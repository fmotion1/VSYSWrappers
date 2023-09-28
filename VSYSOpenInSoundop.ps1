param (
    [Parameter(Mandatory,Position=0)]
    [String]$FileList
)

$Files = Get-Content $FileList
$FilesToOpen = @()

$Files | ForEach-Object {
    $FilesToOpen += $_
}

(& "C:\Program Files\Ivosight\Soundop\Soundop.exe" $FilesToOpen)

Remove-Item $FileList -Force