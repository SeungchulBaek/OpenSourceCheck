# \file
#
# \brief Mando make configuration module
#
# This file contains the implementation of the Mando make 
# configuration module.
#
# \author Mando, Advanced R&D, Korea

#################################################################
MANDO_CAR_PAR_ROOT     ?= $(WORKSPACE_BASE)\SourceCode\VIL

MANDO_CAR_PAR_H:=$(MANDO_CAR_PAR_ROOT)\Car_par.h
#MANDO_CAR_PAR_INC:=-I $(MANDO_CAR_PAR_ROOT)\TL -I $(MANDO_CAR_PAR_ROOT)\M31T
MANDO_CAR_PAR_C:=$(MANDO_CAR_PAR_ROOT)\CarparDummy.c
MANDO_CAR_PAR_GEN_H:=$(UTIL_DIR)\mando\Car_par_gen.h
MANDO_CAR_PAR_GEN_RULE:=$(UTIL_DIR)\mando\Car_par_gen.rule
MANDO_CAR_PAR_GEN_MAK:=$(UTIL_DIR)\mando\mando_carpar_gen_cfg.mak
MANDO_CAR_PAR_PARSER:=$(UTIL_DIR)\parse_Car_par.py
MANDO_CAR_PAR_PARSER_EXE:=$(UTIL_DIR)\parse_Car_par.exe

#-include $(MANDO_CAR_PAR_GEN_MAK)
#yr.song
carpargen_preprocess: $(MANDO_CAR_PAR_H) $(MANDO_CAR_PAR_C)
	$(CC) $(MANDO_CAR_PAR_C) $(CC_OPT) --preprocess=CIlMP $(MANDO_CAR_PAR_INC) -o $(MANDO_CAR_PAR_GEN_H)
carpargen_parse: $(MANDO_CAR_PAR_PARSER_EXE) $(MANDO_CAR_PAR_GEN_H) $(MANDO_CAR_PAR_GEN_RULE)
	$(MANDO_CAR_PAR_PARSER_EXE) $(MANDO_CAR_PAR_GEN_H) $(MANDO_CAR_PAR_GEN_RULE) $(MANDO_CAR_PAR_GEN_MAK)
carpargen: \
	carpargen_preprocess \
	carpargen_parse
#yr.song   

