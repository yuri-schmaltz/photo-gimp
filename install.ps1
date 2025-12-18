<#
PhotoGIMP installer for Windows (PowerShell)
Usage: powershell -ExecutionPolicy Bypass -File install.ps1
- Detects %APPDATA%\GIMP\3.0
- Creates timestamped backup if present
- Copies .config\GIMP\3.0 and .local assets from the repo
#>

$ErrorActionPreference = 'Stop'

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$SrcConfig = Join-Path $ScriptDir '.config\GIMP\3.0'
$SrcLocal  = Join-Path $ScriptDir '.local'

if (-not (Test-Path $SrcConfig)) {
    Write-Error "Source config not found at $SrcConfig"
}

$AppData = [Environment]::GetFolderPath('ApplicationData')
$TargetConfigBase = Join-Path $AppData 'GIMP'
$TargetConfigDir  = Join-Path $TargetConfigBase '3.0'

if (-not (Test-Path $TargetConfigBase)) {
    New-Item -ItemType Directory -Path $TargetConfigBase | Out-Null
}

# Backup if exists
$BackupDir = $null
if (Test-Path $TargetConfigDir) {
    $timestamp = Get-Date -Format 'yyyyMMdd-HHmmss'
    $BackupDir = "$TargetConfigDir.backup-$timestamp"
    Write-Host "[INFO] Existing config detected. Creating backup at: $BackupDir"
    Copy-Item -Recurse -Force $TargetConfigDir $BackupDir
}

Write-Host "[INFO] Copying config to $TargetConfigDir"
New-Item -ItemType Directory -Path $TargetConfigDir -Force | Out-Null
# Use robocopy for reliable recursive copy
$null = robocopy $SrcConfig $TargetConfigDir /MIR

if (Test-Path $SrcLocal) {
    $TargetLocal = Join-Path $AppData '..\\Local'
    $TargetLocal = (Resolve-Path $TargetLocal).Path
    Write-Host "[INFO] Copying .local assets to $TargetLocal"
    $null = robocopy $SrcLocal $TargetLocal /E
}

Write-Host "[SUCCESS] PhotoGIMP installed. Restart GIMP to apply changes."
if ($BackupDir) {
    Write-Host "[NOTE] Backup stored at: $BackupDir"
}
