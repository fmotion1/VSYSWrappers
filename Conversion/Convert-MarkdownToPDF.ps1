param (
    [Parameter(Mandatory)]
    [Alias("f")]
    [String]
    $FileList
)

function Convert-MarkdownToPDF {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)]
        [string[]] $Markdown
    )

    begin {

        foreach ($MD in $Markdown) {
            if($MD -notmatch "\.md$") { throw "A file passed is not markdown."}
        }
        $PreviousNodeVersion = Get-ActiveNodeVersionWithNVM
        & nvm use 20.10.0

    }

    process {

        foreach ($MD in $Markdown) {

            $Output = [System.IO.Directory]::GetParent($MD)

            $pdfName = [System.IO.Path]::GetFileNameWithoutExtension($MD) + ".pdf"
            $pdfOutput = [System.IO.Path]::Combine($Output, $pdfName)

            $DestPDF = $pdfOutput

            # Serialize duplicates
            $IDX = 2
            $PadIndexTo = '1'
            $StaticFilename = $DestPDF.Substring(0, $DestPDF.LastIndexOf('.'))
            $FileExtension  = [System.IO.Path]::GetExtension($DestPDF)
            while (Test-Path -LiteralPath $DestPDF -PathType Leaf) {
                $DestPDF = "{0}_{1:d$PadIndexTo}{2}" -f $StaticFilename, $IDX, $FileExtension
                $IDX++
            }

            $mdpdfCMD = Get-Command mdpdf.cmd

            & $mdpdfCMD $MD --style "$PSScriptRoot\CSS\github.css"
        }
    }

    end {
        & nvm.exe use $PreviousNodeVersion
    }

}

$Files = Get-Content $FileList

try {
    Convert-MarkdownToPDF -Markdown $Files
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
