@echo off
REM echo f | xcopy.exe /f /y %1 %1.orig
REM if exist *.odex.xz 7za x *.odex.xz else
REM 7za x *.odex
COPY %CD%\arm\*.odex %CD%\*.odex
java -jar oat2dex.jar odex *.odex
java -jar baksmali-2.1.1.jar -a 23 -x *.dex -o deodex
java -jar smali-2.1.1.jar -a 23 deodex -o classes.dex
7za u -tzip %1 classes.dex
del *.dex
del *.odex
rd /s /q deodex
rd /s /q arm
pause