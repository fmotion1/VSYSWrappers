param (
    [Parameter(Mandatory)]
    [String[]]$FileList,
    [Switch] $FilenamesOnly,
    [Switch] $NoQuotes,
    [Switch] $NoExtension,
    [Switch] $AsArray
    
)

$Path = Get-Content $FileList
Remove-Item $FileList -Force

if ($AsArray -and $NoQuotes) {
    throw "The AsArray and NoQuotes switches cannot be used together."
}

$params = @{
    Path = $Path
    FilenamesOnly = $FilenamesOnly -and $FilenamesOnly
    NoQuotes = $NoQuotes -and $NoQuotes
    NoExtension = $NoExtension -and $NoExtension
    AsArray = $AsArray -and $AsArray
}

Copy-PathToClipboard @params

