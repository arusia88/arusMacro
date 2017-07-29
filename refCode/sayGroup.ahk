F1::
SetTimer, sayGroup, 1000
return

F2::
SetTimer, sayGroup, Off
return

sayGroup:
ControlSend, , {Enter}, ahk_class Nexon.NWind
Sleep, 500
ControlSend, , {Up}, ahk_class Nexon.NWind
Sleep, 500
return
