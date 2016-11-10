/* Include files */

#include "DescentralizadoNL_sfun.h"
#include "c1_DescentralizadoNL.h"
#include "c2_DescentralizadoNL.h"

/* Type Definitions */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */
uint32_T _DescentralizadoNLMachineNumber_;
real_T _sfTime_;

/* Function Declarations */

/* Function Definitions */
void DescentralizadoNL_initializer(void)
{
}

void DescentralizadoNL_terminator(void)
{
}

/* SFunction Glue Code */
unsigned int sf_DescentralizadoNL_method_dispatcher(SimStruct *simstructPtr,
  unsigned int chartFileNumber, const char* specsCksum, int_T method, void *data)
{
  if (chartFileNumber==1) {
    c1_DescentralizadoNL_method_dispatcher(simstructPtr, method, data);
    return 1;
  }

  if (chartFileNumber==2) {
    c2_DescentralizadoNL_method_dispatcher(simstructPtr, method, data);
    return 1;
  }

  return 0;
}

unsigned int sf_DescentralizadoNL_process_check_sum_call( int nlhs, mxArray *
  plhs[], int nrhs, const mxArray * prhs[] )
{

#ifdef MATLAB_MEX_FILE

  char commandName[20];
  if (nrhs<1 || !mxIsChar(prhs[0]) )
    return 0;

  /* Possible call to get the checksum */
  mxGetString(prhs[0], commandName,sizeof(commandName)/sizeof(char));
  commandName[(sizeof(commandName)/sizeof(char)-1)] = '\0';
  if (strcmp(commandName,"sf_get_check_sum"))
    return 0;
  plhs[0] = mxCreateDoubleMatrix( 1,4,mxREAL);
  if (nrhs>1 && mxIsChar(prhs[1])) {
    mxGetString(prhs[1], commandName,sizeof(commandName)/sizeof(char));
    commandName[(sizeof(commandName)/sizeof(char)-1)] = '\0';
    if (!strcmp(commandName,"machine")) {
      ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(2109298332U);
      ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(2800994953U);
      ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(4174197306U);
      ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(1563824009U);
    } else if (!strcmp(commandName,"exportedFcn")) {
      ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(0U);
      ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(0U);
      ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(0U);
      ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(0U);
    } else if (!strcmp(commandName,"makefile")) {
      ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(522229791U);
      ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(2227517512U);
      ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(794197767U);
      ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(558461176U);
    } else if (nrhs==3 && !strcmp(commandName,"chart")) {
      unsigned int chartFileNumber;
      chartFileNumber = (unsigned int)mxGetScalar(prhs[2]);
      switch (chartFileNumber) {
       case 1:
        {
          extern void sf_c1_DescentralizadoNL_get_check_sum(mxArray *plhs[]);
          sf_c1_DescentralizadoNL_get_check_sum(plhs);
          break;
        }

       case 2:
        {
          extern void sf_c2_DescentralizadoNL_get_check_sum(mxArray *plhs[]);
          sf_c2_DescentralizadoNL_get_check_sum(plhs);
          break;
        }

       default:
        ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(0.0);
        ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(0.0);
        ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(0.0);
        ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(0.0);
      }
    } else if (!strcmp(commandName,"target")) {
      ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(3176360410U);
      ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(1862911626U);
      ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(659157607U);
      ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(1884031890U);
    } else {
      return 0;
    }
  } else {
    ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(1086216002U);
    ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(1655199040U);
    ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(1142882438U);
    ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(2927603015U);
  }

  return 1;

#else

  return 0;

#endif

}

unsigned int sf_DescentralizadoNL_autoinheritance_info( int nlhs, mxArray *
  plhs[], int nrhs, const mxArray * prhs[] )
{

#ifdef MATLAB_MEX_FILE

  char commandName[32];
  if (nrhs<2 || !mxIsChar(prhs[0]) )
    return 0;

  /* Possible call to get the autoinheritance_info */
  mxGetString(prhs[0], commandName,sizeof(commandName)/sizeof(char));
  commandName[(sizeof(commandName)/sizeof(char)-1)] = '\0';
  if (strcmp(commandName,"get_autoinheritance_info"))
    return 0;

  {
    unsigned int chartFileNumber;
    chartFileNumber = (unsigned int)mxGetScalar(prhs[1]);
    switch (chartFileNumber) {
     case 1:
      {
        extern mxArray *sf_c1_DescentralizadoNL_get_autoinheritance_info(void);
        plhs[0] = sf_c1_DescentralizadoNL_get_autoinheritance_info();
        break;
      }

     case 2:
      {
        extern mxArray *sf_c2_DescentralizadoNL_get_autoinheritance_info(void);
        plhs[0] = sf_c2_DescentralizadoNL_get_autoinheritance_info();
        break;
      }

     default:
      plhs[0] = mxCreateDoubleMatrix(0,0,mxREAL);
    }
  }

  return 1;

#else

  return 0;

#endif

}

unsigned int sf_DescentralizadoNL_get_eml_resolved_functions_info( int nlhs,
  mxArray * plhs[], int nrhs, const mxArray * prhs[] )
{

#ifdef MATLAB_MEX_FILE

  char commandName[64];
  if (nrhs<2 || !mxIsChar(prhs[0]))
    return 0;

  /* Possible call to get the get_eml_resolved_functions_info */
  mxGetString(prhs[0], commandName,sizeof(commandName)/sizeof(char));
  commandName[(sizeof(commandName)/sizeof(char)-1)] = '\0';
  if (strcmp(commandName,"get_eml_resolved_functions_info"))
    return 0;

  {
    unsigned int chartFileNumber;
    chartFileNumber = (unsigned int)mxGetScalar(prhs[1]);
    switch (chartFileNumber) {
     case 1:
      {
        extern const mxArray
          *sf_c1_DescentralizadoNL_get_eml_resolved_functions_info(void);
        mxArray *persistentMxArray = (mxArray *)
          sf_c1_DescentralizadoNL_get_eml_resolved_functions_info();
        plhs[0] = mxDuplicateArray(persistentMxArray);
        mxDestroyArray(persistentMxArray);
        break;
      }

     case 2:
      {
        extern const mxArray
          *sf_c2_DescentralizadoNL_get_eml_resolved_functions_info(void);
        mxArray *persistentMxArray = (mxArray *)
          sf_c2_DescentralizadoNL_get_eml_resolved_functions_info();
        plhs[0] = mxDuplicateArray(persistentMxArray);
        mxDestroyArray(persistentMxArray);
        break;
      }

     default:
      plhs[0] = mxCreateDoubleMatrix(0,0,mxREAL);
    }
  }

  return 1;

#else

  return 0;

#endif

}

void DescentralizadoNL_debug_initialize(void)
{
  _DescentralizadoNLMachineNumber_ = sf_debug_initialize_machine(
    "DescentralizadoNL","sfun",0,2,0,0,0);
  sf_debug_set_machine_event_thresholds(_DescentralizadoNLMachineNumber_,0,0);
  sf_debug_set_machine_data_thresholds(_DescentralizadoNLMachineNumber_,0);
}

void DescentralizadoNL_register_exported_symbols(SimStruct* S)
{
}
