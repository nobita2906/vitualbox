# Yêu cầu người dùng nhập thông tin proxy
$proxyServer = Read-Host "Nhap Dia Chi Proxy Vao (VD: http://proxy.cleverbee.me:42021)"

$settingsPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings"
Set-ItemProperty -Path $settingsPath -Name ProxyEnable -Value 1
Set-ItemProperty -Path $settingsPath -Name ProxyServer -Value $proxyServer
Set-ItemProperty -Path $settingsPath -Name AutoConfigURL -Value ""
netsh winhttp set proxy $proxyServer
Write-Host "Proxy da duoc set thanh cong: $proxyServer."
