using namespace System.Text.RegularExpressions

param (
    [Parameter(Mandatory)]
    [Alias("d")]
    [String]$Directory,

    [Parameter(Mandatory)]
    [Alias("v")]
    [String]
    $Version
)

$NPMString = Get-Clipboard -Raw
$isValidLink = $false
$safePackageName = $null

$RXNPMFormat1 = 'npm i ([^\s][a-z0-9\.\-/@:\s]+)$'
$RXNPMFormat2 = 'npm install ([^\s][a-z0-9\.\-/@:\s]+)$'

if($NPMString -match $RXNPMFormat1){
    $isValidLink = $true
}

if($NPMString -match $RXNPMFormat2){
    $isValidLink = $true
}


$safePackageName = $Matches[1].Split([IO.Path]::GetInvalidFileNameChars()) -join '_'
$safePackageName = $safePackageName.Replace("--save-dev ", "")


if($isValidLink){

        $env:Path += ";C:\Program Files\nodejs\"

        $DestDir = Join-Path $Directory $safePackageName

        $IDX = 2
        $PadIndexTo = '1'
        $StaticDirName = $DestDir
        while (Test-Path -LiteralPath $DestDir -PathType Container) {
            $DestDir = "{0} {1:d$PadIndexTo}" -f $StaticDirName, $IDX
            $IDX++
        }

        New-Item -Path $DestDir -ItemType Directory -Force | Out-Null
        Set-Location -Path $DestDir

        & nvm use $Version

        $cmd = Get-Command npm.cmd
        $params = ($NPMString -replace "^npm\s+").Split(" ")
        $params = $params.Trim()
        Write-Host "`$params:" $params -ForegroundColor Green
        & $cmd @params

} else {
    $Params = @{
        Title = "Invalid NPM Link"
        Message = "The NPM package link you supplied is invalid. ($($NPMString))"
        Icon = 'Critical'
        BoxType = 'OKOnly'
    }
    Invoke-VBMessageBox @Params
}
