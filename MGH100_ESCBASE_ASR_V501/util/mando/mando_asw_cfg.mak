# \file
#
# \brief Mando make configuration module
#
# This file contains the implementation of the Mando make 
# configuration module.
#
# \author Mando, Advanced R&D, Korea

#################################################################

MANDO_ASW_ROOT     ?= $(WORKSPACE_BASE)\SourceCode\ASW

MANDO_FAL_ROOT     ?= $(WORKSPACE_BASE)\SourceCode\ASW\FAL

#################################################################
ifeq ($(MGH100_ABS_LARGE), ENABLE)
# <!-- AUTOSAR applied ABS only product
MANDO_FAL_MODULES  := \
    AxP \
    BrkTqCtrlr \
    CalPrm \
    Eem \
    EemSec \
    ElecVacPmp \
    Ess \
    Estmr \
    MotCtrlr \
    PTS1P \
    PTS2P \
    SigProcr \
    SwtP \
    VehMdCtrl \
    Wslc \
    WssP

ifeq ($(MGH100_ABS_MOCI), ENABLE)
### AUTOSAR applied ABS only + MOCI product ###
MANDO_FAL_MODULES += \
    Pbc_HOST
endif
# AUTOSAR applied ABS only product -->
else
# <!-- ESCBASE product
MANDO_FAL_MODULES  := \
    AutoBrkCoorr \
    AwdCtrlr \
    AxP \
    AyP \
    BrkAssisCoorr \
    BrkTqArbr \
    BrkTqCtrlr \
    CalPrm \
    Eem \
    EemSec \
    ElecVacPmp \
    Ess \
    Estmr \
    FctLampCoorr \
    Itpms \
    LatDynsCoorr \
    LowPCoorr \
    MdlSigProc \
    MotCtrlr \
    PressP \
    PrpnTqArbr \
    PTS1P \
    PTS2P \
    RgnBrkCtrlr \
    SasP \
    SigProcr \
    Ssm \
    StrStabyCtrl \
    SwtP \
    VehDrvStsDetr \
    VehLgtCoorr \
    VehMdCtrl \
    Wslc \
    Wspc \
    WssP \
    YawP    

ifeq ($(M_CAR_MAKER),FORD)
MANDO_FAL_MODULES  +=
    FORD_HOST_FSC   \
    FORD_HOST_FSC_SAFETY_BARRIER \
    FORD_HOST_SDM
endif

# ESCBASE product -->
endif

#################################################################
# ALL Variants are moved to each module's makefile #

