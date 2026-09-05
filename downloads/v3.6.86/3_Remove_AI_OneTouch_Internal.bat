@echo off
setlocal EnableExtensions
chcp 65001 >nul

net session >nul 2>&1
if not "%errorlevel%"=="0" (
  echo Requesting administrator permission...
  powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
  exit /b
)

set "BASE=%~dp0"
set "SHORTCUT_TOOL=%BASE%Desktop_Shortcut.ps1"

echo Removing AI One-touch Internal for the current user...
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage -Name 'AI.OneTouch.Internal' | Remove-AppxPackage"

echo Removing the desktop shortcut...
if exist "%SHORTCUT_TOOL%" powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%SHORTCUT_TOOL%" -PackageName "AI.OneTouch.Internal" -ApplicationId "AIOneTouch" -ShortcutName "AI One-touch Internal" -Remove

echo Removing only the certificates created for this internal package...
certutil.exe -delstore TrustedPublisher 8CC6F5032FF17B38DA3D4676916ECE159DFCF24C >nul 2>&1
certutil.exe -delstore TrustedPeople 8CC6F5032FF17B38DA3D4676916ECE159DFCF24C >nul 2>&1

echo Removal completed.
pause
