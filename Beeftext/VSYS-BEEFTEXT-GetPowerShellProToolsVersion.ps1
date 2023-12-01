$VSC = "C:\Users\futur\.vscode\extensions\ironmansoftware.powershellprotools-2023.9.0\package.json"
$JSONData = Get-Content -Path $VSC -Raw
$JSONObj = $JSONData | ConvertFrom-Json
$Version = $JSONObj.version
$FinalStr = "PowerShell Pro Tools v$Version"
$FinalStr