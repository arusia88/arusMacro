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

    me := {x: 0, y:0}

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

    setMyPositionToSetScope() {
        if (ImageSearchWithGdip(xMe, yMe, this.findSelfX, this.findSelfY, this.findSelfX+811, this.findSelfY+615, "Img\kwanmi\me.bmp", 0, 0xFFFFFF) >= 1) {
            this.me.x := xMe
            this.me.y := yMe
            this.startFindX := xMe-155
            this.startFindY := yMe-100
            this.endFindX := xMe+130
            this.endFindY := yMe+240
        }
    }

}

;Class for beneficial magic
Class Benefit extends Base {
    static _instance := 0
    _magicNum := {mabang : "i",lifeSafe : "g", arm1: "q", arm2: "w", myoungsang: "z"}

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
        ; this.doMabang()
        ; this.doLifeSafe()
        ; this.doShield()
        this.doMyoungsang()

    }

    doMyoungsang() {
        ImageSearch, xMyoung, yMyoung, this.findSelfX, this.findSelfY, this.findSelfX+400, this.findSelfY+800, *80 Img\meda.bmp
        if(ErrorLevel<>0){
            myoungsang := this._magicNum.myoungsang
            Sleep 300
            ControlSend,,{Shift down}z{Shift up}%myoungsang%,ahk_class Nexon.NWind
            Sleep 2000
        }
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

    doSeokhwa() {
        ControlSend, ,{Tab}{Home}{Tab}, ahk_class Nexon.NWind
        ControlSend, ,{ShiftDown}1{ShiftUp}, ahk_class Nexon.NWind

    }

}

;Class for enviroment which find baram winDow coordinate
Class Attack extends Base {
    static _instance := 0
    _magicNum := {honma : 4, attackMagic : 1}

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

    attack(x,y,name) {
        ; FileAppend, % name "x / y " x " / " y "`r", log.txt
        if (y < this.me.y) {
            direction = Up
        } else if ( x < this.me.x){
            direction = Left
        } else {
            direction = Right
        }
        this.seongryo(direction)
    }

    seongryo(direction) {
        honma := 4
        attackMagic := 1
        ; casting attack magic twice need to be tested at hanbangul
        ControlSend,, {esc}v{home}{%direction%}v%honma%%attackMagic%%attackMagic%{esc},ahk_class Nexon.NWind
    }

    do(name, resultArray) {
        ; MsgBox, % "resultArray" resultArray.MaxIndex() " / " resultArray[1] " " resultArray[2]
        cnt := resultArray.MaxIndex() -1
        Loop, %cnt%
        {
            result := resultArray[A_Index]
            StringSplit,Pos,result,a
            this.attack(Pos1, Pos2, name)
            ; this.seongryo()
            Sleep, 100
        }
        return
    }
}

Class Monster extends Base{
    startFindX := 0

    __New(name, img) {
        Base.__New()
        this.Name := name
        this.mopImg := img
    }

    multipleImagesearch(xs,ys,xl,yl,image) {
        pos=
        xss:=xs
        yss:=ys


        loop
        {
            Imagesearch,x,yi,%xss%,%yss%,%xl%,%yl%,*transFFFFFF %image%
            If Errorlevel=1
                Break
            pos=%pos%%x%a%yi%`n
            loop
            {
                xss:=x+30
                If xss=%xl%
                    Break
                Imagesearch,x,y,%xss%,%yss%,%xl%,%yl%,*transFFFFFF %image%
                If Errorlevel=1
                    Break
                pos=%pos%%x%a%y%`n
                break
            }
            xss:=xs
            yss:=yi+30
            If yss=%yl%
                Break
        }
        Sort,pos,u
        return pos
    }


    isExist() {
        this.setMyPositionToSetScope()
        if(startFindX = 0) return 0
        MsgBox, % this.startFindX "," this.startFindY "," this.endFindX "," this.endFindY "," this.mopImg
        result := this.multipleImagesearch(this.startFindX, this.startFindY, this.endFindX, this.endFindY, this.mopImg)
        this.resultArray := StrSplit(result, "`n")
        ; MsgBox, % "this.resultArray" this.resultArray[1] " count " this.resultArray.MaxIndex()
        return this.resultArray.MaxIndex()
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
            if(monster.isExist() > 1){
                attack.do(monster.name, monster.resultArray)
            }
    }
}

Class Context {

    contextArray := {}

    addContext(action) {
        ; MsgBox, "here111"
        ; this.action := action
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
context.addContext(Benefit.getInstance())

manager := new ManageMonster(Attack.getInstance())
; manager.add(new Monster("daram", "Img\hanbang\daram.bmp"))
manager.add(new Monster("ruin", "Img\hanbang\ruin.bmp"))
manager.add(new Monster("chowon", "Img\hanbang\chowon.bmp"))
manager.add(new Monster("magic", "Img\hanbang\magic.bmp"))
manager.add(new Monster("magic2", "Img\hanbang\magic2.bmp"))
manager.add(new Monster("healer" ,"Img\hanbang\healer.bmp"))
manager.add(new Monster("knight" ,"Img\hanbang\knight2.bmp"))
manager.add(new Monster("chef" ,"Img\hanbang\chef2.bmp"))
context.addContext(manager)

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
ControlSend,,{esc},ahk_class Nexon.NWind
update("Pause")
Pause, On
Return

F4::
benefit := Benefit.getInstance()
benefit.doSeokhwa()
Return