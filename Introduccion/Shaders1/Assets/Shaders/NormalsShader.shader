Shader "Unlit/NormalsShader"
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
		varying vec3 normal;
#include "UnityCG.glslinc"
		void main()
	{
		mat4 l_ViewMatrix = gl_ModelViewMatrix*unity_WorldToObject;
		gl_Position = unity_ObjectToWorld * gl_Vertex;
		gl_Position = l_ViewMatrix * gl_Position;
		gl_Position = gl_ProjectionMatrix * gl_Position;
		normal = (unity_ObjectToWorld*vec4(gl_Normal.xyz, 1.0)).xyz;
	}
#endif
#ifdef FRAGMENT
		varying vec3 normal;
	void main()
	{
		normalize(normal);
		//gl_FragColor = texture2D(_MainTex, TextureCoordinate);
	}
#endif
	ENDGLSL
	}
	}
}
