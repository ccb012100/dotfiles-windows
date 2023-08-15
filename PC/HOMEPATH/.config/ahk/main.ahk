#Requires AutoHotkey v2.0

; WinTitle "A" is the Active Window
; ^ Ctrl
; ! Alt
; + Shift
; # Win

^!+H::  ; Meh-H
{
    ; (H)ide the active window
    if WinExist("A")
        WinMinimize "A"
}

^!+C::  ; Meh-C
{
    ; (C)enter the active window
    if WinExist("A")
        CenterWindow("A")
}

^!+V::  ; Meh-V
{
    ; (V)ertically maximize the active window
    if WinExist("A")
        VerticallyMaximizeWindow("A")
}

; **WARNING**: this centers the Window on the Primary Monitor only
CenterWindow(WinTitle)
{
    WinGetPos ,, &Width, &Height, WinTitle
    MonitorGetWorkArea( , &Left, &Top, &Right, &Bottom)

    WinMove(
        (Right/2)-(Width/2),
        (Bottom/2)-(Height/2),
        ; prevent overflowing the work area if the window is moving from a monitor with greater width and/or height
        Min(Right, Width),
        Min(Bottom, Height),
        WinTitle
    )
}

; **WARNING**: this assumes the active Window is on the Primary Monitor
VerticallyMaximizeWindow(WinTitle)
{
    MonitorGetWorkArea( , &Left, &Top, &Right, &Bottom)
    WinGetPos &X, &Y, &Width, &Height, WinTitle
    WinMove X, 0, , Bottom, WinTitle
}