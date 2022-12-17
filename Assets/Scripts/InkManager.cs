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

public class InkManager : MonoBehaviour
{
    [SerializeField]
    private TextAsset _inkJsonAsset;
    private Story _story;

    [SerializeField]
    private TMP_Text _textField;

    [SerializeField]
    private VerticalLayoutGroup _choiceButtonContainer;

    [SerializeField]
    private Button _choiceButtonPrefab;

    [SerializeField]
    private Color _normalTextColor;

    [SerializeField]
    private Color _thoughtTextColor;


    private CharacterManager _characterManager;

    private int _relationshipStrength;
    public int RelationshipStrength
    {
        get => _relationshipStrength;
        private set
        {
            Debug.Log($"Updating RelationshipStrength value. Old value: {_relationshipStrength}, new value: {value}");
            _relationshipStrength = value;
        }
    }

    private int _mentalHealth;
    public int MentalHealth
    {
        get => _mentalHealth;
        private set
        {
            Debug.Log($"Updating MentalHealth value. Old value: {_mentalHealth}, new value: {value}");
            _mentalHealth = value;
        }
    }

    void Start()
    {
        _characterManager = FindObjectOfType<CharacterManager>();

        StartStory();

        InitializeVariables();

        var relationshipStrength = (int)_story.variablesState["relationship_strength"];

        var mentalHealth = (int)_story.variablesState["mental_health"];

        Debug.Log($"Logging ink variables. Relationship strength: {relationshipStrength}, mental health: {mentalHealth}");
        
    }

    private static string _loadedState;

    public static void LoadState(string state)
    {
        _loadedState = state;
    }

    void StartStory()
    {
        _story = new Story(_inkJsonAsset.text);

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
        DisplayNextLine();
    }

    private void InitializeVariables()
    {
        RelationshipStrength = (int)_story.variablesState["relationship_strength"];
        MentalHealth = (int)_story.variablesState["mental_health"];

        _story.ObserveVariable("relationship_strength", (arg, value) =>
        {
            RelationshipStrength = (int)value;
        });

        _story.ObserveVariable("mental_health", (arg, value) =>
        {
            MentalHealth = (int)value;
        });

    }

    public void DisplayNextLine()
    {
        if (_story.canContinue)
        {
            string text = _story.Continue(); // gets next line

            text = text?.Trim(); // removes white space from text

            ApplyStyling();

            _textField.text = text; // displays new text
        }
        else if (_story.currentChoices.Count > 0)
        {
            DisplayChoices();
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
        }
        else
        {
            _textField.color = _normalTextColor;
            _textField.fontStyle = FontStyles.Normal;
        }
    }

    public string GetStoryState()
    {
        return _story.state.ToJson();
    }
}
