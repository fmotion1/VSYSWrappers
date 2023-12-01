param (
    [Parameter(Mandatory,ValueFromPipeline)]
    $Folder,

    [Parameter(Mandatory=$false)]
    [ValidateSet('vsys','minimal','empty', IgnoreCase = $true)]
    [String]
    $Template = 'vsys',

    [Parameter(Mandatory=$false)]
    [Switch]
    $Force
)

Save-GitignoreToFolder -Folder $Folder -Template $Template -Force:$Force