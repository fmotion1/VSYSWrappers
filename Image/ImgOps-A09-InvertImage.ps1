param (
    [Parameter(Mandatory)]
    [String]
    $FileList,

    [Parameter(Mandatory=$false)]
    [ValidateSet('8-Bit','24-bit','32-bit','48-bit','64-bit','Source', 'Specify', IgnoreCase=$true)]
    [String]
    $BitDepth = 'Source'
)

Add-Type -AssemblyName System.Drawing

$Images = Get-Content $FileList

## Check if ImageMagick is available on the system PATH
try {
    $MAGICKCMD = Get-Command magick -CommandType Application
} catch {
    $ErrorText = "ImageMagick (magick.exe) isn't installed or available in your PATH environment variable."
    $eRecord = [System.Management.Automation.ErrorRecord]::new(
        [System.Management.Automation.CommandNotFoundException]::new($ErrorText),
        'CommandNotFound',
        'CommandNotFound',
        $MAGICKCMD
    )
    $PSCmdlet.ThrowTerminatingError($eRecord)
}


if($BitDepth -eq 'Specify'){
    $OokiiSplat = @{
        MainInstruction = "Please specify the bit depth of the output image"
        MainContent     = "[8] 8-Bit [24] 24-Bit [32] 32-Bit [48] 48-Bit [64] 64-Bit [Source] Same as Input"
        WindowTitle     = "Invert image"
        InputText       = '24'
    }

    while($true){
        $Result = Invoke-OokiiInputDialog @OokiiSplat
        if($Result[1] -eq 'Cancel'){
            exit 2
        }

        $Depth = $Result[0].toLower()

        if ($Depth -eq '8') { break }
        if ($Depth -eq '24') { break }
        if ($Depth -eq '32') { break }
        if ($Depth -eq '48') { break }
        if ($Depth -eq '64') { break }
        if ($Depth -eq 'source') { break }
    }
}

$Images | ForEach-Object {

    $Image = $_
    $ImageComponents = Get-FilePathComponents -Path $Image
    $ImageExtension = $ImageComponents.FileExtension
    $ImageBase = $ImageComponents.FullPathNoExtension

    $is08Bit = ($Depth -eq '8')
    $is24Bit = ($Depth -eq '24')
    $is32Bit = ($Depth -eq '32')
    $is48Bit = ($Depth -eq '48')
    $is64Bit = ($Depth -eq '64')
    $isSameAsSource = ($Depth -eq 'Source')

    if($is08Bit -or $is24Bit -or $is32Bit -or $is48Bit -or $is64Bit){
        $ImageDest = $ImageBase + "_Inverted_$Depth-Bit" + $ImageExtension
    }
    elseif($isSameAsSource){
        $ImageDest = $ImageBase + "_Inverted" + $ImageExtension
    }

    $DestFile = $ImageDest
    $IDX = 2
    $PadIndexTo = '1'
    $StaticFilename = Get-FilePathComponent $DestFile -Component FullPathNoExtension
    $FileExtension  = Get-FilePathComponent $DestFile -Component FileExtension
    while (Test-Path -LiteralPath $DestFile -PathType Leaf) {
        $DestFile = "{0}_{1:d$PadIndexTo}{2}" -f $StaticFilename, $IDX, $FileExtension
        $IDX++
    }

    $Params = $Image, '-channel', 'RGB', '-negate'
    switch ($Depth) {
        "8"      { $Params += "png8:$DestFile"; break }
        "24"     { $Params += "png24:$DestFile"; break }
        "32"	 { $Params += "png32:$DestFile"; break }
        "48"	 { $Params += "png48:$DestFile"; break }
        "64"	 { $Params += "png64:$DestFile"; break }
        "Source" { $Params += "png00:$DestFile"; break }
    }
    & $MAGICKCMD $Params
}

Remove-Item $FileList -Force

$ToastM1	= 'Image Inversion Complete'
$ToastM2	= 'All images have been inverted.'
$ToastImage = "$PSScriptRoot\images\Toast\toast-photo-1.png"
$Builder = New-BTContentBuilder
$Builder | Add-BTAppLogo -Source $ToastImage -Crop Circle -PassThru |
           Add-BTText -Text $ToastM1 -PassThru |
           Add-BTText -Text $ToastM2
$Builder | Show-BTNotification