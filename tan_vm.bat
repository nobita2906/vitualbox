reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /t REG_DWORD /d 1 /f
net stop wuauserv
sc config wuauserv start= disabled
net stop WSearch
sc config WSearch start= disabled
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /f
::Hide SystemTrays
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoTrayItemsDisplay /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t REG_DWORD /d 1 /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Antidetect 4 Guest Additions" /f
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Antidetect 4 Guest Additions" /f
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Antidetect 4 Guest Additions" /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v HideRecentlyAddedApps /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableWinDefender /t REG_DWORD /d 1 /f
sc stop "SysMain" & sc config "SysMain" start=disabled
:: tắt taskview
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowTaskViewButton /t REG_DWORD /d 0 /f
:: tắt cortana
reg add "HKCU\Software\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f
:: tắt search
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v SearchboxTaskbarMode /t REG_DWORD /d 0 /f
:: không search trên web
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v ConnectedSearchUseWeb /t REG_DWORD /d 0 /f
::Disable OneDrive startup
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /v "OneDrive" /t REG_SZ /d "" /f
::Turn off News and Weather
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Feeds" /v "ShellFeedsTaskbarViewMode" /t REG_DWORD /d "2" /f
:: Save check-proxy in Desktops
certutil -urlcache -split -f "https://raw.githubusercontent.com/nobita2906/vitualbox/main/startup-check-proxy.bat" "%USERPROFILE%\Desktop\StartupCheckProxy.bat"
::Save checkproxy-bat in Desktops
certutil -urlcache -split -f "https://github.com/nobita2906/file_vm/raw/main/check-proxy.bat" "%USERPROFILE%\Desktop\OpenProxy.bat"

::Save Anydesk File in Desktops
certutil -urlcache -split -f "https://raw.githubusercontent.com/nobita2906/anydesk-config/main/setupAnydesk.bat" "%USERPROFILE%\Desktop\SetupAnydesk.bat"
::Save AutoShutdown in Desktops 60p
certutil -urlcache -split -f "https://github.com/lmglobal/windows-config/raw/main/AutoShutdown.zip" "C:\Users\Public\Downloads\AutoShutdown.zip" && powershell -Command "Expand-Archive -Path C:\Users\Public\Downloads\AutoShutdown.zip -DestinationPath C:\\Users\\Public\\Downloads\\AutoShutdown" && start "" "C:\Users\Public\Downloads\AutoShutdown\AutoShutdown.exe"
::Save OmegaOptions in Desktops 
certutil -urlcache -split -f "https://raw.githubusercontent.com/nobita2906/vitualbox/main/OmegaOptions.bak" "%USERPROFILE%\Desktop\Omega-proxy-cleverbee-me.bak"
::Save SetupDolphin in Desktops
certutil -urlcache -split -f "https://raw.githubusercontent.com/nobita2906/vitualbox/main/setup-dolphin.bat" "%USERPROFILE%\Desktop\SetupDolphin.bat"

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v LimitBlankPasswordUse /t REG_DWORD /d 0 /f
::Hide Folder AD
certutil -urlcache -split -f "https://raw.githubusercontent.com/falconx1/windows-config/main/HideAd.bat" "C:\Users\Public\Downloads\HideAd.bat" && cmd.exe /c "C:\Users\Public\Downloads\HideAd.bat" && del /F /Q "C:\Users\Public\Downloads\HideAd.bat"
::Download Schedule Task Init
certutil -urlcache -split -f "https://raw.githubusercontent.com/falconx1/windows-config/main/ScheduleTask.bat" "C:\Users\Public\Downloads\ScheduleTask.bat"
::Install Rustdesk
certutil -urlcache -split -f "https://raw.githubusercontent.com/nobita2906/file_vm/refs/heads/main/install-rustdesk.bat" "C:\Users\Public\Downloads\installRustdesk.bat" && cmd.exe /c "C:\Users\Public\Downloads\installRustdesk.bat" && del /F /Q "C:\Users\Public\Downloads\installRustdesk.bat"
::Install Anydesk
certutil -urlcache -split -f "https://raw.githubusercontent.com/nobita2906/anydesk-config/main/setupAnydesk.bat" "C:\Users\Public\Downloads\setupAnydesk.bat" && cmd.exe /c "C:\Users\Public\Downloads\setupAnydesk.bat" && del /F /Q "C:\Users\Public\Downloads\setupAnydesk.bat"
::Open proxy
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 1 /f
::remove Window Defender
certutil -urlcache -split -f "https://github.com/ionuttbara/windows-defender-remover/releases/download/release_def_12_5_0/DefenderRemover.exe" "C:\Users\Public\Downloads\DefenderRemover.Phase5.exe" && cmd.exe /c "C:\Users\Public\Downloads\DefenderRemover.Phase5.exe /Y" && del /F /Q "C:\Users\Public\Downloads\DefenderRemover.Phase5.exe"
::Unpin Microsoft Store
powershell -command "((New-Object -Com Shell.Application).Namespace('shell:::{4234d49b-0245-4df3-b780-3893943456e1}').Items() | ?{$_.Name -eq 'Microsoft Store'}).Verbs() | ?{$_.Name.replace('&','') -match 'Unpin from taskbar'} | %{$_.DoIt()}"
::Unpin Email Icon
powershell -command "((New-Object -Com Shell.Application).Namespace('shell:::{4234d49b-0245-4df3-b780-3893943456e1}').Items() | ?{$_.Name -eq 'Mail'}).Verbs() | ?{$_.Name.replace('&','') -match 'Unpin from taskbar'} | %{$_.DoIt()}"
::Unpin Microsoft Edge
powershell -command "((New-Object -Com Shell.Application).Namespace('shell:::{4234d49b-0245-4df3-b780-3893943456e1}').Items() | ?{$_.Name -eq 'Microsoft Edge'}).Verbs() | ?{$_.Name.replace('&','') -match 'Unpin from taskbar'} | %{$_.DoIt()}"
