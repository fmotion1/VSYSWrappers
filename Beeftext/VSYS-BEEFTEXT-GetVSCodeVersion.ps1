$VSC = "C:\Users\futur\AppData\Local\Programs\Microsoft VS Code\resources\app\product.json"
$JSONData = Get-Content -Path $VSC -Raw
$JSONObj = $JSONData | ConvertFrom-Json
$Commit = $JSONObj.commit
$Version = $JSONObj.version
$Date = $JSONObj.date
$FinalStr = "VS Code v$($Version) ($Date)`nCommit:$Commit"
$FinalStr