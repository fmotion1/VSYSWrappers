param (
    [Parameter(Mandatory,Position = 0)]
    [ValidateScript({
        if (!(Test-Path -LiteralPath $_)) {
            throw [System.ArgumentException] "File or Folder does not exist."
        }
        return $true
    })]
    [String]
    $RootFolder,

    [Parameter(Mandatory=$false)]
    [Switch]
    $ForceExtractToRoot
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

        if(($CurrentArchive.Name -match '.part1.rar') -or ($CurrentArchive.Name -match '.part01.rar')){

            [void] $Batches.Add($CurrentArchive)
            $PrimaryArchives.Add($CurrentArchive)

            if($CurrentArchive.Name -match '.part1.rar'){

                $ArchiveBase = $CurrentArchive.Name -replace "\.part1\.rar"

            }elseif($CurrentArchive.Name -match '.part01.rar'){

                #$ArchiveBase = $CurrentArchive.Name.TrimEnd('.part01.rar')
                $ArchiveBase = $CurrentArchive.Name -replace "\.part01\.rar"
            }

            Write-Host "`$CurrentArchive.Name:" $CurrentArchive.Name -ForegroundColor Green
            Write-Host "`$ArchiveBase:" $ArchiveBase -ForegroundColor Green

            foreach ($Archive in $AllArchivesList) {
                if(($Archive.Name -match "$ArchiveBase\.part[0-9]{1,4}\.rar")){

                    Write-Host "`$Archive.Name: $($Archive.Name) matched!" -ForegroundColor Green

                    if(($Archive.Name -notmatch '\.part1\.rar') -or ($Archive.Name -notmatch '\.part01\.rar')){
                        [void] $Batches.Add($Archive)
                    }
                }
            }

        } elseif($CurrentArchive.Name -notmatch '\.part[0-9]{1,4}\.rar'){

            $Batches.Add($CurrentArchive)
            $PrimaryArchives.Add($CurrentArchive)

            foreach ($A in $AllArchivesList) {
                if($A.Extension -match "\.r[\d]{2,3}"){
                   # Write-Host "Test Hit"
                    $Batches.Add($A)
                }
            }

            foreach ($A in $AllArchivesList) {
                if($A.Extension -match "\.sfv"){
                    $Batches.Add($A)
                }
            }
        }
    }

    if($CurrentArchive.Extension -eq ".7z"){
        $Batches.Add($CurrentArchive)
        $PrimaryArchives.Add($CurrentArchive)
    }

    if($CurrentArchive.Extension -eq ".zip"){
        $Batches.Add($CurrentArchive)
        $PrimaryArchives.Add($CurrentArchive)
    }
}

$ExtractFailure = $false

if($PrimaryArchives.Count -eq 1){

    $PrimaryArchives | ForEach-Object {

        $DestFolder = $_.Directory.FullName

        $Script = "x", "-aot", $_.FullName, "-o$DestFolder"

        try {
            & 7z $Script
        } catch {
            Write-Host "An error occurred executing the script:"
            Write-Host "7z $Script"
            Write-Host $_
            exit
        }

    }

}elseif($PrimaryArchives.Count -gt 1){

    $PrimaryArchives | ForEach-Object {

        if($ForceExtractToRoot){
            $DestDir = $_.Directory.FullName
        }else{
            $DestDir = [IO.Path]::Combine($_.Directory.FullName, $_.BaseName)
        }

        $DestFolder = $DestDir

        $Script = "x", "-aot", $_.FullName, "-o$DestFolder"

        try {
            & 7z $Script
        } catch {
            Write-Host "An error occurred executing the script:"
            Write-Host "7z $Script"
            Write-Host $_
            exit
        }
    }
}

if(!$ExtractFailure){
    $Batches = $Batches | Select-Object -Unique
    $Batches | ForEach-Object {
        Remove-Item $_ -Force
    }
}


