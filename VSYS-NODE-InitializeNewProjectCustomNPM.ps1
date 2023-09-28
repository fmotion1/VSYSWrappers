param (
    [Parameter(Mandatory, Position = 0)]
    [String]
    $Folder,

    [Parameter(Mandatory=$false)]
    [String]
    $Version = '20.3.1'
)

Set-Location -LiteralPath $Folder

$i = Get-ChildItem -Path $Folder
if ($i.Count -ne 0) {
    $MBoxSplat = @{
        Message = "The target directory is not empty. Please try again inside an empty directory."
        Title = "Directory not Empty"
        Icon = "Critical"
        BoxType = "OKOnly"
    }
    Invoke-VBMessageBox @MBoxSplat
    exit
}

$FolderReverseSep = $Folder.Replace("\", "/")

nvm use $Version | Out-Null

$cmd = Get-Command npm
& $cmd init
& $cmd install -D typescript | Out-Null
& $cmd install -D ts-node | Out-Null
& $cmd install winston | Out-Null
& $cmd install --save-dev tsx | Out-Null

$tsconfig = @"
{
    "compilerOptions": {
        "target": "es6",
        "skipLibCheck": true,
        "lib": [
            "ES6",
            "dom"
        ],
        "rootDir": "./src",
        "module": "commonjs",
        "esModuleInterop": true,
        "moduleResolution": "node",
        "strict": true,
        "declaration": false,
        "sourceMap": true,
        "inlineSources": true,
        "types": [
            "node"
        ],
        "stripInternal": true,
        "incremental": true,
        "skipDefaultLibCheck": true,
        "inlineSourceMap": false,
        "noEmit": false
    },
    "include": [
        "./**/*"
    ],
    "exclude": [
        "node_modules"
    ],
    "ts-node": {
        "cwd": ".",
        "projectSearchDir": ".",
        "require": [],
        "project": "./tsconfig.json"
    }
}
"@

$tsconfig | Out-File -FilePath "$Folder\tsconfig.json" -Force | Out-Null
"" | Out-File -FilePath "$Folder\index.ts" -Force | Out-Null


$gitignore = @"
# Dependency directories
node_modules/

# TypeScript cache
*.tsbuildinfo

# Optional npm cache directory
.npm

# Optional eslint cache
.eslintcache
"@


$msg = "Would you like to initialize a git repository? [Y/N]"

do {
    $response = Read-Host -Prompt $msg
    if ($response -ieq 'y') {
        $gitignore | Out-File -FilePath "$Folder\.gitignore" -Force | Out-Null
        & git init
        break
    }
} until ($response -ieq 'n')
