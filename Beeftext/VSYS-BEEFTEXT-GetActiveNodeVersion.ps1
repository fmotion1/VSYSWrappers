$VersionList = & nvm.exe list

# Regular expression to match the version next to the asterisk
$regex = '^\s*\*\s*(\d+\.\d+\.\d+)'

# Initialize a variable to hold the matched version
$matchedVersion = $null

# Check each line for a match
$VersionList -split "`n" | ForEach-Object {
    if ($_ -match $regex) {
        # Capture the version number
        $matchedVersion = $matches[1]
    }
}

# Output the extracted version number
$matchedVersion



