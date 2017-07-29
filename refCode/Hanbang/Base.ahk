#Include, Lib\Gdip_All.ahk
#Include, Lib\Gdip_ImageSearch.ahk
#Include, Lib\gdipWrapper.ahk

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