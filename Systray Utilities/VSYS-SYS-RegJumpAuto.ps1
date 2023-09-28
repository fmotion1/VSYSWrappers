param (
    [Parameter(Mandatory,Position=0)]
    [Alias("f")]
    [String]
    $File,

    [Parameter(Mandatory=$false)]
    [Switch]
    $FolderBackground
)

$RegJump = Get-Command "C:\BIN\regjump.exe"

if($FolderBackground){
    $arg = "HKCR\Directory\Background\shell"
    & $RegJump $arg
    return
}

$IsFile = $false

if(Test-Path -LiteralPath $File -PathType Leaf){
    $IsFile = $true
    $DestExtension = [System.IO.Path]::GetExtension($File)
    $arg = "HKCR\SystemFileAssociations\$DestExtension\Shell"

    & $RegJump $arg
    return

}else{

    $arg = "HKCR\Directory\shell"
    & $RegJump $arg
    return
}

