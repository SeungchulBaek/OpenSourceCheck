:: TricoreHarmonizeAddressRanges.bat DemoAppl.hex ..\..\..\Misc\HexView\hexview.exe
@echo on
echo Harmonizing Tricore Address Space (%1)
echo move 0x800xxxxx to 0xA00xxxxx
if exist %1 move %1 original%~x1
if exist original%~x1 %2 original%~x1 /S /AR:0x80000000-0x8fffffff /XI -o _0x8%~x1
if exist original%~x1 %2 original%~x1 /S /AR:0xA0000000-0xAfffffff /XI -o _0xA%~x1
if exist _0xA%~x1 %2 _0xA%~x1 /MO:_0x8%~x1;0x20000000 /XI /s -o %~n1.hex
if exist _0x8%~x1 del _0x8%~x1
if exist _0xA%~x1 del _0xA%~x1
echo done