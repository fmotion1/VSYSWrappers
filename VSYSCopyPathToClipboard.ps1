param (
    [Parameter(Mandatory)]
    [String[]]
    $FileList,

    [Parameter(Mandatory=$false)]
    [Switch]
    $FilenamesOnly,

    [Parameter(Mandatory=$false)]
    [Switch]
    $NoQuotes,

    [Parameter(Mandatory=$false)]
    [Switch]
    $NoExtension
)

$Path = Get-Content $FileList

if(!$NoExtension){
    if($FilenamesOnly){
        if($NoQuotes){
            Copy-PathToClipboard -Path $Path -FilenamesOnly -NoQuotes
        }else{
            Copy-PathToClipboard -Path $Path -FilenamesOnly
        }
    }else{
        if($NoQuotes){
            Copy-PathToClipboard -Path $Path -NoQuotes
        }else{
            Copy-PathToClipboard -Path $Path
        }
    }
}else{
    if($FilenamesOnly){
        if($NoQuotes){
            Copy-PathToClipboard -Path $Path -FilenamesOnly -NoQuotes -NoExtension
        }else{
            Copy-PathToClipboard -Path $Path -FilenamesOnly -NoExtension
        }
    }else{
        if($NoQuotes){
            Copy-PathToClipboard -Path $Path -NoQuotes -NoExtension
        }else{
            Copy-PathToClipboard -Path $Path -NoExtension
        }
    }
}


Remove-Item $FileList -Force