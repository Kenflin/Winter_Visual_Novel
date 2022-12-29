using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;
using UnityEngine;
using UnityEngine.UIElements;

public class GameStateManager : MonoBehaviour
{
    private InkManager _inkManager;
    private CharacterManager _characterManager;
    private LanguageSelector _languageSelector;
    private BackgroundManager _backgroundManager;

    private void Start()
    {
        _inkManager = FindObjectOfType<InkManager>();
        _characterManager = FindObjectOfType<CharacterManager>();
        _languageSelector = FindObjectOfType<LanguageSelector>();
        _backgroundManager = FindObjectOfType<BackgroundManager>();
    }

    public void StartGame()
    {
        if(_languageSelector!=null) _languageSelector.SelectLanguage();
        UnityEngine.SceneManagement.SceneManager.LoadScene("WinterNovelJam");
    }


    public void SaveGame()
    {
        SaveData save = CreateSaveGameObject();

        var bf = new BinaryFormatter();

        var savePath = Application.persistentDataPath + "/savedata.save";

        FileStream file = File.Create(savePath);
        bf.Serialize(file, save);
        file.Close();

        Debug.Log("Game saved");
    }

    private SaveData CreateSaveGameObject()
    {
        return new SaveData
        {
            InkStoryState = _inkManager.GetStoryState(),
            Characters = _characterManager.GetVisibleCharacters(),
            Background = _backgroundManager.ReturnBackground()
        };
    }

    public void LoadGame()
    {
        var savePath = Application.persistentDataPath + "/savedata.save";

        if (File.Exists(savePath))
        {
            BinaryFormatter bf = new BinaryFormatter();

            FileStream file = File.Open(savePath, FileMode.Open);
            file.Position = 0;

            SaveData save = (SaveData)bf.Deserialize(file);

            file.Close();

            InkManager.LoadState(save.InkStoryState);
            CharacterManager.LoadState(save.Characters);
            BackgroundManager.LoadState(save.Background);

            StartGame();
        }
        else
        {
            Debug.Log("No game saved!");
        }
    }
    public void ExitMenu()
    {
        UnityEngine.SceneManagement.SceneManager.LoadScene("MainMenu");
    }
    public void ExitGame()
    {
        Application.Quit();
    }



}
