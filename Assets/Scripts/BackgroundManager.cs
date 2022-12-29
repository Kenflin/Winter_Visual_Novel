using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class BackgroundManager : MonoBehaviour
{

    [SerializeField]
    private List<Sprite> backgrounds;

    [SerializeField]
    private GameObject canvasBackground;

    public void changeBackground(string scene)
    {
        int backgroundid = Int32.Parse(scene.Split("-")[0]);
        canvasBackground.GetComponent<Image>().sprite = backgrounds[backgroundid];
        canvasBackground.GetComponent<Image>().color = Color.white;
    }

    public void BackgroundToBlack()
    {
        canvasBackground.GetComponent<Image>().color = Color.black;

    }

    public int ReturnBackground()
    {
        return Int32.Parse(canvasBackground.GetComponent<Image>().sprite.name.Split("-")[0]);
    }


    private static int _loadedBackground;
    public static void LoadState(int background)
    {
        _loadedBackground = background;

    }

    public void RestoreBackground()
    {
        canvasBackground.GetComponent<Image>().sprite = backgrounds[_loadedBackground];
        canvasBackground.GetComponent<Image>().color = Color.white;
    }
}
