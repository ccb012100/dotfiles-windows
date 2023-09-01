﻿#Warn
#SingleInstance Force
#Requires AutoHotkey >=2.0

SetWorkingDir(A_ScriptDir)

USER_HOME_DIR := "C:\Users\" . A_UserName
APP_DATA_LOCAL_DIR := USER_HOME_DIR . "\AppData\Local"

#Include Themes/Dracula.ahk
#Include Themes/Gruvbox.ahk
#Include Windows.ahk
#Include JumpApp/JumpApp.ahk ; must come *after* Windows.ahk

; Active Window has WinTitle "A"

; Key codes
;; ^ Ctrl
;; ! Alt
;; + Shift
;; # Win

try {
    ^!+F5::Reload   ; 🔃 Meh+F5 :: Reload this script
    ^!+R::Reload    ; 🔃 Meh+R  :: Reload this script
    ^!+Q::ExitApp   ; 🛑 Meh+Q :: (Q)uit this script

    ;   ✍🏽 Meh+F2h :: Edit this script
    ;;      I could also just use the command `Edit`, but I don't want to
    ;;      have to worry about the file association for *.ahk files
    ^!+F2::Run Format("C:\Program Files\Microsoft VS Code\Code.exe {}", A_ScriptDir)

    ; 🙈 Meh+H :: (H)ide the active window
    ^!+H::{
        if WinExist("A")
            WinMinimize("A")
    }
    ; 📶 Meh+B :: Open (B)luetooth settings
    ^!+B::Window_FocusOrLaunchByName(
        'Settings ahk_exe ApplicationFrameHost.exe', ; filter on Title and Process
        'ms-settings:bluetooth'
    )

    ; 🎯 Meh+C :: (C)enter the active window
    ^!+C::{
        if WinExist("A")
            Window_Center("A")
    }

    ; 📁 Meh+D :: Open (D)ownloads folder
    ^!+D::Window_FocusOrLaunchInFileExplorerByClsid(
        "Downloads",
        "088e3905-0323-4b02-9826-5d99428e115f"
    )

    ; 🦘 Meh+J :: (J)ump to Application
    ^!+J::JumpApp_Activate()

    ; ⏯️🎧 Meh+P :: Press (P)lay/Pause button
    ^!+P::SendInput("{Media_Play_Pause}")

     ; Meh+S 🔍🎧 Focus on (S)potify window
    ^!+S::Window_FocusOrLaunchByProcess("Spotify.exe", Format("{}\Spotify\Spotify.exe", A_AppData))

    ; 🔍📺 Meh+T :: Focus on Windows (T)erminal window
    ^!+T::Window_FocusOrLaunchByProcess("WindowsTerminal.exe", "wt")

    ; ↕ Meh+V :: (V)ertically maximize the active window
    ^!+V::Window_VerticallyMaximize("A")

    ; 👀 Meh+W :: Show info for the window under the cursor
    ^!+W::Window_WatchCursor()

    ; 🔊 Meh+<EQUALS> :: Volume Up (+)
    ^!+=::SendInput "{Volume_Up}"

    ; 🔊 Meh+<MINUS> :: Volume Down (-)
    ^!+-::SendInput "{Volume_Down}"
}
catch as e {
    MsgBox "An error was thrown:`nLine " . e.Line . ": " . e.Message
}