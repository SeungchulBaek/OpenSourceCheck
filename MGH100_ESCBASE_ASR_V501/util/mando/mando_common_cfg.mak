# \file
#
# \brief Mando make configuration module
#
# This file contains the implementation of the Mando make 
# configuration module.
#
# \author Mando, Advanced R&D, Korea

#################################################################

MANDO_COMMON_ROOT     ?= $(WORKSPACE_BASE)\SourceCode

MANDO_COMMON_FILE_LIST := 

# In AUTOSAR Platform, 
# all common files added to CC_FILES_TO_BUILD should be added to MANDO_COMMON_FILE_LIST, too.
# (If a new file is not added to MANDO_COMMON_FILE_LIST, mando-specific compile option would be not applied for that file.)

## VIL
CC_INCLUDE_PATH    += $(WORKSPACE_BASE)\SourceCode\VIL
CC_INCLUDE_PATH    += $(WORKSPACE_BASE)\SourceCode\VIL\LOGGER
MANDO_COMMON_FILE_LIST += ASW_LogData.c \
    M_LOGGER_VD.c \
    PF_DataLogSet.c \
    FS_DataLogSet.c
CC_FILES_TO_BUILD  += $(WORKSPACE_BASE)\SourceCode\VIL\LOGGER\ASW_LogData.c
CC_FILES_TO_BUILD  += $(WORKSPACE_BASE)\SourceCode\VIL\LOGGER\M_LOGGER_VD.c
CC_FILES_TO_BUILD  += $(WORKSPACE_BASE)\SourceCode\VIL\LOGGER\PF_DataLogSet.c
CC_FILES_TO_BUILD  += $(WORKSPACE_BASE)\SourceCode\VIL\LOGGER\FS_DataLogSet.c

## LIB
-include $(WORKSPACE_BASE)\SourceCode\LIB\MAK\LIB.mak
MANDO_COMMON_FILE_LIST += $(LIB_SRC_LIST) $(LIB_MPU_SRC_LIST)

## FBL_HDR
ifeq ($(M_CAR_MAKER), GM_CHINA)
CC_INCLUDE_PATH    += $(WORKSPACE_BASE)\SourceCode\FBL_HDR\FBL_GM_CHINA
#MANDO_COMMON_FILE_LIST += applvect.c \
#    dummySba.c
ifneq ($(GEN_SINGLE_LIB_ENABLE), ENABLE)
CC_FILES_TO_BUILD  += $(WORKSPACE_BASE)\SourceCode\FBL_HDR\FBL_GM_CHINA\applvect.c
CC_FILES_TO_BUILD  += $(WORKSPACE_BASE)\SourceCode\FBL_HDR\FBL_GM_CHINA\dummySba.c
else
MANDO_src_FILES  += $(WORKSPACE_BASE)\SourceCode\FBL_HDR\FBL_GM_CHINA\applvect.c
MANDO_src_FILES  += $(WORKSPACE_BASE)\SourceCode\FBL_HDR\FBL_GM_CHINA\dummySba.c
endif
else
CC_INCLUDE_PATH    += $(WORKSPACE_BASE)\SourceCode\FBL_HDR\FBL_HMC
#MANDO_COMMON_FILE_LIST += Fbl_Header.c \
#    Fbl_Mtab.c
ifneq ($(GEN_SINGLE_LIB_ENABLE), ENABLE)
CC_FILES_TO_BUILD  += $(WORKSPACE_BASE)\SourceCode\FBL_HDR\FBL_HMC\Fbl_Header.c
CC_FILES_TO_BUILD  += $(WORKSPACE_BASE)\SourceCode\FBL_HDR\FBL_HMC\Fbl_Mtab.c
else
MANDO_src_FILES  += $(WORKSPACE_BASE)\SourceCode\FBL_HDR\FBL_HMC\Fbl_Header.c
MANDO_src_FILES  += $(WORKSPACE_BASE)\SourceCode\FBL_HDR\FBL_HMC\Fbl_Mtab.c
endif
endif

## HDR
CC_INCLUDE_PATH    += $(WORKSPACE_BASE)\SourceCode\HDR
CC_INCLUDE_PATH    += $(WORKSPACE_BASE)\SourceCode\HDR\AUTOSAR

#################################################################
## ETC OPTION
#LOC_FILE = $(UTIL_DIR)\linkscript\TRICORE-tasking_Test.dld

#LOC_FILE = $(UTIL_DIR)\linkscript\$(M_CAR_MAKER)\MGH100.lsl

