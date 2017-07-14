#SingleInstance force
CoordMode,Pixel,Screen
DetectHiddenWindows On
SetKeyDelay, -1
SetWinDelay,-1
SetBatchLines,-1
SetControlDelay,-1

;interface for magic
Class Magic{
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
        MsgBox % "parent"
    }

    getWinPosition() {
        WinGetPos, findSelfX, findSelfY, findSelfWidth, findSelfHeight, ahk_class Nexon.NWind
        ; MsgBox % "where you find at " findSelfX " / " findSelfY
        this.findSelfX := findSelfX
        this.findSelfY := findSelfY
        this.findSelfWidth := findSelfWidth
        this.findSelfHeight := findSelfHeight
    }
}

;Class for beneficial magic
Class Benefit extends Magic {
    do() {
        ; MsgBox % "Benefit"
        this.doMabang()
        this.doLifeSafe()
        this.doShield()
    }

    doMabang() {
        ; MsgBox % "where you find at " this.findSelfX " / " this.findSelfY
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
        if(ErrorLevel=1){
            arm1 := this._magicNum.arm1
            ControlSend,,{Shift down}z{Shift up}%arm1%{enter},ahk_class Nexon.NWind
        }
        Sleep, 200
        ImageSearch, xBomu, yBomu, this.findSelfX, this.findSelfY, this.findSelfX+400, this.findSelfY+800, *80 Img\bufm2.bmp
        if(ErrorLevel=1){
            arm2 := this._magicNum.arm2
            ControlSend,,{Shift down}z{Shift up}%arm2%{enter},ahk_class Nexon.NWind
            Sleep 2000
        }
    }

}

;Class for enviroment which find baram winDow coordinate
Class Attack extends Magic {
    do() {
        MsgBox % "Attack"
    }
}

Class Context {

    __New(magic) {
        this.magic := magic
    }

    setContext(magic) {
        this.magic := magic
    }

    doOperation() {
        this.magic.do()
    }
}

MsgBox, Start Autobuf
context := new Context()
context.setContext(Benefit.getInstance())

Gui, Add, Text, vState x30 y30 w100 h20, -
Gui, Show, w150 h100, currentState
Return

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