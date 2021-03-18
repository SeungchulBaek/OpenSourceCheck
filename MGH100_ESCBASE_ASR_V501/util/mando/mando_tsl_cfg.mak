# \file
#
# \brief Mando make configuration module
#
# This file contains the implementation of the Mando make 
# configuration module.
#
# \author Mando, Advanced R&D, Korea

#################################################################

MANDO_TSL_ROOT     ?= $(WORKSPACE_BASE)\SourceCode\ASW\TSL

#################################################################
MANDO_TSL_MODULES  := IVSS

ifeq ($(M_CYBER_SECURITY), HKMC_CS)
MANDO_TSL_MODULES += HKMC_ASK
endif

ifeq ($(M_CAR_MAKER), GM_CHINA)
ifeq ($(M_CYBER_SECURITY), GM_GLOBAL_B)
MANDO_TSL_MODULES += Sum
endif
endif

ifeq ($(M_SAFETLIB), ENABLE)
MANDO_TSL_MODULES += Safetlib
endif


#################################################################
Ivss_VARIANT            := VariantName


