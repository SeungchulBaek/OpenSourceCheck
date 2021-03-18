@echo off
setlocal EnableDelayedExpansion

:: Gen All
set BIN_OUTPUT_PATH=..\..\output\bin
set TARGET=tc23x_Common
:: Set Manually for sb1
rem set BOOT_SOURCE=
rem set KERNEL_SOURCE=
rem set HSM_SOURCE=

pushd %~dp0
cd ..\..\util
call launch /c echo Start post build process
if not exist "Mando_launch_cfg.bat" goto :EOF
popd 

:: CVN Type will be set by car spec in the future
IF "%M_CAR%"=="ISUZU_PT022" (
set CVN_TYPE=CRC32
) else (
set CVN_TYPE=CHECKSUM
)

IF "%M_PBC_MERGE_TYPE%"=="M_BIN" (
	IF "%M_CAR%"=="HMC_NX4" (
		IF "%M_MGH100_MOCi%"=="ENABLE" ( 
			set PBC_MERGE_SOURCE_1=..\..\..\..\SourceCode\ASW\TSL\PBC\LIB\%M_CAR%\%M_PBC_SUPPLIER%\PBC_App.sx
			set PBC_MERGE_SOURCE_2=..\..\..\..\SourceCode\ASW\TSL\PBC\LIB\%M_CAR%\%M_PBC_SUPPLIER%\PBC_Cal.sx
		) else (
			call :SetDefaultPBCLocation
		)
	) else (
			call :SetDefaultPBCLocation
	)
	echo PBC Location:
	echo %PBC_MERGE_SOURCE_1%
	echo %PBC_MERGE_SOURCE_2%
)

IF "%M_CYBER_SECURITY%"=="HKMC_CS" (
set FST_SIGN=YES
)

set SYSTEM=
IF "%__IDB_SYSTEM%"=="1" (
    set SYSTEM=IDB
) ELSE (
    IF "%V_ECU%"=="1" set SYSTEM=ABS
    IF "%V_ECU%"=="2" set SYSTEM=ESC
)
echo SYSTEM:%SYSTEM%

set CAL_STRUCT_PATH=..\..\..\..\SourceCode\ASW\FAL\CALPRM\SRC\CAL_STRUCT\%SYSTEM%

:: clean
call clean.bat %TARGET%  > nul

:: Move input
copy %BIN_OUTPUT_PATH%\*.mot   > nul
copy %BIN_OUTPUT_PATH%\*.elf   > nul
ren *.mot %TARGET%.mot
ren *.elf %TARGET%.elf

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Gen_All.bat Parameter info
:: %~1 : name of Gen files
:: %~2 : name of mot file for input
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
call Gen_All.bat %TARGET% %TARGET%.mot
IF "%M_CAR_MAKER%"=="TATA" (
	call Gen_TATA.bat %TARGET%
)
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Gen_A2L.bat Parameter info
:: %~1 : name of A2l
:: %~2 : name of Master A2L
:: %~3 : name of elf file
:: %~4 : path of calibration files
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
call Gen_A2L.bat %TARGET%.a2l ASAP2CreatorMaster.a2l %TARGET%.elf %CAL_STRUCT_PATH%

goto :EOF

:SetDefaultPBCLocation
set PBC_MERGE_SOURCE_1=..\..\..\..\SourceCode\ASW\TSL\PBC\LIB\%M_CAR%\PBC_App.sx
set PBC_MERGE_SOURCE_2=..\..\..\..\SourceCode\ASW\TSL\PBC\LIB\%M_CAR%\PBC_Cal.sx
goto :EOF


:end