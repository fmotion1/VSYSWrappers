param (
    [Parameter(Mandatory)]
    [Alias("f")]
    [String]
    $FileList
)

function Convert-MarkdownToHTML {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)]
        [string[]] $Document
    )

    begin {

        foreach ($Doc in $Document) {
            if($Doc -notmatch "\.md$") { throw "A file passed is not markdown."}
        }
        
        & "D:\Dev\Python\00 VENV\MD-Conversion\Scripts\Activate.ps1"

    }

    process {

        foreach ($Doc in $Document) {
            
            $Output = [System.IO.Directory]::GetParent($Doc)

            $htmlName = [System.IO.Path]::GetFileNameWithoutExtension($Doc) + ".html"
            $htmlOutput = [System.IO.Path]::Combine($Output, $htmlName)

            $DestHTML = $htmlOutput

            # Serialize duplicates
            $IDX = 2
            $PadIndexTo = '1'
            $StaticFilename = $DestHTML.Substring(0, $DestHTML.LastIndexOf('.'))
            $FileExtension  = [System.IO.Path]::GetExtension($DestHTML)
            while (Test-Path -LiteralPath $DestHTML -PathType Leaf) {
                $DestHTML = "{0}_{1:d$PadIndexTo}{2}" -f $StaticFilename, $IDX, $FileExtension
                $IDX++
            }

            & grip $Doc --export $DestHTML
        }
    }

    end {
        & deactivate
    }

}

$Files = Get-Content $FileList

try {
    Convert-MarkdownToHTML -Document $Files
} catch {
    Remove-Item $FileList -Force
    $PSCmdlet.ThrowTerminatingError($PSItem)
}

Remove-Item $FileList -Force

$ToastM1	= 'Operation Complete'
$ToastM2	= 'All files have successfully been processed.'
$Builder = New-BTContentBuilder
$Builder | Add-BTText -Text $ToastM1 -PassThru |
           Add-BTText -Text $ToastM2
$Builder | Show-BTNotification
