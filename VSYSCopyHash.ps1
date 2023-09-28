param (
    [Parameter(Mandatory,Position = 0)]
    [String[]]$FileList,

    [Parameter(Mandatory=$false)]
    [String]$Algorithm
)

if (!(Test-Path -LiteralPath $FileList)) {
    throw [System.Exception] "File list doesn't exist."
}

$Files = Get-Content $FileList

if(!$Files){
    throw [System.Exception] "File list is empty."
}

Copy-HashToClipboard -Files $Files -Algorithm $Algorithm

Remove-Item $FileList -Force