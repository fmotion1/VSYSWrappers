param (
    [Parameter(Mandatory=$true,Position=0)]
    [String]$FileList
)

$Folders = Get-Content $FileList


foreach ($Folder in $Folders) {
    if(Test-Path -LiteralPath $Folder -PathType Container){
        $CrapFiles = Get-Childitem $Folder -Include @("._*", ".DS_Store") -Recurse -Force
        foreach ($Item in $CrapFiles) {
            $fs = (Get-Item $Item.FullName).length
            Write-Host "`$fs:" $fs -ForegroundColor Green
            if($fs -lt 2){
                Remove-Item -LiteralPath $Item -Force -Recurse
            }
        }
    }
}

Remove-Item $FileList -Force