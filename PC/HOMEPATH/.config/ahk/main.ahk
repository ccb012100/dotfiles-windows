#Warn
#SingleInstance Force
#Requires AutoHotkey >=2.0

SetWorkingDir(A_ScriptDir)

UserHomeDir := "C:\Users\" . A_UserName
AppDataLocalDir := UserHomeDir . "\AppData\Local"

#Include Gruvbox.ahk
#Include Windows.ahk
#Include JumpApp.ahk ; must come *after* Windows.ahk

; Active Window has WinTitle "A"

; Keycodes
;; ^ Ctrl
;; ! Alt
;; + Shift
;; # Win

try {
    ^!+F5::Reload ; 🔃 Meh+F5 :: Reload this script
    ^!+R::Reload  ; 🔃 Meh+R  :: Reload this script
    ^!+Q::ExitApp  ; 🛑 Meh+Q :: (Q)uit this script

    ^!+F2:: { ; ✍🏽 Meh+F2h :: Edit this script
        ; I could also just use the command `Edit`, but I don't want
        ; to have to worry about the file association for *.ahk files
        Run "C:\Program Files\Microsoft VS Code\Code.exe " . A_ScriptDir
    }

    ^!+H:: { ; 🙈 Meh+H :: (H)ide the active window
        if WinExist("A")
            WinMinimize "A"
    }

    ^!+B:: { ; 📶 Meh+B :: Open (B)luetooth settings
        Run 'ms-settings:bluetooth'
    }

    ^!+C:: { ; 🎯 Meh+C :: (C)enter the active window
        if WinExist("A")
            Window_Center("A")
    }

    ^!+D:: { ; 📁 Meh+D :: Open (D)ownloads folder
        Window_FocusOrLaunchInFileExplorer("Downloads", UserHomeDir)
    }

    ^!+J:: { ; 🦘 Meh+J :: (J)ump to Application
        JumpApp_Activate()
    }

    ^!+P:: { ; ⏯️🎧 Meh+P :: Press (P)lay/Pause button
        SendInput("{Media_Play_Pause}")
    }

    ^!+S:: { ; Meh+S 🔍🎧 Focus on (S)potify window
        Window_FocusOrLaunchByProcess("Spotify.exe", A_AppData . "\Spotify\Spotify.exe")
    }

    ^!+T:: { ; 🔍📺 Meh+T :: Focus on Windows (T)erminal window
        Window_FocusOrLaunchByProcess("WindowsTerminal.exe", "wt")
    }

    ^!+V:: { ; ↕ Meh+V :: (V)ertically maximize the active window
        Window_VerticallyMaximize("A")
    }

    ^!+Z::Window_WatchCursor() ; 👀 Meh+Z :: Show info for the window under the cursor

    ^!+=:: { ; 🔊 Meh+<EQUALS> :: Volume Up (+)
        SendInput "{Volume_Up}"
    }

    ^!+-:: { ; 🔊 Meh+<MINUS> :: Volume Down (-)
        SendInput "{Volume_Down}"
    }
}
catch as e {
    MsgBox "An error was thrown:`nLine " . e.Line . ": " . e.Message
}