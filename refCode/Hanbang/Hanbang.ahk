#SingleInstance force
#Include, Benefit.ahk
#Include, Attack.ahk
#Include, Monster.ahk
#Include, MonsterManager.ahk

CoordMode,Pixel,Screen
DetectHiddenWindows On
SetKeyDelay, -1
SetWinDelay,-1
SetBatchLines,-1
SetControlDelay,-1

Class Context {

    contextArray := {}

    addContext(action) {
        this.contextArray.Insert(action)
    }

    doOperation() {
        for index, action in this.contextArray
            action.do()
    }
}
;===================== Main ===========================

; MsgBox, Start AutoHunt
context := new Context()
manager := new ManageMonster(Attack.getInstance())
; manager.add(new Monster("daram", "Img\hanbang\daram_gdip.bmp"))
manager.add(new Monster("ruin", "Img\hanbang\ruin.bmp"))
; manager.add(new Monster("chowon", "Img\hanbang\chowon.bmp"))
manager.add(new Monster("magic", "Img\hanbang\magic.bmp"))
manager.add(new Monster("magic2", "Img\hanbang\magic2.bmp"))
manager.add(new Monster("healer" ,"Img\hanbang\healer.bmp"))
manager.add(new Monster("knight" ,"Img\hanbang\knight.bmp"))
manager.add(new Monster("chef" ,"Img\hanbang\chef.bmp"))
context.addContext(manager)

bmanager := new BenefitManager()
bmanager.add(new Benefit("myoungsang", "z", "Img\meda.bmp", 2000))
bmanager.add(new Benefit("mabang", "i", "Img\madefence.bmp", 5000))
bmanager.add(new Benefit("boho", "q", "Img\bufb2.bmp", 100))
bmanager.add(new Benefit("mujang", "w", "Img\bufm2.bmp", 2000))

context.addContext(bmanager)

Gui, Add, Text, vState x30 y30 w100 h20, -
Gui, Show, w150 h100, currentState
Return

;===================== GUI Update ===========================
update(state) {
    global
    currentState := state
    GuiControl, text, State, %currentState%
}


F2::
Pause, Off
update("Running")
SetTimer, Start, On
Return

Start:
context.doOperation()
Return

F3::
ControlSend,,{esc},ahk_class Nexon.NWind
update("Pause")
Pause, On
Return

F4::
benefit := Benefit.getInstance()
benefit.doSeokhwa()
Return