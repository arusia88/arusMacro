#SingleInstance, force
CoordMode,Pixel,Screen

t::
ControlSend, , {Esc}, ahk_class Nexon.NWind
SetTimer, attackAll, On
; ControlSend, , {Esc}, target
; SetTimer, healSelf, On
return
y::
SetTimer, attackAll, Off
ControlSend, ,{Esc}, ahk_class Nexon.NWind
; ControlSend, , {Esc}, target
; SetTimer, healSelf, Off
return
; r::
; SetTimer, sendDirectionKey, 0
; return


; y::
; gosub, moveAuto
; Return

F1::
WinSetTitle,바람의나라,,target
return
F2::
WinSetTitle,바람의나라,,self
return
F3::
WinSetTitle,self2,,self
return

; w::
; ControlSend, , {Up}, self
; Return
; a::
; ControlSend, , {Left}, self
; Return
; s::
; ControlSend, , {Down} , self
; Return
; d::
; ControlSend, , {Right} , self
; Return

moveAuto:
Loop {
    Loop, 16
    {
        ControlSend, , {Down}, target
        ControlSend, , {Down}, self
        Sleep, 100
    }
    SetTimer, attackAll, 500
    Sleep, 5000
    SetTimer, attackAll, Off
    Loop, 16
    {
        ControlSend, , {Up}, target
        ControlSend, , {Up}, self
        Sleep, 100
    }
    SetTimer, attackAll, 500
    Sleep, 5000
    SetTimer, attackAll, Off
}
Return

sendDirectionKey:

    Sleep, 10
    if (GetKeystate("Left") = 1)
    {
        ControlSend, , {Left}, self
        ControlSend, , {Left}, self2
    }

    if (GetKeystate("Right") = 1)
    {
        ControlSend, , {Right}, self
        ControlSend, , {Right}, self2
    }

    if (GetKeystate("Up") = 1)
    {
        ControlSend, , {Up}, self
        ControlSend, , {Up}, self2
    }

    if (GetKeystate("Down") = 1)
    {
        ControlSend, , {Down}, self
        ControlSend, , {Down}, self2
    }
    Sleep, 100
Return

attackMagic = 0
debufMagic = 5
ing = 0
attackAll:
; ControlSend, , {2}, target
if(ing = 0){
    ing:=1
    ControlSend, , {1}, ahk_class Nexon.NWind
    Sleep, 200
    ControlSend, , {Up}, ahk_class Nexon.NWind
    Sleep, 200
    ControlSend, , {Enter}, ahk_class Nexon.NWind
    Sleep, 200
}
ing = 0
Return

healSelf:
if(setSelf = 0){
    ControlSend, , {tab}{home}, self
    Sleep, 1000
    ControlSend, , {tab}, self
    setSelf = 1
    return
}
ControlSend, , 2, self
Sleep, 100
ControlSend, , 3, self
Sleep, 50
ControlSend, , 3, self
Sleep, 50
ControlSend, , 3, self
