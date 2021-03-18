:: Author: Andreas Wenckebach, Vector Informatik Gmbh
:: Version: 1.01.00 (2014-02-18)
:: Version: 1.02.00 (2014-06-06) Create PLAIN_FOLDER if not existant, create info files.
:: Version: 1.03.00 (2015-02-09) Add compressed ARLE container generation, allow configuring optional example containers
:: Version: 1.04.00 (2015-02-11) Use dedicated signed header alignment.
:: Version: 1.05.00 (2016-04-13) Evaluate Hexview err-files
:: Version: 1.06.00 (2016-11-02) Added LZMA decompression ability
@echo off


::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Configuration
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

::Path to HexView tool and external files
rem set HEXVIEW_EXE=D:\Uti\HexView\hexview.exe
set HEXVIEW_EXE=..\..\..\_Burner_\Hexview\hexview.exe
set LZMA_COMPRESSION_UTILITY="..\..\..\Misc\Cmpr_Lzma\COMPRESS_LZMA_Util.exe"
set XML_MOD_DEF=ModGenBase.xml
rem set PRIVATE_KEY_SOURCE=D:\usr\usage\Delivery\CBD16x\CBD1600911\D01\external\Misc\DemoKey_2048\rsakeys_2048.txt
set PRIVATE_KEY_SOURCE=..\..\..\DemoKey_2048\rsakeys_2048.txt
set CAL_FOLDER=DemoCal_withoutHeader
set PP_FOLDER=.\Generatedforsb1
set TEMP_FOLDER=.\GeneratedTemp
:: file format and file name extensions for generated files (added to module name)
set OUTFORMAT=gbf
set LZMAFORMAT=lzma
set PEXT=_plain
set PLAIN_FOLDER=.\GeneratedAndToSignedByGm
set SEXT=_sign
set ARLECOMPEXT=_arlecomp
set LZMACOMPEXT=_lzmacomp

:: Configure to be gnerated example containers (signed / ARLE COMPRESSED)
set GEN_SIGNED_CONTAINERS=YES
set GEN_ARLE_COMPRESSED_CONTAINERS=NO
set GEN_LZMA_COMPRESSED_CONTAINERS=NO
set REMAP_ADDRESS=YES

:: LZMA configuration
:: Valid values OPTLEVEL 0-9; DICTIZE in byte
set OPTLEVEL=9
set DICTSIZE=4096
set LC=0
set LP=0
set PB=0

:: ADDRESS Setting
set APPADDRESS_1=0xA000C100
set APPLEN_1=0xBF00
set APPADDRESS_2=0xA0030000
set APPLEN_2=0x30000
set APPADDRESS_3=0xA0080000
set APPLEN_3=0x17FFC0

set CALADDRESS_1=0xA0000010
set CALLEN_1=0x3FB0
set CALADDRESS_2=0xA0004010
set CALLEN_2=0x3FB0
set CALADDRESS_3=0xA0008010
set CALLEN_3=0x3FB0

set APP_PP=0xA01FFFC0
set CAL_PP=0x00003FC0

set SB1_1=0xA0000000
set SB1_2=0xA0004000
set SB1_3=0xA0008000


::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Hexview configuration parameters (GENERAL, PLAIN + SIGNED HEADER) (check hexview tool documentation):
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

::   GENERAL:
::   - Call Hexview silently ("-s") or not (leave empty)
set SILENT=-s
::   PLAIN HEADER (to be programmed data):
::   - Fill all ( /FA )
::   - alignment programmed data (address /Ad<val> and length /Al)
::   - checksum param ("Cs5" for B. endian / "Cs6" for l. endian ECU)
set FILL=
set ALIGN=/Ad:16 /Al /Af:0xCA
set CS=/Cs6
::   SIGNED HEADER:
::   - alignment Ram hold data (address /Ad<val> and length /Al); should be always 4
set ALIGN_SIGNED_HDR=/Ad:1 /Al /Af:0x00

set FILL_DATA=/FP:0xFF
set FR_DATA=
set ALIGN_DATA=/AD:16 /AL:16

