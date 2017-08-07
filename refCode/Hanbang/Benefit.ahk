#Include, Base.ahk

;Class for beneficial magic
Class Benefit extends Base {
    magicName := ""
    magicKey := ""
    imgPath := ""
    castingTime := 0

    __New(name, key, imgPath, castingTime) {
        this.getWinPosition()
        this.magicName := name
        this.magicKey := key
        this.imgPath := imgPath
        this.castingTime := castingTime
    }

    do() {
        imgPath := this.imgPath
        castingTime := this.castingTime
        ImageSearch, xMyoung, yMyoung, this.findSelfX, this.findSelfY, this.findSelfX+400, this.findSelfY+800, *80 %imgPath%
        if(ErrorLevel<>0){
            magicKey := this.magicKey
            Sleep 100
            ControlSend,,{Tab}{Home}{Tab}{Shift down}z{Shift up}%magicKey%,ahk_class Nexon.NWind
            Sleep %castingTime%
            ControlSend,, {Esc}, ahk_class Nexon.NWind
        }
    }
}



class BenefitManager {
    benefitMagicList := {}

    add(benefitMagic) {
        this.benefitMagicList.Insert(benefitMagic)
    }

    do() {
        For index, benefitMagic in this.benefitMagicList
        {
            benefitMagic.do()
        }
    }
}