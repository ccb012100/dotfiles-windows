@ECHO OFF
reg export "HKEY_CURRENT_USER\Software\Nurgo-Software\AquaSnap" "%HOMEPATH%\src\sync\applications\AquaSnap\AquaSnap.reg"
@PAUSE