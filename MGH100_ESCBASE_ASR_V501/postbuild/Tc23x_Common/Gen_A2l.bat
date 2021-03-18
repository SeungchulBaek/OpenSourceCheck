@echo off
Set INSTALLDIR=C:\Program Files (x86)\Vector\ASAP2 Tool-Set 11.0\Exec
set ASAP2CretEXE=%INSTALLDIR%\ASAP2Creator.exe
set ASAP2UpdaEXE=%INSTALLDIR%\ASAP2Updater.exe
set ASAP2CompEXE=%INSTALLDIR%\ASAP2Comparer.exe
set HEADER_FILE_SOURCE_PATH=%~4

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Parameter info
:: %~1 : name of A2l
:: %~2 : name of Master A2L
:: %~3 : name of elf file
:: %~4 : path of cal folder
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

IF NOT EXIST "%~2" (
 call :Error %~2
 goto :EOF
)

IF NOT EXIST "%~3" (
 call :Error %~3
 goto :EOF
)

IF NOT EXIST "%~4" (
 call :Error %~4
 goto :EOF
)

call :StartA2LCreator %~2

call :StartA2LUpdater %~1 %~3

goto :EOF


:Error
echo "Input file %~1 not found."
goto :end
goto :EOF

:StartA2LCreator
@echo on
"%ASAP2CretEXE%" -i ASAP2Creator.ini
@echo off
goto :EOF

:StartA2LUpdater
@echo on
"%ASAP2UpdaEXE%" -t ASAP2Updater.ini -i ASAP2CreatorMasterOutp.a2l -o %~1 -a %~2
@echo off
goto :EOF

:end
