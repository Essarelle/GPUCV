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
//IMGTYPE BaseImage; // source image

//varying vec3  MCPosition_x;// for filter mask positions computation
//varying vec3  MCPosition_y;// for filter mask positions computation

//uniform float Parameters[11]; // Only used here to get size of the image


void main(void)
{
	// Texture position
	gl_TexCoord[0]  = gl_MultiTexCoord0;

	// Vertex position, untouched and computed with built-in function ftransform
	gl_Position     = ftransform();
}
