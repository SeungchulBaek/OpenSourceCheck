@echo off
:: Note: Project setup - user make environment

set GNU_Make_EXE=..\..\_tools_\GNU_Make\make.exe
set GCC_CPP_EXE=..\..\_tools_\gcc\bin\cpp.exe
set CFG_GEN_EXE=..\..\_tools_\gencfg\gencfg.exe


if exist "%~dp0Mando_launch_cfg.bat" del %~dp0Mando_launch_cfg.bat

:: set PROJECT_ROOT to the current project directory (relative to location of this batch file, converted to absolute path)
for /f %%i in ("%~dp0..") do set PROJECT_ROOT=%%~fi


:: generate mando cfg file
call %GNU_Make_EXE% -f Mando_launch_cfg.mak carpargen
if not exist "%~dp0Mando_launch_cfg.bat" goto :finish

:: execute mando cfg file
if exist "%~dp0Mando_launch_cfg.bat" call %~dp0Mando_launch_cfg
if exist "%~dp0launch_cfg.bat" call %~dp0launch_cfg

:: adapt location of plugins if not present in default directory
if "%PLUGINS_BASE%"=="" set PLUGINS_BASE=%TRESOS_BASE%\plugins

:: check, if the path variables for PROJECT_ROOT is set
if not defined TRESOS_BASE goto missing_TRESOS_BASE
if not exist "%TRESOS_BASE%" goto missing_TRESOS_BASE
if not exist "%PLUGINS_BASE%" goto missing_PLUGINS_BASE
:: add %TRESOS_BASE%\bin to path
SET PATH=%PATH%;

:: ensure working directory is util folder of current project directory (location of this batch file)
cd /D "%~dp0%"
set EXIT_CODE=0

:: check for command line parameters
if [%1]==[] goto interactive
if [%1]==[/c] goto call_command_c
if [%1]==[make] goto call_batch
if [%~x1]==[.bat] goto call_batch

:call_command
:: invoke command and terminate
cmd /c %*
set EXIT_CODE=%ERRORLEVEL%
goto finish

:call_command_c
:: invoke command and terminate
cmd %*
set EXIT_CODE=%ERRORLEVEL%
goto finish

:call_batch
:: invoke batch and terminate
call %*
set EXIT_CODE=%ERRORLEVEL%
goto finish

:interactive
:: start interactive command shell and display make rules
cmd /c "make show_rules"
cmd
goto :eof

:: The variable TRESOS_BASE was not specified
:missing_TRESOS_BASE
echo.
echo    The variable TRESOS_BASE was not set correctly:
echo    %TRESOS_BASE%.
echo    Please specify this variable manually by editing
echo    the batch file 'launch_cfg.bat'.
echo.
set EXIT_CODE=1
if [%1]==[] pause
goto :finish

:: The path given by PLUGINS_BASE does not exist
:missing_PLUGINS_BASE
echo.
echo    The variable PLUGINS_BASE was not set correctly:
echo    %PLUGINS_BASE%.
echo    Please specify this variable manually by editing
echo    the batch file 'launch_cfg.bat'.
echo.
set EXIT_CODE=1
if [%1]==[] pause

:: Compiler version is invalid.
:invalid_compiler_version
echo.
echo    Compiler version is invalid.
echo    Please check whether TASKING TriCore v5.0r2p3 is installed.
echo.
set EXIT_CODE=1
if [%1]==[] pause
goto :finish

:finish
exit /B %EXIT_CODE%
