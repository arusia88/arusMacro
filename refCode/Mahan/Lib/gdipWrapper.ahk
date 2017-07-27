
; Gdip_ImageSearch(pBitmapHaystack,pBitmapNeedle,ByRef OutputList=""
; ,OuterX1=0,OuterY1=0,OuterX2=0,OuterY2=0,Variation=0,Trans=""
; ,SearchDirection=1,Instances=1,LineDelim="`n",CoordDelim=",") {}


ImageSearchWithGdip(Byref outputX,Byref outputY, fsX, fsY, feX, feY, targetImg, Variation=0, Trans="") {
    If !pToken := Gdip_Startup()
    {
        MsgBox, 48, gdiplus error!, Gdiplus failed to start. Please ensure you have gdiplus on your system
        ExitApp
    }
    ; Create haystack with Wind process with NWind Size
    screenValue := fsX "|" fsY "|" 811 "|" 615
    raster:=0x40000000 + 0x00CC0020
    pBitmapHayStack := Gdip_BitmapFromScreen(screenValue,raster)
    ; pBitmapHayStack := Gdip_CloneBitmapArea(pBitMapTemp, fsX, fsY, feX, feY)
    ; Create pBitmapNeedle
    pBitmapNeedle := Gdip_CreateBitmapFromFile(targetImg)

    ; Calculate find scope
    Width1 := Gdip_GetImageWidth(pBitmapHayStack), Height1 := Gdip_GetImageHeight(pBitmapHayStack)
    outputCount := Gdip_ImageSearch(pBitmapHayStack,pBitmapNeedle,OutputList
,0,0,Width1,Height1, Variation, Trans)

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
    If !pToken := Gdip_Startup()
    {
        MsgBox, 48, gdiplus error!, Gdiplus failed to start. Please ensure you have gdiplus on your system
        ExitApp
    }

    raster:=0x40000000 + 0x00CC0020
    pBitMapTemp := Gdip_BitmapFromScreen(0,raster)
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
    ; Loop, 100
        DllCall(&Gdip_ImageSearch, "uint", Scan01, "uint", Scan02, "int", Width1, "int", Height1, "int", Width2, "int", Height2, "int", Stride1, "int", Stride2, "int*", x, "int*", y)
    ; MsgBox, % "Time for 100 searches: " A_TickCount-Time1 "ms`nx: " x "`ny: " y ;%
    outputX := x
    outputY := y

    Gdip_UnlockBits(pBitmapHayStack,BitmapData1), Gdip_UnlockBits(pBitmapNeedle,BitmapData2)
    Gdip_DisposeImage(pBitmapHayStack), Gdip_DisposeImage(pBitmapNeedle)

    return (x > -1) ? 1 : 0
}

MCode(ByRef code, hex) {
    VarSetCapacity(code, StrLen(hex)//2)
    Loop % StrLen(hex)//2 ;%
        NumPut("0x" SubStr(hex, 2*A_Index-1, 2), code, A_Index-1, "char")
}


Gdip_CropImage(pBitmap, x, y, w, h) {
    pBitmap2 := Gdip_CreateBitmap(w, h), G2 := Gdip_GraphicsFromImage(pBitmap2) ;gdip로 w h 크기의 비트맵을 만들고 그래픽 핸들은 g2로 한다 정도로 보시면 되겠습니다.
    Gdip_DrawImage(G2, pBitmap, 0, 0, w, h, x, y, w, h) ;그리고 g2의 그래픽핸들에 입력받은 pbitmap을 사용해서 0,0,w,h 만큼 그리되, pbitmap의 x,y,w,h 만큼 그려라 정도라고 보시면 됩니다.
    Gdip_DeleteGraphics(G2) ; 초기화 하는 것이구요.
    Gdip_DisposeImage(G2)
    return pBitmap2 ; 새롭게 그려진 pbitmap2를 반환하는 겁니다.
}

;ex>>img_src_rectangle("1.png",hwnd,vx,vy,200,200,100,100) 1.png의 이미지를 200,200 좌표를 기준으로 100,100 크기의 공간에서 검색해라 라는 의미입니다.
img_src_rectangle(image,hwnd,byref vx, byref vy,vvx,vvy,vw,vh) {
    pToken:=Gdip_Startup()
    pBitmapHayStack1:=Gdip_BitmapFromhwnd(hwnd)
    pBitmapNeedle:=Gdip_CreateBitmapFromFile(image)

    pBitmapHayStack:=Gdip_CropImage(pBitmapHayStack1, vvx, vvy, vw, vh)

    ;Gdip_SetBitmapToClipboard(pBitmapHayStack) ;잘 되고 있는지 클립보드로 저장하는 것이고,
    ;Gdip_SaveBitmapToFile(pBitmapHayStack, "haystack.png") ; 마찬가지로 잘 되고 있는지 혹은 캡쳐할 때 파일로 저장하는겁니다. 이 부분만 다르므로 아래 부분은 복붙합니다.

    if Gdip_ImageSearch(pBitmapHayStack,pBitmapNeedle,list,0,0,0,0,60,,1,1) {  ;그 뒤 이미지서치 함수를 통해서, 값이 나올 경우
        StringSplit, LISTArray, LIST, `,  ; list라는 변수에 저장되는데, 출력 양식은 111,222 처럼 저장되니 이렇게 문자열을 쪼갭니다.
        vx:=LISTArray1 ;이렇게 하면 listarray0엔 쪼갠 변수 총 갯수 그다음부터 쭉쭉 나오게 되는 것이죠.
        vy:=LISTArray2
        ;; 이 부분에 마우스 클릭 및 다른 기능을 추가하셔도 됩니다.
        ;; 단, 여기서 출력된 부분은 사각형의 좌표 기준이므로 입력되는 변수 vvx와 vvy를 각각 더해야 온전한 좌표를 얻을 수 있습니다.
        Gdip_DisposeImage(pBitmapHayStack), Gdip_DisposeImage(pBitmapNeedle) ;초기화하는 부분입니다. 그냥 넣어주시면되요.
        Gdip_DisposeImage(pBitmapHayStack1)
        Gdip_Shutdown(pToken)
        return true
    }
    else {
        Gdip_DisposeImage(pBitmapHayStack), Gdip_DisposeImage(pBitmapNeedle), Gdip_DisposeImage(pBitmapHayStack1)
        Gdip_Shutdown(pToken)
        return false
    }
}