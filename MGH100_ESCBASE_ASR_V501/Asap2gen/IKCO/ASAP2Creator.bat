@Set INSTALLDIR=C:\Program Files (x86)\Vector\ASAP2 Tool-Set 11.0\Exec

@echo Existing output file will be overwritten!

@IF EXIST ASAP2CreatorMasterOutp.a2l del ASAP2CreatorMasterOutp.a2l
"%INSTALLDIR%\ASAP2Creator.exe" -i ASAP2Creator.ini
@echo -----------------------------------------------------
@echo a2l file create finished.
@echo -----------------------------------------------------
@exit /b