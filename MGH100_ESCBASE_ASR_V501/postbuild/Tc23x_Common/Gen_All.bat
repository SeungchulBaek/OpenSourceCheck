:: Author: Andreas Wenckebach, Vector Informatik Gmbh
:: Version: 1.01.00 (2014-02-18)
:: Version: 1.02.00 (2014-06-06) Create PLAIN_FOLDER if not existant, create info files.
:: Version: 1.03.00 (2015-02-09) Add compressed ARLE container generation, allow configuring optional example containers
:: Version: 1.04.00 (2015-02-11) Use dedicated signed header alignment.
:: Version: 1.05.00 (2016-04-13) Evaluate Hexview err-files
:: Version: 1.06.00 (2016-11-02) Added LZMA decompression ability
@echo off
setlocal EnableDelayedExpansion

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Configuration
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

::Path to HexView tool and external files
rem set HEXVIEW_EXE=D:\Uti\HexView\hexview.exe
set HEXVIEW_EXE=..\..\..\_Burner_\Hexview\hexview.exe
set HKMC_FST_EXE="C:\Program Files (x86)\Hyundai-AutoEver\HK-FST\2.00\bin\HFST_VS.exe"
set LZMA_COMPRESSION_UTILITY=
set XML_MOD_DEF=

set PRIVATE_KEY_SOURCE=
set PP_FOLDER=.\Generatedforsb1
set TEMP_FOLDER=.\GeneratedTemp
set SIGN_FOLDER=.\signed
:: file format and file name extensions for generated files (added to module name)
set OUTFORMAT=gbf
set LZMAFORMAT=lzma
set PEXT=_plain
set PLAIN_FOLDER=.\GeneratedAndToSignedByGm
set SEXT=_Signed
set ARLECOMPEXT=_arlecomp
set LZMACOMPEXT=_lzmacomp

:: Configure to be gnerated example containers (signed / ARLE COMPRESSED)
set GEN_SIGNED_CONTAINERS=%FST_SIGN%
set GEN_ARLE_COMPRESSED_CONTAINERS=NO
set GEN_LZMA_COMPRESSED_CONTAINERS=NO
set REMAP_ADDRESS=YES
set FST_CLIENT=..\..\..\_tools_\FST_client\FST_Client.exe

:: LZMA configuration
:: Valid values OPTLEVEL 0-9; DICTIZE in byte
set OPTLEVEL=9
set DICTSIZE=4096
set LC=0
set LP=0
set PB=0


:: APP ADDRESS Setting
set APPADDRESS=0x80070000
set APPLEN=0x18ff

:: CAL ADDRESS Setting
if %M_CAR_MAKER%==MAHINDRA (
:: M&M
set CALADDRESS=0x80014000
set CALLEN=0x5bf
) else (
:: Common
set CALADDRESS=0x80010000
set CALLEN=0x5ff
)

:: Reduce size for CRC32
if "%CVN_TYPE%"=="CHECKSUM" (
:: CheckSum - Assign full size of memory range.
set APPLEN=%APPLEN%c0
set CALLEN=%CALLEN%c0
) else (
:: CRC32 - Reserve last 4b for CRC32.
set APPLEN=%APPLEN%bc
set CALLEN=%CALLEN%bc
)

set APP_PP=0x801FFFE0
set CAL_PP=0x8006FFE0

set PBC_APP_REGION=0x8019FE00-0x801BFFFF
set PBC_CAL_REGION=0x80014000-0x80017FFF

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
set CS=/Cs5
::   SIGNED HEADER:
::   - alignment Ram hold data (address /Ad<val> and length /Al); should be always 4
set ALIGN_SIGNED_HDR=/Ad:1 /Al /Af:0x00

set FILL_DATA=/FP:0x00
set FR_DATA=
set ALIGN_DATA=/AD:32 /AL:32

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

IF NOT EXIST "%~2" (
    echo "ERROR: Application file cannot be generated."
    call :Error %~2
    goto :EOF
)

call :GetEBSFileFunc %~1 %~2

IF "%M_PBC_MERGE_TYPE%" EQU "M_BIN" (
    call :GetPBCFileFunc %~1 %PBC_MERGE_SOURCE_1% %PBC_MERGE_SOURCE_2%
)

