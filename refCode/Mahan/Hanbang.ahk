#SingleInstance force
#Include, MLib\Gdip_All.ahk
#Include, MLib\Gdip_ImageSearch.ahk
#Include, Lib\gdipWrapper.ahk

CoordMode,Pixel,Screen
DetectHiddenWindows On
SetKeyDelay, -1
SetWinDelay,-1
SetBatchLines,-1
SetControlDelay,-1

;interface for magic
Class Base{

    __New() {
        this.getWinPosition()
    }

    do() {
        ; MsgBox % "parent"
    }

    getWinPosition() {
        WinGetPos, findSelfX, findSelfY, findSelfWidth, findSelfHeight, ahk_class Nexon.NWind
        ; MsgBox % "I found where your window is at " findSelfX " / " findSelfY
        this.findSelfX := findSelfX
        this.findSelfY := findSelfY
        this.findSelfWidth := findSelfWidth
        this.findSelfHeight := findSelfHeight
    }
}

;Class for beneficial magic
Class Benefit extends Base {
    static _instance := 0
    _magicNum := {mabang : "i",lifeSafe : "g", arm1: "q", arm2: "w"}

    __New() {
        if (IsObject(this._instance)) {
            return this._instance
        }
        this.getWinPosition()
    }

    getInstance() {
        if (IsObject(this._instance) = 0) {
            this._instance := new Benefit()
        }
        return this._instance
    }

    do() {
        ; MsgBox % "Benefit"
        this.doMabang()
        this.doLifeSafe()
        this.doShield()
    }

    doMabang() {
        MsgBox % "where you find at " this.findSelfX " / " this.findSelfY
        ImageSearch, xMabang, yMabang, this.findSelfX, this.findSelfY, this.findSelfX+400, this.findSelfY+800, *transFFFFFF Img\madefence.bmp
        if(ErrorLevel <> 0) {
            mabang := this._magicNum.mabang
            ControlSend,,{Shift down}z{Shift up}%mabang%,ahk_class Nexon.NWind
            Sleep, 5000
        }
    }

    doLifeSafe() {
        ImageSearch, xLifeSafe, yLifeSafe, this.findSelfX, this.findSelfY, this.findSelfX+400, this.findSelfY+800, *transFFFFFF Img\lifesafer.bmp
        if(ErrorLevel <> 0) {
            lifeSafe := this._magicNum.lifeSafe
            ControlSend,,{Shift down}z{Shift up}%lifeSafe%{Enter},ahk_class Nexon.NWind
            Sleep, 2000
        }
    }

    doShield() {
        ImageSearch, xBomu, yBomu, this.findSelfX, this.findSelfY, this.findSelfX+400, this.findSelfY+800, *80 Img\bufb.bmp
        if(ErrorLevel <> 0){
            arm1 := this._magicNum.arm1
            ControlSend,,{Shift down}z{Shift up}%arm1%{enter},ahk_class Nexon.NWind
        }
        Sleep, 200
        ImageSearch, xBomu, yBomu, this.findSelfX, this.findSelfY, this.findSelfX+400, this.findSelfY+800, *80 Img\bufm2.bmp
        if(ErrorLevel <> 0){
            arm2 := this._magicNum.arm2
            ControlSend,,{Shift down}z{Shift up}%arm2%{enter},ahk_class Nexon.NWind
            Sleep 2000
        }
    }

}

;Class for enviroment which find baram winDow coordinate
Class Attack extends Base {
    static _instance := 0
    _magicNum := {honma : 4, attackMagic : 1}
    _prevX := 0
    _prevY := 0

    __New() {
        ; MsgBox, "@@@@@@ createInstance"
        if (IsObject(this._instance)) {
            return this._instance
        }
        this.getWinPosition()
    }

    getInstance() {
        ; MsgBox, "@@@@@@ getinstance"
        if (IsObject(this._instance) = 0) {
            this._instance := new Attack()
        }
        return this._instance
    }

    checkAlreadyAttack(x,y) {
        ; FileAppend, % "_prevX" this._prevX " " this._prevY " / " "_XY" x " / " y "`r", log.txt
        if(Abs(this._prevX - x) < 50 and Abs(this._prevY - y) < 50){
            ; FileAppend, % "same value `r", log.txt
            return 1
        }
        FileAppend, % "different value `r", log.txt
        return 0
    }

    do(name, x, y) {
        honma := 4
        attackMagic := 1
        ; FileAppend, % "honma" honma " / " attackMagic " `r", log.txt
        ; if (this.checkAlreadyAttack(x,y) = 0) {
        BlockInput, On
        ControlSend,,{esc}v,ahk_class Nexon.NWind
        Sleep, 100
        MouseClick, Left, %x%, %y%, 1
        Sleep, 100
        ControlSend,,v%honma%%attackMagic%{esc},ahk_class Nexon.NWind
        BlockInput, Off
        ; }
        this._prevX := x
        this._prevY := y
    }
}

Class Monster extends Base{
    startFindX := 0

    __New(name, img) {
        Base.__New()
        this.Name := name
        this.mopImg := img
    }

    setMyPositionToSetScope() {
        if (ImageSearchWithGdip(xMe, yMe, this.findSelfX, this.findSelfY, this.findSelfX+811, this.findSelfY+615, "Img\kwanmi\me.bmp", 0, 0xFFFFFF) >= 1) {
            this.startFindX := xMe-218
            this.startFindY := yMe-113
            this.endFindX := xMe+200
            this.endFindY := yMe+300
        }
    }

    isExist() {
        this.setMyPositionToSetScope()
        if(startFindX = 0) return 0
        MsgBox, % this.startFindX "," this.startFindY "," this.endFindX "," this.endFindY "," this.mopImg
        mopImgPath := this.mopImg
        ImageSearch, x, y, this.startFindX, this.startFindY, this.endFindX, this.endFindY, *transFFFFFF %mopImgPath%
        if(ErrorLevel = 0) {
            this.x := x
            this.y := y + 50
            return 1
        }
        return 0
    }

}

Class ManageMonster {
    monsterArray := {}

    __New(attack) {
        ; MsgBox, "create managerMonster"
        this.attack := attack
    }

    add(monster){
        this.monsterArray.Insert(monster.name, monster)
    }

    do() {
        for index, monster in this.monsterArray
            if(monster.isExist() = 1){
                attack.do(name, monster.x, monster.y)
            }
    }
}

Class Context {

    __New(action) {
        this.action := action
    }

    setContext(action) {
        ; MsgBox, "here111"
        this.action := action
    }

    doOperation() {
        this.action.do()
    }
}
;===================== Main ===========================

; MsgBox, Start AutoHunt
context := new Context()
; context.setContext(Benefit.getInstance())
manager := new ManageMonster(Attack.getInstance())
; manager.add(new Monster("daram", "Img\hanbang\daram.bmp"))
; manager.add(new Monster("daram", "Img\hanbang\ruin.bmp"))
manager.add(new Monster("magic", "Img\hanbang\magic.bmp"))
manager.add(new Monster("healer" ,"Img\hanbang\healer.bmp"))
manager.add(new Monster("knight" ,"Img\hanbang\knight.bmp"))
manager.add(new Monster("chef" ,"Img\hanbang\chef.bmp"))
context.setContext(manager)

Gui, Add, Text, vState x30 y30 w100 h20, -
Gui, Show, w150 h100, currentState
Return

;===================== GUI Run ===========================
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
update("Pause")
Pause, On
Return