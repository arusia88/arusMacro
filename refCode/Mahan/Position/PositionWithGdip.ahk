#Include, MLib\Gdip_All.ahk
#Include, MLib\Gdip_ImageSearch.ahk
#Include, MLib\Bin2Hex.ahk
#Include, MLib\BinRead.ahk
#Include, MLib\Hex2Bin.ahk
#Include, convertImgToPos.ahk
#Include, MLib\SetClipboardData.ahk

#SingleInstance, Force
#NoEnv
CoordMode, Pixel, Screen
number = 0
F1::
SetKeyDelay, -1
SetWinDelay,-1
SetBatchLines,-1
SetControlDelay,-1


WinGetPos, findSelfX, findSelfY, findSelfWidth, findSelfHeight, 바람의나라
ImageSearch, X찾, Y찾, findSelfX+880, findSelfY+750, findSelfX+findSelfWidth, findSelfY+findSelfHeight, *transFFFFFF Img\X.bmp
if(ErrorLevel=0) {
    범위X백a:= X찾 + 20
    범위X백b:= X찾 + 28
    범위X십a:= X찾 + 29
    범위X십b:= X찾 + 37
    범위X일a:= X찾 + 38
    범위X일b:= X찾 + 46
    범위Y백a:= X찾 + 78
    범위Y백b:= X찾 + 86
    범위Y십a:= X찾 + 87
    범위Y십b:= X찾 + 95
    범위Y일a:= X찾 + 96
    범위Y일b:= X찾 + 104
    범위Y위:= Y찾
    범위Y아래:= Y찾 + 11
    MsgBox, good
} else {
    MsgBox, bad
}
return
; F2::
; StartTime:=A_TickCount
; ;#########################################################################################아래부분을 Code()로 구현 하시면 됩니다.
; X := convertImgToPos(범위X십a, 범위Y위)
; EndTime:=A_TickCount
; ResultTime:=EndTime - StartTime
; Msgbox, result = %ret% pos=%X% , Time=%ResultTime%
; ;#########################################################################################


; return

k:=1
value:=3
F3::
gdipToken := Gdip_Startup()
PosX := X찾-516
PosY := Y찾-736
string = %PosX%|%PosY%|72|17
MsgBox, %string%
pBitmap:=Gdip_BitmapFromScreen(string)
ret := Gdip_SaveBitmapToFile(pBitmap, "pos.bmp")
file = expected.bmp

BinRead(file, data)
Bin2Hex(resultHex,data,res)

; MsgBox, result : %resultHex%
; FileAppend, 자리 : %k% 값 : %value% 캡쳐 hex : %resultHex% `r, Test.txt
value += 1
Return


F9::

; get capture heopung image
; BlockInput, On
WinGetPos, findSelfX, findSelfY, findSelfWidth, findSelfHeight, 제목 없음 - 그림판

gdipToken := Gdip_Startup()
ImageSearch, X찾, Y찾, findSelfX, findSelfY, findSelfX+findSelfWidth, findSelfY+findSelfHeight, *transFFFFFF *50 Img\heopung.bmp
If(ErrorLevel = 0)
{
    string = %X찾%|%Y찾%|276|198
    pBitmap:=Gdip_BitmapFromScreen(string)
    ret := Gdip_SaveBitmapToFile(pBitmap, "pos.bmp")

    ; set clipboard to cpature image
    Gdip_SetBitmapToClipboard(pBitmap)

    ; control send 'ctrl + v ' on kakao (me)
    ; control send enter
    WinActivate 임군
    ControlSend, ,{CtrlDown}v{CtrlUp},임군
    Sleep, 300
    ; Send, {Enter}
    Sleep, 300
    ; WinActivate 바람의나라
    ; BlockInput, Off
}
; active wind back
return

F4::
CoordMode, Pixel, Screen
Cal_imageSearchTime := A_TickCount
if(ImageSearchWithGdip(xPotal, yPotal, findSelfX, findSelfY, findSelfX+findSelfWidth, findSelfY+findSelfHeight, "Img\0.bmp") = 1)
{
    ret := A_TickCount - Cal_imageSearchTime
    msgbox % "result : " ret "ms"
}
return
F5::
Cal_imageSearchTime := A_TickCount
; MsgBox % "found " findSelfX "/" findSelfY "/" findSelfWidth "/" findSelfHeight
PixelSearch, xPotal, yPotal, 0, 0, 1030, 920, 0x83EBFF, , Fast
if(ErrorLevel=0){
    ret := A_TickCount - Cal_imageSearchTime
    msgbox % "result : " ret "ms " xPotal "/" yPotal
}
return

wantBmp = 424d96010000000000003600000028000000080000000b000000010020000000000000000000c40e0000c40e000000000000000000002b84b7ff2c7cb3ff2c7cbcff000000ff000000ff1c74b6ff2c7cbcff186caaff1c84b5ff347cb4ff000000ffaf776fffaf776fff000000ff2474b4ff1464adff2c7cb3ff000000ffb3837bffb3837bffb3837bffb3837bff000000ff196cb8ff000000ffbb8b83ffbb8b83ff000000ff000000ffbb8b83ffbb8b83ff000000ff000000ffc3978fffc3978fff000000ff000000ffc3978fffc3978fff000000ff000000ffcba397ffcba397ff000000ff000000ffcba397ffcba397ff000000ff000000ffcfaba3ffcfaba3ff000000ff000000ffcfaba3ffcfaba3ff000000ff000000ffdfc3bbffdfc3bbff000000ff000000ffdfc3bbffdfc3bbff000000ff1c74acff000000ffcfaba3ffcfaba3ffcfaba3ffcfaba3ff000000ff2c7cbcff2474b4ff217cbcff000000ffbb8b83ffbb8b83ff000000ff347cb4ff2c7cbcff2c7cb3ff1c74b6ff2c7cbcff000000ff000000ff217cbcff2c7cbcff2c7cbcff

ImageSearchWithGdip(Byref outputX,Byref outputY, fsX, fsY, feX, feY, targetImg, Variation=0, Trans="")
{
    If !pToken := Gdip_Startup()
    {
        MsgBox, 48, gdiplus error!, Gdiplus failed to start. Please ensure you have gdiplus on your system
        ExitApp
    }
    ; Create haystack with Wind process with NWind
    ; MsgBox % "hwnd : " hwnd
    raster:=0x40000000 + 0x00CC0020
    pBitMapTemp := Gdip_BitmapFromScreen(0,raster)

    pBitmapHayStack := Gdip_CloneBitmapArea(pBitMapTemp, fsX, fsY, feX, feY)
    ; Create pBitmapNeedle
    ; pBitmapNeedle := Gdip_CreateBitmapFromFile(targetImg)
    imageLen := Hex2Bin(image, wantBmp)
    SetClipboardData(8, image, imageLen)
    pBitmapNeedle := Gdip_CreateBitmapFromClipboard()
    Gdip_SaveBitmapToFile(pBitmapNeedle, "pBitmapNeedle.bmp")

    ; Result Coordinate

    ; startX,Y
    OuterX1 := fsX
    OuterY1 := fsY
    ; endX,Y
    OuterX2 := feX
    OuterY2 := feY

    outputCount := Gdip_ImageSearch(pBitmapHayStack,pBitmapNeedle,OutputList
,OuterX1,OuterY1,OuterX2,OuterY2, Variation, Trans)

    ; FileAppend, output : %outputCount% targetImg : %targetImg% `r, log.txt


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
    Gdip_Shutdown(pToken)

    return (outputCount > 0) ? outputCount : 0
}


