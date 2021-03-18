# \file
#
# \brief AUTOSAR Make
#
# This file contains the implementation of the AUTOSAR
# module Make.
#
# \author Elektrobit Automotive GmbH, 91058 Erlangen, Germany
#
# Copyright 2005 - 2016 Elektrobit Automotive GmbH
# All rights exclusively reserved for Elektrobit Automotive GmbH,
# unless expressly agreed to otherwise.
#################################################################
## This makefile export parameters derived from the project
## data to make variables

# Only include these variables once
ifndef PROJECT_MODULES

# project name in workspace
TRESOS2_PROJECT_NAME := MGH100_TC23x_basic
TRESOS2_ECU_ID       := ECU

# target and derivate
TARGET   := TRICORE
DERIVATE := TC23XL

ifeq ($(ENABLED_PLUGINS),)
# In case enabled modules are NOT specified explicitly
# use all enabled modules (including modules, that are NOT generated)
#PROJECT_MODULES := Adc Base BswM CanIf CanNm CanSM CanTp Can ComM Com Crc Dcm Dem Det Dio  EcuC EcuM Fee Fls Gpt Make Mcu MemIf MemMap MicroOs Nm NvM Os PbcfgM PduR Platforms Port Resource Rte  WdgIf WdgM Wdg Dma Sent
PROJECT_MODULES := Adc Base BswM CanIf CanNm CanSM CanTp Can ComM Com Crc Dcm Dem Det Dio  EcuC EcuM Fee Fls Gpt Make Mcu MemIf MemMap MicroOs Nm NvM Os PbcfgM PduR Platforms Port Resource Rte  WdgIf WdgM Wdg Dma Sent
else
# otherwise only use generated modules
#PROJECT_MODULES := Adc Base BswM CanIf CanNm CanSM CanTp Can ComM Com Crc Dcm Dem Det Dio  EcuC EcuM Fee Fls Gpt Make Mcu MemIf MemMap MicroOs Nm NvM Os PbcfgM PduR Platforms Port Resource Rte  WdgIf WdgM Wdg
PROJECT_MODULES := Adc Base BswM CanIf CanNm CanSM CanTp Can ComM Com Crc Dcm Dem Det Dio  EcuC EcuM Fee Fls Gpt Make Mcu MemIf MemMap MicroOs Nm NvM Os PbcfgM PduR Platforms Port Resource Rte  WdgIf WdgM Wdg Dma Sent
endif

# add tresos2 make plugin if not yet contained in SOFTWARE_MODULES
SOFTWARE_MODULES := $(filter-out tresos2,$(SOFTWARE_MODULES))
SOFTWARE_MODULES += tresos2

# There might already modules added to SOFTWARE_MODULES. So add only what's
# not yet contained SOFTWARE_MODULES.
# Duplicated entries are removed by the sort function.
SOFTWARE_MODULES += $(sort $(filter-out $(SOFTWARE_MODULES),$(PROJECT_MODULES)))

# variables defining module versions
Adc_VARIANT := TS_T16D22M3I1R0
Base_VARIANT := TS_TxDxM5I0R0
BswM_VARIANT := TS_TxDxM1I11R0
CanIf_VARIANT := TS_TxDxM6I5R0
CanNm_VARIANT := TS_TxDxM6I15R0
CanSM_VARIANT := TS_TxDxM3I4R0
CanTp_VARIANT := TS_TxDxM6I5R0
Can_VARIANT := TS_T16D22M2I3R0
ComM_VARIANT := TS_TxDxM5I15R0
Com_VARIANT := TS_TxDxM6I3R0
Crc_VARIANT := TS_TxDxM6I9R0
Dcm_VARIANT := TS_TxDxM4I12R0
Dem_VARIANT := TS_TxDxM5I16R0
Det_VARIANT := TS_TxDxM6I4R0
Dio_VARIANT := TS_T16D22M3I0R0
#_VARIANT := TS_
Dma_VARIANT         := AurixAS403
EcuC_VARIANT := TS_TxDxM5I0R0
EcuM_VARIANT := TS_TxDxM5I11R0
Fee_VARIANT := TS_T16D22M2I3R0
Fls_VARIANT := TS_T16D22M2I2R0
Gpt_VARIANT := TS_T16D22M3I1R0
Make_VARIANT := TS_TxDxM4I0R0
Mcu_VARIANT := TS_T16D22M4I3R0
MemIf_VARIANT := TS_TxDxM5I9R0
MemMap_VARIANT := TS_TxDxM1I2R0
MicroOs_VARIANT := TS_T16D22M1I1R0
Nm_VARIANT := TS_TxDxM5I10R0
NvM_VARIANT := TS_TxDxM6I14R0
Os_VARIANT := TS_T16D22M4I5R0_AS403
PbcfgM_VARIANT := TS_TxDxM1I2R0
PduR_VARIANT := TS_TxDxM5I3R0
Platforms_VARIANT := TS_T16D22M2I0R0
Port_VARIANT := TS_T16D22M3I0R0
Resource_VARIANT := TS_T16D22M2I1R0
Rte_VARIANT := TS_TxDxM6I1R0
#_VARIANT := TS_
Sent_VARIANT        := AurixAS403
WdgIf_VARIANT := TS_TxDxM6I0R0
WdgM_VARIANT := TS_TxDxM6I0R0
Wdg_VARIANT := TS_T16D22M3I2R0


# output path for generated files
GEN_OUTPUT_PATH  ?= C:/EB/tresos/ACG7/workspace/MGH100_TC23x_basic/output/generated
# list of all output paths of generated files
GEN_OUTPUT_PATHS := \
$(GEN_OUTPUT_PATH)


# output path for files created by the build environment
PROJECT_OUTPUT_PATH ?= $(realpath $(GEN_OUTPUT_PATH)/..)

# for compatibility reasons we need the AUTOSAR_BASE_OUTPUT_PATH
AUTOSAR_BASE_OUTPUT_PATH ?= $(GEN_OUTPUT_PATH)

endif

# Set Os Vendor to EB
OS_VENDOR := EB