ifeq ($(M_CAR_MAKER), GM_CHINA)
LOC_FILE = $(UTIL_DIR)\linkscript\$(M_CAR_MAKER)\TRICORE-tasking.dld
else
LOC_FILE = $(UTIL_DIR)\linkscript\COMMON\TRICORE-tasking.dld
endif

CC_OPT += -D_TASKING_C_TRICORE_=1
CC_OPT += -DV_ECU=2
CC_OPT += -DV_MOCI=0
CC_OPT += -DV_MCU=34
CC_OPT += --no-warnings
CC_OPT += --keep-temporary-files
CC_OPT += -DV_MOCI_ECU=0

CPP_OPTS += -D_TASKING_C_TRICORE_=1
CPP_OPTS += -DV_ECU=2
CPP_OPTS += -DV_MOCI=0
CPP_OPTS += -DV_MCU=34
CPP_OPTS += -DV_MOCI_ECU=0

LINK_OPT += -D__CPU__=tc23x
LINK_OPT += -D__PROC_TC23X__
#LINK_OPT += --core=mpe:vtc
#LINK_OPT += --global-type-checking

ifeq ($(MGH100_ABS_LARGE), ENABLE)
CC_OPT += -DABS_SOLO_ONLY
CPP_OPTS += -DABS_SOLO_ONLY
LINK_OPT += -DMGH100_ABS_LARGE
endif

ifeq ($(GEN_SINGLE_LIB_ENABLE), ENABLE)
LINK_OPT += --extern=ADC0SR0_ISR,ADC0SR1_ISR,ADC0SR2_ISR,ADC1SR0_ISR,ADC1SR1_ISR,ADC1SR2_ISR,ADCCG0SR0_ISR,ADCCG0SR1_ISR,CANSR0_ISR,CANSR1_ISR,CANSR2_ISR,CANSR3_ISR,CANSR4_ISR,CANSR5_ISR,CANSR6_ISR,GPSRGROUP1_SR0_ISR,GTMTIM0SR1_ISR,GTMTIM0SR2_ISR,GTMTIM0SR3_ISR,GTMTIM0SR4_ISR,GTMTOM0SR1_ISR,GTMTOM1SR0_ISR,GTMTOM1SR7_ISR
endif

