function Get-FormattedWindowsVersion {

    [CmdletBinding()]
    [OutputType([PSCustomObject])]

    $WindowsEdition = 'Windows 10 Pro x64'

    # 22H2 (Display Version)
    $r = (Get-Item "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion")
    $displayVersion = "$($r.GetValue("DisplayVersion"))"

    # 10.0.19045.3693 (Full OS Build)
    $FullWindowsBuild = ((& cmd /c ver) -replace 'Microsoft Windows \[Version (.*)\]', '$1')[1]

    # 19045.3693 (Short OS Build)
    $ShortWindowsBuild = $FullWindowsBuild -replace '10\.0\.', ''

    $FormattedBuild = "$displayVersion (OS Build $ShortWindowsBuild)"

    [PSCustomObject]@{
        Edition = $WindowsEdition
        DisplayVersion = $displayVersion
        FullBuild = $FullWindowsBuild
        ShortBuild = $ShortWindowsBuild
        CompleteBuild = $FormattedBuild
        FinalFormat = "$WindowsEdition`n$FormattedBuild"
    }
}

(Get-FormattedWindowsVersion).FinalFormat




