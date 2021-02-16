# valheim-crash-saver
Save your precious files from crashes
Edit the variables to control the behaviour

Default backup location is on `C:\User\username\Documents\_VALHEIM-CRASH-SAVER\`

### OPTIONS

1. `$WorldSave = $true|$false`
   * Enable or disable Worlds-Backup. Defaults to $true.
 
2. `$CharSave = $true`
   * Enable or disable Characters-Backup. Defaults to $true.

3. `$BackupPath = "$env:USERPROFILE\Documents\_VALHEIM-CRASH-SAVER\"`
   * Set Backup Path. Defaults to `%USERPROFILE%\Documents\_VALHEIM-CRASH-SAVER\`

4. `$BackupSets = 50`
   * Number of files to be kept. Defaults to 50.

5. `$RunLoop = $true`
   * Whether the script should continue running and save periodically. False means one-shot. Defaults to $true.

6. `$SaveInterval = 600`
   * Intervall of saves in seconds. Defaults to 10 minutes.


### TODO
- Create option to install the script as a service
- Include Linux builds
- optimization
- farm more iron

### HOW TO USE
1. Download script
2. Right-click --> Run with PowerShell