IF "%BOOT_SOURCE%" NEQ "" (
    call :GetBootFileFunc %~1 %BOOT_SOURCE%
) else (
    echo BOOT is not provided. Skip.
)

IF "%HSM_SOURCE%" NEQ "" (
    call :GetHsmFileFunc %~1 %HSM_SOURCE%
) else (
    echo HSM is not provided. Skip.
)

call :GenInFileFunc %~1

call :GenAppInFilefunc %~1

call :GenCalInFilefunc %~1

call :GenCalHeaders %~1

call :GenAppHeaders %~1

IF "%GEN_SIGNED_CONTAINERS%" EQU "YES" (
call :GenSignAppCalFunc %~1
)

IF "%CVN_TYPE%" EQU "CRC32" (
call :GenCrc32AppCalFunc %~1
)

call :GenWithoutBootFunc %~1

call :GenCalPPFunc %~1

call :GenAppPPFunc %~1

call :GenSb1FileFunc %~1

:: Print CVN
if "%CVN_TYPE%"=="CHECKSUM" (
    %HEXVIEW_EXE% /MO:%~1%AEXT%.%OUTHexFORMAT%;-%APPADDRESS% %SILENT% /AR:0x00,2 /XA -o app.checksum.tmp
    %HEXVIEW_EXE% /MO:%~1%CEXT%.%OUTHexFORMAT%;-%CALADDRESS% %SILENT% /AR:0x00,2 /XA -o cal.checksum.tmp
    set /p CHECKSUM_APP=<app.checksum.tmp
    set /p CHECKSUM_CAL=<cal.checksum.tmp
    copy app.checksum.tmp+cal.checksum.tmp CVN.txt /B > nul
) else (
    %HEXVIEW_EXE% /MO:%~1%AEXT%.%OUTHexFORMAT%;-%APPADDRESS% %SILENT% /AR:%APPLEN%,4 /XN -o app.crc32.tmp
    %HEXVIEW_EXE% /MO:%~1%CEXT%.%OUTHexFORMAT%;-%CALADDRESS% %SILENT% /AR:%CALLEN%,4 /XN -o cal.crc32.tmp
    copy app.crc32.tmp+cal.crc32.tmp crc32.tmp /B > nul
    %HEXVIEW_EXE% %SILENT% crc32.tmp /CS9:@append /XI:32 -o crc32.tmp
    %HEXVIEW_EXE% %SILENT% crc32.tmp /AR:0x08,4 /XA -o CVN.txt
)
del /s /q .\*.tmp > nul

set /p CVN_VALUE=<CVN.txt > nul
echo.
echo CVN : %CVN_VALUE%
echo.

:: Move formats not required for testdownload, but only for later signing by GM to defined folder
del /s /q .\*.bin > nul
move *%PPEXT%.%OUTHexFORMAT% %PP_FOLDER% > nul 2>&1
move %~1.%OUTHexFORMAT% %TEMP_FOLDER% > nul 2>&1
move *.mot %TEMP_FOLDER% > nul 2>&1
move %~1%EBSEXT%.%OUTHexFORMAT% %TEMP_FOLDER% > nul 2>&1
move %~1%BEXT%.%OUTHexFORMAT% %TEMP_FOLDER% > nul 2>&1
move %~1%PBCEXT%*.%OUTHexFORMAT% %TEMP_FOLDER% > nul 2>&1
move %~1%HSMEXT%.%OUTHexFORMAT% %TEMP_FOLDER% > nul 2>&1
move *.err %TEMP_FOLDER% > nul 2>&1
echo Post Build has been done.
echo.

:: Convert all remained hex to S-Record
call :GenALLSRecordFilefunc %~1

goto :EOF

:Error
echo "Input file %~1 not found."
goto :EOF

:Error2
echo Hexview reported Error:
type %~1
goto :EOF

:RemapAddressFunc
IF EXIST %~1 call TricoreHarmonizeAddressRanges.bat %~1 %HEXVIEW_EXE%
goto :EOF

:GetEBSFileFunc
%HEXVIEW_EXE% /MO:%~2 %SILENT% /XI /E:GetEBSFileFunc.err -o %~1%EBSEXT%.%OUTHexFORMAT%
IF EXIST GetEBSFileFunc.err call :Error2 GetEBSFileFunc.err
goto :EOF

