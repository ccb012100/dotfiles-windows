#Requires AutoHotkey v2.0

; WinTitle "A" is the Active Window
; ^ Ctrl
; ! Alt
; + Shift
; # Win

^!+H::  ; Meh+H 🙈
{
    ; 🙈 (H)ide the active window
    if WinExist("A")
        WinMinimize "A"
}

; TODO: Meh+B 📶 to connect to specific Bluetooth device

^!+C::  ; Meh+C 🎯
{
    ; (C)enter the active window
    if WinExist("A")
        CenterWindow("A")
}

^!+P::  ; Meh+P ⏯️
{
    ; Press (P)lay/Pause button
    SendInput("{Media_Play_Pause}")
}

^!+S::  ; Meh+S 🔍
{
    ; Focus on (S)potify window
    FocusTarget("Spotify.exe")
}

^!+T::  ; Meh+T 🔍
{
    ; Focus on Windows (T)erminal window
    FocusTarget("WindowsTerminal.exe")
}

^!+V::  ; Meh+V ↕️
{
    ; (V)ertically maximize the active window
    if WinExist("A")
        VerticallyMaximizeWindow("A")
}

^!+=::  ; Meh+<EQUALS> 🔊
{
    ; Volume Up (+)
    SendInput "{Volume_Up}"
}

^!+-::  ; Meh+<MINUS> 🔉
{
    ; Volume Down (-)
    SendInput "{Volume_Down}"
}

; **WARNING**: this centers the Window on the Primary Monitor only
CenterWindow(WinTitle)
{
    WinGetPos ,, &Width, &Height, WinTitle
    MonitorGetWorkArea( , &Left, &Top, &Right, &Bottom)

    WinMove(
        (Right/2)-(Width/2), (Bottom/2)-(Height/2),
        ; prevent overflowing the work area if the window is moving from a monitor with greater width and/or height
        Min(Right, Width), Min(Bottom, Height),
        WinTitle
    )
}

; **WARNING**: this assumes the active Window is on the Primary Monitor
VerticallyMaximizeWindow(WinTitle)
{
    MonitorGetWorkArea( , &Left, &Top, &Right, &Bottom)
    WinGetPos(&X, &Y, &Width, &Height, WinTitle)
    WinMove(X, 0, , Bottom, WinTitle)
}

FocusTarget(ProcessName)
{
    Target := "ahk_exe " . ProcessName

    if WinExist(Target)
        WinActivate(Target)
    else
        TrayTip("Unable to find <" . ProcessName ">.")
}

WatchCursor() ; useful for debugging; copied from <https://www.autohotkey.com/docs/v2/lib/MouseGetPos.htm>
{
    MouseGetPos , , &id, &control
    ToolTip
    (
        "ahk_id " . id . "
        ahk_class " . WinGetClass(id) . "
        " . WinGetTitle(id) . "
        Control: " . control
    )
}