set SBEXT=_Sb1
set AEXT=_App
set CEXT=_Cal
set PPEXT=_PP
set BEXT=_Boot
set PBCEXT=_Pbc
set EBSEXT=_Ebs
set HSMEXT=_Hsm
set TEMPEXT=_temp

set OUTHexFORMAT=hex
set OUTSredFORMAT=s19
set OUTSxFORMAT=sx
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Check input file existence and create info files
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
IF NOT EXIST %PRIVATE_KEY_SOURCE% call :Error %PRIVATE_KEY_SOURCE%
IF NOT EXIST %HEXVIEW_EXE% call :Error %HEXVIEW_EXE%
IF /I "%GEN_LZMA_COMPRESSED_CONTAINERS%" EQU "YES" (
IF NOT EXIST %LZMA_COMPRESSION_UTILITY% call :Error %LZMA_COMPRESSION_UTILITY%
)
IF NOT EXIST %XML_MOD_DEF% call :Error %XML_MOD_DEF%
IF NOT EXIST %CAL_FOLDER% mkdir %CAL_FOLDER%
IF NOT EXIST %PP_FOLDER% mkdir %PP_FOLDER%
IF NOT EXIST %PLAIN_FOLDER% mkdir %PLAIN_FOLDER%
IF NOT EXIST %TEMP_FOLDER% mkdir %TEMP_FOLDER%

IF EXIST *.err DEL *.err
cd. > ".\Files with _sign extension are Demo Download containers"
cd. > ".\%PLAIN_FOLDER%\Files with _plain extension are to be send to GM for signing"

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Generation calls for different Standard download modules.
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Required Function Parameters for GenAppHeaders (Application files), GenCalHeaders (calibration files):
:: - <module name> : "Module Name" - Needs to match configured module name (XML_MOD_DEF file)
:: - <file name>   : "File name" - File name of raw input file
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: call :<func name>   "<module name>" "<file name>"

:: For all cal files in CAL_FOLDER call function GenCalHeaders (Assumption: module name == file name without extension )

IF NOT EXIST "%~2" (
 echo "ERROR: Application file cannot be generated."
 call :Error %~2
 goto :EOF
)


call :GetEBSFileFunc %~1 %~2

call :GetBootFileFunc %~1 %BOOT_SOURCE%

call :GetPBCFileFunc %~1 %PBC_MERGE_SOURCE_1% %PBC_MERGE_SOURCE_2%

call :GetHsmFileFunc %~1 %HSM_SOURCE%

call :GenInFileFunc %~1

call :GenAppInFilefunc %~1

call :GenCalInFilefunc %~1

move *%CEXT%*.%OUTHexFORMAT% %CAL_FOLDER%

for /f %%f in ('dir /b .\%CAL_FOLDER%') do (
   call :GenCalHeaders "%%~nf" "%CAL_FOLDER%\%%f"
)
call :GenAppHeaders %~1 %~2 

call :GenAppPPFunc %~1

call :GenCalPPFunc %~1

call :GenSb1FileFunc %~1

call :GenALLSRecordFilefunc %~1

:: Move formats not required for testdownload, but only for later signing by GM to defined folder

move *%PPEXT%.%OUTHexFORMAT% %PP_FOLDER%


move %~1.%OUTHexFORMAT% %TEMP_FOLDER%
move *.mot %TEMP_FOLDER%
move %~1%EBSEXT%.%OUTHexFORMAT% %TEMP_FOLDER%
move %~1%BEXT%.%OUTHexFORMAT% %TEMP_FOLDER%
move %~1%PBCEXT%*.%OUTHexFORMAT% %TEMP_FOLDER%
move %~1%HSMEXT%.%OUTHexFORMAT% %TEMP_FOLDER%
move *.err %TEMP_FOLDER%

goto :EOF

:Error
echo "Input file %~1 not found."
goto :EOF

:Error2
echo Hexview reported Error:
type %~1
goto :EOF

