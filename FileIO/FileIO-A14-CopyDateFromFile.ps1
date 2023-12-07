param (
    [Parameter(Mandatory,Position=0)]
    [String[]]
    $FileList,

    [Parameter(Mandatory)]
    [ValidateSet('created','modified', IgnoreCase = $true)]
    [String]
    $DateType,

    [Parameter(Mandatory=$false)]
    [String]
    $DateFormat = "MM-dd-yyyy"
)

$Path = Get-Content $FileList

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Clipboard]::Clear()

$DateList = [System.Collections.ArrayList]@()

$Path | ForEach-Object {

    if($DateType -eq 'created'){
        $TheDate = Get-Item $_ | Select-Object CreationTime
        $FormattedDate = Get-Date $TheDate.CreationTime -Format $DateFormat
        $FormattedDate.Trim()
        $DateList.Add($FormattedDate)
    }else{
        $TheDate = Get-Item $_ | Select-Object LastWriteTime
        $FormattedDate = Get-Date $TheDate.LastWriteTime -Format $DateFormat
        $FormattedDate.Trim()
        $DateList.Add($FormattedDate)
    }
}

$DateList | Set-Clipboard

Remove-Item $FileList -Force