Gui 1:+LastFound
GUI1:=WinExist() , hDC:=DllCall("GetDC",UInt,Gui1)
Gui, Add, Text, x100 y100 vPic Hidden w20 h17 0xE hwndhPic
Gui, Add, Button, x10 y270 gBt, Move
Gui, Add, Text, x160 y275 w120 vPos
GoSub, LoadBitmap1
hBMP := DllCall( "CreateDIBitmap", UInt,hDC, UInt,(bmiHAddr:=&BMP+14)
       ,UInt,(CBM_INIT:=4), UInt,&BMP+NumGet(BMP,10), UInt,&BMP+14, UInt,(DIB_PAL_COLORS:=1) )
SendMessage, (STM_SETIMAGE:=0x172), (IMAGE_BITMAP:=0x0), hBMP,, ahk_id %hPic%
Gui, Show, w300 h300, SampleWindow
hwnd := WinExist()
Gosub,Bt
GuiControl, Show, Pic
Return
Bt:
Random, X, 20, 260
Random, Y, 20, 240
GuiControl, Move, Pic, x%X% y%Y%
ClientToWin(hwnd, X, Y)
GuiControl, , Pos, x:%X% y:%Y%
return
LoadBitmap1:
BMPH =
( Join
424d96010000000000003600000028000000080000000b000000010020000000000000000000c40e0000c40e00000000000000000000247cb3ff217cbcff1c84b5ff000000ff000000ff1c74acff1c74b6ff2c74b4ff2c7cb3ff2c7cb3ff000000ffaf776fffaf776fff000000ff1c74b6ff2c74b4ff2c7cbcff000000ffb3837bffb3837bffb3837bffb3837bff000000ff2c7cb3ff000000ffbb8b83ffbb8b83ff000000ff000000ffbb8b83ffbb8b83ff000000ff000000ffc3978fffc3978fff000000ff000000ffc3978fffc3978fff000000ff000000ffcba397ffcba397ff000000ff000000ffcba397ffcba397ff000000ff000000ffcfaba3ffcfaba3ff000000ff000000ffcfaba3ffcfaba3ff000000ff000000ffdfc3bbffdfc3bbff000000ff000000ffdfc3bbffdfc3bbff000000ff3584b7ff000000ffcfaba3ffcfaba3ffcfaba3ffcfaba3ff000000ff2c7cb3ff2b84b7ff247cb3ff000000ffbb8b83ffbb8b83ff000000ff247cb3ff2c7cb3ff2b84b7ff2b84b7ff2c7cb3ff000000ff000000ff2c7cb3ff1c74b6ff347cb4ff
)
nSize := StrLen(BMPH)//2
VarSetCapacity( BMP,nSize )
Loop % nSize
  NumPut( "0x" . SubStr(BMPH,2*A_Index-1,2), BMP, A_Index-1, "Char" )
BMPH= ; empty it
Return
ClientToWin(hwnd, ByRef x, ByRef y)
{
    VarSetCapacity(pt, 8)
    NumPut(x, pt, 0)
    NumPut(y, pt, 4)
    DllCall("ClientToScreen", "uint", hwnd, "uint", &pt)
    WinGetPos, wx, wy,,, ahk_id %hwnd%
    x := NumGet(pt, 0, "int") - wx
    y := NumGet(pt, 4, "int") - wy
}
GuiClose:
ExitApp
