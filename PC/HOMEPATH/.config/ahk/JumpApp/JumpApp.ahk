;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;             Jump to an application                  ;;;
;;;                                                     ;;;
;;;         Displays a list of applications.            ;;;
;;;                                                     ;;;
;;;        Clicking the associated key for an           ;;;
;;;         application brings it into focus            ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#Include JumpAppChoiceMap.ahk

; Theming
JumpApp_theme := {}
JumpApp_theme.GuiBackgroundColor        :=  Dracula.Background
JumpApp_theme.GuiFontColor              :=  Dracula.Pink
JumpApp_theme.ListBoxBackgroundColor    :=  Dracula.Comment

try {
    JumpApp_gui := Gui()
    JumpApp_gui.BackColor := JumpApp_theme.GuiBackgroundColor

    ; -Caption :: remove title bar and a thick window border/edge
    ; -SysMenu :: omit the system menu and icon in the window's upper left corner
    ;;         :: omit the minimize, maximize, and close buttons in the title bar.
    ; +AlwaysOnTop :: what it sounds like
    ; +Owner :: Make the GUI owned by the script's main window to prevent display of a taskbar button.
    JumpApp_gui.Opt("-Caption -SysMenu +AlwaysOnTop +Owner")
    JumpApp_gui.SetFont("s14 c" . JumpApp_theme.GuiFontColor, "JetBrains Mono")

    JumpApp_listBoxItems := [] ; used to
    JumpApp_choiceMap := JumpApp_BuildChoiceMap()

    for mapKey in JumpApp_choiceMap
        JumpApp_listBoxItems.Push(mapKey)

    ; TODO: remove color on ListBox border
    JumpApp_listBox := JumpApp_gui.Add(
        "ListBox",
        "sort" . " w400" . " r" . JumpApp_choiceMap.Count . " Background" . JumpApp_theme.ListBoxBackgroundColor,
        JumpApp_listBoxItems
    )

    ; Register event hooks

    ;; "Escape" event is fired on [Esc] key press
    JumpApp_gui.OnEvent("Escape", (*) => JumpApp_gui.Hide())

    ;; "Change" Event is fired when the ListBox selection changes; the selected item is in ListBox.Text
    ;; Use the selected item to get the associated callback from the choice map and pass it to JumpApp_JumpToSelection
    JumpApp_listBox.OnEvent("Change",(*) => JumpApp_JumpToSelection(JumpApp_choiceMap[JumpApp_listBox.Text]))
}
catch as e {
    MsgBox "An error was thrown:`nLine " . e.Line . ": " . e.Message
}

JumpApp_Activate() {
    JumpApp_gui.Show()
}

; TODO(maybe): figure out how to make it differentiate between upper/lowercase versions of the same letter
; TODO(maybe): if there are multiple of the same process, show selection list to choose
JumpApp_JumpToSelection(Callback) {
    Callback()

    JumpApp_gui.Hide()
}