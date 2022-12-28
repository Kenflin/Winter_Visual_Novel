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
        int backgrounid = Int32.Parse(scene.Split("-")[0]);
        canvasBackground.GetComponent<Image>().sprite = backgrounds[backgrounid];
        canvasBackground.GetComponent<Image>().color = Color.white;
    }

    public void BackgroundToBlack()
    {
        canvasBackground.GetComponent<Image>().color = Color.black;

    }

}
