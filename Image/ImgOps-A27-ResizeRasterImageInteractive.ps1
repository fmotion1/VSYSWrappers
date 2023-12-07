param (

    [Parameter(Mandatory)]
    [String]
    $FileList,

    [Parameter(Mandatory)]
    [ValidateSet('png', 'jpg', 'jpeg', 'gif', 'tif', 'bmp', 'webp', IgnoreCase = $true)]
    [String]
    $DestFormat,

    [Parameter(Mandatory)]
    [ValidateSet('width', 'height', 'percentage', IgnoreCase = $true)]
    [String]
    $Method
)


function Set-ResizeByPercentage {

    param (
        [Parameter(Mandatory)]
        $Files
    )

    $OokiiSplat = @{
        MainInstruction = "Specify a percentage to resize selected images."
        MainContent     = "The range to resize by percentage is 1-300%"
        WindowTitle     = "Image Resize"
        InputText       = '1'
    }

    while ($true) {
        $Result = Invoke-OokiiInputDialog @OokiiSplat
        if ($Result[1] -eq 'Cancel') {
            exit 2
        }
        [System.String]$ResizePercentage = $Result[0]
        if ($ResizePercentage -match '^(?:[1-9][0-9]?|1[0-9]{2}|2[0-9]{2}|300)%?$') {
            break
        }
    }

    $ResizePercentage = $ResizePercentage.TrimEnd('%')
    Convert-ResizeRasterImage -Files $Files -DestFormat $DestFormat -DestPercentage $ResizePercentage
}

function Set-ResizeByWidthHeight {

    param (
        [Parameter(Mandatory)]
        $Files,

        [Parameter(Mandatory)]
        [ValidateSet('width', 'height', IgnoreCase = $true)]
        [String]
        $Method,

        [Parameter(Mandatory = $false)]
        [Int32]
        $Value
    )

    $Method = $Method.ToLower()
    $MethodUpper = Format-TitleCase -String $Method -ToLowerFirst

    $OokiiSplat = @{
        MainInstruction = "Specify a $Method value in pixels to resize selected images."
        MainContent     = "The range to resize by $Method is 3-4000"
        WindowTitle     = "Image Resize ($MethodUpper)"
        InputText       = '1000'
    }

    while ($true) {
        $Result = Invoke-OokiiInputDialog @OokiiSplat
        if ($Result[1] -eq 'Cancel') {
            exit 2
        }
        [System.String]$ResizePixels = $Result[0]
        if ($ResizePixels -match '^(?:[3-9]|[1-9][0-9]{1,2}|[1-3][0-9]{3}|4000)(px)?$') {
            break
        }
    }

    $ResizePixels = $ResizePixels.TrimEnd('px')

    if ($Method -eq "Width") {
        Convert-ResizeRasterImage -Files $Files -DestFormat $DestFormat -DestWidth $ResizePixels
    } else {
        Convert-ResizeRasterImage -Files $Files -DestFormat $DestFormat -DestHeight $ResizePixels
    }
}

$Files = Get-Content $FileList

switch ($Method) {
    "Percentage" {
        try{
            Set-ResizeByPercentage -Files $Files
        } catch {
            throw
        }
    }
    "Width" {
        try{
            Set-ResizeByWidthHeight -Method "Width" -Files $Files
        } catch {
            throw
        }
    }
    "Height" {
        try{
            Set-ResizeByWidthHeight -Method "Height" -Files $Files
        } catch {
            throw
        }
    }
}



Remove-Item $FileList -Force

$ToastM1	= 'Operation Complete'
$ToastM2	= 'All files have successfully been processed.'
$ToastImage = "$PSScriptRoot\images\Toast\toast-photo-1.png"
$Builder = New-BTContentBuilder
$Builder | Add-BTAppLogo -Source $ToastImage -Crop Circle -PassThru |
Add-BTText -Text $ToastM1 -PassThru |
Add-BTText -Text $ToastM2
$Builder | Show-BTNotification
