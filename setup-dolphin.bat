@echo off
start /wait "" https://app.dolphin-anty-mirror3.org/anty-app/dolphin-anty-win-latest.exe
timeout /t 1 /nobreak
PowerShell -ExecutionPolicy Bypass -Command "Start-Process \"$env:userprofile\Downloads\dolphin-anty-win-latest.exe\" -ArgumentList '/S','/v','/qn' -PassThru"
