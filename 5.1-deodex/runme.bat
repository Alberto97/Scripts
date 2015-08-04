@echo off
COPY %CD%\arm\*.odex %CD%\*.odex
java -jar oat2dex.jar odex *.odex
java -jar baksmali-2.0.6.jar -a 22 -x *.dex -o deodex
java -jar smali-2.0.6.jar -a 22 deodex -o classes.dex
7za u -tzip %1 classes.dex
del *.dex
del *.odex
rd /s /q deodex
pause