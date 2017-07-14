#SingleInstance force
CoordMode,Pixel,Screen
F1::
; SetTimer, attack, On
ImageSearch, xMabang, yMabang, 20, 70, 900, 600, *80 *transFFFFFF Img\madefence.bmp
if(ErrorLevel = 0) {
    msgbox % "find mabang"
} else {
    msgbox % "not findb"
}
return
