[CmdletBinding()]
param(
    [Parameter(Mandatory)][string]$PackageName,
    [Parameter(Mandatory)][string]$ApplicationId,
    [Parameter(Mandatory)][string]$ShortcutName,
    [string]$DesktopPath = '',
    [string]$IconSource = '',
    [switch]$Remove
)

$ErrorActionPreference = 'Stop'

if ([string]::IsNullOrWhiteSpace($DesktopPath)) {
    $DesktopPath = [Environment]::GetFolderPath([Environment+SpecialFolder]::DesktopDirectory)
}
if ([string]::IsNullOrWhiteSpace($DesktopPath)) {
    throw 'Windows desktop folder could not be resolved.'
}

$invalidNameCharacters = [System.IO.Path]::GetInvalidFileNameChars()
if ($ShortcutName.IndexOfAny($invalidNameCharacters) -ge 0) {
    throw 'The desktop shortcut name contains invalid characters.'
}

if (-not (Test-Path -LiteralPath $DesktopPath -PathType Container)) {
    New-Item -ItemType Directory -Path $DesktopPath -Force | Out-Null
}

$shortcutPath = Join-Path $DesktopPath ($ShortcutName + '.lnk')
$iconCacheDirectory = Join-Path $env:LOCALAPPDATA 'AI_OneTouch_Internal\Shell'
$cachedIconPath = Join-Path $iconCacheDirectory 'AI_OneTouch.ico'
if ($Remove) {
    if (Test-Path -LiteralPath $shortcutPath -PathType Leaf) {
        Remove-Item -LiteralPath $shortcutPath -Force
    }
    if (Test-Path -LiteralPath $cachedIconPath -PathType Leaf) {
        Remove-Item -LiteralPath $cachedIconPath -Force
    }
    Write-Host "Desktop shortcut removed: $shortcutPath"
    return
}

if ([string]::IsNullOrWhiteSpace($IconSource)) {
    $IconSource = Join-Path $PSScriptRoot 'launcher.ico'
}
if (-not (Test-Path -LiteralPath $IconSource -PathType Leaf)) {
    throw "Desktop shortcut icon was not found: $IconSource"
}
New-Item -ItemType Directory -Path $iconCacheDirectory -Force | Out-Null
Copy-Item -LiteralPath $IconSource -Destination $cachedIconPath -Force

$package = Get-AppxPackage -Name $PackageName -ErrorAction SilentlyContinue |
    Sort-Object Version -Descending |
    Select-Object -First 1
if (-not $package) {
    throw "Installed MSIX package was not found: $PackageName"
}

$explorerPath = Join-Path $env:WINDIR 'explorer.exe'
$appShellId = '{0}!{1}' -f $package.PackageFamilyName, $ApplicationId

$shell = New-Object -ComObject WScript.Shell
$shortcut = $shell.CreateShortcut($shortcutPath)
$shortcut.TargetPath = $explorerPath
$shortcut.Arguments = 'shell:AppsFolder\' + $appShellId
$shortcut.WorkingDirectory = $env:LOCALAPPDATA
$shortcut.Description = $ShortcutName
$shortcut.IconLocation = $cachedIconPath + ',0'
$shortcut.Save()

if (-not (Test-Path -LiteralPath $shortcutPath -PathType Leaf)) {
    throw "Desktop shortcut was not created: $shortcutPath"
}
$savedShortcut = $shell.CreateShortcut($shortcutPath)
if ([string]::IsNullOrWhiteSpace([string]$savedShortcut.IconLocation) -or
    ([string]$savedShortcut.IconLocation -notlike ($cachedIconPath + '*')) -or
    -not (Test-Path -LiteralPath $cachedIconPath -PathType Leaf)) {
    throw "Desktop shortcut icon was not saved correctly: $shortcutPath"
}

Write-Host "Desktop shortcut created: $shortcutPath"
Write-Host "Desktop shortcut icon: $cachedIconPath"
