:: clean
@echo off
IF "%~1"=="" goto :EOF

IF EXIST *.err del *.err
IF EXIST %~1*.hex del %~1*.hex
IF EXIST %~1*.gbf del %~1*.gbf
IF EXIST %~1*.elf del %~1*.elf
IF EXIST %~1*.mot del %~1*.mot
IF EXIST %~1*.RSA del %~1*.RSA
IF EXIST %~1*.s19 del %~1*.s19
IF EXIST %~1*.bin del %~1*.bin
IF EXIST %~1*.a2l del %~1*.a2l
IF EXIST *.sx del *.sx

IF EXIST ASAP2CreatorMasterOutp.a2l del ASAP2CreatorMasterOutp.a2l
IF EXIST .\DemoCal_withoutHeader del /s /q .\DemoCal_withoutHeader\*.*
IF EXIST .\GeneratedAndToSignedByGm del /s /q .\GeneratedAndToSignedByGm\*.*
IF EXIST .\Generatedforsb1 del /s /q .\Generatedforsb1\*.*
IF EXIST .\GeneratedTemp del /s /q .\GeneratedTemp\*.*
IF EXIST .\signed del /s /q .\signed\*.*

:end
