@ECHO OFF
REM COPY DOTFILES TO .dotfiles DIRECTORY
REM /D -> only copy if src is newer than dest
REM /F -> display full path and file name of src and dest
REM /H -> copy hidden/system files
REM /I -> assume dest is a directory
REM /L -> dry run

Set DOTFILES="%HOMEPATH%\.dotfiles\HOMEPATH"

REM ~
xcopy %HOMEPATH%\.bashrc %DOTFILES%\ /D /F /H /I
xcopy %HOMEPATH%\.gitconfig %DOTFILES%\ /D /F /H /I
xcopy %HOMEPATH%\.minttyrc %DOTFILES%\ /D /F /H /I
xcopy %HOMEPATH%\_gvimrc %DOTFILES%\ /D /F /H /I
xcopy %HOMEPATH%\_vimrc %DOTFILES%\ /D /F /H /I
xcopy %HOMEPATH%\aliases.cmd %DOTFILES%\ /D /F /H /I
xcopy %HOMEPATH%\.config\nvim\init.vim %DOTFILES%\.config\nvim\ /D /F /H /I

REM VS Code
xcopy %APPDATA%\Code\User\keybindings.json %DOTFILES%\AppData\Roaming\Code\User\ /D /F /H /I
xcopy %APPDATA%\Code\User\settings.json %DOTFILES%\AppData\Roaming\Code\User\ /D /F /H /I

REM NotePad++
xcopy %APPDATA%\NotePad++\shortcuts.xml %DOTFILES%\AppData\Roaming\NotePad++\ /D /F /H /I

REM Visual Studio
xcopy %HOMEPATH%\AppData\Local\Microsoft\VisualStudio\16.0_df333996\Settings\CurrentSettings.vssettings ^
	%DOTFILES%\AppData\Local\Microsoft\VisualStudio\16.0_df333996\Settings\ /D /F /H /I

REM Windows Terminal
xcopy %HOMEPATH%\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json ^
	%DOTFILES%\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\ /D /F /H /I

REM Power Toys
xcopy %HOMEPATH%\AppData\Local\Microsoft\PowerToys\settings.json ^
	%DOTFILES%\AppData\Local\Microsoft\PowerToys\ /D /F /H /I
xcopy %HOMEPATH%\AppData\Local\Microsoft\PowerToys\FancyZones\settings.json ^
	%DOTFILES%\AppData\Local\Microsoft\PowerToys\FancyZones\ /D /F /H /I
xcopy %HOMEPATH%\AppData\Local\Microsoft\PowerToys\File Explorer\settings.json ^
	%DOTFILES%\AppData\Local\Microsoft\PowerToys\File Explorer\ /D /F /H /I
xcopy %HOMEPATH%\AppData\Local\Microsoft\PowerToys\File Explorer\settings.json ^
	%DOTFILES%\AppData\Local\Microsoft\PowerToys\File Explorer\ /D /F /H /I
xcopy %HOMEPATH%\AppData\Local\Microsoft\PowerToys\Keyboard Manager\default.json ^
	%DOTFILES%\AppData\Local\Microsoft\PowerToys\Keyboard Manager\ /D /F /H /I
xcopy %HOMEPATH%\AppData\Local\Microsoft\PowerToys\PowerRename\power-rename-settings.json ^
	%DOTFILES%\AppData\Local\Microsoft\PowerToys\PowerRename\ /D /F /H /I
xcopy %HOMEPATH%\AppData\Local\Microsoft\PowerToys\PowerRename\power-rename-ui-flags ^
	%DOTFILES%\AppData\Local\Microsoft\PowerToys\PowerRename\ /D /F /H /I
xcopy %HOMEPATH%\AppData\Local\Microsoft\PowerToys\PowerToys Run\settings.json ^
	%DOTFILES%\AppData\Local\Microsoft\PowerToys\PowerToys Run\ /D /F /H /I
xcopy %HOMEPATH%\AppData\Local\Microsoft\PowerToys\PowerToys Run\Settings\PowerToysRunSettings.json ^
	%DOTFILES%\AppData\Local\Microsoft\PowerToys\PowerToys Run\Settings\ /D /F /H /I
@pause
