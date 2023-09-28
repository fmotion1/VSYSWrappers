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

$Items           = Get-ChildItem -LiteralPath $RootFolder -Recurse -File -Force
$AllArchives     = $Items | Where-Object {( $_.Extension -eq '.rar' -or
                                            $_.Extension -eq '.zip' -or
                                            $_.Extension -eq '.7z'  -or
                                            $_.Extension -match "\.r[\d]{2,3}" -or
                                            $_.Extension -eq '.sfv')}

$AllArchivesList = [System.Collections.ArrayList]@()
foreach ($A in $AllArchives) { $AllArchivesList.Add($A) }

$Batches = [System.Collections.ArrayList]@()
$PrimaryArchives = [System.Collections.ArrayList]@()

for ($i = 0; $i -lt $AllArchivesList.Count; $i++) {

    $CurrentArchive = $AllArchivesList[$i]

    if($CurrentArchive.Extension -eq ".rar"){

        if($CurrentArchive.Name -match '.part1.rar'){

            $Batch = [System.Collections.ArrayList]@()
            [void] $Batch.Add($CurrentArchive)

            $ArchiveBase = $CurrentArchive.Name.TrimEnd('.part1.rar')

            foreach ($Archive in $AllArchivesList) {
                if(($Archive.Name -match "$ArchiveBase\.part[0-9]{1,3}\.rar") -and ($Archive.Name -notmatch '\.part1\.rar')){
                    [void] $Batch.Add($Archive)
                }
            }

            $Batches.Add($Batch)

        } elseif($CurrentArchive.Name -notmatch '\.part[0-9]{1,3}\.rar'){

            $Batch = [System.Collections.ArrayList]@()
            $Batch.Add($CurrentArchive)
            $PrimaryArchives.Add($CurrentArchive)

            foreach ($A in $AllArchivesList) {
                if($A.Extension -match "\.r[\d]{2,3}"){
                   # Write-Host "Test Hit"
                    $Batch.Add($A)
                }
            }

            foreach ($A in $AllArchivesList) {
                if($A.Extension -match "\.sfv"){
                    $Batch.Add($A)
                }
            }

            $Batches.Add($Batch)

        }
    }

    if($CurrentArchive.Extension -eq ".7z"){
        $Batch = [System.Collections.ArrayList]@()
        $Batch.Add($CurrentArchive)
        $Batches.Add($Batch)
        $PrimaryArchives.Add($CurrentArchive)
    }

    if($CurrentArchive.Extension -eq ".zip"){
        $Batch = [System.Collections.ArrayList]@()
        $Batch.Add($CurrentArchive)
        $Batches.Add($Batch)
        $PrimaryArchives.Add($CurrentArchive)
    }
}

$ExtractFailure = $false

if($PrimaryArchives.Count -eq 1){

    $PrimaryArchives | ForEach-Object {

        $DestFolder = $_.Directory.FullName
        $Script = "x", $_.FullName, "-o$DestFolder"
        & 7z $Script 2>&1 | Tee-Object -Variable allOutput

        $STDERR = $allOutput | Where-Object { $_ -is [System.Management.Automation.ErrorRecord] }
        $FN = Split-Path $CurrentArchive.Name -Leaf

        if($LASTEXITCODE -ne 0){
            $ExtractFailure = $true
        }
    }
}elseif($PrimaryArchives.Count -gt 1){
    $PrimaryArchives | ForEach-Object {
        Write-Host "`$_.Name:" $_.BaseName -ForegroundColor Green
        $DestFolder = [IO.Path]::Combine($_.Directory.FullName, $_.BaseName)
        $Script = "x", $_.FullName, "-o$DestFolder"
        & 7z $Script 2>&1 | Tee-Object -Variable allOutput

        $STDERR = $allOutput | Where-Object { $_ -is [System.Management.Automation.ErrorRecord] }
        $FN = Split-Path $CurrentArchive.Name -Leaf

        if($LASTEXITCODE -ne 0){
            $ExtractFailure = $true
        }
    }
}

foreach ($Itm in $Batches) {

}


# if(!$ExtractFailure){
#     $Batches | ForEach-Object {
#         Remove-Item $_ -Force
#     }
# }


