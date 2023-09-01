;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;             Jump to an application                  ;;;
;;;                                                     ;;;
;;;         Displays a list of applications.            ;;;
;;;                                                     ;;;
;;;        Clicking the associated key for an           ;;;
;;;         application brings it into focus            ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Key = display value for list
; Value = process name
JumpApp_ChoiceMap := Map(
    "c -> Chrome",
        () => Window_FocusOrLaunchByProcess("chrome.exe", "C:\Program Files\Google\Chrome\Application\chrome.exe"),
    "f -> Firefox",
        () => Window_FocusOrLaunchByProcess("firefox.exe", AppDataLocalDir . "\Mozilla Firefox\firefox.exe"),
    "g -> GitHub Desktop",
        () => Window_FocusOrLaunchByName("GitHub Desktop", UserHomeDir . "\GitHubDesktop\GitHubDesktop.exe"),
    ; TODO: debug Home Folder call
    ; "h -> Home Folder",
    ;     () => Window_FocusOrLaunchInFileExplorer(
    ;         A_UserName,
    ;         UserHomeDir
    ;     ),
    "m -> Microsoft Edge",
        () => Window_FocusOrLaunchByProcess(
            "msedge.exe",
            "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe --profile-directory=Default"
        ),
    "n -> Notepad++",
        () => Window_FocusOrLaunchByProcess(
            "notepad++.exe",
            "C:\Program Files\Notepad++\notepad++.exe"
        ),
    "o -> Outlook",
        () => Window_FocusOrLaunchByProcess(
            "outlook.exe",
            "C:\Program Files\Microsoft Office\root\Office16\OUTLOOK.EXE"
        ),
    "p -> Notepad",
        () => Window_FocusOrLaunchByProcess(
            "notepad.exe",
            A_WinDir . "\system32\notepad.exe"
        ),
    "s -> Visual Studio",
        () => Window_FocusOrLaunchByProcess(
            "devenv.exe",
            "C:\Program Files\Microsoft Visual Studio\2022\Enterprise\Common7\IDE\devenv.exe"
        ),
    "t -> Teams",
        () => Window_FocusOrLaunchByProcess(
            "teams.exe",
            AppDataLocalDir . '\Microsoft\Teams\Update.exe --processStart "Teams.exe"'
        ),
    "v -> VS Code",
        () => Window_FocusOrLaunchByProcess("code.exe", "C:\Program Files\Microsoft VS Code\Code.exe"),
)

try {
    JumpApp_Gui := Gui()
    JumpApp_Gui.BackColor := Gruvbox.blue

    ; -Caption :: remove title bar and a thick window border/edge
    ; -SysMenu :: omit the system menu and icon in the window's upper left corner
    ;;         :: omit the minimize, maximize, and close buttons in the title bar.
    ; +AlwaysOnTop :: what it sounds like
    ; +Owner :: Make the GUI owned by the script's main window to prevent display of a taskbar button.
    JumpApp_Gui.Opt("-Caption -SysMenu +AlwaysOnTop +Owner")
    JumpApp_Gui.SetFont("s14 cWhite", "JetBrains Mono")

    JumpApp_Gui.OnEvent("Escape", (*) => JumpApp_Gui.Hide())  ; Hide Gui when [Esc] key is pressed

    JumpApp_LBChoiceArray := []

    for k in JumpApp_ChoiceMap
        JumpApp_LBChoiceArray.Push(k)

    ; TODO: remove color on listbox border
    JumpApp_LB := JumpApp_Gui.Add(
        "ListBox",
        "sort" . " w400" . " r" . JumpApp_ChoiceMap.Count . " Background" . Gruvbox.blue,
        JumpApp_LBChoiceArray
    )

    JumpApp_LB.OnEvent("Change", (*) => JumpApp_JumpToSelection()) ; open application
}
catch as e {
    MsgBox "An error was thrown:`nLine " . e.Line . ": " . e.Message
}

; TODO: open process if not already open (make use of method from main.ahk)
; TODO(maybe): figure out how to make it work with upper/lowercase versions of the same letter
; TODO(maybe): if there are multiple of the same process, show selection list to choose
JumpApp_JumpToSelection() {
    Command := JumpApp_ChoiceMap[JumpApp_LB.Text]

    Command()

    ; WinTitleByProcess := "ahk_exe " . ProcessName

    ; if WinExist(WinTitleByProcess)
    ;     WinActivate(WinTitleByProcess)

    JumpApp_Gui.Hide()
}

JumpApp_Activate() {
    JumpApp_Gui.Show()
}