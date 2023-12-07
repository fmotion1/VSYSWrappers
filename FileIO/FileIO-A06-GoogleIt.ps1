param (
    [Parameter(Mandatory,Position = 0)]
    [String]
    $FileList,

    [Parameter(Mandatory=$false)]
    [Switch]
    $NoExtension,

    [Parameter(Mandatory=$false)]
    [Switch]
    $ImageSearch,

    [Parameter(Mandatory=$false)]
    [String]
    $ImageSearchSize = '2mp',

    [Parameter(Mandatory=$false)]
    [String]
    $SiteOrDomain = ''
)

$Files = Get-Content $FileList
$List = [System.Collections.Generic.List[String]]@()

foreach ($F in $Files) {
    if ($NoExtension) {
        $List.Add([IO.Path]::GetFileNameWithoutExtension($F))
    } else {
        $List.Add([IO.Path]::GetFileName($F))
    }
}

$searchGoogleItSplat = @{
    Query = $List
    SiteOrDomain = $SiteOrDomain
    ImageSearch = $ImageSearch
    ImageSearchSize = $ImageSearchSize
}

Search-GoogleIt @searchGoogleItSplat

Remove-Item $FileList -Force