//
// Adjust ambient lighting
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_fAmbientLight;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	if (gl_FragColor.rgb == vec3(0.0, 0.0, 0.0)) { 
		gl_FragColor = vec4(u_fAmbientLight, u_fAmbientLight, u_fAmbientLight, 1.0);	
	}
	else {
		gl_FragColor.rgb += u_fAmbientLight;
	}
}
