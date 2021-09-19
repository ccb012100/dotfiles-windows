@echo off

set DOTFILES=%HOMEPATH%\.dotfiles\

doskey ls=dir

doskey cd-h=cd %USERPROFILE%
doskey cd-tmp=cd %TMP%
doskey cd-temp=cd %TMP%
doskey cd-dotfiles=cd %DOTFILES%\

doskey g=git $*

doskey cb=cargo build $*
doskey cc=cargo check $*
doskey cr=cargo run $*

doskey gb=go build .
doskey gr=go run .