ImageSearchWithGdipMcode(Byref outputX,Byref outputY, fsX, fsY, feX, feY, targetImg, Variation=0, Trans="") {
        global
    If !pToken := Gdip_Startup()
    {
        MsgBox, 48, gdiplus error!, Gdiplus failed to start. Please ensure you have gdiplus on your system
        ExitApp
    }

    pBitMapTemp := Gdip_BitmapFromScreen(0)
    ; Create pBitmapHayStack
    pBitmapHayStack := Gdip_CloneBitmapArea(pBitMapTemp, fsX, fsY, feX, feY)
    ; Create pBitmapNeedle
    pBitmapNeedle := Gdip_CreateBitmapFromFile(targetImg)

    Width1 := Gdip_GetImageWidth(pBitmapHayStack), Height1 := Gdip_GetImageHeight(pBitmapHayStack)
    Width2 := Gdip_GetImageWidth(pBitmapNeedle), Height2 := Gdip_GetImageHeight(pBitmapNeedle)
    E1 := Gdip_LockBits(pBitmapHayStack, 0, 0, Width1, Height1, Stride1, Scan01,BitmapData1)
    E2 := Gdip_LockBits(pBitmapNeedle, 0, 0, Width2, Height2, Stride2, Scan02,BitmapData2)

    MCode(Gdip_ImageSearch, "83EC148B4424309983E20303C28BC88B442434995383E2035503C2C1F80256C1F902837C24"
    . "30005789442420C7442410000000000F8EBE0000008B5C24288B7C24388D048D00000000894424188B442430895C241CE"
    . "B098DA424000000008BFFC74424440000000085C07E6D895C24148B6C242CC7442440000000008D6424008B4C24403B4C"
    . "243C0F8D8600000033C985FF7E158BD58BF38B063B02751F4183C20483C6043BCF7CEF8B442420035C2418FF44244003C"
    . "003C003E8EBC38B4C24448B5C24148B4424304183C3043BC8894C2444895C24147C978B4C24108B5C241C035C2418413B"
    . "4C2434894C2410895C241C0F8C68FFFFFF8B5424488B44244C5F5E5DC702FFFFFFFFC700FFFFFFFF5B83C414C38B4C244"
    . "48B5424488B44244C5F495E890A8B4C24085D89085B83C414C3")

    Time1 := A_TickCount
    VarSetCapacity(x, 8, 0), VarSetCapacity(y, 8, 0)
        DllCall(&Gdip_ImageSearch, "uint", Scan01, "uint", Scan02, "int", Width1, "int", Height1, "int", Width2, "int", Height2, "int", Stride1, "int", Stride2, "int*", x, "int*", y)
    ; MsgBox, % "Time for 100 searches: " A_TickCount-Time1 "ms`nx: " x "`ny: " y ;%
    outputX := x
    outputY := y

    Gdip_UnlockBits(pBitmapHayStack,BitmapData1), Gdip_UnlockBits(pBitmapNeedle,BitmapData2)
    Gdip_DisposeImage(pBitmapHayStack), Gdip_DisposeImage(pBitmapNeedle)

    return (x > -1) ? 1 : 0
}

MCode(ByRef code, hex)
{
    VarSetCapacity(code, StrLen(hex)//2)
    Loop % StrLen(hex)//2 ;%
        NumPut("0x" SubStr(hex, 2*A_Index-1, 2), code, A_Index-1, "char")
}
