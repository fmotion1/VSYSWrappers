$Version = (Get-Item "C:\Program Files\Mozilla Firefox\firefox.exe").VersionInfo
"Firefox $($Version.FileVersion)"