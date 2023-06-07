@ECHO OFF
REM COPY DOTFILES TO .dotfiles DIRECTORY
REM /D -> only copy if src is newer than dest
REM /F -> display full path and file name of src and dest
REM /H -> copy hidden/system files
REM /I -> assume dest is a directory
REM /L -> dry run

Set DOTFILES_HOMEPATH="%HOMEPATH%\.dotfiles\HOMEPATH"
Set DOTFILES_CDIR="%HOMEPATH%\.dotfiles\C"

REM ~/
xcopy %HOMEPATH%\.bashrc %DOTFILES_HOMEPATH%\ /D /F /H /I
xcopy %HOMEPATH%\.gitconfig %DOTFILES_HOMEPATH%\ /D /F /H /I
xcopy %HOMEPATH%\.minttyrc %DOTFILES_HOMEPATH%\ /D /F /H /I
xcopy %HOMEPATH%\_gvimrc %DOTFILES_HOMEPATH%\ /D /F /H /I
xcopy %HOMEPATH%\_vimrc %DOTFILES_HOMEPATH%\ /D /F /H /I
xcopy %HOMEPATH%\aliases.cmd %DOTFILES_HOMEPATH%\ /D /F /H /I

REM ~/.config
xcopy %HOMEPATH%\.config\liquidpromptrc %DOTFILES_HOMEPATH%\.config\ /D /F /H /I
xcopy %HOMEPATH%\.config\starship.toml %DOTFILES_HOMEPATH%\.config\ /D /F /H /I
@REM xcopy %HOMEPATH%\.config\nvim\init.vim %DOTFILES_HOMEPATH%\.config\nvim\ /D /F /H /I

REM ~/.config/git
xcopy %HOMEPATH%\.config\git\aliases.gitconfig %DOTFILES_HOMEPATH%\git\ /D /F /H /I
xcopy %HOMEPATH%\.config\git\attributes %DOTFILES_HOMEPATH%\git\ /D /F /H /I
xcopy %HOMEPATH%\.config\git\git.gitconfig %DOTFILES_HOMEPATH%\git\ /D /F /H /I
xcopy %HOMEPATH%\.config\git\github.gitconfig %DOTFILES_HOMEPATH%\git\ /D /F /H /I
xcopy %HOMEPATH%\.config\git\ignore %DOTFILES_HOMEPATH%\git\ /D /F /H /I
xcopy %HOMEPATH%\.config\git\tools.gitconfig %DOTFILES_HOMEPATH%\git\ /D /F /H /I

REM ~/.config/kmonad
xcopy %HOMEPATH%\.config\kmonad\dell_latitude.kbd %DOTFILES_HOMEPATH%\.config\kmonad\ /D /F /H /I

REM ~/.gnupg
xcopy %HOMEPATH%\.gnupg\gpg.conf %DOTFILES_HOMEPATH%\.gnupg\ /D /F /H /I
xcopy %HOMEPATH%\.gnupg\gpg-agent.conf %DOTFILES_HOMEPATH%\.gnupg\ /D /F /H /I

REM NotePad++
xcopy %APPDATA%\NotePad++\shortcuts.xml %DOTFILES_HOMEPATH%\AppData\Roaming\NotePad++\ /D /F /H /I

REM kdiff3
xcopy %HOMEPATH%\AppData\Local\kdiff3rc %DOTFILES_HOMEPATH%\AppData\Local\ /D /F /H /I

REM Windows Terminal
REM xcopy %HOMEPATH%\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json ^
REM	%DOTFILES_HOMEPATH%\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\ /D /F /H /I

REM Power Toys
xcopy %HOMEPATH%\AppData\Local\Microsoft\PowerToys\settings.json ^
	%DOTFILES_HOMEPATH%\AppData\Local\Microsoft\PowerToys\ /D /F /H /I
xcopy %HOMEPATH%\AppData\Local\Microsoft\PowerToys\FancyZones\settings.json ^
	%DOTFILES_HOMEPATH%\AppData\Local\Microsoft\PowerToys\FancyZones\ /D /F /H /I
xcopy "%HOMEPATH%\AppData\Local\Microsoft\PowerToys\File Explorer\settings.json" ^
	"%DOTFILES_HOMEPATH%\AppData\Local\Microsoft\PowerToys\File Explorer\" /D /F /H /I
xcopy "%HOMEPATH%\AppData\Local\Microsoft\PowerToys\File Explorer\settings.json" ^
	"%DOTFILES_HOMEPATH%\AppData\Local\Microsoft\PowerToys\File Explorer\" /D /F /H /I
xcopy "%HOMEPATH%\AppData\Local\Microsoft\PowerToys\Keyboard Manager\default.json" ^
	"%DOTFILES_HOMEPATH%\AppData\Local\Microsoft\PowerToys\Keyboard Manager\" /D /F /H /I
xcopy "%HOMEPATH%\AppData\Local\Microsoft\PowerToys\Keyboard Manager\settings.json" ^
	"%DOTFILES_HOMEPATH%\AppData\Local\Microsoft\PowerToys\Keyboard Manager\" /D /F /H /I
	xcopy %HOMEPATH%\AppData\Local\Microsoft\PowerToys\PowerRename\power-rename-settings.json ^
	%DOTFILES_HOMEPATH%\AppData\Local\Microsoft\PowerToys\PowerRename\ /D /F /H /I
xcopy %HOMEPATH%\AppData\Local\Microsoft\PowerToys\PowerRename\power-rename-ui-flags ^
	%DOTFILES_HOMEPATH%\AppData\Local\Microsoft\PowerToys\PowerRename\ /D /F /H /I
xcopy "%HOMEPATH%\AppData\Local\Microsoft\PowerToys\PowerToys Run\settings.json" ^
	"%DOTFILES_HOMEPATH%\AppData\Local\Microsoft\PowerToys\PowerToys Run\" /D /F /H /I
xcopy "%HOMEPATH%\AppData\Local\Microsoft\PowerToys\PowerToys Run\Settings\PowerToysRunSettings.json" ^
	"%DOTFILES_HOMEPATH%\AppData\Local\Microsoft\PowerToys\PowerToys Run\Settings\" /D /F /H /I

@PAUSE
