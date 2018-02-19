Shader "Unlit/PeloShader"
{
	Properties
	{
		_MainTex("Main texture", 2D) = "white" {}
		_FurTex("Fur texture" , 2D) = "white" {}
		_FurTile("Fur tile" , float) = 10
		_FurLength("Fur length" , float) = 0.02
	}
		SubShader
	{
		Tags{ "Queue" = "Geometry" }
		Blend SrcAlpha OneMinusSrcAlpha
		Pass
	{
		GLSLPROGRAM
#ifdef VERTEX
		varying vec2 TextureCoordinate;
		uniform sampler2D _MainTex;
		uniform sampler2D _FurTex;
		uniform float _FurTile;
		unfirm float _FurLenght;
#include "UnityCG.glslinc"

		vec3 CalcFurPosition(vec3 Position, vec3 Normal, float IdLayer, float
			TotalLayers, float _FurLength)
		{
			float layer = (IdLayer + 1) / TotalLayers;
			float length = _FurLength * layer;
			return Position + Normal*length;
		}
		void main()
	{
		mat4 l_ViewMatrix = gl_ModelViewMatrix*unity_WorldToObject;
		gl_Position = unity_ObjectToWorld * gl_Vertex;
		gl_Position = l_ViewMatrix * gl_Position;
		gl_Position = gl_ProjectionMatrix * gl_Position;
		TextureCoordinate = gl_MultiTexCoord0.xy;


	}

#endif
#ifdef FRAGMENT
		varying vec2 TextureCoordinate;
		uniform sampler2D _MainTex;
	void main()
	{
		gl_FragColor = texture2D(_MainTex, TextureCoordinate);
	}
#endif
	ENDGLSL
	}
	}
}
