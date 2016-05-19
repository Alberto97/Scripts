@echo off
rem baksmali -x -c boot.oat -d framework -e %1.jar framework/boot.oat -o %1
echo Deodexing...
java -jar baksmali-2.1.1.jar -x -c boot.oat -d framework %~n1.odex -o deodex
java -jar smali-2.1.1.jar -a 23 deodex -o classes.dex
7za u -tzip %~n1%~x1 classes.dex
del *.dex
del *.odex
rd /s /q deodex
pause