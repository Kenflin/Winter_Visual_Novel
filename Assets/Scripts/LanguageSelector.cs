using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class LanguageSelector : MonoBehaviour
{
    [SerializeField]
    public int SelectedLanguage = 0;

    [SerializeField]
    private GameObject DropdownMenu;

    private void Start()
    {
        DropdownMenu = GameObject.FindGameObjectWithTag("LanguageController");
    }
    public void SelectLanguage()
    {
        DropdownMenu = GameObject.FindGameObjectWithTag("LanguageController");
        SelectedLanguage = DropdownMenu.GetComponent<TMP_Dropdown>().value;
    }
}
