Shader "Unlit/TerrainShader"
{
	Properties
	{
		_MainTex("Texture", 2D) = ""{}
		_HeightmapTex("HeightmapTex", 2D) = ""{}
		_MaxHeight("MaxHeight", 2D) = ""{}
	}
		SubShader
	{
		Tags{ "Queue" = "Geometry" }
		Pass
	{
		GLSLPROGRAM
#ifdef VERTEX
		varying vec2 TextureCoordinate;
#include "UnityCG.glslinc"
		void main()
	{
			vec4 l_Height = texture2DLod(_HeightmapTex, gl_MultiTexCoord0.xy, 0.0);
			mat4 l_ViewMatrix = gl_ModelViewMatrix*unity_WorldToObject;
			l_Position = unity_ObjectToWorld*l_Position;
			l_Position.y = l_Position.y + l_Height.x*_MaxHeight;
			TextureCoordinate = vec2(0.5, l_Height.x);
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
