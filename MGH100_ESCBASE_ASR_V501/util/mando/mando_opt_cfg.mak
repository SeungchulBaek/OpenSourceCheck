# \file
#
# \brief Mando make configuration module
#
# This file contains the implementation of the Mando make 
# configuration module.
#
# \author Mando, Advanced R&D, Korea

#################################################################

ifeq ($(MANDO_PERF_MAX),TRUE)
MANDO_SPECIFIC_OPT := -Wc--warnings-as-errors=500,501,502,504,505,506,507,509,510,511,512,513,514,516,517,518,524,529,530,541,544,545,546,547,556,559,561,585,704,705,706,707
else
MANDO_SPECIFIC_OPT := --tradeoff=0 -OacefgiklmnOprsuvwy -Wc--warnings-as-errors=500,501,502,504,505,506,507,509,510,511,512,513,514,516,517,518,524,529,530,541,544,545,546,547,556,559,561,585,704,705,706,707
endif

ifeq ($(M_MISRA_CHECK), ENABLE)
MANDO_SPECIFIC_OPT += --misrac-version=$(MANDO_MISRAC_CHECK_VER)
MANDO_SPECIFIC_OPT += --misrac=$(MANDO_MISRAC_CHECK_RULE_LIST)
endif

SAFETLIB_SPECIFIC_OPT := --tradeoff=4 -O2ROPYG -Wc--warnings-as-errors=500,501,502,504,505,506,507,509,510,511,512,513,514,516,517,518,524,541,544,545,546,547,556,561,585,704,705,706,707

MANDO_OPT_IGNORE_LIST := --tradeoff=4 -O2ROPYG
ifeq ($(MANDO_PERF_MAX),TRUE)
SAFETLIB_OPT_IGNORE_LIST := --tradeoff=0 -OacefgiklmnOprsuvwy
else
SAFETLIB_OPT_IGNORE_LIST := --tradeoff=4 -O2ROPYG
endif

$(foreach FILE, $(MANDO_COMMON_FILE_LIST),\
	$(eval $(subst .c,,$(FILE))_OPTMAP=$(PROJECT_ROOT)\output\make\Mando_src_options.inc))
$(foreach PLUGIN, $(MANDO_BSW_MODULES), \
	$(eval $(PLUGIN)_src_OPTMAP=$(PROJECT_ROOT)\output\make\Mando_src_options.inc))
$(foreach PLUGIN, $(MANDO_CAL_MODULES), \
	$(eval $(PLUGIN)_src_OPTMAP=$(PROJECT_ROOT)\output\make\Mando_src_options.inc))
$(foreach PLUGIN, $(MANDO_FAL_MODULES), \
	$(eval $(PLUGIN)_src_OPTMAP=$(PROJECT_ROOT)\output\make\Mando_src_options.inc))

# Customized module shall be processed file by file.
$(foreach FILE, $(Safetlib_src_FILES),\
	$(eval $(subst .c,,$(notdir $(FILE)))_OPTMAP=$(PROJECT_ROOT)\output\make\Safetlib_src_options.inc))	

MANDO_OPTMAP_LIST := $(PROJECT_ROOT)\output\make\Mando_src_options.inc
MANDO_OPTMAP_LIST += $(PROJECT_ROOT)\output\make\Safetlib_src_options.inc

$(MANDO_OPTMAP_LIST):
	$(SEPARATOR) [ generate MANDO intermediate compile option ]  $(notdir $@)
	@$(file > $@,)
	@$(if $(findstring Safetlib,$@), \
	$(foreach i,$(filter-out $(SAFETLIB_OPT_IGNORE_LIST),$(CC_OPT)) $(ALL_INC_DIR) $(cppGetPreProcessorDefines), $(file >>$@,$(subst \,/,$i))) \
	echo $(SAFETLIB_SPECIFIC_OPT) >> $@, \
	$(foreach i,$(filter-out $(MANDO_OPT_IGNORE_LIST),$(CC_OPT)) $(ALL_INC_DIR) $(cppGetPreProcessorDefines), $(file >>$@,$(subst \,/,$i))) \
	echo $(MANDO_SPECIFIC_OPT) >> $@ \
	)

mando_opt: $(OBJ_TO_CC) $(MAKE_INC_DEFAULT) $(MANDO_OPTMAP_LIST)

######### Unit Test #########
#Task_5ms_src_OPTMAP=$(PROJECT_ROOT)\output\make\Task_5ms_src_options.inc
#RULE_TEST_FILE_MANDO = $(PROJECT_ROOT)\output\temp_testfile.txt
#$(RULE_TEST_FILE_MANDO): $(LIB_TO_OBJ) $(MAKE_INC_DEFAULT) $(MAKE_INCPP) $(DEPEND_INC) $(ASM_INC) $(OPT_MAP)
#	$(SEPARATOR)         [rule_test]	$(notdir $@)
#	$(COPY) $(PROJECT_ROOT)\output\Task_5ms_src_options.inc $@
#rule_test: $(DEPEND_INC) $(OBJ_TO_CC) $(MAKE_INC_DEFAULT) $(RULE_TEST_FILE_MANDO)

##################################################################
# Register the make rules
MAKE_GLOBAL_RULES +=mando_opt

mando_opt_DESCRIPTION = - Apply Mando library specific compile option

.PHONY : mando_opt
##################################################################
