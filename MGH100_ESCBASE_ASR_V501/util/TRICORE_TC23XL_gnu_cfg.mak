# \file
#
# \brief AUTOSAR ApplTemplates
#
# This file contains the implementation of the AUTOSAR
# module ApplTemplates.
#
# \author Elektrobit Automotive GmbH, 91058 Erlangen, Germany
#
# Copyright 2005 - 2017 Elektrobit Automotive GmbH
# All rights exclusively reserved for Elektrobit Automotive GmbH,
# unless expressly agreed to otherwise.

#################################################################
# Toolchain settings
#################################################################
# TOOLPATH_COMPILER:
# Path to the gnu compiler and linker.
# TOOLPATH_COMPILER must be set by user
# (modify command in line following the ifeq).
# 
# For example:
# TOOLPATH_COMPILER = C:/compiler/HIGHTEC/toolchains/tricore/v4.6.2.0
TOOLPATH_COMPILER ?= C:\tools\Compiler\HIGHTEC\toolchains\tricore\v4.6.3.0

# Convert backslash to slash in toolpath compiler to avoid make errors
TOOLPATH_COMPILER := $(subst \\,/,$(TOOLPATH_COMPILER))
TOOLPATH_COMPILER := $(subst \,/,$(TOOLPATH_COMPILER))

#################################################################
# Configure MCALs to use OS functions for interrupt mapping
# 0: Use Os function for mapping enable/disable global interrupts
# 1: Use compiler inline functions for mapping enable/disable
#MCALUSEINTRINSICS ?= 0
# DON'T use Os mapping currently cause it does NOT work!
MCALUSEINTRINSICS = 1

#################################################################
# CC_OPT Options

# Specify include directory for linker scripts (use '/' instead of '\')
CC_OPT += -I$(TOOLPATH_COMPILER)/tricore/include/machine

# Never use tasking copytable for gnu toolchain
CC_OPT += -DUSE_TASKING_INIT=0

# select target cpu (Infineon MCAL settings)
CC_OPT += -mcpu=tc27xx

# GNU dialect of ISO C90 (including some C99 features). This is the default for C code.
CC_OPT += -std=gnu90

# You can use ‘-Wp,option’ to bypass the compiler driver and pass option directly
# through to the preprocessor
CC_OPT += -Wp,-std=gnu90

# Assert that compilation takes place in a freestanding environment
CC_OPT += -ffreestanding

# This enables all the warnings about constructions that some users
# consider questionable. 
CC_OPT += -Wall

# Request debugging information and also use level to specify how much information.
CC_OPT += -g3

# Set optimization level
CC_OPT += -O3

# Disable any machine-specific peephole optimizations
CC_OPT += -fno-peephole2

# This switch causes the command line that was used to invoke the compiler to
# be recorded into the object file that is being created.
CC_OPT += -frecord-gcc-switches

# These options control whether a bit-field is signed or unsigned, when the declaration
# does not use either signed or unsigned. By default, such a bit-field is signed.
CC_OPT += -funsigned-bitfields

# Place each function into its own section in the output file.
CC_OPT += -ffunction-sections

# Try to reduce the number of symbolic address calculations by using shared 
# “anchor” symbols to address nearby objects.
CC_OPT += -fsection-anchors

# Do not use the standard system startup files when linking.
CC_OPT += -nostartfiles

# Suppress all warnings, including those which GNU CPP issues by default.
CC_OPT += -W

# Align the start of functions to the next power-of-two greater than n
# Enabled at levels ‘-O2’, ‘-O3’
CC_OPT += -falign-functions=4

# Peels the loops for that there is enough information that they do not roll 
# much (from profile feedback).
CC_OPT += -fpeel-loops

# Store the usual “temporary” intermediate files permanently
CC_OPT += -save-temps=obj

# Do not recognize asm, inline or typeof as a keyword, so that code can use
# these words as identifiers
CC_OPT += -fno-asm 

# Disable usage of short enums
CC_OPT += -fno-short-enums 

# Warn if an automatic variable is used without first being initialized or if a
# variable may be clobbered by a setjmp call.
CC_OPT += -Wuninitialized

# Specify board name (Infineon MCAL settings)
CC_OPT += -DTRIBOARD_TC27XX

# Mandatory option for Wabco
CC_OPT += -D_GNU_C_TRICORE_=1

# Use extended Comiler_CfgExt.h
CC_OPT += -DCOMPILERCFG_EXTENSION_MCAL_FILE

# Specify compiler symbol
DEPEND_GCC_OPTS += -D_GNU_C_TRICORE_=1

# Specify include directory for compiler headers (use '/' instead of '\')
DEPEND_GCC_OPTS += -I$(TOOLPATH_COMPILER)/tricore/include/machine

#################################################################
# Define the default options for the assembler

# select target architecture V1.6.1
ASM_OPT += -mtc161

# -g seems not to work...
ASM_OPT += --gen-debug

#################################################################
# Define the options for the linker

# setup architecture (aurix, tc16, tc161, ...)
LINK_OPT += --mcpu=tc27xx

# Specify include directory for linker scripts
LINK_OPT += -L$(BOARD_PROJECT_PATH)

# Create a map file
LINK_OPT += -Map=$(MAP_FILE)

# Add standard compiler lib, needed for floating point double precision
LIBRARIES_LINK_ONLY += $(TOOLPATH_COMPILER)/lib/gcc/tricore/4.6.3/tc161/libgcc.a

# EXT_LOCATOR_FILE:
# specify the name for an external locator file
# if no name is given, a default locator file $(BOARD).ldscript is taken
# which is composed in file <board>.mak
EXT_LOCATOR_FILE +=

#################################################################
# General path setup

# Path where the map file should get generated
MAP_FILE = $(BIN_OUTPUT_PATH)\$(PROJECT).map

# Path where the output file should get generated
OUT_FILE = $(BUILD_DIR)\$(PROJECT).out

# Linker archive options: insert-replace/create/update
AR_OPT += -rcu
