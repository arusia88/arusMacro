#Include, Base.ahk

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
        ; FileAppend, % "me x / y " this.me.x " / " this.me.y " result: " direction "`r", log.txt
        this.seongryo(direction)
    }

    revisedPosition(ByRef x, ByRef y, monster) {
        x := x + monster.startFindX
        y := y + monster.startFindY
        ; MsgBox,% "revised : " x "," y "read : " monster.startFindX "," monster.startFindY
    }

    seongryo(direction) {
        honma := 4
        attackMagic := 1
        ; casting attack magic twice need to be tested at hanbangul
        ControlSend,, {esc}v{home}{%direction%}v%honma%%attackMagic%%attackMagic%{esc},ahk_class Nexon.NWind
    }

    do(monster, cnt) {
        resultArray := monster.resultArray
        StringSplit, Item, resultArray, `n
        Loop, %cnt%
        {
            ; msgbox,% "orign result : " Item%A_Index%
            result := Item%A_Index%
            ; msgbox,% "split result : " result
            StringSplit,Pos,result, `,
            ; msgbox,% "second split result : " Pos1 " " Pos2
            this.revisedPosition(Pos1, Pos2, monster)
            this.attack(Pos1, Pos2, monster.name)
            Sleep, 100
        }
        return
    }
}
