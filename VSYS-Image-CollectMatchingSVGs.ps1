param (
    [Parameter(Mandatory)]
    [String]
    $FileList
)

$Folders = Get-Content $FileList

$Folders | ForEach-Object {

    $Folder = $_
    $PNGs = (Get-ChildItem -LiteralPath $Folder -Filter *.png).FullName

    foreach($PNG in $PNGs){
        [System.String]$PNGBase = Get-FilePathComponent -Path $PNG -Component FullPathNoExtension
        $PNGBase = $PNGBase -replace '\-[\d]+$',''
        $TargetSVG = $PNGBase + '.svg'

        $CollectedPath = [System.IO.Path]::Combine($Folder, "Collected")
        if(-not(Test-Path -LiteralPath $CollectedPath -PathType Container)){
            New-Item -Path $CollectedPath -ItemType Directory -Force | Out-Null
        }

        try {
            [System.IO.FileInfo]$FinalSVG = $TargetSVG -as [System.IO.FileInfo]
        } catch {
            Write-Error "Can't cast to System.IO.FileInfo"
            Remove-Item -LiteralPath $CollectedPath -Force
            Remove-Item $FileList -Force
            throw
        }

        Copy-Item -LiteralPath $FinalSVG -Destination $CollectedPath -Force
        Remove-Item -LiteralPath $PNG -Force
    }
}

Remove-Item $FileList -Force

$ToastM1	= 'File Move Complete'
$ToastM2	= 'All matching SVGs have successfully been moved.'
$ToastImage = "$PSScriptRoot\images\Toast\toast-document-convert-1.png"
$Builder = New-BTContentBuilder
$Builder | Add-BTAppLogo -Source $ToastImage -Crop Circle -PassThru |
           Add-BTText -Text $ToastM1 -PassThru |
           Add-BTText -Text $ToastM2
$Builder | Show-BTNotification