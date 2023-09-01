;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Functions for working with windows ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Window_Center(WinTitle) { ; **WARNING**: this centers the Window on the Primary Monitor only
    WinGetPos ,, &Width, &Height, WinTitle
    MonitorGetWorkArea( , &Left, &Top, &Right, &Bottom)

    WinMove(
        (Right/2)-(Width/2), (Bottom/2)-(Height/2),
        ; prevent overflowing the work area if the window is moving from a monitor with greater width and/or height
        Min(Right, Width), Min(Bottom, Height),
        WinTitle
    )
}

; Call be called directly if the Window Name is static (e.g. it's just the name of the program)
Window_FocusOrLaunchByName(WindowName, RunTarget) {
    if WinExist(WindowName)
        WinActivate(WindowName)
    else
        Run RunTarget
}

; Process name is the Executable name
Window_FocusOrLaunchByProcess(ProcessName, RunTarget) {
    Window_FocusOrLaunchByName("ahk_exe " . ProcessName, RunTarget)
}

; FolderPath should exclude FolderName
Window_FocusOrLaunchInFileExplorer(FolderName, FolderPath) {
    Window_FocusOrLaunchByName(FolderName,
        Run("explorer.exe " . FolderPath . "\" . FolderName)
    )
}

; TODO: add support for multiple monitors
; **WARNING**: this assumes the active Window is on the Primary Monitor
Window_VerticallyMaximize(WinTitle) {
    MonitorGetWorkArea( , &Left, &Top, &Right, &Bottom)
    WinGetPos(&X, &Y, &Width, &Height, WinTitle)
    WinMove(X, 0, , Bottom, WinTitle)
}

Window_WatchCursor() { ; useful for debugging; copied from <https://www.autohotkey.com/docs/v2/lib/MouseGetPos.htm>
    MouseGetPos , , &id, &control

    ToolTip
    (
        "ahk_id " . id .
        "`nahk_class " . WinGetClass(id) .
        "`n" . WinGetTitle(id) .
        "`nControl: " . control
    )

    SetTimer () => ToolTip(), -5000 ; display Toolip for 5 seconds
}