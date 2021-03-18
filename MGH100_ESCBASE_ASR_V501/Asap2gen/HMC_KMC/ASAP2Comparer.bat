@Set INSTALLDIR=C:\Program Files (x86)\Vector\ASAP2 Tool-Set 11.0\Exec

@echo Existing output file will be overwritten!

"%INSTALLDIR%\ASAP2Comparer.exe" -a ASAP2UpdaterOutp.a2l -b ASAP2UpdaterOutpOld.a2l -i ASAP2Comparer.ini -d Comparer_Report.log
@copy %TOOL_ASAP2_DIR%\ASAP2UpdaterOutp.a2l %CURRENT_DIR%\%FILE_OUT_NAME%.a2l
@copy %TOOL_ASAP2_DIR%\Comparer_Report.log %CURRENT_DIR%\Comparer_Report.log
@echo -----------------------------------------------------
@echo a2l file compare finished.
@echo -----------------------------------------------------
@exit /b