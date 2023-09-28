param(
    [Parameter(Mandatory,Position = 0)]
    [String]
    $FileList,

    [Parameter(Mandatory)]
    [ValidateSet('OBJ','FBX',IgnoreCase = $true)]
    [String]
    $DestFormat
)

$Files = Get-Content $FileList
if(!$Files){
    throw [System.Exception] "File list is empty."
}

foreach ($File in $Files) {
    $NewFile = [System.IO.Path]::ChangeExtension($File, $DestFormat)
    Write-Host "Processing $File..."
    mayo.exe `"$File`" --export `"$NewFile`" | Out-Null
    Write-Host "Finished."
}


