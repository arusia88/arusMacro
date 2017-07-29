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
