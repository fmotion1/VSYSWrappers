param (
    [Parameter(Mandatory,Position=0)]
    [String]
    $Folder,

    [Parameter(Mandatory=$false)]
    [String]
    $Version
)

if($Version){
    Invoke-InteractiveNewNodeProject -Folder $Folder -Version $Version
}else {
    Invoke-InteractiveNewNodeProject -Folder $Folder
}
