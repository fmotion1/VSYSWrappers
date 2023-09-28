param (
    [Parameter(Mandatory,Position=0,ValueFromPipeline)]
    $Directory
)

$Choices = @()
$Choices += 'Normalize.css'


Invoke-SpectreConsoleSelection -Choices