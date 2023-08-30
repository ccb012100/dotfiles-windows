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
    "c -> Chrome", "chrome.exe",
    "d -> Downloads Folder", "explorer.exe Downloads",
    "e -> File Explorer", "explorer.exe",
    "f -> Firefox", "firefox.exe",
    "h -> Home Folder", "explorer.exe %HOME%",
    "m -> Microsoft Edge", "msedge.exe",
    "n -> Notepad++", "notepad++.exe",
    "o -> Outlook", "outlook.exe",
    "p -> Notepad", "notepad.exe",
    "s -> Visual Studio", "devenv.exe",
    "t -> Teams", "teams.exe",
    "v -> VS Code", "code.exe"
)

JumpApp_Gui := Gui()

JumpApp_Gui.BackColor := Gruvbox.bg4
JumpApp_Gui.Opt("+AlwaysOnTop -SysMenu +Owner")    ; +Owner avoids a taskbar button.
JumpApp_Gui.SetFont("s12", "JetBrains Mono")

JumpApp_Gui.OnEvent("Escape", (*) => JumpApp_Gui.Hide())  ; Hide when you hit [Esc] key

JumpApp_LBChoiceArray := []

for k in JumpApp_ChoiceMap
    JumpApp_LBChoiceArray.Push(k)

JumpApp_LB := JumpApp_Gui.Add(
    "ListBox",
    "sort" . " w400" . " r" . JumpApp_ChoiceMap.Count . " Background" . Gruvbox.bg,
    JumpApp_LBChoiceArray
)

JumpApp_LB.OnEvent("Change", (*) => JumpApp_JumpToSelection()) ; open application

; TODO: open process if not already open (reuse method from main.ahk)
; TODO(maybe): figure out how to make it work with upper/lowercase versions of the same letter
; TODO(maybe): if there are multiple of the same process, show selection list to choose
JumpApp_JumpToSelection() {
    ProcessName := JumpApp_ChoiceMap[JumpApp_LB.Text]

    WinTitleByProcess := "ahk_exe " . ProcessName

    if WinExist(WinTitleByProcess)
        WinActivate(WinTitleByProcess)

    JumpApp_Gui.Hide()
}

JumpApp_Activate() {
    JumpApp_Gui.Show()
}