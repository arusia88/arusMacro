Gui, Add, TreeView
P1 := TV_Add("First parent")
P1C1 := TV_Add("Parent 1's first child", P1)  ; Specify P1 to be this item's parent.

Gui, +LastFound
hwnd := WinExist("ÀÓ±º")
Gui, Show, w300

ControlGet tH, HWND, ,SysTreeView321, ahk_id %hwnd%
WinSetTitle DLG: %hwnd%   TV: %tH%

GetTVText()


GetTVText()
{
    global

    ;SendMessage TVM_GETNEXTITEM, TVGN_ROOT
    SendMessage 0x110A, 0, 0, ,ahk_id %tH%
    root = %ErrorLevel%

    ;set TVITEM struct
    VarSetCapacity(buf, 128, 0)

    VarSetCapacity(sTVITEM, 40,  0)     ;10x4 = 40
    InsertInteger(0x0011, sTVITEM, 0)   ;set mask to TVIF_TEXT | TVIF_HANDLE  = 0x001 | 0x0010
    InsertInteger(root,  sTVITEM, 4)    ;set itemid to root
[color=blue]    InsertInteger(&buf,  sTVITEM, 16)   ;set txt pointer
    InsertInteger(100,   sTVITEM, 20)   ;set txt size[/color]


    ;tv_getitem
    SendMessage 0x110C, 0, &sTVITEM, ,ahk_id %tH%
    msgBox ERR:%ErrorLevel% `n`nRoot Handle: %root%`nAHK ID: %P1% `n`nText: %buf%
}


;TYPEDEF STRUCT TAGtvitem {
;    uint MASK;
;    htreeitem HiTEM;
;    uint STATE;
;    uint STATEmASK;
;    lptstr PSZtEXT;
;    INT CCHtEXTmAX;
;    INT IiMAGE;
;    INT IsELECTEDiMAGE;
;    INT CcHILDREN;
;    lparam LpARAM;
;} tvitem, *lptvitem




InsertInteger(pInteger, ByRef pDest, pOffset = 0, pSize = 4)
{
    Loop %pSize%
        DllCall("RtlFillMemory", "UInt", &pDest + pOffset + A_Index-1, "UInt", 1, "UChar", pInteger >> 8*(A_Index-1) & 0xFF)
}