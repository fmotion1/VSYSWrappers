param (
    [Parameter(Mandatory,Position = 0)]
    [string]$Path,

    [Parameter(Mandatory=$false)]
    [string]$Algorithm
)

# 'SHA1','SHA256','SHA384','SHA512','MD5'
Copy-AllFileHashesInFolderToClipboard -Folder $Path -Algorithm $Algorithm