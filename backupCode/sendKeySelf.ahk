#SingleInstance, force

#q::
WinSetTitle,바람의나라,,target
return

#w::
WinSetTitle,바람의나라,,self
return

gosub, sendDirectionKey

sendDirectionKey:
Loop {
    Sleep, 10
    if (GetKeystate("Left") = 1)
    {
        ControlSend, , {Left}, self
        break
    }

    if (GetKeystate("Right") = 1)
    {
        ControlSend, , {Right}, self
        break
    }

    if (GetKeystate("Up") = 1)
    {
        ControlSend, , {Up}, self
        break
    }

    if (GetKeystate("Down") = 1)
    {
        ControlSend, , {Down}, self
        break
    }
    ControlSend,,{Esc}{3}{Home}{Enter},self
    ControlSend,,{2},self

}
gosub, sendDirectionKey
Return