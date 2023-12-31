param (
    [Parameter(Mandatory, Position = 0)]
    [String]
    $FileList,

    [Parameter(Mandatory=$false)]
    [ValidateSet('1','2','3')]
    [Int32]
    $Method,

    [Parameter(Mandatory=$false)]
    [Int32]
    $MaxThreads = 16
)

begin {
    & "D:\Dev\Python\00 VENV\FontTools\Scripts\Activate.ps1"
}

process{

    if(!$Method){
        $OokiiSplat = @{
            MainInstruction = "Please specify the how to extract the file names"
            MainContent     = "[1] FamilyName-StyleName [2] PostScript Name [3] Full Font Name"
            WindowTitle     = "ftCLI Font Renamer"
            InputText       = '1'
        }
    
        while($true){
            $Result = Invoke-OokiiInputDialog @OokiiSplat
            if($Result[1] -eq 'Cancel'){
                exit 2
            }
            $SourceMethod = $Result[0]
            if ($SourceMethod -eq '1') { break }
            if ($SourceMethod -eq '2') { break }
            if ($SourceMethod -eq '3') { break }
        }
    } else {
        $SourceMethod = '3'
    }
    
    $Files = Get-Content $FileList
    $Files | ForEach-Object -Parallel {

        $File = $_
        $cmd = Get-Command "D:\Dev\Python\00 VENV\FontTools\Scripts\ftcli.exe"
        & $cmd utils font-renamer -s $Using:SourceMethod $File

    } -ThrottleLimit $MaxThreads

    Remove-Item $FileList -Force
}
