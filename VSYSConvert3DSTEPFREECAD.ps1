param(
    [Parameter(Mandatory,Position = 0)]
    [String]
    $FileList
)

$Files = Get-Content $FileList
if(!$Files){
    throw [System.Exception] "File list is empty."
}

foreach ($File in $Files) {
    $NewFile = [System.IO.Path]::ChangeExtension($File,'obj')
    Write-Host "Processing $File..."
    py -3.8 "C:\Tools\scripts\VSYSConvert3DSTEPFREECAD1.py" $File $NewFile | Out-Null
    Write-Host "Finished."
}


