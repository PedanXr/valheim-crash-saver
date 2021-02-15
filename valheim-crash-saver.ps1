# Valheim crash saver
#
# Newest version @ https://github.com/PedanXr/valheim-crash-saver/
#
# This script creates a backup of your world and character files on every boot

#### VARIABLES ####
# Edit these to control this script
# Set to $false to deactivate world backup
$WorldSave = $true
# Set to $false to deactivate character backup
$CharSave = $true
# Set backup destination
$BackupPath = "$env:USERPROFILE\Documents\_VALHEIM-CRASH-SAVER\"
# How many backups should be kept?
$BackupSets = 50
##############

# DO NOT EDIT ANYTHING BELOW THIS LINE

Function New-BackupPath {
    if (!(Test-Path -Path $BackupPath)) {
        New-Item -Path $BackupPath -ItemType Directory | Out-Null
    }
}

Function Set-BackupSets ($path, $sets) {
    if ($CharSave -eq $true) {
        $findfiles = @(Get-ChildItem -Path $path -Filter "*Character*")
        if ($findfiles.Count -gt $sets) {
            $findfiles | Sort-Object LastWriteTime -Descending | Select-Object -Last ($findfiles.Count - $sets) | Remove-Item
        }
    }
    if ($WorldSave -eq $true) {
        $findfiles = @(Get-ChildItem -Path $path -Filter "*Worlds*")
        if ($findfiles.Count -gt $sets) {
            $findfiles | Sort-Object LastWriteTime -Descending | Select-Object -Last ($findfiles.Count - $sets) | Out-Host #Remove-Item
        }
    }
}

Add-Type -assembly "system.io.compression.filesystem"
$CharSource = "$env:USERPROFILE\AppData\LocalLow\IronGate\Valheim\characters\"
$WorldSource = "$env:USERPROFILE\AppData\LocalLow\IronGate\Valheim\worlds\"
$date = Get-Date
$dateStr = $date.ToString("yyyy-MM-dd_HH-mm")

New-BackupPath
Set-BackupSets -path $BackupPath -sets $BackupSets

if ($CharSave -eq $true) {
    $targetFile = $BackupPath+'Character-'+$dateStr+'.zip'
    [io.compression.zipfile]::CreateFromDirectory($CharSource, $targetFile)
}

if ($WorldSave -eq $true) {
    $targetFile = $BackupPath+'Worlds-'+$dateStr+'.zip'
    [io.compression.zipfile]::CreateFromDirectory($WorldSource, $targetFile)
}