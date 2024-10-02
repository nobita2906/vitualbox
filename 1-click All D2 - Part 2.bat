echo Hay dam bao Windows Defender (Security) da duoc tat!
echo An phim bat ky de bat dau!
pause
::Hide SystemTrays
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoTrayItemsDisplay /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v HideRecentlyAddedApps /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableWinDefender /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f
::Hide SystemTrays AD
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Antidetect 4 Guest Additions" /f
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Antidetect 4 Guest Additions" /f
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Antidetect 4 Guest Additions" /f

:: OFF Taskview
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowTaskViewButton /t REG_DWORD /d 0 /f
:: OFF Cortana
reg add "HKCU\Software\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f
:: OFF Search
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v SearchboxTaskbarMode /t REG_DWORD /d 0 /f
:: OFF Search on web
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v ConnectedSearchUseWeb /t REG_DWORD /d 0 /f
:: OFF OneDrive startup
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /v "OneDrive" /t REG_SZ /d "" /f
:: OFF News and Weather
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Feeds" /v ShellFeedsTaskbarViewMode /t REG_DWORD /d 2 /f

::Enable GuestControl
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v LimitBlankPasswordUse /t REG_DWORD /d 0 /f

::Install Rustdesk
certutil -urlcache -split -f "https://raw.githubusercontent.com/lmglobal/windows-config/main/installRustdesk.bat" "C:\Users\Public\Downloads\installRustdesk.bat" && cmd.exe /c "C:\Users\Public\Downloads\installRustdesk.bat" && del /F /Q "C:\Users\Public\Downloads\installRustdesk.bat"

::Install Anydesk
certutil -urlcache -split -f "https://raw.githubusercontent.com/lmglobal/windows-config/main/installAnydesk.bat" "C:\Users\Public\Downloads\installAnydesk.bat" && cmd.exe /c "C:\Users\Public\Downloads\installAnydesk.bat" && del /F /Q "C:\Users\Public\Downloads\installAnydesk.bat"

:: AutoShutdown PC after 60 minitues Idle
certutil -urlcache -split -f "https://github.com/lmglobal/windows-config/raw/main/AutoShutdown.zip" "C:\Users\Public\Downloads\AutoShutdown.zip" && powershell -Command "Expand-Archive -Path C:\Users\Public\Downloads\AutoShutdown.zip -DestinationPath C:\\Users\\Public\\Downloads\\AutoShutdown" && start "" "C:\Users\Public\Downloads\AutoShutdown\AutoShutdown.exe"
::Turn On High Contrast
echo Thiet lap tat may trong 60p thanh cong

timeout /t 20
echo Dam bao xoa file nay sau khi chay xong
echo May tinh se khoi dong lai ngay bay gio
pause
:: Reboot PC
shutdown /r /t 1