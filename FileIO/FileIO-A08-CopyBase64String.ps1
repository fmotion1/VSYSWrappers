param (
    [Parameter(Mandatory,Position=0)]
    [String]
    $Path
)

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Clipboard]::Clear()

$SB = [System.Text.StringBuilder]::new()
$SB.Append([System.convert]::ToBase64String((Get-Content -LiteralPath $Path -AsByteStream -Raw)))
$SB.ToString() | Set-Clipboard

$MessageBoxArgs = @{
    Message       = "Base64 String for $Path has been copied to the clipboard."
    Title         = "String copy successful."
    Icon          = "Information"
    BoxType       = "OKOnly"
    DefaultButton = 1
}

Invoke-VBMessageBox @MessageBoxArgs
