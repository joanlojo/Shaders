Shader "Unlit/UVShader"
{
	Properties
	{

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
	void main()
	{
		gl_FragColor = vec4(TextureCoordinate.xy, 0,1);
	}
#endif
	ENDGLSL
	}
	}
}
