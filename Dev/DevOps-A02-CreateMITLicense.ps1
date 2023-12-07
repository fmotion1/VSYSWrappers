param (
    [Parameter(Mandatory,ValueFromPipeline)]
    $Folder,

    [Parameter(Mandatory=$false)]
    [Switch]
    $Force
)

Save-LicenseToFolder -Folder $Folder -LicenseType MIT -Force:$Force

