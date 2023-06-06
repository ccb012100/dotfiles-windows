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
xcopy %DOTFILES_HOMEPATH%\.config\liquidpromptrc %HOMEPATH%\.config\ /D /F /H /I
xcopy %DOTFILES_HOMEPATH%\.config\git\attributes %HOMEPATH%\ /D /F /H /I
xcopy %DOTFILES_HOMEPATH%\.config\git\ignore %HOMEPATH%\ /D /F /H /I
xcopy %DOTFILES_HOMEPATH%\.config\nvim\init.vim %HOMEPATH%\.config\nvim\ /D /F /H /I

REM ~/.gnupg
xcopy %DOTFILES_HOMEPATH%\.gnupg\gpg.conf %HOMEPATH%\.gnupg\ /D /F /H /I
xcopy %DOTFILES_HOMEPATH%\.gnupg\gpg-agent.conf %HOMEPATH%\.gnupg\ /D /F /H /I

REM ~/.omnisharp
xcopy %DOTFILES_HOMEPATH%\.omnisharp\omnisharp.json %HOMEPATH%\.omnisharp\ /D /F /H /I

REM NotePad++
xcopy %DOTFILES_HOMEPATH%\AppData\Roaming\NotePad++\shortcuts.xml %HOMEPATH%\AppData\Roaming\NotePad++\ /D /F /H /I

REM kdiff3
xcopy %DOTFILES_HOMEPATH%\AppData\Local\kdiff3rc %HOMEPATH%\AppData\Local\ /D /F /H /I

REM Sublime Text
REM xcopy "%DOTFILES_HOMEPATH%\AppData\Roaming\Sublime Text\Packages\User\Default\" "%APPDATA%\Sublime Text\Packages\User\Default (Windows).sublime-keymap" /D /F /H /I
REM xcopy "%DOTFILES_HOMEPATH%\AppData\Roaming\Sublime Text\Packages\User\Default\" "%APPDATA%\Sublime Text\Packages\User\Preferences.sublime-settings" /D /F /H /I
REM xcopy "%DOTFILES_HOMEPATH%\AppData\Roaming\Sublime Text\Packages\User\Default\" "%APPDATA%\Sublime Text\Packages\User\Package Control.sublime-settings" /D /F /H /I

REM Sublime Merge
REM xcopy "%DOTFILES_HOMEPATH%\AppData\Roaming\Sublime Merge\Packages\User\Default\" "%APPDATA%\Sublime Merge\Packages\User\Preferences.sublime-settings" /D /F /H /I

REM Visual Studio
REM xcopy %DOTFILES_HOMEPATH%\AppData\Local\Microsoft\VisualStudio\16.0_df333996\Settings\CurrentSettings.vssettings ^
REM	%HOMEPATH%\AppData\Local\Microsoft\VisualStudio\16.0_df333996\Settings\ /D /F /H /I

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
