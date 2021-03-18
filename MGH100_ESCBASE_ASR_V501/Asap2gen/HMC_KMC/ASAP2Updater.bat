@Set INSTALLDIR=C:\Program Files (x86)\Vector\ASAP2 Tool-Set 11.0\Exec

@echo Existing output file will be overwritten!

@IF EXIST ASAP2UpdaterOutp.a2l copy ASAP2UpdaterOutp.a2l ASAP2UpdaterOutpOld.a2l
@del ASAP2UpdaterOutp.a2l
"%INSTALLDIR%\ASAP2Updater.exe" -t ASAP2Updater.ini -i ASAP2CreatorMasterOutp.a2l -o ASAP2UpdaterOutp.a2l -a %CURRENT_DIR%\%FILE_OUT_NAME%.elf
@echo -----------------------------------------------------
@echo a2l file update finished.
@echo -----------------------------------------------------
@exit /b