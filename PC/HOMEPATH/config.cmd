@echo off

@REM starship init cmd
@REM clink set prompt.transient same_dir

set DOTFILES=%HOMEPATH%\.dotfiles\

doskey ls=dir

doskey cdh=cd %USERPROFILE%

doskey k=git $*
doskey cb=cargo build $*
doskey cc=cargo check $*
doskey cr=cargo run $*
doskey gb=go build .
doskey gr=go run .
doskey c.=code .
doskey dn=dotnet
doskey v=nvim
doskey vim=nvim
