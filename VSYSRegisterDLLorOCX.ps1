param (
    [Parameter(Mandatory,Position = 0)]
    [string]$Path,

    [Parameter(Mandatory=$false)]
    [switch]
    $Unregister
)

if(!(Test-IsAdmin)){
    Request-AdminRights -HiddenWindow
}

if($Unregister){
    Register-DLLorOCX -File $Path -Unregister
}else{
    Register-DLLorOCX -File $Path
}