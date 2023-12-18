$downloadURL = "https://dolphin-anty.com/download/?platform=win"
$installerPath = "$env:userprofile\Downloads\dolphin-anty-win-latest.exe"

# Tải về file
Start-Process $downloadURL -Wait

# Tắt Chrome
Stop-Process -Name chrome -Force -ErrorAction SilentlyContinue

# Cài đặt và cấp full quyền
Start-Process $installerPath -ArgumentList '/S','/v','/qn' -Wait
