@ECHO OFF
reg export "HKEY_CURRENT_USER\Software\Nurgo-Software\AquaSnap" "%HOMEPATH%\src\cm-notes\sync\AquaSnap\AquaSnap.reg"
@PAUSE