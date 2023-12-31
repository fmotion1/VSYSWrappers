param (
    [Parameter(Mandatory,Position=0)]
    [String]
    $FileList
)

$Files = Get-Content $FileList

try {
    Move-FontFamiliesToSubfolders -Font $Files -MaxThreads 12
}
catch {
    Remove-Item $FileList -Force
    throw "Error calling Move-FontFamiliesToSubfolders." 
}

Remove-Item $FileList -Force

$ToastM1	= 'Operation Complete.'
$ToastM2	= 'All fonts have been separated into folders by family.'
$Builder = New-BTContentBuilder
$Builder | Add-BTText -Text $ToastM1 -PassThru |
           Add-BTText -Text $ToastM2
$Builder | Show-BTNotification