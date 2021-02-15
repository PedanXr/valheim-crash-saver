# Valheim crash saver
#
# Newest version found @ https://github.com/schuwima/valheim-crash-saver/
#
# This script creates a backup of your world and character files on every boot

#### TODO ####
#
# - play more Valheim
# - farm more iron
# - optimization
#
##############

#### VARIABLES ####
# Edit these to control this script

# Set to $false to deactivate world backup
$WorldSave = $true

# Set to $false to deactivate character backup
$CharSave = $true

# Set backup destination
$BackupPath = "$env:USERPROFILE\Documents\_VALHEIM-CRASH-SAVER\"

# How many backups should be kept?
$BackupSets = 10

##############

# DO NOT EDIT ANYTHING BELOW THIS LINE

Function New-BackupPath { #New-Backupdir
    if (!(Test-Path -Path $BackupPath)) {
        New-Item -Path $BackupPath -ItemType Directory | Out-Null
    }
}

Add-Type -assembly "system.io.compression.filesystem"
$CharSource = "$env:USERPROFILE\AppData\LocalLow\IronGate\Valheim\characters\"
$WorldSource = "$env:USERPROFILE\AppData\LocalLow\IronGate\Valheim\worlds\"
$date = Get-Date
$dateStr = $date.ToString("yyyy-MM-dd_HH-mm")

Add-Type -A 'System.IO.Compression.FileSystem';
New-BackupPath

# check if task exists

if ($CharSave -eq $true) {
    $targetFile = $BackupPath+'Character'+$dateStr+'.zip'
    [io.compression.zipfile]::CreateFromDirectory($CharSource, $targetFile)
}

if ($WorldSave -eq $true) {
    $targetFile = $BackupPath+'Worlds'+$dateStr+'.zip'
    [io.compression.zipfile]::CreateFromDirectory($WorldSource, $targetFile)
}