:GetBootFileFunc
%HEXVIEW_EXE% /MO:%~2 %SILENT% /XI /E:GetBootFileFunc%BEXT%.err -o %~1%BEXT%.%OUTHexFORMAT%
IF EXIST GetBootFileFunc%BEXT%.err call :Error2 GetBootFileFunc%BEXT%.err
goto :EOF

:GetPBCFileFunc
%HEXVIEW_EXE% /MO:%~2 %SILENT% /XI /E:GetPBCFileFunc%PBCEXT%_1.err -o %~1%PBCEXT%_1.%OUTHexFORMAT%
%HEXVIEW_EXE% /MO:%~3 %SILENT% /XI /E:GetPBCFileFunc%PBCEXT%_2.err -o %~1%PBCEXT%_2.%OUTHexFORMAT%
IF EXIST GetPBCFileFunc%PBCEXT%_1.err call :Error2 GetPBCFileFunc%PBCEXT%_1.err
IF EXIST GetPBCFileFunc%PBCEXT%_2.err call :Error2 GetPBCFileFunc%PBCEXT%_2.err

IF EXIST %~1%PBCEXT%_1.%OUTHexFORMAT% (
    echo | set /p=Validation PBC APP binary... 
    %HEXVIEW_EXE% /MO:%~1%PBCEXT%_1.%OUTHexFORMAT%;:%PBC_APP_REGION% %SILENT% /XI -o %~1%PBCEXT%_1_dummy.%OUTHexFORMAT%
    fc %~1%PBCEXT%_1.%OUTHexFORMAT% %~1%PBCEXT%_1_dummy.%OUTHexFORMAT% > nul
    IF !errorlevel! NEQ 0 (
       echo FAIL
       echo PBC APP must be placed in %PBC_APP_REGION%.
       pause
       del %~1%PBCEXT%_1.%OUTHexFORMAT% > nul
    ) else (
        echo OK
    )
    del %~1%PBCEXT%_1_dummy.%OUTHexFORMAT% > nul
)

IF EXIST %~1%PBCEXT%_2.%OUTHexFORMAT% (
    echo | set /p=Validation PBC CAL binary... 
    %HEXVIEW_EXE% /MO:%~1%PBCEXT%_2.%OUTHexFORMAT%;:%PBC_CAL_REGION% %SILENT% /XI -o %~1%PBCEXT%_2_dummy.%OUTHexFORMAT%
    fc %~1%PBCEXT%_2.%OUTHexFORMAT% %~1%PBCEXT%_2_dummy.%OUTHexFORMAT% > nul
    IF !errorlevel! NEQ 0 (
       echo FAIL
       echo PBC CAL must be placed in %PBC_CAL_REGION%.
       pause
       del %~1%PBCEXT%_2.%OUTHexFORMAT% > nul
    ) else (
        echo OK
    )
    del %~1%PBCEXT%_2_dummy.%OUTHexFORMAT% > nul
)

goto :EOF

:GetHsmFileFunc
%HEXVIEW_EXE% /MO:%~2 %SILENT% /XI /E:GetHsmFileFunc.err -o %~1%HSMEXT%.%OUTHexFORMAT%
IF EXIST GetHsmFileFunc.err call :Error2 GetHsmFileFunc.err
goto :EOF

:GenInFileFunc
%HEXVIEW_EXE% %SILENT% /MO:%~1%EBSEXT%.%OUTHexFORMAT%+%~1%PBCEXT%_1.%OUTHexFORMAT%+%~1%PBCEXT%_2.%OUTHexFORMAT% /XI /E:%~1.err -o %~1.%OUTHexFORMAT%
goto :EOF

:GenAppInFilefunc
%HEXVIEW_EXE% %~1.%OUTHexFORMAT% %SILENT% %ALIGN_INPUT% %ALIGN_DATA% %FILL_DATA% /FR:%APPADDRESS%,%APPLEN% /AR:%APPADDRESS%,%APPLEN% /XI:32 /E:%~1%AEXT%.err -o %~1%AEXT%.%OUTHexFORMAT%
call :ConvertHextoSXFilefunc %~1%AEXT%.%OUTHexFORMAT% HOST_App
IF EXIST GenAppInFilefunc.err call :Error2 GenAppInFilefunc.err
goto :EOF

