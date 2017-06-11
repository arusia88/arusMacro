F1::
SetTimer, start, On
Return
F2::
SetTimer, start, Off
Return


start:
    ControlSend,,u,ahk_class Nexon.NWind
    Sleep, 100
    ControlSend,,u,ahk_class Nexon.NWind
    Sleep, 100
    ControlSend,,u,ahk_class Nexon.NWind
    Sleep, 100
    MouseClick, Left, 600, 400, 2
    Sleep, 3000
return