# \file
#
# \brief Mando make configuration module
#
# This file contains the implementation of the Mando make 
# configuration module.
#
# \author Mando, Advanced R&D, Korea

#################################################################

#################################################################
# MANDO_PLUGIN_TYPE := (LEGACY or AUTOSAR)
# This variable defines the plugin name in the Build package.
#
MANDO_PLUGIN_TYPE    := $(MANDO_PLATFORM)

MANDO_PLUGIN_ROOT    ?= $(WORKSPACE_BASE)\SourceCode\PLUGIN\$(MANDO_PLUGIN_TYPE)

#################################################################
ifeq ($(MANDO_PLUGIN_TYPE), LEGACY)
$(error Error! MANDO_PLUGIN_TYPE should be AUTOSAR in this build package!)
#MANDO_LEGACY_MCAL_ROOT             ?= $(MANDO_PLUGIN_ROOT)\MCAL
#MANDO_LEGACY_SYSTEMSERVICE_ROOT    ?= $(MANDO_PLUGIN_ROOT)\SystemService
#MANDO_PLUGIN_MODULES               := $(MANDO_MCU)
#MANDO_LEGACY_VARIANT               := $(OEM_MCAL_CAR_NAME)

endif



ifeq ($(MANDO_PLUGIN_TYPE), AUTOSAR)
MANDO_AUTOSAR_ROOT                 ?= $(MANDO_PLUGIN_ROOT)
ifeq ($(M_CAN_PROTOCOL_TYPE), PROTOCOL_TYPE_CANFD)
MANDO_AUTOSAR_PACKAGE              := ASR403_TC23X_AC_V201
else
MANDO_AUTOSAR_PACKAGE              := ASR403_TC23X_V501
endif

MANDO_AUTOSAR_FIX_DIR              := $(MANDO_AUTOSAR_ROOT)\$(MANDO_AUTOSAR_PACKAGE)\plugins
MANDO_AUTOSAR_CFG_DIR              := $(MANDO_AUTOSAR_ROOT)\$(MANDO_AUTOSAR_PACKAGE)\generated
MANDO_AUTOSAR_USR_DIR              := $(MANDO_AUTOSAR_ROOT)\$(MANDO_AUTOSAR_PACKAGE)\source

MANDO_PLUGIN_MODULES := \
    Adc \
    Base \
    BswM \
    CanIf \
    CanSM \
    CanTp \
    Can \
    ComM \
    Com \
    Crc \
    Dcm \
    Dem \
    Det \
    Dio \
    Dma \
    EcuC \
    EcuM \
    Fee \
    Fls \
    Gpt \
    Make \
    Mcu \
    MemIf \
    MemMap \
    MicroOs \
    NvM \
    Os \
    PduR \
    Platforms \
    Port \
    Resource \
    Rte \
    Sent \
    WdgIf \
    WdgM \
    Wdg
ifeq ($(MANDO_USE_CANNM), TRUE)
    MANDO_PLUGIN_MODULES += Nm
    MANDO_PLUGIN_MODULES += CanNm
endif
    MANDO_PLUGIN_MODULES += Pwm
ifneq ($(M_HARDWARE_SECURITY), DISABLE)
ifeq ($(M_HARDWARE_SECURITY), INFINEON)
#    MANDO_PLUGIN_MODULES += CryShe
    MANDO_PLUGIN_MODULES += CryHsm
endif
    MANDO_PLUGIN_MODULES += Csm
endif

