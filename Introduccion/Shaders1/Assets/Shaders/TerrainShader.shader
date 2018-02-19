Shader "Unlit/TerrainShader"
{
	Properties
	{
		//_MainTex("Texture", 2D) = ""{}
		_HeightmapTex("HeightmapTex", 2D) = ""{}
		_HeatmapTex("Heat", 2D) = ""{}
		_MaxHeight("MaxHeight", float) = 1 
	}
		SubShader
	{
		Tags{ "Queue" = "Geometry" }
		Pass
	{
		GLSLPROGRAM
#ifdef VERTEX
		uniform float _MaxHeight;
		uniform sampler2D _HeightmapTex;
		varying vec2 TextureCoordinate;
#include "UnityCG.glslinc"
		void main()
	{
			//vec4 l_Position = gl_Vertex;
			vec4 l_Height = vec4(0, 0, texture2DLod(_HeightmapTex,gl_MultiTexCoord0.xy, 0.0).x * _MaxHeight, 0);
			mat4 l_ViewMatrix = gl_ModelViewMatrix*unity_WorldToObject;
			gl_Position = unity_ObjectToWorld*(gl_Vertex + l_Height);
			gl_Position = l_ViewMatrix*gl_Position;
			gl_Position = gl_ProjectionMatrix * gl_Position;
			TextureCoordinate = vec2(0.5, l_Height.z) * 10;
	}
#endif
#ifdef FRAGMENT
		varying vec2 TextureCoordinate;
		uniform sampler2D _HeatmapTex;
	void main()
	{
		gl_FragColor = texture2D(_HeatmapTex, TextureCoordinate);
	}
#endif
	ENDGLSL
	}
	}
}
