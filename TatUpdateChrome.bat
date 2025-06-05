@echo off
echo.
echo === DANG TIM VA VO HIEU HOA TOAN BO GOOGLE UPDATER SERVICES ===
echo.

:: Lấy danh sách các dịch vụ có tên chứa "GoogleUpdater"
for /f "tokens=*" %%S in ('sc query state^= all ^| findstr /R /C:"SERVICE_NAME: GoogleUpdater"') do (
    set "line=%%S"
    call :processLine
)

echo.
echo === DA HOAN TAT VO HIEU HOA CAC DICH VU GOOGLE UPDATER ===
pause
exit /b

:processLine
:: Cắt tên dịch vụ ra từ dòng "SERVICE_NAME: GoogleUpdaterXXXXX"
for /f "tokens=2 delims=:" %%A in ("%line%") do (
    set "servicename=%%A"
    setlocal enabledelayedexpansion
    set "servicename=!servicename:~1!"   :: loại bỏ khoảng trắng đầu dòng
    echo -> Vô hiệu hóa dịch vụ: !servicename!
    sc stop "!servicename!" >nul 2>&1
    sc config "!servicename!" start= disabled >nul 2>&1
    endlocal
)

