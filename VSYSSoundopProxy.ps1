$ErrorActionPreference = "SilentlyContinue"

Start-Process -FilePath "C:\Program Files\Ivosight\Soundop\Soundop.exe" -ArgumentList "`"$args`"" -Wait
# & "C:\Program Files\Ivosight\Soundop\Soundop.exe" `"$args`"

exit