Adc_VARIANT := TS_T16D22M3I2R0
Base_VARIANT := TS_TxDxM5I0R0
BswM_VARIANT := TS_TxDxM1I12R0
CanIf_VARIANT := TS_TxDxM6I9R0
ifeq ($(MANDO_USE_CANNM), TRUE)
CanNm_VARIANT := TS_TxDxM6I16R0
endif
CanSM_VARIANT := TS_TxDxM3I6R0
CanTp_VARIANT := TS_TxDxM6I7R0
Can_VARIANT := TS_T16D22M2I7R0
ComM_VARIANT := TS_TxDxM5I16R0
Com_VARIANT := TS_TxDxM6I3R0
Crc_VARIANT := TS_TxDxM6I10R0
ifneq ($(M_HARDWARE_SECURITY), DISABLE)
ifeq ($(M_HARDWARE_SECURITY), INFINEON)
#CryShe_VARIANT := TS_T16D22M1I3R0
CryHsm_VARIANT := TS_M3M0P62
endif
Csm_VARIANT := TS_TxDxM2I0R0
endif
Dcm_VARIANT := TS_TxDxM4I12R0
Dem_VARIANT := TS_TxDxM5I17R0
Det_VARIANT := TS_TxDxM6I4R0
Dio_VARIANT := TS_T16D22M3I1R0
Dma_VARIANT := TS_AurixAS403
EcuC_VARIANT := TS_TxDxM5I0R0
EcuM_VARIANT := TS_TxDxM5I12R0
Fee_VARIANT := TS_T16D22M2I4R0
Fls_VARIANT := TS_T16D22M2I4R0
Gpt_VARIANT := TS_T16D22M3I3R0
Make_VARIANT := TS_TxDxM4I0R0
Mcu_VARIANT := TS_T16D22M4I6R0
MemIf_VARIANT := TS_TxDxM5I10R0
MemMap_VARIANT := TS_TxDxM1I2R0
MicroOs_VARIANT := TS_T16D22M1I1R0
ifeq ($(MANDO_USE_CANNM), TRUE)
Nm_VARIANT := TS_TxDxM5I10R0
endif
NvM_VARIANT := TS_TxDxM6I15R0
Os_VARIANT := TS_T16D22M4I5R0_AS403
PduR_VARIANT := TS_TxDxM5I3R0
Platforms_VARIANT := TS_T16D22M2I0R0
Port_VARIANT := TS_T16D22M3I1R0
Pwm_VARIANT := TS_T16D22M5I1R0
Resource_VARIANT := TS_T16D22M2I1R0
Rte_VARIANT := TS_TxDxM6I1R0
ifeq ($(M_CAN_PROTOCOL_TYPE), PROTOCOL_TYPE_CANFD)
Sent_VARIANT := AurixAS403
else
Sent_VARIANT := TS_AurixAS403
endif
WdgIf_VARIANT := TS_TxDxM6I0R0
WdgM_VARIANT := TS_TxDxM6I0R0
Wdg_VARIANT := TS_T16D22M3I4R0

###############################################################################
# add tresos2 make plugin if not yet contained in SOFTWARE_MODULES
SOFTWARE_MODULES := tresos2

# There might already modules added to SOFTWARE_MODULES. So add only what's
# not yet contained SOFTWARE_MODULES.
# Duplicated entries are removed by the sort function.
SOFTWARE_MODULES += $(sort $(filter-out $(SOFTWARE_MODULES), $(MANDO_PLUGIN_MODULES)))

# for compatibility reasons we need the AUTOSAR_BASE_OUTPUT_PATH
AUTOSAR_BASE_OUTPUT_PATH = $(MANDO_AUTOSAR_CFG_DIR)\$(MANDO_AUTOSAR_CFG_VARIANT)

