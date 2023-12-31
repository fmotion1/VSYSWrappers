param (
    [Parameter(Mandatory=$true,Position=0)]
    [String]$FileList
)

$Files = Get-Content $FileList

$Files | ForEach-Object -Parallel {
    function Remove-WhiteFilledPaths {
        param(
            [string]$filePath
        )
    
        # Read the SVG content from the file
        [xml]$xml = Get-Content -Path $filePath
    
        # Define the namespaces used in the SVG
        $ns = New-Object System.Xml.XmlNamespaceManager($xml.NameTable)
        $ns.AddNamespace("svg", "http://www.w3.org/2000/svg")
    
        # Find all path elements
        $paths = $xml.SelectNodes("//svg:path", $ns)
    
        foreach ($path in $paths) {
            # Check if the 'fill' attribute is white (#fff or #ffffff)
            if ($path.Attributes["fill"].Value -eq "#fff" -or $path.Attributes["fill"].Value -eq "#ffffff") {
                # Remove the white-filled path
                $path.ParentNode.RemoveChild($path) | Out-Null
            }
        }
    
        # Save the modified SVG back to the file
        $xml.Save($filePath)
    }

    try {
        Remove-WhiteFilledPaths -filePath $_
    }
    catch {
        throw "There was a problem processing the SVG $_"
    }
    

} -ThrottleLimit 12


Remove-Item $FileList -Force