:RemapAddressFunc
@echo on
IF EXIST %~1 call TricoreHarmonizeAddressRanges.bat %~1 %HEXVIEW_EXE%
@echo off
goto :EOF

:GetEBSFileFunc
@echo on
%HEXVIEW_EXE% /MO:%~2 %SILENT% /XI /E:GetEBSFileFunc.err -o %~1%EBSEXT%.%OUTHexFORMAT%
call :RemapAddressFunc %~1%EBSEXT%.%OUTHexFORMAT%
@echo off
IF EXIST GetEBSFileFunc.err call :Error2 GetEBSFileFunc.err
goto :EOF

:GetBootFileFunc
@echo on
%HEXVIEW_EXE% /MO:%~2 %SILENT% /XI /E:GetBootFileFunc%BEXT%.err -o %~1%BEXT%.%OUTHexFORMAT%
call :RemapAddressFunc %~1%BEXT%.%OUTHexFORMAT%
IF EXIST GetBootFileFunc%BEXT%.err call :Error2 GetBootFileFunc%BEXT%.err
@echo off
goto :EOF

:GetPBCFileFunc
@echo on
%HEXVIEW_EXE% /MO:%~2 %SILENT% /XI /E:GetPBCFileFunc%PBCEXT%_1.err -o %~1%PBCEXT%_1.%OUTHexFORMAT%
call :RemapAddressFunc %~1%PBCEXT%_1.%OUTHexFORMAT%
%HEXVIEW_EXE% /MO:%~3 %SILENT% /XI /E:GetPBCFileFunc%PBCEXT%_2.err -o %~1%PBCEXT%_2.%OUTHexFORMAT%
call :RemapAddressFunc %~1%PBCEXT%_2.%OUTHexFORMAT%
IF EXIST GetPBCFileFunc%PBCEXT%_1.err call :Error2 GetPBCFileFunc%PBCEXT%_1.err
IF EXIST GetPBCFileFunc%PBCEXT%_2.err call :Error2 GetPBCFileFunc%PBCEXT%_2.err
@echo off
goto :EOF

:GetHsmFileFunc
@echo on
%HEXVIEW_EXE% /MO:%~2 %SILENT% /XI /E:GetHsmFileFunc.err -o %~1%HSMEXT%.%OUTHexFORMAT%
call :RemapAddressFunc %~1%HSMEXT%.%OUTHexFORMAT%
IF EXIST GetHsmFileFunc.err call :Error2 GetHsmFileFunc.err
@echo off
goto :EOF

:GenInFileFunc
@echo on
%HEXVIEW_EXE% %SILENT% /MO:%~1%EBSEXT%.%OUTHexFORMAT%+%~1%PBCEXT%_1.%OUTHexFORMAT%+%~1%PBCEXT%_2.%OUTHexFORMAT% /XI /E:%~1.err -o %~1.%OUTHexFORMAT%
@echo off
goto :EOF

:GenAppInFilefunc
@echo on
%HEXVIEW_EXE% %~1.%OUTHexFORMAT% %SILENT% %ALIGN_DATA% %FILL_DATA% /FR:%APPADDRESS_1%,%APPLEN_1% /AR:%APPADDRESS_1%,%APPLEN_1% /XI:32 /E:GenAppInFilefunc.err -o %~1%AEXT%1.%OUTHexFORMAT%
%HEXVIEW_EXE% %~1.%OUTHexFORMAT% %SILENT% %ALIGN_DATA% %FILL_DATA% /FR:%APPADDRESS_2%,%APPLEN_2% /AR:%APPADDRESS_2%,%APPLEN_2% /XI:32 /E:GenAppInFilefunc.err -o %~1%AEXT%2.%OUTHexFORMAT%
%HEXVIEW_EXE% %~1.%OUTHexFORMAT% %SILENT% %ALIGN_DATA% %FILL_DATA% /FR:%APPADDRESS_3%,%APPLEN_3% /AR:%APPADDRESS_3%,%APPLEN_3% /XI:32 /E:GenAppInFilefunc.err -o %~1%AEXT%3.%OUTHexFORMAT%
%HEXVIEW_EXE% %SILENT% /MO:%~1%AEXT%1.%OUTHexFORMAT%+%~1%AEXT%2.%OUTHexFORMAT%+%~1%AEXT%3.%OUTHexFORMAT% /XI:32 /E:GenAppInFilefunc.err -o %~1%AEXT%.%OUTHexFORMAT%
call :ConvertHextoSXFilefunc %~1%AEXT%.%OUTHexFORMAT% HOST_App
if exist %~1%AEXT%1.%OUTHexFORMAT% del %~1%AEXT%1.%OUTHexFORMAT%
if exist %~1%AEXT%2.%OUTHexFORMAT% del %~1%AEXT%2.%OUTHexFORMAT%
if exist %~1%AEXT%3.%OUTHexFORMAT% del %~1%AEXT%3.%OUTHexFORMAT%



