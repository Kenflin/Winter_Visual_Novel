using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using Ink.Runtime;
using UnityEngine.UI;
using static CharacterEnums;
using FontStyles = TMPro.FontStyles;
using TextAsset = UnityEngine.TextAsset;
using System;
using System.Linq;

public class InkManager : MonoBehaviour
{
    [SerializeField]
    private TextAsset _inkJsonAssetES;
    [SerializeField]
    private TextAsset _inkJsonAssetEN;
    private Story _story;

    [SerializeField]
    private TMP_Text _textField;

    [SerializeField]
    private TMP_Text _textFieldName;

    [SerializeField]
    private VerticalLayoutGroup _choiceButtonContainer;

    [SerializeField]
    private Button _choiceButtonPrefab;

    [SerializeField]
    private Color _normalTextColor;

    [SerializeField]
    private Color _thoughtTextColor;
    [SerializeField]
    private string language;

    [SerializeField]
    private int letterPerSeconds;

    [SerializeField]
    private Button _nextButton;

    private SoundController _soundController;

    private CharacterManager _characterManager;

    private BackgroundManager _backgroundManager;

    private bool isWriting = false;

    private bool _giftStolen;
    public bool GiftStolen
    {
        get => _giftStolen;
        private set
        {
            Debug.Log($"Updating giftStolen value. Old value: {_giftStolen}, new value: {value}");
            _giftStolen = value;
        }
    }

    private bool _turkeyStolen;
    public bool TurkeyStolen
    {
        get => _turkeyStolen;
        private set
        {
            Debug.Log($"Updating turkeyStolen value. Old value: {_turkeyStolen}, new value: {value}");
            _turkeyStolen = value;
        }
    }

    void Start()
    {
        _characterManager = FindObjectOfType<CharacterManager>();
        _soundController = FindObjectOfType<SoundController>();
        _backgroundManager = FindObjectOfType<BackgroundManager>();

        StartStory();

        InitializeVariables();

        var giftStolen = (bool)_story.variablesState["giftStolen"];

        var turkeyStolen = (bool)_story.variablesState["turkeyStolen"];

        Debug.Log($"Logging ink variables. Gift Stolen: {giftStolen}, Turkey Stolen: {turkeyStolen}");
        
    }

    private static string _loadedState;

    public static void LoadState(string state)
    {
        _loadedState = state;
    }

    void StartStory()
    {
        if(language == "ES") _story = new Story(_inkJsonAssetES.text);
        else _story = new Story(_inkJsonAssetEN.text);

        if (!string.IsNullOrEmpty(_loadedState))
        {
            _story?.state?.LoadJson(_loadedState);

            _loadedState = null;
        }
        _story.BindExternalFunction("ShowCharacter", (string name, string position, string mood)
          => _characterManager.ShowCharacter(name, position, mood));
        _story.BindExternalFunction("HideCharacter", (string name)
          => _characterManager.HideCharacter(name));
        _story.BindExternalFunction("ChangeMood", (string name, string mood)
          => _characterManager.ChangeMood(name, mood));
        _story.BindExternalFunction("IsNotTalking", (string name, string mood)
  => _characterManager.IsNotTalking(name,mood));
        _story.BindExternalFunction("IsTalking", (string name, string mood)
=> _characterManager.IsTalking(name, mood));
        DisplayNextLine();
    }

    private void InitializeVariables()
    {
        GiftStolen = (bool)_story.variablesState["giftStolen"];
        TurkeyStolen = (bool)_story.variablesState["turkeyStolen"];

        _story.ObserveVariable("giftStolen", (arg, value) =>
        {
            GiftStolen = (bool)value;
        });

        _story.ObserveVariable("turkeyStolen", (arg, value) =>
        {
            TurkeyStolen = (bool)value;
        });

    }

    public void DisplayNextLine()
    {
        if (_story.canContinue)
        {
            string text = _story.Continue(); // gets next line

            text = text?.Trim(); // removes white space from text

            _textFieldName.text = text.Split(':')[0];//displays name
            StartCoroutine(TypeDialog(text.Split(':')[1] ?? text)); //display text letter by letter
           // _textField.text = text.Split(':')[1] ?? text; // displays new text

            ApplyStyling();
            ApplySound();
            if (_story.currentTags.Contains("background"))
            {
                if(_story.currentTags.Last()!="black")
                _backgroundManager.changeBackground(_story.currentTags.Last());
                else
                {
                    _backgroundManager.BackgroundToBlack();
                }
            }

        }
        else if (_story.currentChoices.Count > 0)
        {
            DisplayChoices();
        }
        else
        {
            UnityEngine.SceneManagement.SceneManager.LoadScene("MainMenu");
        }

    }

    private void DisplayChoices()
    {
        // checks if choices are already being displaye
        if (_choiceButtonContainer.GetComponentsInChildren<Button>().Length > 0) return;

        for (int i = 0; i < _story.currentChoices.Count; i++) // iterates through all choices
        {

            var choice = _story.currentChoices[i];
            var button = CreateChoiceButton(choice.text); // creates a choice button

            button.onClick.AddListener(() => OnClickChoiceButton(choice));
        }
    }

    Button CreateChoiceButton(string text)
    {
        // creates the button from a prefab
        var choiceButton = Instantiate(_choiceButtonPrefab);
        choiceButton.transform.SetParent(_choiceButtonContainer.transform, false);

        // sets text on the button
        var buttonText = choiceButton.GetComponentInChildren<TMP_Text>();
        buttonText.text = text;

        return choiceButton;
    }

    void OnClickChoiceButton(Choice choice)
    {
        _story.ChooseChoiceIndex(choice.index); // tells ink which choice was selected
        RefreshChoiceView(); // removes choices from the screen
        DisplayNextLine();

    }

    void RefreshChoiceView()
    {
        if (_choiceButtonContainer != null)
        {
            foreach (var button in _choiceButtonContainer.GetComponentsInChildren<Button>())
            {
                Destroy(button.gameObject);
            }
        }
    }

    private void ApplyStyling()
    {
        if (_story.currentTags.Contains("thought"))
        {
           _textField.color = _thoughtTextColor;
           _textField.fontStyle = FontStyles.Italic;

        }else if (_story.currentTags.Contains("FinalSentence"))
        {
            _textField.fontSize = 232f;
        }
        else
        {
            _textField.color = _normalTextColor;
            _textField.fontStyle = FontStyles.Normal;
        }
    }

    private void ApplySound()
    {
        if (_story.currentTags.Contains("sound"))
        {
            _soundController.selectSound(_story.currentTags.Last());
        }
    }

    public string GetStoryState()
    {
        return _story.state.ToJson();
    }

    public IEnumerator TypeDialog(string dialog)
    {
        if (_story.currentTags.Contains("thought")) dialog = "<" + dialog + ">";
        isWriting = true;
        _nextButton.gameObject.SetActive(!isWriting);
        _textField.text = "";
        foreach (var letter in dialog.ToCharArray()){

            _textField.text += letter;
            yield return new WaitForSeconds(1f/letterPerSeconds);
        }


        isWriting = false;
        _nextButton.gameObject.SetActive(!isWriting);
    }
}
