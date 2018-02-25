Shader "Unlit/LoopShader"
{
	Properties
	{
		_MainTex("Main texture" , 2D) = "white" {}
		_TileMultiplier("Tile multiplier" , float) = 10
		_UVPosition("UV Position" , float) = 0.5
		_UVWidth("UV Width" , float) = 0.1
		_UVMaxWidth("UV Max Width" , float) = 0.3
		_NormalMultiplier("Normal multiplier", float) = 1.0
		_PctPow("Pct pow" , float) = 1.0
		_Color("Color" , color) = (1.0, 0.0, 0.0, 1.0)
		_Speed("Speed" , float) = 0.05
		_AmbientColor("AmbientColor" , color) = (1.0, 1.0, 1.0, 1.0)
		_AmbientIntensity("_AmbientIntensity", Range(0.0, 1.0)) = 1.0
	}
		SubShader
		{
			Tags{ "Queue" = "Geometry" }
			Pass
		{
			GLSLPROGRAM
	#ifdef VERTEX
		varying float Pct;
		varying vec3 l_Vertex;
		varying vec2 TextureCoordinate;
		uniform float _Speed;
		uniform float _UVPosition;
		uniform float _UVWidth;
		uniform float _UVMaxWidth;
		uniform float _PctPow;
		uniform float _NormalMultiplier;
#include "UnityCG.glslinc"
		void main()
	{
			float l_Length = length(gl_MultiTexCoord0.x - fract(_UVPosition + _Time.y * _Speed));
			float l_Length2 = length(gl_MultiTexCoord0.x - (1.0 + fract(_UVPosition + _Time.y * _Speed)));
			float l_Length3 = length(1.0 + gl_MultiTexCoord0.x - (fract(_UVPosition + _Time.y * _Speed)));
			l_Length = min(l_Length3, min(l_Length, l_Length2));
			float l_Pct = clamp((l_Length - _UVMaxWidth) / _UVWidth, 0.0, 1.0);
			Pct = pow(l_Pct, _PctPow);
			l_Vertex = gl_Vertex.xyz + gl_Normal*(1.0 - Pct)*_NormalMultiplier;
			TextureCoordinate = gl_MultiTexCoord0.xy;
	}
#endif
#ifdef FRAGMENT
		varying float Pct;
		varying vec3 l_Vertex;
		varying vec2 TextureCoordinate;
		uniform sampler2D _MainTex;
		uniform vec4 _AmbientIntensity;
		uniform vec4 _AmbientColor;
		uniform vec4 _Color;
		uniform float _TileMultiplier;
	void main()
	{
		vec3 Nn = normalize(l_Vertex);
		gl_FragColor = texture2D(_MainTex, vec2(TextureCoordinate.x * _TileMultiplier, TextureCoordinate.y));
		gl_FragColor = gl_FragColor * mix(_Color, vec4(1, 1, 1, 1), Pct);
		gl_FragColor = gl_FragColor * _AmbientColor * _AmbientIntensity + gl_FragColor * dot(Nn, vec3(0, 1, 0));
	}
#endif
	ENDGLSL
	}
	}
}
