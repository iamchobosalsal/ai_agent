@echo off
setlocal EnableExtensions
chcp 65001 >nul

echo [0/5] Checking AMD processor compatibility...
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "$processors=@(); try{$processors=@(Get-CimInstance Win32_Processor -ErrorAction Stop)}catch{}; if($processors.Count -eq 0){try{$processors=@(Get-ItemProperty 'HKLM:\HARDWARE\DESCRIPTION\System\CentralProcessor\*' -ErrorAction Stop | ForEach-Object {[pscustomobject]@{Name=[string]$_.ProcessorNameString;Manufacturer=[string]$_.VendorIdentifier}})}catch{}}; if($processors.Count -eq 0){Write-Host 'CPU information could not be read. Installation stopped.' -ForegroundColor Red; exit 11}; $supported=@($processors | Where-Object { (([string]$_.Name) + ' ' + ([string]$_.Manufacturer)) -match '(?i)AMD|Advanced Micro Devices' }).Count -gt 0; if(-not $supported){$detected=($processors | ForEach-Object { ([string]$_.Name).Trim() + ' [' + ([string]$_.Manufacturer).Trim() + ']' }) -join ', '; Write-Host ('This package supports AMD processors only. Detected: ' + $detected) -ForegroundColor Red; exit 10}"
if errorlevel 1 goto :unsupported_cpu

net session >nul 2>&1
if not "%errorlevel%"=="0" (
  echo Requesting administrator permission...
  powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
  exit /b
)

set "BASE=%~dp0"
set "LEAF_CERT=%BASE%Trust\AI-OneTouch-Internal-CodeSigning.cer"
set "MSIX=%BASE%AI_OneTouch_v3.7_Beginner_Internal.msix"
set "SHORTCUT_TOOL=%BASE%Desktop_Shortcut.ps1"
set "AI_INTERNAL_MSIX=%MSIX%"

if not exist "%LEAF_CERT%" goto :missing
if not exist "%MSIX%" goto :missing
if not exist "%SHORTCUT_TOOL%" goto :missing

echo [1/5] Trusting internal publisher certificate...
certutil.exe -addstore -f TrustedPublisher "%LEAF_CERT%"
if errorlevel 1 goto :failed
certutil.exe -addstore -f TrustedPeople "%LEAF_CERT%" >nul
if errorlevel 1 goto :failed

echo [2/5] Verifying the certificate fingerprint...
certutil.exe -store TrustedPublisher 8CC6F5032FF17B38DA3D4676916ECE159DFCF24C >nul
if errorlevel 1 goto :failed

echo [3/5] Stopping the previous v3.7 launcher background process...
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "$roots = @((Join-Path $env:LOCALAPPDATA 'AMD_AI_PC_Launcher_v3_7')); $pkg = Get-AppxPackage -Name 'AI.OneTouch.Beginner.Internal' -ErrorAction SilentlyContinue | Select-Object -First 1; if ($pkg) { $roots += (Join-Path $env:LOCALAPPDATA ('Packages\' + $pkg.PackageFamilyName + '\LocalState\AMD_AI_PC_Launcher_v3_7')) }; foreach ($root in $roots) { $pidFile = Join-Path $root 'state\webui-pid.txt'; if (Test-Path -LiteralPath $pidFile) { try { $webPid = [int](Get-Content -LiteralPath $pidFile -Raw); if ($webPid -gt 0 -and $webPid -ne $PID) { Stop-Process -Id $webPid -Force -ErrorAction SilentlyContinue } } catch {} }; $endpoint = Join-Path $root 'state\webui-endpoint.txt'; if (Test-Path -LiteralPath $endpoint) { try { $port = ([uri](Get-Content -LiteralPath $endpoint -Raw)).Port; Get-NetTCPConnection -State Listen -LocalPort $port -ErrorAction SilentlyContinue | Select-Object -ExpandProperty OwningProcess -Unique | Where-Object { $_ -gt 4 -and $_ -ne $PID } | ForEach-Object { Stop-Process -Id $_ -Force -ErrorAction SilentlyContinue } } catch {} } }; Get-CimInstance Win32_Process -ErrorAction SilentlyContinue | Where-Object { $_.Name -match '^powershell(?:_ise)?\.exe$' -and $_.CommandLine -match 'AMD_AI_PC_Launcher_v3_7' -and $_.CommandLine -match 'AMD_AI_PC_Launcher_v2_WebUI\.ps1' } | ForEach-Object { Stop-Process -Id $_.ProcessId -Force -ErrorAction SilentlyContinue }"
timeout /t 1 /nobreak >nul

echo [4/5] Installing AI One-touch Beginner...
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "Add-AppxPackage -ForceApplicationShutdown -Path $env:AI_INTERNAL_MSIX"
if errorlevel 1 goto :failed

echo [5/5] Creating the desktop shortcut...
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%SHORTCUT_TOOL%" -PackageName "AI.OneTouch.Beginner.Internal" -ApplicationId "AIOneTouchBeginner" -ShortcutName "AI One-touch Beginner"
if errorlevel 1 (
  echo WARNING: The app was installed, but the desktop shortcut could not be created.
  echo You can still open AI One-touch Beginner from the Start menu.
) else (
  echo Desktop shortcut created: AI One-touch Beginner
)

echo.
echo Installation completed. Open AI One-touch Beginner from the desktop or Start menu.
pause
exit /b 0

:unsupported_cpu
echo.
echo Installation stopped. Intel and unsupported processors are not supported.
pause
exit /b 10

:missing
echo Required package files are missing. Extract the entire ZIP before running this file.
pause
exit /b 2

:failed
echo.
echo Installation did not complete.
echo 1. Restart Windows and try this installer again as administrator.
echo 2. If it still fails, extract a fresh copy of the ZIP to a new folder and retry.
echo 3. For a clean recovery, run Reset_Tool_LMStudio.exe and then run this installer again.
pause
exit /b 1
