using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SoundController : MonoBehaviour
{
    [SerializeField]
    private AudioSource _audioSourceSound;
    [SerializeField]
    private AudioSource _audioSourceMusic;


    [SerializeField]
    private List<AudioClip> _audioClipsSound;

    [SerializeField]
    private List<AudioClip> _audioClipsMusic;

    // Start is called before the first frame update
    void Start()
    {
     
    }

    public void selectSound(string sound)
    {
        if (sound == "")
        {
            _audioSourceSound.clip = _audioClipsSound[0];
            _audioSourceSound.Play();
        }
        

    }

    public void selectMusic(string music)
    {
        if (music == "0-Office" || music == "11-End")
        {
            _audioSourceMusic.clip = _audioClipsMusic[0];
            _audioSourceMusic.Play();
        }else if(music == "cold" || music == "6-TurkeyFarmSign" || music == "black")
        {
            _audioSourceMusic.clip = _audioClipsMusic[1];
            _audioSourceMusic.Play();
        }
        else if (music == "trucker")
        {
            _audioSourceMusic.clip = _audioClipsMusic[2];
            _audioSourceMusic.Play();
        }
        else if (music == "decision")
        {
            _audioSourceMusic.clip = _audioClipsMusic[3];
            _audioSourceMusic.Play();
        }
        else if(music == "hut" || music == "9-JohnHouse" || music == "7-TurkeyFarm")
        {
            _audioSourceMusic.clip = _audioClipsMusic[4];
            _audioSourceMusic.Play();
        }
        else if (music == "12-GoodBye")
        {
            _audioSourceMusic.clip = _audioClipsMusic[5];
            _audioSourceMusic.Play();
        }
        else if (music == "11-EndBad")
        {
            _audioSourceMusic.clip = _audioClipsMusic[6];
            _audioSourceMusic.Play();
        }

    }
}