@echo off
IF EXIST GenAppInFilefunc.err call :Error2 GenAppInFilefunc.err
goto :EOF

:GenCalInFilefunc
@echo on
%HEXVIEW_EXE% %~1.%OUTHexFORMAT% %SILENT% %ALIGN_DATA% %FILL_DATA% /FR:%CALADDRESS_1%,%CALLEN_1% /AR:%CALADDRESS_1%,%CALLEN_1% /XI:32 /E:GenCalInFilefunc.err -o %~1%CEXT%1.%OUTHexFORMAT%
%HEXVIEW_EXE% %~1.%OUTHexFORMAT% %SILENT% %ALIGN_DATA% %FILL_DATA% /FR:%CALADDRESS_2%,%CALLEN_2% /AR:%CALADDRESS_2%,%CALLEN_2% /XI:32 /E:GenCalInFilefunc.err -o %~1%CEXT%2.%OUTHexFORMAT%
%HEXVIEW_EXE% %~1.%OUTHexFORMAT% %SILENT% %ALIGN_DATA% %FILL_DATA% /FR:%CALADDRESS_3%,%CALLEN_3% /AR:%CALADDRESS_3%,%CALLEN_3% /XI:32 /E:GenCalInFilefunc.err -o %~1%CEXT%3.%OUTHexFORMAT%
call :ConvertHextoSXFilefunc %~1%CEXT%1.%OUTHexFORMAT% HOST_Cal1
call :ConvertHextoSXFilefunc %~1%CEXT%2.%OUTHexFORMAT% HOST_Cal2
call :ConvertHextoSXFilefunc %~1%CEXT%3.%OUTHexFORMAT% HOST_Cal3

@echo off
IF EXIST GenCalInFilefunc.err call :Error2 GenCalInFilefunc.err
goto :EOF

:GenAppPPFunc
@echo on
%HEXVIEW_EXE% %~1%AEXT%%PEXT%.%OUTFORMAT% %SILENT% /e:%~1%AEXT%%PPEXT%.err /CS16:@%APP_PP% /P:expdatproc.ini /XI:32 -o %~1%AEXT%%PPEXT%.%OUTHexFORMAT%
@echo off
IF EXIST %~1%AEXT%%PPEXT%.err call :Error2 %~1%AEXT%%PPEXT%.err
goto :EOF

:GenCalPPFunc
@echo on
%HEXVIEW_EXE% %~1%CEXT%1%PEXT%.%OUTFORMAT% %SILENT% /e:%~1%CEXT%1%PPEXT%.err /CS16:@%CAL_PP% /P:expdatproc.ini /XI:32 -o %~1%CEXT%1%PPEXT%.%OUTHexFORMAT%
%HEXVIEW_EXE% %~1%CEXT%2%PEXT%.%OUTFORMAT% %SILENT% /e:%~1%CEXT%2%PPEXT%.err /CS16:@%CAL_PP% /P:expdatproc.ini /XI:32 -o %~1%CEXT%2%PPEXT%.%OUTHexFORMAT%
%HEXVIEW_EXE% %~1%CEXT%3%PEXT%.%OUTFORMAT% %SILENT% /e:%~1%CEXT%3%PPEXT%.err /CS16:@%CAL_PP% /P:expdatproc.ini /XI:32 -o %~1%CEXT%3%PPEXT%.%OUTHexFORMAT%
@echo off
IF EXIST %~1%CEXT%1%PPEXT%.err call :Error2 %~1%CEXT%%PPEXT%.err
IF EXIST %~1%CEXT%2%PPEXT%.err call :Error2 %~1%CEXT%%PPEXT%.err
IF EXIST %~1%CEXT%3%PPEXT%.err call :Error2 %~1%CEXT%%PPEXT%.err
goto :EOF

