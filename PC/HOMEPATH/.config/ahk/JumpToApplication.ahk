;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;     Jump to an application from a Gui ListBox       ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; colors from <https://github.com/morhetz/gruvbox>
; TODO: change depending on system Light/Dark mode setting
bg4 := "a89984"
bg := "fbf1c7"

; main object
;
;   structure:
;   {
;       Activate() : fn => void
;       Internals :
;       {
;           Visible : boolean
;           Choices : Map
;           Hide() : fn => void
;           JumpToSelection() : fn => void
;           Gui : Gui
;           LB : ListBox
;       }
;   }
JumpApp := {}
JumpApp.Internals := {} ; TODO: find a better method of encapsulation :/

; properties
JumpApp.Visible := false

JumpApp.Choices := Map(
    ; Key = display value for list
    ; Value = process name
    "c: Chrome", "chrome.exe",
    "d: Downloads Folder", "explorer.exe Downloads",
    "e: File Explorer", "explorer.exe",
    "f: Firefox", "firefox.exe",
    "h: Home Folder", "explorer.exe %HOME%",
    "m: Microsoft Edge", "msedge.exe",
    "n: Notepad++", "notepad++.exe",
    "o: Outlook", "outlook.exe",
    "p: Notepad", "notepad.exe",
    "s: Visual Studio", "devenv.exe",
    "t: Teams", "teams.exe",
    "v: VS Code", "code.exe" )

; methods
JumpApp.Hide := _jumpapphide
JumpApp.Activate := _jumpappactivate
JumpApp.JumpToSelection := _jumpappjumptoselection
JumpApp.Selected := ""

; Gui object
JumpApp.Gui := Gui()
JumpApp.Gui.SetFont("s12", "JetBrains Mono")
JumpApp.Gui.BackColor := bg4
JumpApp.Gui.Opt("+AlwaysOnTop -SysMenu +Owner")    ; +Owner avoids a taskbar button.
JumpApp.Gui.OnEvent("Escape", (*) => JumpApp.Hide())  ; Hide when you hit [Esc] key

; Create ListBox
ChoiceArray := []

for k in JumpApp.Choices
    ChoiceArray.Push(k)

JumpApp.LB := JumpApp.Gui.Add(
    "ListBox",
    "sort" . " w400" . " r" . JumpApp.Choices.Count . " Background" . bg,
    ChoiceArray
)

JumpApp.LB.OnEvent("Change", (*) => JumpApp.JumpToSelection()) ; open application
; REVIEW: below causes the error: "Invalid callback funtion."
; this.LB.OnEvent("Change", this.JumpToSelection) ; open application

_jumpapphide(this) {
    this.Visible := false
    this.Gui.Hide()
}

_jumpappactivate(this) {
    this.Visible := true
    this.Gui.Show()
}

; TODO: open process if not already open (reuse method from main.ahk)
; TODO(maybe): figure out how to make it work with upper/lowercase versions of the same letter
; TODO(maybe): if there are multiple of the same process, show selection list to choose
_jumpappjumptoselection(this) {
    Choice := this.LB.Text
    ProcessName := this.Choices[Choice]

    WinTitleByProcess := "ahk_exe " . ProcessName

    if WinExist(WinTitleByProcess)
        WinActivate(WinTitleByProcess)
    ; else
        ; MsgBox("selected: " . Choice "`nprocess: " . ProcessName "`nWin doesn't exist: " . WinTitleByProcess)

    this.Hide()
}