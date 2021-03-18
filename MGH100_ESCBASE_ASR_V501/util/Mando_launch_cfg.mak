# \file
#
# \brief Mando make configuration module
#
# This file contains the implementation of the Mando make 
# configuration module.
#
# \author Mando, Advanced R&D, Korea

#################################################################
MANDO_CAR_PAR_ROOT:= ..\..\..\SourceCode\VIL
MANDO_CAR_PAR_C:=$(MANDO_CAR_PAR_ROOT)\CarparDummy.c

-include .\mando\mando_common_cfg.mak

carpargen_preprocess: 
	@$(GCC_CPP_EXE) $(CPP_OPTS) -I$(MANDO_CAR_PAR_ROOT) $(MANDO_CAR_PAR_C) -E -dM -undef -o Mando_launch_cfg.pre
carpargen: carpargen_preprocess
	@$(CFG_GEN_EXE) -i Mando_launch_cfg.pre -o Mando_launch_cfg.bat

