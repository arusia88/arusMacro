#SingleInstance force
F1::
SetTimer, attack, On
return

F2::
SetTimer, attack, Off
Return

attack:
ControlSend, , 1, ahk_class Nexon.NWind
Sleep, 300
ControlSend, , {Up}, ahk_class Nexon.NWind
Sleep, 300
ControlSend, , {Enter}, ahk_class Nexon.NWind
Sleep, 300
Return