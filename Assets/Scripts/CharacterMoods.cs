using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using static CharacterEnums;

public class CharacterMoods : MonoBehaviour
{
    public CharacterName Name;
    public Sprite Fine;
    public Sprite Sad;
    public Sprite Upset;
    public Sprite Serious;
    public Sprite Surprised;
    public Sprite Thinking;

    public Sprite GetMoodSprite(CharacterMood mood)
    {

        switch (mood)
        {
            case CharacterMood.Fine:
                return Fine;
            case CharacterMood.Sad:
                return Sad ?? Fine;
            case CharacterMood.Thinking:
                return Thinking ?? Fine;
            case CharacterMood.Upset:
                return Upset ?? Fine;
            case CharacterMood.Serious:
                return Serious ?? Fine;
            case CharacterMood.Surprised:
                return Surprised ?? Fine;
            default:
                Debug.Log($"Didn't find Sprite for character: {Name}, mood: {mood}");
                return Fine;
        }
    }

}
