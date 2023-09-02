@ECHO OFF
@REM Note: must run as Administrator

reg delete HKEY_CLASSES_ROOT\Directory\background\shell\git_gui
reg delete HKEY_CLASSES_ROOT\Directory\background\shell\git_shell

reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Directory\background\shell\git_gui
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Directory\background\shell\git_shell

@PAUSE