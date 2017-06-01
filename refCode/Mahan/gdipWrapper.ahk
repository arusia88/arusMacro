
; Gdip_ImageSearch(pBitmapHaystack,pBitmapNeedle,ByRef OutputList=""
; ,OuterX1=0,OuterY1=0,OuterX2=0,OuterY2=0,Variation=0,Trans=""
; ,SearchDirection=1,Instances=1,LineDelim="`n",CoordDelim=",") {}


ImageSearchWithGdip(Byref outputX,Byref outputY, fsX, fsY, feX, feY, targetImg, Variation=0, Trans="")
{
    ; Create haystack with Wind process with NWind
    ; MsgBox % "hwnd : " hwnd
    raster:=0x40000000 + 0x00CC0020
    pBitMapTemp := Gdip_BitmapFromScreen(0,raster)

    pBitmapHayStack := Gdip_CloneBitmapArea(pBitMapTemp, fsX, fsY, feX, feY)
    ; Create pBitmapNeedle
    pBitmapNeedle := Gdip_CreateBitmapFromFile(targetImg)

    ; Result Coordinate

    ; startX,Y
    OuterX1 := fsX
    OuterY1 := fsY
    ; endX,Y
    OuterX2 := feX
    OuterY2 := feY

    outputCount := Gdip_ImageSearch(pBitmapHaystack,pBitmapNeedle,OutputList
,OuterX1,OuterY1,OuterX2,OuterY2, Variation, Trans)

    FileAppend, output : %outputCount% `r, log.txt

    ; result X, Y
    if (outputcount > 0 ){
        StringSplit, cordinate, OutputList, `,
        outputX := cordinate1
        outputY := cordinate2
    } else {
        outputX := 0
        outputY := 0
    }

    Gdip_DisposeImage(pBitmapHayStack), Gdip_DisposeImage(pBitmapNeedle)

    return (outputCount > 0) ? outputCount : 0
}