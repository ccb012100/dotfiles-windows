@ECHO OFF
reg export "HKEY_CURRENT_USER\Software\Nurgo-Software\AquaSnap" "%HOMEPATH%\work\work-notes\sync\AquaSnap\AquaSnap.reg"
@PAUSE