#SingleInstance force

;Declare Class
Class Window{


    Class Tmp{
        A:=1
        Static B:=1
    }

    Get()
    {
        WingetTitle TitleVar, A ; Get title from Active window.
        This.Title:=TitleVar ; Set TitleVar to This.Title

        WinGet IDVar,ID,A ; Get ID from Active window.
        This.ID:=IDVar ; Set IDVar to This.ID
    }
    Activate() ;Activates window with Title - This.Title
    {
        IfWinExist, % "ahk_id "This.ID
            WinActivate % "ahk_id " This.ID
        else
            MsgBox % "There is no Window with ID: "This.ID
    }
    AnnounceWinProps() ;Create message box with title and ID
    {
        MsgBox % "Title is: " This.Title "`n ID is: " This.ID
    }
}

Class Notepad extends Window{

    __New()
    {
        This.Run()
        This.get()
    }

    Run()
    {
        IfWinNotExist ahk_class Notepad
            Run Notepad
        Else
            WinActivate
    }

}
;Create Instance
SomeWin:= New Window
SomeNot:= New Notepad
return

F1:: ;Hotkey to run Instance Method
;SomeNot.Run()
;SomeNot.get()
;SomeNot.AnnounceWinProps()
Return

F2::
If SomeNot.ID
    SomeNot.Activate()
else
    MsgBox Instance SomeWindow has no ID setted, pleas run SomeWin.get() first!
return

F3::
MsgBox % "SomeWin.Tmp.A = "SomeWin.Tmp.A "`nSomeWin.Tmp.B = "SomeWin.Tmp.B
return