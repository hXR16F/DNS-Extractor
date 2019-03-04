:: Programmed by hXR16F
:: hXR16F.ar@gmail.com

@echo off & setlocal EnableDelayedExpansion & title DNS Extractor & color 07

:loop
	set "ip=--" & set "p=0" & set /p "host=Host : "
	ping %host% -n 1 > "temp.txt"
	for /f "tokens=3 skip=2 delims= " %%i in (temp.txt) do if !p! equ 0 (set "ip=%%i" & set p=1)
	del /f /q "temp.txt" >nul 2>&1
	if exist "batbox.dll" (call batbox.dll /c 0x08 /d "  IP : %ip:~0,-1%" /c 0x07 && echo. & echo.) else (echo   IP : %ip:~0,-1% & echo.)
	
	goto loop
	