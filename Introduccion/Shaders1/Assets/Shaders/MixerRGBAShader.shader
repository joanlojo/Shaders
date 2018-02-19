Shader "Unlit/MixerRGBAShader"
{
	Properties
	{
		_Mixer("Mixer", 2D) = ""{}
		_Texture1("Texture1", 2D) = ""{}
		_Texture2("Texture2", 2D) = ""{}
		_Texture3("Texutre3", 2D) = ""{}
		_Texture4("Texutre4", 2D) = ""{}

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
		mat4 l_ViewMatrix = gl_ModelViewMatrix*unity_WorldToObject;
		gl_Position = unity_ObjectToWorld * gl_Vertex;
		gl_Position = l_ViewMatrix * gl_Position;
		gl_Position = gl_ProjectionMatrix * gl_Position;
		TextureCoordinate = gl_MultiTexCoord0.xy;
	}
#endif
#ifdef FRAGMENT
		varying vec2 TextureCoordinate;
		uniform sampler2D _Mixer;
		uniform sampler2D _Texture1;
		uniform sampler2D _Texture2;
		uniform sampler2D _Texture3;
		uniform sampler2D _Texture4;

	void main()
	{
		vec4 Red = texture2D(_Texture1, TextureCoordinate);
		vec4 Green = texture2D(_Texture2, TextureCoordinate);
		vec4 Blue = texture2D(_Texture3, TextureCoordinate);
		vec4 Alpha = texture2D(_Texture4, TextureCoordinate);
		vec4 Mixer = texture2D(_Mixer, TextureCoordinate);
		gl_FragColor = Mixer.x * Red + Mixer.y * Green + Mixer.z * Blue + Mixer.w * Alpha;
	}
#endif
	ENDGLSL
	}
	}
}
