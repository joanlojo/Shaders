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
		//ZWrite Off
		Pass
		{
		GLSLPROGRAM
#ifdef VERTEX
		varying vec2 TextureCoordinate;
		varying float FurDiscardTexture;
		uniform sampler2D _MainTex;
		uniform sampler2D _FurTex;
		uniform float _FurTile;
		uniform float _FurLenght;
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
			float l_IdLayer = 0;
			float l_TotalLayers = 5;
			vec3 l_Position = CalcFurPosition(gl_Vertex.xyz, gl_Normal.xyz,l_IdLayer, l_TotalLayers, _FurLenght);
			gl_Position = gl_ModelViewProjectionMatrix * vec4(l_Position, 1.0);
			TextureCoordinate = gl_MultiTexCoord0.xy;
			FurDiscardTexture = (l_IdLayer + 1) / l_TotalLayers;
	}


#endif
#ifdef FRAGMENT
		varying vec2 TextureCoordinate;
		varying float FurDiscardTexture;
		uniform sampler2D _MainTex;
		uniform sampler2D _FurTex;
		uniform float _FurTile;
	void main()
	{
		gl_FragColor = texture2D(_MainTex, TextureCoordinate);
	}
#endif
	ENDGLSL
		GLSLPROGRAM
#ifdef VERTEX
		varying vec2 TextureCoordinate;
	varying float FurDiscardTexture;
	uniform sampler2D _MainTex;
	uniform sampler2D _FurTex;
	uniform float _FurTile;
	uniform float _FurLenght;
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
		float l_IdLayer = 1;
		float l_TotalLayers = 5;
		vec3 l_Position = CalcFurPosition(gl_Vertex.xyz, gl_Normal.xyz,l_IdLayer, l_TotalLayers, _FurLenght);
		gl_Position = gl_ModelViewProjectionMatrix * vec4(l_Position, 1.0);
		TextureCoordinate = gl_MultiTexCoord0.xy;
		FurDiscardTexture = (l_IdLayer + 1) / l_TotalLayers;
	}


#endif
#ifdef FRAGMENT
	varying vec2 TextureCoordinate;
	varying float FurDiscardTexture;
	uniform sampler2D _MainTex;
	uniform sampler2D _FurTex;
	uniform float _FurTile;
	void main()
	{
		//gl_FragColor = texture2D(_MainTex, TextureCoordinate);

		vec4 l_FurColor = texture2D(_FurTex, TextureCoordinate*_FurTile);
		gl_FragColor = texture2D(_MainTex, TextureCoordinate);
		gl_FragColor.a = l_FurColor.x / FurDiscardTexture;
	}
#endif
	ENDGLSL
		GLSLPROGRAM
#ifdef VERTEX
		varying vec2 TextureCoordinate;
	varying float FurDiscardTexture;
	uniform sampler2D _MainTex;
	uniform sampler2D _FurTex;
	uniform float _FurTile;
	uniform float _FurLenght;
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
		float l_IdLayer = 2;
		float l_TotalLayers = 5;
		vec3 l_Position = CalcFurPosition(gl_Vertex.xyz, gl_Normal.xyz,l_IdLayer, l_TotalLayers, _FurLenght);
		gl_Position = gl_ModelViewProjectionMatrix * vec4(l_Position, 1.0);
		TextureCoordinate = gl_MultiTexCoord0.xy;
		FurDiscardTexture = (l_IdLayer + 1) / l_TotalLayers;
	}


#endif
#ifdef FRAGMENT
	varying vec2 TextureCoordinate;
	varying float FurDiscardTexture;
	uniform sampler2D _MainTex;
	uniform sampler2D _FurTex;
	uniform float _FurTile;
	void main()
	{
		//gl_FragColor = texture2D(_MainTex, TextureCoordinate);

		vec4 l_FurColor = texture2D(_FurTex, TextureCoordinate*_FurTile);
		gl_FragColor = texture2D(_MainTex, TextureCoordinate);
		gl_FragColor.a = l_FurColor.x / FurDiscardTexture;
	}
#endif
	ENDGLSL
		GLSLPROGRAM
#ifdef VERTEX
		varying vec2 TextureCoordinate;
	varying float FurDiscardTexture;
	uniform sampler2D _MainTex;
	uniform sampler2D _FurTex;
	uniform float _FurTile;
	uniform float _FurLenght;
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
		float l_IdLayer = 3;
		float l_TotalLayers = 5;
		vec3 l_Position = CalcFurPosition(gl_Vertex.xyz, gl_Normal.xyz, l_IdLayer, l_TotalLayers, _FurLenght);
		gl_Position = gl_ModelViewProjectionMatrix * vec4(l_Position, 1.0);
		TextureCoordinate = gl_MultiTexCoord0.xy;
		FurDiscardTexture = (l_IdLayer + 1) / l_TotalLayers;
	}


#endif
#ifdef FRAGMENT
	varying vec2 TextureCoordinate;
	varying float FurDiscardTexture;
	uniform sampler2D _MainTex;
	uniform sampler2D _FurTex;
	uniform float _FurTile;
	void main()
	{
		//gl_FragColor = texture2D(_MainTex, TextureCoordinate);

		vec4 l_FurColor = texture2D(_FurTex, TextureCoordinate*_FurTile);
		gl_FragColor = texture2D(_MainTex, TextureCoordinate);
		gl_FragColor.a = l_FurColor.x / FurDiscardTexture;
	}
#endif
	ENDGLSL
		}

	}

}
