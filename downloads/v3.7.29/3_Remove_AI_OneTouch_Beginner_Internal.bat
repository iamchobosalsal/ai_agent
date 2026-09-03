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

echo Removing AI One-touch Beginner for the current user...
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage -Name 'AI.OneTouch.Beginner.Internal' | Remove-AppxPackage"

echo Removing the desktop shortcut...
if exist "%SHORTCUT_TOOL%" powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%SHORTCUT_TOOL%" -PackageName "AI.OneTouch.Beginner.Internal" -ApplicationId "AIOneTouchBeginner" -ShortcutName "AI One-touch Beginner" -Remove

set "KEEP_CERT=yes"
for /f %%I in ('powershell.exe -NoProfile -Command "$left=Get-AppxPackage ^| Where-Object { $_.Name -like 'AI.OneTouch.*' }; if($left){'yes'}else{'no'}"') do set "KEEP_CERT=%%I"
if /I "%KEEP_CERT%"=="yes" (
  echo The shared AI One-touch certificate is preserved because another AI One-touch package remains installed.
) else (
  echo Removing the internal certificate because no AI One-touch package remains...
  certutil.exe -delstore TrustedPublisher 8CC6F5032FF17B38DA3D4676916ECE159DFCF24C >nul 2>&1
  certutil.exe -delstore TrustedPeople 8CC6F5032FF17B38DA3D4676916ECE159DFCF24C >nul 2>&1
)

echo Removal completed.
pause
