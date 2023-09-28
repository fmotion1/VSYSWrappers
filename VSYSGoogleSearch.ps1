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

if($NoExtension){
    foreach ($F in $Files) {
        $List.Add([IO.Path]::GetFileNameWithoutExtension($F))
    }
}else{
    foreach ($F in $Files) {
        $List.Add([IO.Path]::GetFileName($F))
    }
}

if($ImageSearch){
    Search-GoogleIt -Query $List -SiteOrDomain $SiteOrDomain -ImageSearch -ImageSearchSize $ImageSearchSize
}else{
    Search-GoogleIt -Query $List -SiteOrDomain $SiteOrDomain
}

Remove-Item $FileList -Force