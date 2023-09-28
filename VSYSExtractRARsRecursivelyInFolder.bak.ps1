param (
    [Parameter(Mandatory,Position = 0)]
    [ValidateScript({
        if (!(Test-Path -LiteralPath $_)) {
            throw [System.ArgumentException] "File or Folder does not exist."
        }
        return $true
    })]
    [String]
    $RootFolder
)

$Items = Get-ChildItem -LiteralPath $RootFolder -Recurse -File -Force
$RarFiles = $Items | Where-Object {($_.Extension -eq '.rar' -or $_.Extension -eq '.zip' -or $_.Extension -eq '.7z')}
$RarFiles | ForEach-Object {

    $DestFolder = $_.Directory.FullName + "\Extracted\"
    $Script = "x", $_.FullName, "-o$DestFolder"
    & 7z $Script



    # $RemainingFiles = Get-ChildItem -LiteralPath $_.Directory.FullName -Force | Where-Object {( $_.Name -ne 'Extracted')}
    # $OrgPath = New-Item -Path ($_.Directory.FullName + "\Original\") -ItemType Directory -Force
    # $RootPath = $_.Directory.FullName

    # $RemainingFiles | ForEach-Object {
    #     Move-Item -Path $_.FullName -Destination $OrgPath.FullName -Force
    # }

    # $ExtractedFiles = Get-ChildItem -LiteralPath $DestFolder -Force

    # $ExtractedFiles | ForEach-Object {
    #     Write-Host "`$_.FullName:" $_.FullName -ForegroundColor Green
    #     Write-Host "`$RootPath:" $RootPath -ForegroundColor Green
    #     Move-Item -Path $_.FullName -Destination $RootPath -Force
    # }

    # Remove-Item $DestFolder -Force
}


