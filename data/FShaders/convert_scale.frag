//CVG_LicenseBegin============================================================================
// Short license for shaders:
//	Copyright@ Institut TELECOM 2005 http://www.institut-telecom.fr/en_accueil.html
//	This file is part of GpuCV library.
//	Contacts : gpucv@picoforge.int-evry.fr or gpucv-developers@picoforge.int-evry.fr
//	Project's Home Page : https://picoforge.int-evry.fr/cgi-bin/twiki/view/Gpucv/Web/WebHome
//	License: CeCILL-B license "http://www.cecill.info/licences/Licence_CeCILL-B_V1-en.html". 
//==============================================================================CVG_LicenseEnd
//CVG_METASHADERBegin
//! Defined to 1 when compiled into GpuCV
//! Defined to 0 when compile by external applications such as "Shader Designer"
#define GPUCV_FILTER 0 
#if GPUCV_FILTER 
	#define GETTEX 			// function to get texture
	#define IMGTYPE 		// texture type
#else
	#define GETTEX 		texture2D
	#define IMGTYPE 	uniform sampler2D
#endif
//!!!!! WARNING DO NOT WRITE ANYTHING IN THIS LICENSE OR METASHADER PART !!!!!!!!!!!!
//!!!!! CAUSE IT IS SELF GENERATED !!!!!!!!!!!!!!!!
//---------------------CVG_METASHADEREnd
#define DEF_SCALE	0
#define DEF_SHIFT	0
#define SWIZZLE_ORDER bgra
#define REVERSE_SWIZZLE_ORDER rgba

IMGTYPE BaseImage; // source imag 
uniform float Parameters[2];

#if DEF_SCALE
	#define DEF_SCALE_OP * Parameters[0]
#else
	#define DEF_SCALE_OP 
#endif

#if DEF_SHIFT
	#define DEF_SHIFT_OP + vec4(Parameters[1])
#else
	#define DEF_SHIFT_OP 
#endif


void main(void)
{
//get main source
	vec4 img0 = GETTEX(BaseImage, gl_TexCoord[0].st).SWIZZLE_ORDER;
	gl_FragColor = (img0 * Parameters[0] + vec4(Parameters[1])).SWIZZLE_ORDER;

//process scale and shifting
		gl_FragColor = ((img0 DEF_SCALE_OP) DEF_SHIFT_OP).SWIZZLE_ORDER; //default addition
}
