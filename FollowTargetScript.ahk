#SingleInstance, force
CoordMode,Pixel,Screen

e::
SetTimer, attackAll, 500
return

r::
ControlSend, , {Esc}, target
SetTimer, attackAll, Off
return

t::
SetTimer, sendDirectionKey, 0
return


y::
gosub, moveAuto
Return

#q::
WinSetTitle,바람의나라,,target
return
#z::
WinSetTitle,바람의나라,,self
return
#w::
WinSetTitle,바람의나라,,self2
return

w::
ControlSend, , {Up}, self
Return
a::
ControlSend, , {Left}, self
Return
s::
ControlSend, , {Down} , self
Return
d::
ControlSend, , {Right} , self
Return

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

attackAll:
ControlSend, , {2}, target
ControlSend, , {5}, target
Sleep, 100

ControlSend, , {Up}, target
; WinGetPos, findTargetX, findTargetY, findTargetWidth, findTargetHeight, target
; ImageSearch, OutputVarX, OutputVarY, findTargetX, findTargetY, findTargetX+400, findTargetY+400, *80 resources/sinsugeobuk.bmp
; if ErrorLevel=0
; {
    ControlSend, , {Enter}, target
    Sleep, 50
    ControlSend, , {0}, target
    Sleep, 50
    ControlSend, , {Enter}, target
    Sleep, 50

; }
Return