:GenCalInFilefunc
%HEXVIEW_EXE% %~1.%OUTHexFORMAT% %SILENT% %ALIGN_INPUT% %ALIGN_DATA% %FILL_DATA% /FR:%CALADDRESS%,%CALLEN% /AR:%CALADDRESS%,%CALLEN% /XI:32 /E:%~1%CEXT%.err -o %~1%CEXT%.%OUTHexFORMAT%
call :ConvertHextoSXFilefunc %~1%CEXT%.%OUTHexFORMAT% HOST_Cal
IF EXIST GenCalInFilefunc.err call :Error2 GenCalInFilefunc.err
goto :EOF

:GenWithoutBootFunc
%HEXVIEW_EXE% %SILENT% /MO:%~1%AEXT%.%OUTHexFORMAT%+%~1%CEXT%.%OUTHexFORMAT%+%~1%HSMEXT%.%OUTHexFORMAT% /XI:32 -o %~1_WithoutBoot.%OUTHexFORMAT%
goto :EOF

:GenAppPPFunc
%HEXVIEW_EXE% %~1%AEXT%.%OUTHexFORMAT% %SILENT% /e:%~1%AEXT%%PPEXT%.err /CS16:@%APP_PP% /P:expdatproc.ini /XI:32 -o %~1%AEXT%%PPEXT%.%OUTHexFORMAT%
IF /I "%GEN_SIGNED_CONTAINERS%" EQU "YES" (
    %HEXVIEW_EXE% %~1%AEXT%%SEXT%.%OUTHexFORMAT% %SILENT% /e:%~1%AEXT%%SEXT%%PPEXT%.err /CS16:@%APP_PP% /P:expdatproc.ini /XI:32 -o %~1%AEXT%%SEXT%%PPEXT%.%OUTHexFORMAT%
)
IF EXIST %~1%AEXT%%PPEXT%.err call :Error2 %~1%AEXT%%PPEXT%.err
goto :EOF

:GenCalPPFunc
%HEXVIEW_EXE% %~1%CEXT%.%OUTHexFORMAT% %SILENT% /e:%~1%CEXT%%PPEXT%.err /CS16:@%CAL_PP% /P:expdatproc.ini /XI:32 -o %~1%CEXT%%PPEXT%.%OUTHexFORMAT%
IF /I "%GEN_SIGNED_CONTAINERS%" EQU "YES" (
	%HEXVIEW_EXE% %~1%CEXT%%SEXT%.%OUTHexFORMAT% %SILENT% /e:%~1%CEXT%%SEXT%%PPEXT%.err /CS16:@%CAL_PP% /P:expdatproc.ini /XI:32 -o %~1%CEXT%%SEXT%%PPEXT%.%OUTHexFORMAT%
)
IF EXIST %~1%CEXT%%PPEXT%.err call :Error2 %~1%CEXT%%PPEXT%.err
goto :EOF

:GenSb1FileFunc
%HEXVIEW_EXE% %SILENT% /MO:%~1%AEXT%%PPEXT%.%OUTHexFORMAT%+%~1%CEXT%%PPEXT%.%OUTHexFORMAT%+%~1%HSMEXT%.%OUTHexFORMAT%+%~1%BEXT%.%OUTHexFORMAT%  /XI:32 /E:GenSb1InFilefunc.err             -o %~1%SBEXT%.%OUTHexFORMAT%
IF /I "%GEN_SIGNED_CONTAINERS%" EQU "YES" (
    %HEXVIEW_EXE% %SILENT% /MO:%~1%AEXT%%SEXT%%PPEXT%.%OUTHexFORMAT%+%~1%CEXT%%SEXT%%PPEXT%.%OUTHexFORMAT%+%~1%HSMEXT%.%OUTHexFORMAT%+%~1%BEXT%.%OUTHexFORMAT% /XI:32 /E:GenSb1InFilefunc.signed.err             -o %~1%SBEXT%%SEXT%.%OUTHexFORMAT%
)
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
IF NOT EXIST %~1%APP%.%OUTHexFORMAT% (
    call :Error %~1%APP%.%OUTHexFORMAT%
    echo "ERROR: Application file cannot be generated."
    goto :EOF
)
call :GenPlainAppFunc %~1
goto :EOF

