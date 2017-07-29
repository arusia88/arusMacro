#Include, Base.ahk

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