#ifndef __ComparacaoLcomNL_sfun_h__
#define __ComparacaoLcomNL_sfun_h__

/* Include files */
#define S_FUNCTION_NAME                sf_sfun
#include "sfc_sf.h"
#include "sfc_mex.h"
#include "rtwtypes.h"
#include "sfcdebug.h"
#define rtInf                          (mxGetInf())
#define rtMinusInf                     (-(mxGetInf()))
#define rtNaN                          (mxGetNaN())
#define rtIsNaN(X)                     ((int)mxIsNaN(X))
#define rtIsInf(X)                     ((int)mxIsInf(X))

/* Type Definitions */

/* Named Constants */
#define CALL_EVENT                     (-1)

/* Variable Declarations */
extern uint32_T _ComparacaoLcomNLMachineNumber_;
extern real_T _sfTime_;

/* Variable Definitions */

/* Function Declarations */
extern void ComparacaoLcomNL_initializer(void);
extern void ComparacaoLcomNL_terminator(void);

/* Function Definitions */
#endif
