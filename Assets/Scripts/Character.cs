using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using static CharacterEnums;

public class Character : MonoBehaviour
{
    public CharacterPosition Position { get; private set; }

    public CharacterName Name { get; private set; }

    public CharacterMood Mood { get; private set; }

    public bool IsShowing { get; private set; }

    private CharacterMoods _moods;


    [SerializeField]
    private Color activeColor;
    [SerializeField]
    private Color inactiveColor;

    private float _offScreenX;

    private float _onScreenX;

    private readonly float _animationSpeed = 0.5f;
    public void Init(CharacterName name, CharacterPosition position, CharacterMood mood, CharacterMoods moods)
    {
        Name = name;
        Position = position;
        Mood = mood;

        _moods = moods;

        Show();
    }

    public void Show()
    {

        SetAnimationValues();

        // Position outside of the screen
        transform.position = new Vector3(_offScreenX, transform.position.y, transform.localPosition.z);

        // Set correct mood sprite
        UpdateSprite();

        LeanTween.moveX(gameObject, _onScreenX, _animationSpeed).setEase(LeanTweenType.linear).setOnComplete(() =>
        {
            IsShowing = true;
        });
    }

    public void Hide()
    {

        LeanTween.moveX(gameObject, _offScreenX, _animationSpeed).setEase(LeanTweenType.linear).setOnComplete(() =>
        {
            IsShowing = false;
        });
    }

    private void SetAnimationValues()
    {
        switch (Position)
        {
            case CharacterPosition.Left:
                _onScreenX = Screen.width * 0.25f;
                _offScreenX = -Screen.width * 0.25f;
                break;

            case CharacterPosition.Center:
                _onScreenX = Screen.width * 0.5f;
                _offScreenX = -Screen.width * 0.25f;
                break;

            case CharacterPosition.Right:
                _onScreenX = Screen.width * 0.75f;
                _offScreenX = Screen.width * 1.25f;
                break;
        }
    }

    public void ChangeMood(CharacterMood mood)
    {
        Mood = mood;
        UpdateSprite();
    }
    public void IsTalking(CharacterMood mood)
    {
        var sprite = _moods.GetMoodSprite(Mood);
        var image = GetComponent<Image>();

        image.sprite = sprite;
        image.color = activeColor;
        image.preserveAspect = true;
    }
    public void IsNotTalking(CharacterMood mood)
    {
        var sprite = _moods.GetMoodSprite(Mood);
        var image = GetComponent<Image>();

        image.sprite = sprite;
        image.color = inactiveColor;
        image.preserveAspect = true;
    }

    private void UpdateSprite()
    {
        var sprite = _moods.GetMoodSprite(Mood);
        var image = GetComponent<Image>();

        image.sprite = sprite;
        image.preserveAspect = true;
    }

    public CharacterData GetCharacterData()
    {
        return new CharacterData
        {
            Name = Name,
            Position = Position,
            Mood = Mood
        };
    }
}
