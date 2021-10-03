@ECHO OFF
REM COPY DOTFILES TO .dotfiles DIRECTORY
REM /D -> only copy if src is newer than dest
REM /F -> display full path and file name of src and dest
REM /H -> copy hidden/system files
REM /I -> assume dest is a directory
REM /L -> dry run

Set DOTFILES_HOMEPATH="%HOMEPATH%\.dotfiles\HOMEPATH"
Set DOTFILES_CDIR="%HOMEPATH%\.dotfiles\C"

REM ~
xcopy %DOTFILES_HOMEPATH%\.bashrc %HOMEPATH%\ /D /F /H /I
xcopy %DOTFILES_HOMEPATH%\.gitconfig %HOMEPATH%\ /D /F /H /I
xcopy %DOTFILES_HOMEPATH%\.minttyrc %HOMEPATH%\ /D /F /H /I
xcopy %DOTFILES_HOMEPATH%\_gvimrc %HOMEPATH%\ /D /F /H /I
xcopy %DOTFILES_HOMEPATH%\_vimrc %HOMEPATH%\ /D /F /H /I
xcopy %DOTFILES_HOMEPATH%\aliases.cmd %HOMEPATH%\ /D /F /H /I

REM ~/.config
xcopy %DOTFILES_HOMEPATH%\.config\nvim\init.vim %HOMEPATH%\.config\nvim\ /D /F /H /I
xcopy %DOTFILES_HOMEPATH%\.config\liquidpromptrc %HOMEPATH%\.config\ /D /F /H /I

REM ~/.gnupg
xcopy %DOTFILES_HOMEPATH%\.gnupg\gpg.conf %HOMEPATH%\.gnupg\ /D /F /H /I
xcopy %DOTFILES_HOMEPATH%\.gnupg\gpg-agent.conf %HOMEPATH%\.gnupg\ /D /F /H /I

REM VS Code
xcopy %DOTFILES_HOMEPATH%\AppData\Roaming\Code\User\keybindings.json %HOMEPATH%\AppData\Roaming\Code\User\ /D /F /H /I
xcopy %DOTFILES_HOMEPATH%\AppData\Roaming\Code\User\settings.json %HOMEPATH%\AppData\Roaming\Code\User\ /D /F /H /I

REM NotePad++
xcopy %DOTFILES_HOMEPATH%\AppData\Roaming\NotePad++\shortcuts.xml %HOMEPATH%\AppData\Roaming\NotePad++\ /D /F /H /I

REM Visual Studio
xcopy %DOTFILES_HOMEPATH%\AppData\Local\Microsoft\VisualStudio\16.0_df333996\Settings\CurrentSettings.vssettings ^
	%HOMEPATH%\AppData\Local\Microsoft\VisualStudio\16.0_df333996\Settings\ /D /F /H /I

REM Windows Terminal
REM xcopy %DOTFILES_HOMEPATH%\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json ^
REM       %HOMEPATH%\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\ /D /F /H /I

REM Power Toys
xcopy %DOTFILES_HOMEPATH%\AppData\Local\Microsoft\PowerToys\settings.json ^
	%HOMEPATH%\AppData\Local\Microsoft\PowerToys\ /D /F /H /I
xcopy %DOTFILES_HOMEPATH%\AppData\Local\Microsoft\PowerToys\FancyZones\settings.json ^
	%HOMEPATH%\AppData\Local\Microsoft\PowerToys\FancyZones\ /D /F /H /I
xcopy "%DOTFILES_HOMEPATH%\AppData\Local\Microsoft\PowerToys\File Explorer\settings.json" ^
	"%HOMEPATH%\AppData\Local\Microsoft\PowerToys\File Explorer\" /D /F /H /I
xcopy "%DOTFILES_HOMEPATH%\AppData\Local\Microsoft\PowerToys\File Explorer\settings.json" ^
	"%HOMEPATH%\AppData\Local\%HOMEPATH%\Microsoft\PowerToys\File Explorer\" /D /F /H /I
xcopy "%DOTFILES_HOMEPATH%\AppData\Local\Microsoft\PowerToys\Keyboard Manager\default.json" ^
	"%HOMEPATH%\AppData\%HOMEPATH%\Local\Microsoft\PowerToys\Keyboard Manager\" /D /F /H /I
xcopy "%DOTFILES_HOMEPATH%\AppData\Local\Microsoft\PowerToys\Keyboard Manager\settings.json" ^
	"%HOMEPATH%\AppData\Local\Microsoft\PowerToys\Keyboard Manager\" /D /F /H /I
xcopy %DOTFILES_HOMEPATH%\AppData\Local\Microsoft\PowerToys\PowerRename\power-rename-settings.json ^
	%HOMEPATH%\AppData\Local\Microsoft\PowerToys\PowerRename\ /D /F /H /I
xcopy %DOTFILES_HOMEPATH%\AppData\Local\Microsoft\PowerToys\PowerRename\power-rename-ui-flags ^
	%HOMEPATH%\AppData\Local\Microsoft\PowerToys\PowerRename\ /D /F /H /I
xcopy "%DOTFILES_HOMEPATH%\AppData\Local\Microsoft\PowerToys\PowerToys Run\settings.json" ^
	"%HOMEPATH%\AppData\Local\Microsoft\PowerToys\PowerToys Run\" /D /F /H /I
xcopy "%DOTFILES_HOMEPATH%\AppData\Local\Microsoft\PowerToys\PowerToys Run\Settings\PowerToysRunSettings.json" ^
	"%HOMEPATH%\AppData\Local\Microsoft\PowerToys\PowerToys Run\Settings\" /D /F /H /I

@PAUSE