:GenSb1FileFunc
@echo on
%HEXVIEW_EXE% %SILENT% ^
/MO:%~1%AEXT%%PPEXT%.%OUTHexFORMAT%+%~1%CEXT%1%PPEXT%.%OUTHexFORMAT%;%SB1_1%+%~1%CEXT%2%PPEXT%.%OUTHexFORMAT%;%SB1_2%+%~1%CEXT%3%PPEXT%.%OUTHexFORMAT%;%SB1_3%^
+%~1%HSMEXT%.%OUTHexFORMAT%+%~1%BEXT%.%OUTHexFORMAT% /XI:32 /E:GenSb1InFilefunc.err -o %~1%SBEXT%.%OUTHexFORMAT%
@echo off
goto :EOF

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Functions to be used to generate files - !! Usually not required to be edited !!
::
:: In case of problems:
:: - check generated error files
:: - check hexview.exe parameters used when calling the below functions in batch and compare to Hexview manual for plausibility
:: - check GENy file module configuration (configuration base for XML_MOD_DEF) and XML_MOD_DEF output for plausibility
:: - Please contact our support in case of questions
::
:: Required Function Parameters are same as for above described for GenAppHeaders, GenCalHeaders.
:: ( GenSignAppFunc and GenSignCalFunc require only the "Module Name" parameter (%~1) )
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:GenAppHeaders
echo GenAppHeaders %~1 %~2
IF NOT EXIST %~2 (
 call :Error %~2
 echo "ERROR: Application file cannot be generated."
 goto :EOF
)
call :GenPlainAppFunc %~1 %~2
IF /I "%GEN_SIGNED_CONTAINERS%" EQU "YES" (
call :GenSignAppFunc %~1
)
IF /I "%GEN_ARLE_COMPRESSED_CONTAINERS%" EQU "YES" (
call :GenArleCompressedModuleFunc %~1
)
IF /I "%GEN_LZMA_COMPRESSED_CONTAINERS%" EQU "YES" (
call :GenLzmaCompressedModuleFunc %~1
)
goto :EOF

:GenCalHeaders
IF NOT EXIST %~2 (
 call :Error %~2
 echo "Continue without considering cal file %~1 for header generation."
 goto :EOF
)
call :GenPlainCalFunc %~1 %~2
IF /I "%GEN_SIGNED_CONTAINERS%" EQU "YES" (
call :GenSignCalFunc %~1
)
IF /I "%GEN_ARLE_COMPRESSED_CONTAINERS%" EQU "YES" (
call :GenArleCompressedModuleFunc %~1
)
IF /I "%GEN_LZMA_COMPRESSED_CONTAINERS%" EQU "YES" (
call :GenLzmaCompressedModuleFunc %~1
)
goto :EOF

:GenPlainAppFunc
@echo on
%HEXVIEW_EXE% %~1%AEXT%.%OUTHexFORMAT% %SILENT% -xgc_app_plain=%~1%AEXT% -xml=%XML_MOD_DEF% /FP:0xFF /FR:0xA000C080,0x80 %ALIGN% %CS% /E:%~1%PEXT%.err -o %~1%AEXT%%PEXT%.%OUTFORMAT% 
@echo off
IF EXIST %~1%PEXT%.err call :Error2 %~1%PEXT%.err
goto :EOF

