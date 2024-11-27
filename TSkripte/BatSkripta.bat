@echo off
rem Podešavanje putanje do PowerShell skripte
set "SkriptaPath=C:\Users\Korisnik\Documents\SkriptaSysLog.ps1"

rem Provera da li postoji PowerShell skripta na datoj putanji
if not exist "%SkriptaPath%" (
    echo PowerShell skripta nije pronađena na datoj putanji: %SkriptaPath%
    exit /b 1
)

rem Pokretanje PowerShell skripte
PowerShell.exe -ExecutionPolicy Bypass -NoProfile -File "%SkriptaPath%"

rem Provera povratnog koda PowerShell skripte
if %errorlevel% neq 0 (
    echo Greška prilikom izvršavanja PowerShell skripte.
    exit /b %errorlevel%
)

echo Skripta je uspešno izvršena.
exit /b 0
