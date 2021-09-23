Shader "Unlit/Unlit"
{
	Properties
	{
		_Value("Value", Float) = 1.0
	}
		SubShader
	{
		Tags { "RenderType" = "Opaque" }
		LOD 100

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag

			#include "UnityCG.cginc"

			float _Value;

            struct appdata //Per Mesh Data
            {
                float4 vertex : POSITION;	//Vertex Position
				float3 normals : NORMAL;	//The v1ertex' normal
				//float4 tangent : TANGENT;	//Vertex Tangent
				//float4 color : COLOR;		//Vertex Color
                float2 uv0 : TEXCOORD0;		//UV0 Coordinates (can be very general)
				//float2 uv1 : TEXCOORD1;		//UV1 could be the lightmaps etc
            };

            struct v2f	//The data that gets passed from vertex shader to fragment shader (Interpolators), vertex shader returns this
            {
				float4 vertex : SV_POSITION;	//Clip space position of each vertex
                float2 uv : TEXCOORD0;			//NOT UV Channel, used for passing data
				//float2 uv : TEXCOORD2;
				//float2 uv : TEXCOORD1;
            };

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
				//o.uv = ;
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                // sample the texture
				fixed4 col = (1,1,1,1) * _Value;
                // apply fog
                return col;
            }
            ENDCG
        }
    }
}
