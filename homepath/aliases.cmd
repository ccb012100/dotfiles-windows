@echo off

doskey ls=dir

doskey cdh=cd %USERPROFILE%
doskey tmp=cd %TMP%
doskey dotfiles=cd ~/.dotfiles
doskey dotfiles-copy=~/.dotfiles/copydotfiles.bat

doskey g=git $*

doskey cb=cargo build $*
doskey cc=cargo check $*
doskey cr=cargo run $*

doskey gb=go build .
doskey gr=go run .
