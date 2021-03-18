# \file
#
# \brief Mando make configuration module
#
# This file contains the implementation of the Mando make 
# configuration module.
#
# \author Mando, Advanced R&D, Korea

#################################################################

MANDO_BSW_ROOT     ?= $(WORKSPACE_BASE)\SourceCode\BSW

#################################################################
MANDO_BSW_MODULES  := \
    AbsVlvM \
    Ach \
    Acm \
    AdcIf \
    Aka \
    Arbitrator \
    Awd \
    Ax \
    AxM \
    Ay \
    AyM \
    CanIfCdd \
    CanM \
    CanTpCdd \
    CanTrv_TLE6251 \
    ComCdd \
    DcmCdd \
    Dcmio \
    DemCdd \
    Diag \
    EcuHwCtrlM \
    Fsr \
    Icu \
    IoIf \
    Mom \
    MtrM \
    NvmCdd \
    PduRCdd \
    Pedal \
    Press \
    PressM \
    Proxy \
    PTS1M \
    PTS2M \
    Rly \
    RlyM \
    Sas \
    SasM \
    Scheduler \
    SenPwrM \
    SentH \
    Swt \
    SwtM \
    SysPwrM \
    Task_1ms \
    Task_5ms \
    Vacuum \
    VacuumM \
    Vim \
    Vlv \
    Wss \
    WssM \
    Yaw \
    YawM \
    PFM

MANDO_BSW_MODULES += \
    Spim
    
ifeq ($(M_XCP_ENABLE),ENABLE)
MANDO_BSW_MODULES += XCP
endif

#MANDO_BSW_MODULES +=
#    Ioc \
#    Prly \
#    TomTimerHandler \
#    Watchdog \

ifeq ($(M_GLIWA_ENABLE),ENABLE)
MANDO_BSW_MODULES += Gliwa
endif

ifneq ($(filter $(M_YAW_SENSOR_TYPE) $(M_AX_SENSOR_TYPE), MURATA_INTEGRATED_TYPE BOSCH_INTEGRATED_TYPE),)
MANDO_BSW_MODULES += \
    Ych \
    Ycm 
endif

Gliwa_VARIANT                 := Autosar
    
#################################################################
# ALL Variants are moved to each module's makefile #
#################################################################
UNIT_TEST             ?= false
ifeq ($(MGH100_ABS_LARGE), ENABLE)
Task_1ms_VARIANT            := ESC_ABS_LARGE
Task_5ms_VARIANT            := ESC_ABS_LARGE
else
Task_1ms_VARIANT            := ESC_BASE
Task_5ms_VARIANT            := ESC_BASE
endif