###############################################################################
#AUTOSAR User Code ##############################################################
CC_FILES_TO_BUILD += $(wildcard $(MANDO_AUTOSAR_USR_DIR)/application/*.c) \
                     $(wildcard $(MANDO_AUTOSAR_USR_DIR)/application/$(TARGET)/*.c) \
                     $(wildcard $(MANDO_AUTOSAR_USR_DIR)/application/$(TARGET)/$(DERIVATE)/*.c)
#                     $(wildcard $(MANDO_AUTOSAR_USR_DIR)/stubs/*.c) \
#                     $(wildcard $(MANDO_AUTOSAR_USR_DIR)/stubs/$(TARGET)/*.c) \
#                     $(wildcard $(MANDO_AUTOSAR_USR_DIR)/stubs/$(TARGET)/$(DERIVATE)/*.c)

#CC_INCLUDE_PATH  += $(MANDO_AUTOSAR_USR_DIR)\stubs
#CC_INCLUDE_PATH  += $(MANDO_AUTOSAR_USR_DIR)\stubs\$(TARGET)
#CC_INCLUDE_PATH  += $(MANDO_AUTOSAR_USR_DIR)\stubs\$(TARGET)\$(DERIVATE)
CC_INCLUDE_PATH  += $(MANDO_AUTOSAR_USR_DIR)\application
CC_INCLUDE_PATH  += $(MANDO_AUTOSAR_USR_DIR)\application\$(TARGET)
CC_INCLUDE_PATH  += $(MANDO_AUTOSAR_USR_DIR)\application\$(TARGET)\$(DERIVATE)
CC_INCLUDE_PATH  += $(MANDO_AUTOSAR_USR_DIR)\boards\$(BOARD)
CC_INCLUDE_PATH  += $(MANDO_AUTOSAR_USR_DIR)\config
CC_INCLUDE_PATH  += $(MANDO_AUTOSAR_USR_DIR)\config\$(TOOLCHAIN)
CPP_INCLUDE_PATH +=
ASM_INCLUDE_PATH += $(MANDO_AUTOSAR_USR_DIR)\boards\$(BOARD)

################################################################################
# AUTOSAR Module Variant management
CC_INCLUDE_PATH += $(MANDO_AUTOSAR_CFG_DIR)\include

ifneq ($(MANDO_PLUGIN_MODULES), )
include $(foreach PLUGIN,$(MANDO_PLUGIN_MODULES),\
  $(if $(wildcard $(subst \,/,$(MANDO_AUTOSAR_CFG_DIR)\variant\$(PLUGIN)\make\$(PLUGIN)$(VARIANT_FILE_SUFFIX))),\
    $(MANDO_AUTOSAR_CFG_DIR)\variant\$(PLUGIN)\make\$(PLUGIN)$(VARIANT_FILE_SUFFIX),\
  )\
)

MANDO_AUTOSAR_CFG_CUR_DIR :=$(MANDO_AUTOSAR_CFG_DIR)\..\generated_current

asr_cfg:
	@echo ========  Gather Autosar CFG to $(MANDO_AUTOSAR_CFG_CUR_DIR)==============
	@if not exist $(MANDO_AUTOSAR_CFG_CUR_DIR) mkdir $(MANDO_AUTOSAR_CFG_CUR_DIR)
	@if not exist $(MANDO_AUTOSAR_CFG_CUR_DIR)\include mkdir $(MANDO_AUTOSAR_CFG_CUR_DIR)\include
	@if not exist $(MANDO_AUTOSAR_CFG_CUR_DIR)\src mkdir $(MANDO_AUTOSAR_CFG_CUR_DIR)\src
	@if not exist $(MANDO_AUTOSAR_CFG_CUR_DIR)\config mkdir $(MANDO_AUTOSAR_CFG_CUR_DIR)\config
	@$(foreach PLUGIN,$(MANDO_PLUGIN_MODULES), $(CP) $(MANDO_AUTOSAR_CFG_DIR)\variant\$(PLUGIN)\$($(PLUGIN)_VARIANT_NAME)\*.h $(MANDO_AUTOSAR_CFG_CUR_DIR)\include\\ &)
	@$(foreach PLUGIN,$(MANDO_PLUGIN_MODULES), $(CP) $(MANDO_AUTOSAR_CFG_DIR)\variant\$(PLUGIN)\$($(PLUGIN)_VARIANT_NAME)\*.c $(MANDO_AUTOSAR_CFG_CUR_DIR)\src\\ & )
	@$(foreach PLUGIN,$(MANDO_PLUGIN_MODULES), $(CP) $(MANDO_AUTOSAR_CFG_DIR)\variant\$(PLUGIN)\$($(PLUGIN)_VARIANT_NAME)\xdm\*.xdm $(MANDO_AUTOSAR_CFG_CUR_DIR)\config\\ & )
	@$(foreach PLUGIN,$(MANDO_PLUGIN_MODULES), $(CP) $(MANDO_AUTOSAR_CFG_DIR)\variant\$(PLUGIN)\$($(PLUGIN)_VARIANT_NAME)\xdm\*.tdb $(MANDO_AUTOSAR_CFG_CUR_DIR)\config\\ & )
ifeq ($(M_CAR_MAKER), GM_CHINA)
	@if not exist $(MANDO_AUTOSAR_CFG_CUR_DIR)\arxml mkdir $(MANDO_AUTOSAR_CFG_CUR_DIR)\arxml
	@$(CP) $(MANDO_AUTOSAR_CFG_DIR)\variant\Rte\$(Rte_VARIANT_NAME)\arxml\*.arxml $(MANDO_AUTOSAR_CFG_CUR_DIR)\arxml\ 
endif
	
MANDO_AUTOSAR_VAR_IN_DIR :=$(MANDO_AUTOSAR_CFG_DIR)\..\generated_variant_input
MANDO_AUTOSAR_VAR_OUT_DIR :=$(MANDO_AUTOSAR_CFG_DIR)\..\generated_variant_output

asr_variant:
	@echo ========  Autosar CFG to VARIANT $(MANDO_AUTOSAR_CFG_VAR_DIR)==============
	@if not exist $(MANDO_AUTOSAR_VAR_OUT_DIR) mkdir $(MANDO_AUTOSAR_VAR_OUT_DIR)
	@if not exist $(MANDO_AUTOSAR_VAR_OUT_DIR)\variant mkdir $(MANDO_AUTOSAR_VAR_OUT_DIR)\variant
	@$(foreach PLUGIN, $(MANDO_PLUGIN_MODULES), $(shell if not exist $(MANDO_AUTOSAR_VAR_OUT_DIR)\variant\$(PLUGIN) mkdir $(MANDO_AUTOSAR_VAR_OUT_DIR)\variant\$(PLUGIN) ) )
	@$(foreach PLUGIN, $(MANDO_PLUGIN_MODULES), $(shell if not exist $(MANDO_AUTOSAR_VAR_OUT_DIR)\variant\$(PLUGIN)\$($(PLUGIN)_VARIANT_NAME) mkdir $(MANDO_AUTOSAR_VAR_OUT_DIR)\variant\$(PLUGIN)\$($(PLUGIN)_VARIANT_NAME) ) )
	@$(foreach PLUGIN, $(MANDO_PLUGIN_MODULES), $(shell if not exist $(MANDO_AUTOSAR_VAR_OUT_DIR)\variant\$(PLUGIN)\$($(PLUGIN)_VARIANT_NAME)\xdm mkdir $(MANDO_AUTOSAR_VAR_OUT_DIR)\variant\$(PLUGIN)\$($(PLUGIN)_VARIANT_NAME)\xdm ) )
	@$(foreach PLUGIN, $(MANDO_PLUGIN_MODULES), $(CP) $(MANDO_AUTOSAR_VAR_IN_DIR)\config\$(PLUGIN).xdm $(MANDO_AUTOSAR_VAR_OUT_DIR)\variant\$(PLUGIN)\$($(PLUGIN)_VARIANT_NAME)\xdm\\ & )
	@$(foreach PLUGIN, $(MANDO_PLUGIN_MODULES), $(CP) $(MANDO_AUTOSAR_VAR_IN_DIR)\include\$(PLUGIN)_*.h $(MANDO_AUTOSAR_VAR_OUT_DIR)\variant\$(PLUGIN)\$($(PLUGIN)_VARIANT_NAME)\\ & )
	@$(foreach PLUGIN, $(MANDO_PLUGIN_MODULES), $(CP) $(MANDO_AUTOSAR_VAR_IN_DIR)\src\$(PLUGIN)_*.c $(MANDO_AUTOSAR_VAR_OUT_DIR)\variant\$(PLUGIN)\$($(PLUGIN)_VARIANT_NAME)\\ & )
	@$(CP) $(MANDO_AUTOSAR_VAR_IN_DIR)\config\SystemModel2.tdb $(MANDO_AUTOSAR_VAR_OUT_DIR)\variant\Rte\$(Rte_VARIANT_NAME)\xdm\ &
	@$(CP) $(MANDO_AUTOSAR_VAR_IN_DIR)\config\MemMap.xdm $(MANDO_AUTOSAR_VAR_OUT_DIR)\variant\Rte\$(Rte_VARIANT_NAME)\xdm\ &
	@$(CP) $(MANDO_AUTOSAR_VAR_IN_DIR)\config\EcuC.xdm $(MANDO_AUTOSAR_VAR_OUT_DIR)\variant\Can\$(Can_VARIANT_NAME)\xdm\ &
	@$(CP) $(MANDO_AUTOSAR_VAR_IN_DIR)\include\SchM_*.h $(MANDO_AUTOSAR_VAR_OUT_DIR)\variant\Rte\$(Rte_VARIANT_NAME)\ &
#	@$(CP) $(MANDO_AUTOSAR_VAR_IN_DIR)\include\*MemMap.h $(MANDO_AUTOSAR_VAR_OUT_DIR)\variant\Rte\$(Rte_VARIANT_NAME)\ & ############MemMap file folder should be considered
	@$(CP) $(MANDO_AUTOSAR_VAR_IN_DIR)\include\Rte.h $(MANDO_AUTOSAR_VAR_OUT_DIR)\variant\Rte\$(Rte_VARIANT_NAME)\ &
	@$(CP) $(MANDO_AUTOSAR_VAR_IN_DIR)\src\Rte.c $(MANDO_AUTOSAR_VAR_OUT_DIR)\variant\Rte\$(Rte_VARIANT_NAME)\ &
	@$(CP) $(MANDO_AUTOSAR_VAR_IN_DIR)\include\ComStack_Cfg.h $(MANDO_AUTOSAR_VAR_OUT_DIR)\variant\Base\$(Base_VARIANT_NAME)\ &
	@$(CP) $(MANDO_AUTOSAR_VAR_IN_DIR)\include\Platform_Types.h $(MANDO_AUTOSAR_VAR_OUT_DIR)\variant\Base\$(Base_VARIANT_NAME)\ &
	@$(CP) $(MANDO_AUTOSAR_VAR_IN_DIR)\include\TSAutosar_Cfg.h $(MANDO_AUTOSAR_VAR_OUT_DIR)\variant\Base\$(Base_VARIANT_NAME)\ &
	@$(CP) $(MANDO_AUTOSAR_VAR_IN_DIR)\include\Gtm_*.h $(MANDO_AUTOSAR_VAR_OUT_DIR)\variant\Mcu\$(Mcu_VARIANT_NAME)\ &
	@$(CP) $(MANDO_AUTOSAR_VAR_IN_DIR)\src\Gtm_*.c $(MANDO_AUTOSAR_VAR_OUT_DIR)\variant\Mcu\$(Mcu_VARIANT_NAME)\ &
	@$(CP) $(MANDO_AUTOSAR_VAR_IN_DIR)\include\Mk_gen_*.h $(MANDO_AUTOSAR_VAR_OUT_DIR)\variant\MicroOs\$(MicroOs_VARIANT_NAME)\ &
	@$(CP) $(MANDO_AUTOSAR_VAR_IN_DIR)\src\Mk_gen_*.c $(MANDO_AUTOSAR_VAR_OUT_DIR)\variant\MicroOs\$(MicroOs_VARIANT_NAME)\ &
	@$(CP) $(MANDO_AUTOSAR_VAR_IN_DIR)\include\Irq_*.h $(MANDO_AUTOSAR_VAR_OUT_DIR)\variant\Resource\$(Resource_VARIANT_NAME)\ &
	@$(CP) $(MANDO_AUTOSAR_VAR_IN_DIR)\include\Cry_Hsm_*.h $(MANDO_AUTOSAR_VAR_OUT_DIR)\variant\CryHsm\$(CryHsm_VARIANT_NAME)\ &
	@$(CP) $(MANDO_AUTOSAR_VAR_IN_DIR)\src\Cry_Hsm_*.c $(MANDO_AUTOSAR_VAR_OUT_DIR)\variant\CryHsm\$(CryHsm_VARIANT_NAME)\ &
	@$(RM) "$(MANDO_AUTOSAR_VAR_OUT_DIR)\variant\MemMap\xdm\*.*"
	@$(RM) "$(MANDO_AUTOSAR_VAR_OUT_DIR)\variant\EcuC\xdm\*.*"
ifeq ($(M_CAR_MAKER), GM_CHINA)
	@if not exist $(MANDO_AUTOSAR_VAR_OUT_DIR)\variant\Rte\$(Rte_VARIANT_NAME)\arxml mkdir $(MANDO_AUTOSAR_VAR_OUT_DIR)\variant\Rte\$(Rte_VARIANT_NAME)\arxml
	@$(CP) $(MANDO_AUTOSAR_VAR_IN_DIR)\arxml\*.arxml $(MANDO_AUTOSAR_VAR_OUT_DIR)\variant\Rte\$(Rte_VARIANT_NAME)\arxml\ 
endif

endif

endif

