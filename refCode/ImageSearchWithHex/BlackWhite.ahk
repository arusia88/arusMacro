;BlackWhite.ahk
;By: Frankie
;Made with AutoHotkey and C++
;Thanks to Tic for his Gdiplus library which a lot of this is copy
;and paste from a tutorial by him.

#Include, lib\Gdip_all.ahk
#SingleInstance, Force
#NoEnv
SetBatchLines, -1

; Uncomment if Gdip.ahk is not in your standard library
;#Include, Gdip_All.ahk

; Start gdi+
If !pToken := Gdip_Startup()
{
   MsgBox, 48, gdiplus error!, Gdiplus failed to start. Please ensure you have gdiplus on your system
   ExitApp
}
OnExit, Exit

; Create a layered window that is always on top as usual and get a handle to the window
Gui, 1: -Caption +E0x80000 +LastFound +OwnDialogs +Owner +AlwaysOnTop
Gui, 1: Show, NA
hwnd1 := WinExist()

;Load a sample picture
pBitmap := Gdip_CreateBitmapFromFile("me.bmp")
If !pBitmap
{
	MsgBox, 48, File loading error!, Could not load the image specified
	ExitApp
}

MCode(blackwhite, "518B4424188B4C24149983E20303C2C1F80285C90F8E820000008B54240C535503C05603C0578B7C24208944241089542428894C242"
. "485FF7E4C8B7424182B74241C8B04168BD8C1FB108BE8C1FD0881E3FF00000081E5FF0000008BC803DD25FF00000003D881E1000000FF81FB7E010000"
. "7C0681C1FFFFFF00890A83C2044F75C08B7C24208B54242803542410FF4C242489542428759E5F5E5D5B33C059C3")


;Get the width and height of the picture, this never changes
Width := Gdip_GetImageWidth(pBitmap)*2, Height := Gdip_GetImageHeight(pBitmap)
;Create a blank bitmap to store the new image in
pBitmapOut := Gdip_CreateBitmap(Width//2, Height)

;Some more good stuff
hbm := CreateDIBSection(Width, Height), hdc := CreateCompatibleDC(), obm := SelectObject(hdc, hbm)
G := Gdip_GraphicsFromHDC(hdc)

Gdip_DrawImage(G, pBitmap, 0, 0, Width, Height, 0, 0, Width, Height)
BlackWhite(pBitmap, pBitmapOut, Width//2, Height)
Gdip_SaveBitmapToFile(pBitmapOut, "converted2.bmp")
Gdip_DrawImage(G, pBitmapOut, Width//2, 0, Width, Height, 0, 0, Width, Height)


;Were going to put it in the center of the screen
UpdateLayeredWindow(hwnd1, hdc, X:=(A_ScreenWidth-Width)//2, Y:=(A_ScreenHeight-Height)//2, Width, Height)
return

BlackWhite(pBitmap, ByRef pBitmapOut, Width, Height)
{
	global blackwhite
	E1 := Gdip_LockBits(pBitmap, 0, 0, Width, Height, Stride1, Scan01, BitmapData1)
	E2 := Gdip_LockBits(pBitmapOut, 0, 0, Width, Height, Stride2, Scan02, BitmapData2)

	R := DllCall(&blackwhite, "uint", Scan01, "uint", Scan02, "int", Width, "int", Height, "int", Stride1)

	Gdip_UnlockBits(pBitmap, BitmapData1), Gdip_UnlockBits(pBitmapOut, BitmapData2)

	return (R)
}

MCode(ByRef code, hex) { ; allocate memory and write Machine Code there
   VarSetCapacity(code,StrLen(hex)//2)
   Loop % StrLen(hex)//2
      NumPut("0x" . SubStr(hex,2*A_Index-1,2), code, A_Index-1, "Char")
}


Esc::
Exit:
Gdip_DisposeImage(pBitmapOut), Gdip_DisposeImage(pBitmap)
SelectObject(hdc, obm), DeleteObject(hbm), DeleteDC(hdc)
Gdip_DeleteGraphics(G)
Gdip_Shutdown(pToken)
ExitApp
return