:GenPlainCalFunc
@echo on
%HEXVIEW_EXE% %~2 %SILENT% -xgc_cal_plain=%~1 -xml=%XML_MOD_DEF% %FILL% %ALIGN% %CS% /E:%~1%PEXT%.err -o %~1%PEXT%.%OUTFORMAT%
@echo off
IF EXIST %~1%PEXT%.err call :Error2 %~1%PEXT%.err
goto :EOF

:GenSignAppFunc
@echo on
%HEXVIEW_EXE% %~1%AEXT%%PEXT%.%OUTFORMAT% %SILENT% -xgc_app_sign -xml=%XML_MOD_DEF% %ALIGN_SIGNED_HDR% /cs20 /dp32:%PRIVATE_KEY_SOURCE% /E:%~1%SEXT%.err -o %~1%AEXT%%SEXT%.%OUTFORMAT%
@echo off
IF EXIST %~1%AEXT%%SEXT%.err call :Error2 %~1%AEXT%%SEXT%.err
goto :EOF

:GenSignCalFunc
@echo on
%HEXVIEW_EXE% %~1%PEXT%.%OUTFORMAT% %SILENT% -xgc_cal_sign -xml=%XML_MOD_DEF% %ALIGN_SIGNED_HDR% /cs20 /dp32:%PRIVATE_KEY_SOURCE% /E:%~1%SEXT%.err -o %~1%SEXT%.%OUTFORMAT%
@echo off
IF EXIST %~1%SEXT%.err call :Error2 %~1%SEXT%.err
goto :EOF

:GenArleCompressedModuleFunc
@echo on
%HEXVIEW_EXE% %~1%SEXT%.%OUTFORMAT% %SILENT% -dp36 -xgc_sign_cmpr:0401 /E:%~1%ARLECOMPEXT%.err -o %~1%ARLECOMPEXT%.%OUTFORMAT%
@echo off
IF EXIST %~1%PEXT%.err call :Error2 %~1%PEXT%.err
goto :EOF

:GenLzmaCompressedModuleFunc
@echo on
%LZMA_COMPRESSION_UTILITY% -O%OPTLEVEL% -lc=%LC% -lp=%LP% -pb=%PB% -ws=%DICTSIZE% %~1%SEXT%.%OUTFORMAT% %~1%LZMACOMPEXT%.%LZMAFORMAT%
%HEXVIEW_EXE% %~1%LZMACOMPEXT%.%LZMAFORMAT% %SILENT% -xgc_sign_cmpr:0402 /E:%~1%LZMACOMPEXT%.err -o %~1%LZMACOMPEXT%.%OUTFORMAT%
IF EXIST %~1%LZMACOMPEXT%.%LZMAFORMAT% DEL %~1%LZMACOMPEXT%.%LZMAFORMAT%
@echo off
IF EXIST %~1%PEXT%.err call :Error2 %~1%PEXT%.err
goto :EOF


:GenALLSRecordFilefunc
@echo on
for /f %%f in ('dir /b .\%CAL_FOLDER%') do (
   call :ConvertHextoSRecordFilefunc "%CAL_FOLDER%\%%f"
)
copy .\%CAL_FOLDER%\*.hex .
copy .\%CAL_FOLDER%\*.s19 .
call :ConvertHextoSRecordFilefunc %~1%AEXT%.%OUTHexFORMAT%
call :ConvertHextoSRecordFilefunc %~1%SBEXT%.%OUTHexFORMAT%
goto :EOF


:ConvertHextoSRecordFilefunc 
@echo on
%HEXVIEW_EXE% %SILENT% %~1 /XS:32 /E:%~1S19Error.err
@echo off
IF EXIST %~1S19Error.err call :Error2 %~1S19Error.err
goto :EOF

:ConvertHextoSXFilefunc 
@echo on
%HEXVIEW_EXE% %SILENT% %~1 /XS:32 /E:%~1S19Error.err -o %~2.%OUTSxFORMAT%
@echo off
IF EXIST %~1S19Error.err call :Error2 %~1S19Error.err
goto :EOF

:end
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
