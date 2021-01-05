/*
 * add_test.cpp
 *
 * Code generation for model "add_test".
 *
 * Model version              : 1.1
 * Simulink Coder version : 9.3 (R2020a) 18-Nov-2019
 * C++ source code generated on : Wed Dec 30 13:22:10 2020
 *
 * Target selection: grt.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: Intel->x86-64 (Windows64)
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "add_test.h"
#include "add_test_private.h"

/* External inputs (root inport signals with default storage) */
ExtU_add_test_T add_test_U;

/* External outputs (root outports fed by signals with default storage) */
ExtY_add_test_T add_test_Y;

/* Real-time model */
RT_MODEL_add_test_T add_test_M_ = RT_MODEL_add_test_T();
RT_MODEL_add_test_T *const add_test_M = &add_test_M_;

/* Model step function */
void add_test_step(void)
{
  /* Outport: '<Root>/Out1' incorporates:
   *  Inport: '<Root>/In1'
   *  Inport: '<Root>/In2'
   *  Sum: '<Root>/Sum'
   */
  add_test_Y.Out1 = add_test_U.In1 + add_test_U.In2;

  /* Matfile logging */
  rt_UpdateTXYLogVars(add_test_M->rtwLogInfo, (&add_test_M->Timing.taskTime0));

  /* signal main to stop simulation */
  {                                    /* Sample time: [0.2s, 0.0s] */
    if ((rtmGetTFinal(add_test_M)!=-1) &&
        !((rtmGetTFinal(add_test_M)-add_test_M->Timing.taskTime0) >
          add_test_M->Timing.taskTime0 * (DBL_EPSILON))) {
      rtmSetErrorStatus(add_test_M, "Simulation finished");
    }
  }

  /* Update absolute time for base rate */
  /* The "clockTick0" counts the number of times the code of this task has
   * been executed. The absolute time is the multiplication of "clockTick0"
   * and "Timing.stepSize0". Size of "clockTick0" ensures timer will not
   * overflow during the application lifespan selected.
   * Timer of this task consists of two 32 bit unsigned integers.
   * The two integers represent the low bits Timing.clockTick0 and the high bits
   * Timing.clockTickH0. When the low bit overflows to 0, the high bits increment.
   */
  if (!(++add_test_M->Timing.clockTick0)) {
    ++add_test_M->Timing.clockTickH0;
  }

  add_test_M->Timing.taskTime0 = add_test_M->Timing.clockTick0 *
    add_test_M->Timing.stepSize0 + add_test_M->Timing.clockTickH0 *
    add_test_M->Timing.stepSize0 * 4294967296.0;
}

/* Model initialize function */
void add_test_initialize(void)
{
  /* Registration code */

  /* initialize non-finites */
  rt_InitInfAndNaN(sizeof(real_T));
  rtmSetTFinal(add_test_M, 10.0);
  add_test_M->Timing.stepSize0 = 0.2;

  /* Setup for data logging */
  {
    static RTWLogInfo rt_DataLoggingInfo;
    rt_DataLoggingInfo.loggingInterval = NULL;
    add_test_M->rtwLogInfo = &rt_DataLoggingInfo;
  }

  /* Setup for data logging */
  {
    rtliSetLogXSignalInfo(add_test_M->rtwLogInfo, (NULL));
    rtliSetLogXSignalPtrs(add_test_M->rtwLogInfo, (NULL));
    rtliSetLogT(add_test_M->rtwLogInfo, "tout");
    rtliSetLogX(add_test_M->rtwLogInfo, "");
    rtliSetLogXFinal(add_test_M->rtwLogInfo, "");
    rtliSetLogVarNameModifier(add_test_M->rtwLogInfo, "rt_");
    rtliSetLogFormat(add_test_M->rtwLogInfo, 4);
    rtliSetLogMaxRows(add_test_M->rtwLogInfo, 0);
    rtliSetLogDecimation(add_test_M->rtwLogInfo, 1);
    rtliSetLogY(add_test_M->rtwLogInfo, "");
    rtliSetLogYSignalInfo(add_test_M->rtwLogInfo, (NULL));
    rtliSetLogYSignalPtrs(add_test_M->rtwLogInfo, (NULL));
  }

  /* external inputs */
  (void)std::memset(&add_test_U, 0, sizeof(ExtU_add_test_T));

  /* external outputs */
  add_test_Y.Out1 = 0.0;

  /* Matfile logging */
  rt_StartDataLoggingWithStartTime(add_test_M->rtwLogInfo, 0.0, rtmGetTFinal
    (add_test_M), add_test_M->Timing.stepSize0, (&rtmGetErrorStatus(add_test_M)));
}

/* Model terminate function */
void add_test_terminate(void)
{
  /* (no terminate code required) */
}
