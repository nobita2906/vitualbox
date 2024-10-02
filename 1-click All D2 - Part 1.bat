@echo off
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /t REG_DWORD /d 1 /f
net stop wuauserv
sc config wuauserv start= disabled
sc stop "WSearch"
sc config "WSearch" start= disabled
sc stop "SysMain"
sc config "SysMain" start= disabled
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /f

setlocal
set reg_path=HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System
set value_name=EnableLUA
set data_value=0

reg add "%reg_path%" /v %value_name% /t REG_DWORD /d %data_value% /f
echo UAC has been disabled. The system needs to be rebooted to apply changes.

:: SET new PC name
set /p UserName= Nhap ten moi cho may tinh (theo ten may duoc cap, vi du: G2xxx): 
set NewName=DESKTOP-%UserName%
wmic computersystem where name="%computername%" call rename name="%NewName%"
echo May tinh se duoc doi ten thanh %NewName%

:: Reboot PC
echo Khoi dong lai may tinh ngay bay gio
shutdown /r /t 1