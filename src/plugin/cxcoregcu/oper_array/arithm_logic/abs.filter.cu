//CVG_LicenseBegin========================================== ====================
//
//	Copyright@ Institut TELECOM 2005
//		http://www.institut-telecom.fr/en_accueil.html 
//	
//	This software is a GPU accelerated library for computer-vision. It 
//	supports an OPENCV-like extensible interface for easily porting OPENCV 
//	applications.   
//	    
//	Contacts :
//		patrick.horain@it-sudparis.eu  
//		gpucv-developers@picoforge.int-evry.fr
//	
//	Project's Home Page :
//		https://picoforge.int-evry.fr/cgi-bin/twiki/view/Gpucv/Web/WebHome
//	
//	This software is governed by the CeCILL-B license under French law and
//	abiding by the rules of distribution of free software.  You can  use, 
//	modify and/ or redistribute the software under the terms of the CeCILL-B
//	license as circulated by CEA, CNRS and INRIA at the following URL
//	"http://www.cecill.info/licences/Licence_CeCILL-B_V1-en.html". 
//	
//================================================================CVG_LicenseEnd
#include <cxcoregcu/oper_array/arithm_logic/arithm_logic.h>
#if _GPUCV_COMPILE_CUDA


_GPUCV_CXCOREGCU_EXPORT_CU
void gcuAbsDiff(CvArr* src1,CvArr* src2, CvArr* dst)
{
	CudaArithm_SwitchCHANNELS<KERNEL_ARITHM_OPER_ABSDIFF, GCUArithmStruct>(&varLocalArithm, src1, src2, dst, NULL, 1.0, NULL);
}

_GPUCV_CXCOREGCU_EXPORT_CU
void gcuAbsDiffS(CvArr* src1,gcuScalar scalar, CvArr* dst)
{
	float4 TempScalar;
	TempScalar.x = (float)scalar.val[0];
	TempScalar.y = (float)scalar.val[1];
	TempScalar.z = (float)scalar.val[2];
	TempScalar.w = (float)scalar.val[3];
	CudaArithm_SwitchCHANNELS<KERNEL_ARITHM_OPER_ABSDIFF, GCUArithmStruct>(&varLocalArithm, src1, NULL , dst, NULL, 1.0, &TempScalar);
}
#endif