:GenCalHeaders
IF NOT EXIST %~1%CEXT%.%OUTHexFORMAT% (
    call :Error %~1%CEXT%.%OUTHexFORMAT%
    echo "ERROR: Calibration file cannot be generated."
    goto :EOF
)
call :GenPlainCalFunc %~1
goto :EOF

:GenPlainAppFunc
%HEXVIEW_EXE% %~1%AEXT%.%OUTHexFORMAT% /AR:%APPADDRESS%,%APPLEN% %SILENT% /XG /MPFH=%~1%CEXT%.%OUTHexFORMAT% /e:%~1%AEXT%%PEXT%.err
%HEXVIEW_EXE% /MO:%~1%AEXT%.%OUTHexFORMAT%;-%APPADDRESS% %SILENT% /AR:0x0E,2 /XA -o HKMC_HEADER_NOAR.tmp
set /p HKMC_HEADER_NOAR=<HKMC_HEADER_NOAR.tmp
set /a HKMC_HEADER_NOAR=0x%HKMC_HEADER_NOAR%
set /a HKMC_HEADER_DCID_ADDR=16 + %HKMC_HEADER_NOAR% * 8 + 2
%HEXVIEW_EXE% %SILENT% /FR:%HKMC_HEADER_DCID_ADDR%,2 /FP:0x8000 /XI:32 -o HKMC_HEADER_DCID.tmp
%HEXVIEW_EXE% %SILENT% /MO:%~1%AEXT%.%OUTHexFORMAT%+HKMC_HEADER_DCID.tmp;%APPADDRESS% /XI:32 -o %~1%AEXT%.%OUTHexFORMAT% /e:DCID_overwrite.err
%HEXVIEW_EXE% %SILENT% %~1%AEXT%.%OUTHexFORMAT% /CS5:@%APPADDRESS%;/%APPADDRESS%,2 /XI:32 -o %~1%AEXT%.%OUTHexFORMAT%
del HKMC_HEADER_NOAR.tmp >nul 2>&1
del HKMC_HEADER_DCID.tmp >nul 2>&1
IF EXIST %~1%AEXT%.err call :Error2 %~1%AEXT%.err
goto :EOF

:GenPlainCalFunc
%HEXVIEW_EXE% %~1%CEXT%.%OUTHexFORMAT% /AR:%CALADDRESS%,%CALLEN% %SILENT% /XG %CS% /e:%~1%CEXT%%PEXT%.err
IF EXIST %~1%PEXT%.err call :Error2 %~1%PEXT%.err
goto :EOF

:GenSignAppCalFunc
%FST_CLIENT% -i autobuild -f %~1%AEXT%.%OUTHexFORMAT% -l .\
%FST_CLIENT% -i autobuild -f %~1%CEXT%.%OUTHexFORMAT% -l .\
goto :EOF

:GenCrc32AppCalFunc
%HEXVIEW_EXE% %SILENT% %~1%CEXT%.%OUTHexFORMAT% /CS9:@append /XI:32 -o %~1%CEXT%.%OUTHexFORMAT%
%HEXVIEW_EXE% %SILENT% %~1%AEXT%.%OUTHexFORMAT% /CS9:@append;%PATTERN_PF_ADDR% /XI:32 -o %~1%AEXT%.%OUTHexFORMAT%
goto :EOF

:GenALLSRecordFilefunc
for %%a in (*.hex) do (
   call :ConvertHextoSRecordFilefunc "%%a"
)
goto :EOF

:ConvertHextoSRecordFilefunc 
%HEXVIEW_EXE% %SILENT% %~1 /XS:32 /E:%~1S19Error.err
IF EXIST %~1S19Error.err call :Error2 %~1S19Error.err
goto :EOF

:ConvertHextoSXFilefunc 
%HEXVIEW_EXE% %SILENT% %~1 /XS:32 /E:%~1S19Error.err -o %~2.%OUTSxFORMAT%
IF EXIST %~1S19Error.err call :Error2 %~1S19Error.err
goto :EOF
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
