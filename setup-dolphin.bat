@echo off
start /wait "" https://dolphin-anty.com/download/
timeout /t 1 /nobreak
PowerShell -ExecutionPolicy Bypass -Command "Start-Process \"$env:userprofile\Downloads\dolphin-anty-win-latest.exe\" -ArgumentList '/S','/v','/qn' -PassThru"
