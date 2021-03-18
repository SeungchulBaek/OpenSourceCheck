# don't generate code for Os_MemoryProtection.xdm (enables MemoryProtection)
TRESOS2_NOGEN_PLUGINS += Os_MemoryProtection

# don't generate code for MicroKernel Os
TRESOS2_NOGEN_PLUGINS += MicroOs

# enable MicroKernel Os plugin
ENABLED_PLUGINS += MicroOs

# Settings for Multicore: Use other board directory
BOARD = TriboardTC2X7_MK

# EB Dem provides ASR3 and ASR4 symbolic names per default
# Disable for TC23XL cause MCAL drivers define own symbolic names and these
# clash with Dem compatibility mode, only ASR4.0.3 defines will be generated
CC_OPT += -DDEM_DONT_PROVIDE_LEGACY_SYMBOLIC_NAMES
#################################################################
# include merged makefile if they exist
-include $(PROJECT_ROOT)\util\$(TARGET)\Merged_Makefile.mak

# enable Resource plugin in make environment
ENABLED_PLUGINS += Resource

#################################################################
#
# Add the toolchain specific MemMap configuration to the list of
# config files and make sure that tresos does not expect a
# module of that name.
#

TRESOS2_NOGEN_PLUGINS += MemMap_Platforms

