using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SoundController : MonoBehaviour
{
    private AudioSource _audioSource;

    [SerializeField]
    private AudioClip _audioClipScream;

    // Start is called before the first frame update
    void Start()
    {
        _audioSource = FindObjectOfType<AudioSource>();
    }

    public void selectSound(string sound)
    {
        if (sound == "scream")
        {
            _audioSource.clip = _audioClipScream;
            _audioSource.Play();
        }
        

    }
}
