@ECHO OFF
REM set up the local machine's dotfiles from the ~/.dotfiles directory
REM /D -> only copy if src is newer than dest
REM /F -> display full path and file name of src and dest
REM /H -> copy hidden/system files
REM /I -> assume dest is a directory
REM /L -> dry run
REM /P -> prompt for confirmation every file

Set DOTFILES_HOMEPATH="%HOMEPATH%\.dotfiles\HOMEPATH"
Set DOTFILES_CDIR="%HOMEPATH%\.dotfiles\C"

REM ~
xcopy %DOTFILES_HOMEPATH%\.bashrc %HOMEPATH%\ /D /F /H /I /P
xcopy %DOTFILES_HOMEPATH%\.gitconfig %HOMEPATH%\ /D /F /H /I /P
xcopy %DOTFILES_HOMEPATH%\.minttyrc %HOMEPATH%\ /D /F /H /I /P
xcopy %DOTFILES_HOMEPATH%\_gvimrc %HOMEPATH%\ /D /F /H /I /P
xcopy %DOTFILES_HOMEPATH%\_vimrc %HOMEPATH%\ /D /F /H /I /P
xcopy %DOTFILES_HOMEPATH%\aliases.cmd %HOMEPATH%\ /D /F /H /I /P

REM ~/.config
xcopy %DOTFILES_HOMEPATH%\.config\liquidpromptrc %HOMEPATH%\.config\ /D /F /H /I /P
xcopy %DOTFILES_HOMEPATH%\.config\starship.toml %HOMEPATH%\.config\ /D /F /H /I /P

REM ~/.config/kmonad
xcopy %DOTFILES_HOMEPATH%\.config\kmonad\dell_latitude.kbd %HOMEPATH%\.config\kmonad\ /D /F /H /I /P

REM ~/.config/nvim
xcopy %DOTFILES_HOMEPATH%\.config\nvim\init.vim %HOMEPATH%\.config\nvim\ /D /F /H /I /P

REM ~/.config/git
xcopy %DOTFILES_HOMEPATH%\.config\git\aliases.gitconfig %HOMEPATH%\.config\git\ /D /F /H /I /P
xcopy %DOTFILES_HOMEPATH%\.config\git\attributes %HOMEPATH%\.config\git\ /D /F /H /I /P
xcopy %DOTFILES_HOMEPATH%\.config\git\git.gitconfig %HOMEPATH%\.config\git\ /D /F /H /I /P
xcopy %DOTFILES_HOMEPATH%\.config\git\github.gitconfig %HOMEPATH%\.config\git\ /D /F /H /I /P
xcopy %DOTFILES_HOMEPATH%\.config\git\ignore %HOMEPATH%\.config\git\ /D /F /H /I /P
xcopy %DOTFILES_HOMEPATH%\.config\git\tools.gitconfig %HOMEPATH%\.config\git\ /D /F /H /I /P

REM ~/.gnupg
xcopy %DOTFILES_HOMEPATH%\.gnupg\gpg.conf %HOMEPATH%\.gnupg\ /D /F /H /I /P
xcopy %DOTFILES_HOMEPATH%\.gnupg\gpg-agent.conf %HOMEPATH%\.gnupg\ /D /F /H /I /P

REM NotePad++
xcopy %DOTFILES_HOMEPATH%\AppData\Roaming\NotePad++\shortcuts.xml %HOMEPATH%\AppData\Roaming\NotePad++\ /D /F /H /I /P

REM Windows Terminal
REM xcopy %DOTFILES_HOMEPATH%\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json ^
REM       %HOMEPATH%\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\ /D /F /H /I /P

REM Power Toys
xcopy %DOTFILES_HOMEPATH%\AppData\Local\Microsoft\PowerToys\settings.json ^
	%HOMEPATH%\AppData\Local\Microsoft\PowerToys\ /D /F /H /I /P
xcopy %DOTFILES_HOMEPATH%\AppData\Local\Microsoft\PowerToys\FancyZones\settings.json ^
	%HOMEPATH%\AppData\Local\Microsoft\PowerToys\FancyZones\ /D /F /H /I /P
xcopy "%DOTFILES_HOMEPATH%\AppData\Local\Microsoft\PowerToys\File Explorer\settings.json" ^
	"%HOMEPATH%\AppData\Local\Microsoft\PowerToys\File Explorer\" /D /F /H /I /P
xcopy "%DOTFILES_HOMEPATH%\AppData\Local\Microsoft\PowerToys\File Explorer\settings.json" ^
	"%HOMEPATH%\AppData\Local\%HOMEPATH%\Microsoft\PowerToys\File Explorer\" /D /F /H /I /P
xcopy "%DOTFILES_HOMEPATH%\AppData\Local\Microsoft\PowerToys\Keyboard Manager\default.json" ^
	"%HOMEPATH%\AppData\%HOMEPATH%\Local\Microsoft\PowerToys\Keyboard Manager\" /D /F /H /I /P
xcopy "%DOTFILES_HOMEPATH%\AppData\Local\Microsoft\PowerToys\Keyboard Manager\settings.json" ^
	"%HOMEPATH%\AppData\Local\Microsoft\PowerToys\Keyboard Manager\" /D /F /H /I /P
xcopy %DOTFILES_HOMEPATH%\AppData\Local\Microsoft\PowerToys\PowerRename\power-rename-settings.json ^
	%HOMEPATH%\AppData\Local\Microsoft\PowerToys\PowerRename\ /D /F /H /I /P
xcopy %DOTFILES_HOMEPATH%\AppData\Local\Microsoft\PowerToys\PowerRename\power-rename-ui-flags ^
	%HOMEPATH%\AppData\Local\Microsoft\PowerToys\PowerRename\ /D /F /H /I /P
xcopy "%DOTFILES_HOMEPATH%\AppData\Local\Microsoft\PowerToys\PowerToys Run\settings.json" ^
	"%HOMEPATH%\AppData\Local\Microsoft\PowerToys\PowerToys Run\" /D /F /H /I /P
xcopy "%DOTFILES_HOMEPATH%\AppData\Local\Microsoft\PowerToys\PowerToys Run\Settings\PowerToysRunSettings.json" ^
	"%HOMEPATH%\AppData\Local\Microsoft\PowerToys\PowerToys Run\Settings\" /D /F /H /I /P

@PAUSE
