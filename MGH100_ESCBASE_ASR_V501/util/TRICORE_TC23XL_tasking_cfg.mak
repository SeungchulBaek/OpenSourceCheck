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
# Path to the tasking compiler and linker.
# It is checked, if an environment variable
# $(SSC_TRICORE_277_TOOLPATH_COMPILER) exists.
# If so, this variable is taken for TOOLPATH_COMPILER
# If it not exists, TOOLPATH_COMPILER must be set by user
# (modify command in line following the ifeq).
#
# For example:
TOOLPATH_COMPILER ?= C:\Compiler\TASKING\TriCore_v5.0r2\ctc

#################################################################
# TASKING_MODE:
#
# To compile a C source file the C compiler and the assembler must
# be called. This can be done by one call of the control program cctc
# or by a call of the compiler ctc and the assembler astc. The variable
# TASKING_MODE allows to select the kind of the tool chain call.
# Valid values are CONTROL_PROGRAM and COMPILER_ASSEMBLER.
TASKING_MODE = CONTROL_PROGRAM


#################################################################
# Define the options for the compiler.

#Generate TriCore 1.6.x instructions in the assembly file 
CC_OPT += --core=tc1.6.x

CC_OPT += -Wa-gAHLs


# Emit locals EQU and non-EQU symbols.
#CC_OPT += --emit-locals=-equ,-symbols
CC_OPT += --emit-locals=+equ,+symbols
CC_OPT += -Wa-Ogs

CC_OPT += -Wa--error-limit=42

# Compile in ISO-C:99 mode
CC_OPT += --iso=99

# Set TriCore EABI compliant mode (don't use half-word alignment)
CC_OPT += --eabi-compliant

# Always treat enum-types as int.
# Tasking: http://issues.tasking.com/?issueid=160-39612
CC_OPT += --integer-enumeration

# Specify source language option:
# - no ISO C99 comments (double-slash)
# - no gcc extensions
# - optimize across volatile accesses
# - unrelaxed const check for string literals
CC_OPT += --language=-comments,-gcc,+volatile,-strings

# Select an Algorithm for switch statements.
CC_OPT += --switch=auto

# Select alignment of data (Default).
CC_OPT += --align=0

# 0 byte threshold for putting data in __near field.
# This prevents the compiler from moving data out of sections,
# where the OS expects it to be located for its protection features.
CC_OPT += --default-near-size=0

# Set threshold values for A0, A1 memory.
CC_OPT += --default-a0-size=0
CC_OPT += --default-a1-size=0

#-O2 - Optimize that not affect debug capability
#R - disallow Code compaction (reverse inlining)
#O - disallow Forward store
#P - disallow Constant propagation
#Y - disallow Peephole optimizations
#G - disallow Generic assembly code optimizations
#CC_OPT +=-O2ROPYG

# Balance for speed and size when optimizing (0=speed, ..., 4=code size).
#CC_OPT += --tradeoff=4
####  Mando AUTOSAR modified to improve performance
#CC_OPT += --tradeoff=0

# Set optimization level, but prevent impairment of debugging.
####  Mando AUTOSAR modified to improve performance
#CC_OPT += --optimize=3
# MANDO_UPDATE_S : Apply optimize 3 (Disabled some risky options)
# Disable Forward store # https://issues.tasking.com/?issueid=160-39613
#CC_OPT += -OacefgiklmnOprsuvwy
ifeq ($(MANDO_PERF_MAX),TRUE)
CC_OPT += --tradeoff=0
CC_OPT += -OacefgiklmnOprsuvwy
else
CC_OPT += --tradeoff=4
CC_OPT += -O2ROPYG
endif
# MANDO_UPDATE_E

# Generate symbolic debug information
CC_OPT += -g

# Merge C source code with generated assembly code in the output.
CC_OPT += --source

# define a macro constant
CC_OPT += -D_TASKING_C_TRICORE_=1

# Add definition of the used Tricore architecture for the OS.
CC_OPT += -DOS_TRICOREARCH=OS_TRICOREARCH_16EP

# Use tasking copytable for data initialization.
CC_OPT += -DUSE_TASKING_INIT=0

CC_OPT += -DOS_TOOL=OS_tasking

# Use extended Comiler_CfgExt.h.
CC_OPT += -DCOMPILERCFG_EXTENSION_MCAL_FILE


#################################################################
# Define the options for the linker

# Specify include directory for linker scripts
LINK_OPT += -I$(BOARD_PROJECT_PATH)

# Create a map file
LINK_OPT += -M$(MAP_FILE)
LINK_OPT += -M$(MAP_FILE_XML):XML

# Safety Os requires its own initialization code
LINK_OPT += --user-provided-initialization-code

#### Mando AUTOSAR Bring-up
# Link against the runtime library
LINK_OPT += -lrt

# Link against the C library
LINK_OPT += -lc

# Linker optimizations
# - C do not delete unreferenced sections
# - L do not use a ffd algorithm to locate unrestricted sections
# - t emit smart restrictions to decrease copy table size
# - x delete duplicate code sections
# - Y do not delete duplicate constant data sections (needed for Rte)
LINK_OPT += -OCLtXY

 # Link library for fpu.
LINK_OPT += --library=fp_fpu

# Enable the usage of our own initialisation code - Mandatory with Safety Os
# Equivalent to --user-provided-initialization-code
LINK_OPT += -i

#LINK_OPT += --strip-debug

# Add LSL dump information.
LINK_OPT += --lsl-dump=lsldump_$(MANDO_SYSTEM).txt
#### Mando AUTOSAR Bring-up
 
#################################################################
# Various options
 
# Linker archive options: insert-replace/create/update
AR_OPT += -rcu

# EXT_LOCATOR_FILE:
# specify the name for an external locator file
# if no name is given, a default locator file $(BOARD).ldscript is taken
# which is composed in file <board>.mak
EXT_LOCATOR_FILE +=

#################################################################
# General path setup

# Path where the map file should get generated
MAP_FILE = $(BIN_OUTPUT_PATH)\$(PROJECT).map
MAP_FILE_XML = $(BIN_OUTPUT_PATH)\$(PROJECT).mapxml

# Path where the output file should get generated
OUT_FILE = $(BUILD_DIR)\$(PROJECT).out
 
#################################################################
# Define the options for preprocessing *.s files before being fed
# into the assembler.

# Add definition of the used Tricore architecture for the OS
ASS_OPT += -DOS_TRICOREARCH=OS_TRICOREARCH_16EP

# MANDO_UPDATE_S
LINK_OPT += -mcdfiklmNoqrSu
# MANDO_UPDATE_E
