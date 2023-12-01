param (
    [Parameter(Mandatory,Position=0)]
    [string]
    $Folder
)

$ProjectName = Split-Path $Folder -Leaf
$ProjectName = $ProjectName -replace '\s', ''

Save-DotnetConsoleAppTemplate -ProjectName $ProjectName -OutputPath $Folder