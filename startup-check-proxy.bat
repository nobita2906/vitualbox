@echo off
setlocal enabledelayedexpansion

set "batFileUrl1=https://github.com/nobita2906/file_vm/raw/main/check-proxy.bat"
set "batFileUrl2=https://raw.githubusercontent.com/nobita2906/file_vm/main/hoi.bat"
set "startupFolder=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
set "batFilePath1=%startupFolder%\check-proxy.bat"
set "batFilePath2=%startupFolder%\hoi.bat"

:: Màu đỏ cho lỗi
set "errorColor=0C"

:: Màu xanh cho thành công
set "successColor=0A"

:: Tải check-proxy.bat
echo Tai check-proxy.bat...
certutil -urlcache -split -f "%batFileUrl1%" "%batFilePath1%"
if %ERRORLEVEL% neq 0 (
    color %errorColor%
    echo Loi khi tai check-proxy.bat
) else (
    color %successColor%
    echo Da tai thanh cong check-proxy.bat
)

:: Tải hoi.bat
echo Tai hoi.bat...
certutil -urlcache -split -f "%batFileUrl2%" "%batFilePath2%"
if %ERRORLEVEL% neq 0 (
    color %errorColor%
    echo Loi khi tai hoi.bat
) else (
    color %successColor%
    echo Da tai thanh cong hoi.bat
)

:: Giữ CMD mở sau khi thực thi xong
pause

:: Đặt lại màu sắc về mặc định
color 07
