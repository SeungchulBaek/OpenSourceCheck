@echo off 

:: Gen All
set BIN_OUTPUT_PATH=..\..\output\bin
set TARGET=tc23x_Gm
:: Set Manually for sb1
rem set BOOT_SOURCE=
rem set KERNEL_SOURCE=
rem set HSM_SOURCE=

pushd %~dp0
cd ..\..\util
call launch /c echo Start post build process
if not exist "Mando_launch_cfg.bat" goto :EOF
popd 

@echo on
IF "%M_PBC_MERGE_TYPE%"=="M_BIN" (
set PBC_MERGE_SOURCE_1=..\..\..\..\SourceCode\ASW\TSL\PBC\LIB\%M_CAR%\PBC_App.sx
set PBC_MERGE_SOURCE_2=..\..\..\..\SourceCode\ASW\TSL\PBC\LIB\%M_CAR%\PBC_Cal.sx
)

IF "%M_CYBER_SECURITY%"=="HKMC_CS" (
set FST_SIGN=YES
)

set SYSTEM=
IF "%__IDB_SYSTEM%"=="ENABLE" (
	set SYSTEM=IDB
) ELSE (
	IF "%V_ECU%"=="1" set SYSTEM=ABS
	IF "%V_ECU%"=="2" set SYSTEM=ESC
)
@echo off

@echo on
set CAL_STRUCT_PATH=..\..\..\..\SourceCode\ASW\FAL\CALPRM\SRC\CAL_STRUCT\%SYSTEM%
@echo off

:: clean
@echo on
call clean.bat %TARGET%
@echo off

:: Move input
@echo on
copy %BIN_OUTPUT_PATH%\*.mot
copy %BIN_OUTPUT_PATH%\*.elf
ren *.mot %TARGET%.mot
ren *.elf %TARGET%.elf
@echo off

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Gen_All.bat Parameter info
:: %~1 : name of Gen files
:: %~2 : name of mot file for input
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@echo on
call Gen_All.bat %TARGET% %TARGET%.mot
@echo off
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Gen_A2L.bat Parameter info
:: %~1 : name of A2l
:: %~2 : name of Master A2L
:: %~3 : name of elf file
:: %~4 : path of calibration files
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@echo on
call Gen_A2L.bat %TARGET%.a2l ASAP2CreatorMaster.a2l %TARGET%.elf %CAL_STRUCT_PATH%
@echo off
goto :EOF

:end