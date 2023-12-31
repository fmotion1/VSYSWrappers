$Version = (Get-Item "C:\Program Files\Firefox Developer Edition\firefox.exe").VersionInfo
"Firefox Developer Edition $($Version.FileVersion)"