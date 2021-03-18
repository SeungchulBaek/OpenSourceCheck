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
rem %TOOL_HEXVIEW_DIR%\Hexview.exe %FILE_OUT_NAME%_App.sx /s /CS14:%FILE_OUT_NAME%_App_CheckSum.txt;@begin;0x80070000-0x801fffbf
::CheckSum is saved into the cheksum files.
rem set HEXVIEW_EXE=..\..\..\_Burner_\Hexview\hexview.exe
rem set AEXT=_App
rem set CAL_FOLDER=DemoCal_withoutHeader
set FILEEXT=s19 
%HEXVIEW_EXE% %~1%AEXT%.s19 /s /CS14:%~1%AEXT%_CheckSum.txt;@begin;0x80070000-0x801fffbf
for /f "tokens=1-2 delims=." %%f in ('dir /b .\%CAL_FOLDER%') do (
   IF %FILEEXT%==%%g (
      echo make checksum text for %%f.%%g
      %HEXVIEW_EXE% %CAL_FOLDER%\%%f.%%g /s /CS14:%%f_Cal_CheckSum.txt;@begin;0x80010000-0x8006ffbf
   )
)
