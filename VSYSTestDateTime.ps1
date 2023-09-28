$TheDate = Get-Date -Day 2
$FormattedDate = Get-Date $TheDate -Format 'ddd MM-dd-yyyy'
#$FormattedDate = Get-Date $TheDate -Format 'yyyy-MM-dd'
Write-Host "`$FormattedDate:" $FormattedDate -ForegroundColor Green