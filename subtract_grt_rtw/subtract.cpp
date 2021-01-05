/*
 * subtract.cpp
 *
 * Code generation for model "subtract".
 *
 * Model version              : 1.3
 * Simulink Coder version : 9.3 (R2020a) 18-Nov-2019
 * C++ source code generated on : Tue Jan  5 14:31:05 2021
 *
 * Target selection: grt.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: Intel->x86-64 (Windows64)
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "subtract.h"
#include "subtract_private.h"

/* External inputs (root inport signals with default storage) */
ExtU_subtract_T subtract_U;

/* External outputs (root outports fed by signals with default storage) */
ExtY_subtract_T subtract_Y;

/* Real-time model */
RT_MODEL_subtract_T subtract_M_ = RT_MODEL_subtract_T();
RT_MODEL_subtract_T *const subtract_M = &subtract_M_;

/* Model step function */
void subtract_step(void)
{
  /* Outport: '<Root>/Out1' incorporates:
   *  Inport: '<Root>/In1'
   *  Inport: '<Root>/In2'
   *  Inport: '<Root>/In3'
   *  Sum: '<Root>/Sum'
   */
  subtract_Y.Out1 = (subtract_U.In1 - subtract_U.In2) + subtract_U.In3;

  /* Matfile logging */
  rt_UpdateTXYLogVars(subtract_M->rtwLogInfo, (&subtract_M->Timing.taskTime0));

  /* signal main to stop simulation */
  {                                    /* Sample time: [0.2s, 0.0s] */
    if ((rtmGetTFinal(subtract_M)!=-1) &&
        !((rtmGetTFinal(subtract_M)-subtract_M->Timing.taskTime0) >
          subtract_M->Timing.taskTime0 * (DBL_EPSILON))) {
      rtmSetErrorStatus(subtract_M, "Simulation finished");
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
  if (!(++subtract_M->Timing.clockTick0)) {
    ++subtract_M->Timing.clockTickH0;
  }

  subtract_M->Timing.taskTime0 = subtract_M->Timing.clockTick0 *
    subtract_M->Timing.stepSize0 + subtract_M->Timing.clockTickH0 *
    subtract_M->Timing.stepSize0 * 4294967296.0;
}

/* Model initialize function */
void subtract_initialize(void)
{
  /* Registration code */

  /* initialize non-finites */
  rt_InitInfAndNaN(sizeof(real_T));
  rtmSetTFinal(subtract_M, 10.0);
  subtract_M->Timing.stepSize0 = 0.2;

  /* Setup for data logging */
  {
    static RTWLogInfo rt_DataLoggingInfo;
    rt_DataLoggingInfo.loggingInterval = NULL;
    subtract_M->rtwLogInfo = &rt_DataLoggingInfo;
  }

  /* Setup for data logging */
  {
    rtliSetLogXSignalInfo(subtract_M->rtwLogInfo, (NULL));
    rtliSetLogXSignalPtrs(subtract_M->rtwLogInfo, (NULL));
    rtliSetLogT(subtract_M->rtwLogInfo, "tout");
    rtliSetLogX(subtract_M->rtwLogInfo, "");
    rtliSetLogXFinal(subtract_M->rtwLogInfo, "");
    rtliSetLogVarNameModifier(subtract_M->rtwLogInfo, "rt_");
    rtliSetLogFormat(subtract_M->rtwLogInfo, 4);
    rtliSetLogMaxRows(subtract_M->rtwLogInfo, 0);
    rtliSetLogDecimation(subtract_M->rtwLogInfo, 1);
    rtliSetLogY(subtract_M->rtwLogInfo, "");
    rtliSetLogYSignalInfo(subtract_M->rtwLogInfo, (NULL));
    rtliSetLogYSignalPtrs(subtract_M->rtwLogInfo, (NULL));
  }

  /* external inputs */
  (void)std::memset(&subtract_U, 0, sizeof(ExtU_subtract_T));

  /* external outputs */
  subtract_Y.Out1 = 0.0;

  /* Matfile logging */
  rt_StartDataLoggingWithStartTime(subtract_M->rtwLogInfo, 0.0, rtmGetTFinal
    (subtract_M), subtract_M->Timing.stepSize0, (&rtmGetErrorStatus(subtract_M)));
}

/* Model terminate function */
void subtract_terminate(void)
{
  /* (no terminate code required) */
}
