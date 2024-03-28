using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class URPtest : MonoBehaviour
{
    public Renderer RD;
    public Texture2D T2D;
    public Cubemap cubemap;

    void Start()
    {
        RD.material.SetFloat("_Vector2", 1);
    }
}
