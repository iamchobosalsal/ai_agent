[CmdletBinding()]
param(
    [Parameter(Mandatory)][string]$PackageName,
    [Parameter(Mandatory)][string]$ApplicationId,
    [Parameter(Mandatory)][string]$ShortcutName,
    [string]$DesktopPath = '',
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
if ($Remove) {
    if (Test-Path -LiteralPath $shortcutPath -PathType Leaf) {
        Remove-Item -LiteralPath $shortcutPath -Force
    }
    Write-Host "Desktop shortcut removed: $shortcutPath"
    return
}

$package = Get-AppxPackage -Name $PackageName -ErrorAction SilentlyContinue |
    Sort-Object Version -Descending |
    Select-Object -First 1
if (-not $package) {
    throw "Installed MSIX package was not found: $PackageName"
}

$explorerPath = Join-Path $env:WINDIR 'explorer.exe'
$appShellId = '{0}!{1}' -f $package.PackageFamilyName, $ApplicationId
$iconPath = Join-Path $package.InstallLocation 'AMD_AI_PC_Launcher.exe'

$shell = New-Object -ComObject WScript.Shell
$shortcut = $shell.CreateShortcut($shortcutPath)
$shortcut.TargetPath = $explorerPath
$shortcut.Arguments = 'shell:AppsFolder\' + $appShellId
$shortcut.WorkingDirectory = $env:LOCALAPPDATA
$shortcut.Description = $ShortcutName
if (Test-Path -LiteralPath $iconPath -PathType Leaf) {
    $shortcut.IconLocation = $iconPath + ',0'
}
$shortcut.Save()

if (-not (Test-Path -LiteralPath $shortcutPath -PathType Leaf)) {
    throw "Desktop shortcut was not created: $shortcutPath"
}

Write-Host "Desktop shortcut created: $shortcutPath"
