param (
    [Parameter(Mandatory, Position = 0)]
    [String]
    $FileList,

    [Parameter(Mandatory=$false)]
    [Int32]
    $MaxThreads = 16
)

$Files = Get-Content $FileList

$Files | ForEach-Object -Parallel {

    $CurrentFile = $_
    $FileContents = Get-Content $CurrentFile -Raw

    $delimiterStart = '<g id="svgGrid">'
    $delimiterEnd = '</g>'

    if ($FileContents -match '<g id="svgGrid">') {
        $pattern = "(?s)$delimiterStart.*?$delimiterEnd"
        $modifiedContent = $FileContents -replace $pattern, ""
        $modifiedContent | Set-Content -Path $CurrentFile -Force
    }else{
        return
    }

} -ThrottleLimit $MaxThreads