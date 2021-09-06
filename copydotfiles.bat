@ECHO OFF
REM COPY DOTFILES TO .dotfiles DIRECTORY
REM /D -> only copy if src is newer than dest
REM /F -> display full path and file name of src and dest
REM /H -> copy hidden/system files
REM /I -> assume dest is a directory
REM /L -> dry run

Set DOTFILES="%HOMEPATH%\.dotfiles\dotfiles"

xcopy %HOMEPATH%\.bashrc %DOTFILES%\ /D /F /H /I
xcopy %HOMEPATH%\.gitconfig %DOTFILES%\ /D /F /H /I
xcopy %HOMEPATH%\.minttyrc %DOTFILES%\ /D /F /H /I
xcopy %HOMEPATH%\_gvimrc %DOTFILES%\ /D /F /H /I
xcopy %HOMEPATH%\_vimrc %DOTFILES%\ /D /F /H /I
xcopy %HOMEPATH%\aliases.cmd %DOTFILES%\ /D /F /H /I
xcopy %HOMEPATH%\.config\nvim\init.vim %DOTFILES%\.config\nvim\ /D /F /H /I
xcopy %APPDATA%\Code\User\keybindings.json %DOTFILES%\AppData\Roaming\Code\User\ /D /F /H /I
xcopy %APPDATA%\Code\User\settings.json %DOTFILES%\AppData\Roaming\Code\User\ /D /F /H /I
xcopy %APPDATA%\NotePad++\shortcuts.xml %DOTFILES%\AppData\Roaming\NotePad++\ /D /F /H /I
xcopy %HOMEPATH%\AppData\Local\Microsoft\VisualStudio\16.0_df333996\Settings\CurrentSettings.vssettings ^
	%DOTFILES%\AppData\Local\Microsoft\VisualStudio\16.0_df333996\Settings\ /D /F /H /I
xcopy %HOMEPATH%\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json ^
	%DOTFILES%\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\ /D /F /H /I
@pause