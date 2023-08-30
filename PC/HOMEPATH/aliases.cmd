@echo off

set DOTFILES=%HOMEPATH%\.dotfiles\

doskey ls=dir

doskey k=git $*
doskey cb=cargo build $*
doskey cc=cargo check $*
doskey cr=cargo run $*
doskey gb=go build .
doskey gr=go run .
doskey c.=code .
doskey dr=dotnet run $*
doskey db=dotnet build $*