ifeq ($(M_MISRA_CHECK), ENABLE)
MANDO_MISRAC_CHECK_VER :=2012
#MANDO_MISRAC_CHECK_RULE := 2.4
MANDO_MISRAC_CHECK_RULE += 2.6
#MANDO_MISRAC_CHECK_RULE += 3.2
MANDO_MISRAC_CHECK_RULE += 4.1
MANDO_MISRAC_CHECK_RULE += 4.2
MANDO_MISRAC_CHECK_RULE += 5.4
MANDO_MISRAC_CHECK_RULE += 5.5
MANDO_MISRAC_CHECK_RULE += 5.6
MANDO_MISRAC_CHECK_RULE += 5.7
MANDO_MISRAC_CHECK_RULE += 5.8
MANDO_MISRAC_CHECK_RULE += 5.9
MANDO_MISRAC_CHECK_RULE += 6.1
MANDO_MISRAC_CHECK_RULE += 6.2
MANDO_MISRAC_CHECK_RULE += 7.1
MANDO_MISRAC_CHECK_RULE += 7.2
MANDO_MISRAC_CHECK_RULE += 7.3
#MANDO_MISRAC_CHECK_RULE += 7.4
MANDO_MISRAC_CHECK_RULE += 8.1
#MANDO_MISRAC_CHECK_RULE += 8.2
MANDO_MISRAC_CHECK_RULE += 8.6
#MANDO_MISRAC_CHECK_RULE += 8.10
MANDO_MISRAC_CHECK_RULE += 8.11
MANDO_MISRAC_CHECK_RULE += 8.12
MANDO_MISRAC_CHECK_RULE += 8.14
MANDO_MISRAC_CHECK_RULE += 9.1
MANDO_MISRAC_CHECK_RULE += 9.2
MANDO_MISRAC_CHECK_RULE += 9.3
MANDO_MISRAC_CHECK_RULE += 9.4
MANDO_MISRAC_CHECK_RULE += 9.5
MANDO_MISRAC_CHECK_RULE += 10.2
MANDO_MISRAC_CHECK_RULE += 11.1
MANDO_MISRAC_CHECK_RULE += 11.2
MANDO_MISRAC_CHECK_RULE += 11.7
MANDO_MISRAC_CHECK_RULE += 12.3
MANDO_MISRAC_CHECK_RULE += 12.4
MANDO_MISRAC_CHECK_RULE += 13.1
MANDO_MISRAC_CHECK_RULE += 13.3
#MANDO_MISRAC_CHECK_RULE += 13.4
MANDO_MISRAC_CHECK_RULE += 13.6
MANDO_MISRAC_CHECK_RULE += 14.1
#MANDO_MISRAC_CHECK_RULE += 14.4
MANDO_MISRAC_CHECK_RULE += 15.1
MANDO_MISRAC_CHECK_RULE += 15.2
MANDO_MISRAC_CHECK_RULE += 15.3
MANDO_MISRAC_CHECK_RULE += 15.4
#MANDO_MISRAC_CHECK_RULE += 15.6
#MANDO_MISRAC_CHECK_RULE += 16.1
MANDO_MISRAC_CHECK_RULE += 16.2
MANDO_MISRAC_CHECK_RULE += 16.3
MANDO_MISRAC_CHECK_RULE += 16.5
MANDO_MISRAC_CHECK_RULE += 16.6
MANDO_MISRAC_CHECK_RULE += 16.7
MANDO_MISRAC_CHECK_RULE += 17.1
MANDO_MISRAC_CHECK_RULE += 17.2
MANDO_MISRAC_CHECK_RULE += 17.3
MANDO_MISRAC_CHECK_RULE += 17.4
#MANDO_MISRAC_CHECK_RULE += 17.5
MANDO_MISRAC_CHECK_RULE += 17.6
MANDO_MISRAC_CHECK_RULE += 17.7
MANDO_MISRAC_CHECK_RULE += 18.2
MANDO_MISRAC_CHECK_RULE += 18.3
MANDO_MISRAC_CHECK_RULE += 18.5
MANDO_MISRAC_CHECK_RULE += 18.6
MANDO_MISRAC_CHECK_RULE += 18.7
#MANDO_MISRAC_CHECK_RULE += 18.8
MANDO_MISRAC_CHECK_RULE += 19.1
MANDO_MISRAC_CHECK_RULE += 20.1
MANDO_MISRAC_CHECK_RULE += 20.2
MANDO_MISRAC_CHECK_RULE += 20.3
MANDO_MISRAC_CHECK_RULE += 20.4
#MANDO_MISRAC_CHECK_RULE += 20.5
#MANDO_MISRAC_CHECK_RULE += 20.6
#MANDO_MISRAC_CHECK_RULE += 20.7
MANDO_MISRAC_CHECK_RULE += 20.8
#MANDO_MISRAC_CHECK_RULE += 20.10
MANDO_MISRAC_CHECK_RULE += 20.11
MANDO_MISRAC_CHECK_RULE += 20.12
MANDO_MISRAC_CHECK_RULE += 20.13
MANDO_MISRAC_CHECK_RULE += 20.14
#MANDO_MISRAC_CHECK_RULE += 21.2
MANDO_MISRAC_CHECK_RULE += 21.3
MANDO_MISRAC_CHECK_RULE += 21.4
MANDO_MISRAC_CHECK_RULE += 21.5
MANDO_MISRAC_CHECK_RULE += 21.6
MANDO_MISRAC_CHECK_RULE += 21.7
MANDO_MISRAC_CHECK_RULE += 21.8
MANDO_MISRAC_CHECK_RULE += 21.9
MANDO_MISRAC_CHECK_RULE += 21.10
MANDO_MISRAC_CHECK_RULE += 21.11
MANDO_MISRAC_CHECK_RULE += 21.12
MANDO_MISRAC_CHECK_RULE += 22.1
MANDO_MISRAC_CHECK_RULE += 22.2
MANDO_MISRAC_CHECK_RULE += 22.3
MANDO_MISRAC_CHECK_RULE += 22.4
MANDO_MISRAC_CHECK_RULE += 22.5
MANDO_MISRAC_CHECK_RULE += 22.6
MANDO_EMPTY :=
MANDO_BLANK := $(MANDO_EMPTY) $(MANDO_EMPTY)
MANDO_COMMA := ,
MANDO_MISRAC_CHECK_RULE_LIST = $(subst $(MANDO_BLANK),$(MANDO_COMMA),$(MANDO_MISRAC_CHECK_RULE))
else
#Check MISRA-C Rule 9.2 to prevent data partial initialization
CC_OPT += --misrac=9.2
CC_OPT += --misrac-version=2004
endif
