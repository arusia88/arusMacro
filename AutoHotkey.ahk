F1::
Process, Exist, gamer.exe
PID:=ErrorLevel

ADDRESS := ReadMemory(0x4df73c, PID)
Return

ReadMemory(MADDRESS,pid){

VarSetCapacity(MVALUE,4,0)
ProcessHandle := DllCall("OpenProcess", "Int", 24, "Char", 0, "UInt", pid, "UInt")
DllCall("ReadProcessMemory","UInt",ProcessHandle,"UInt",MADDRESS,"Str",MVALUE,"UInt",4,"UInt *",0)

Loop 4
result += *(&MVALUE + A_Index-1) << 8*(A_Index-1)

return, result
}
; 1st address hp  : 35720C0C            2st. hp : 316D4A0C         3st : 316D8C0C,  316D600C
; 1st address mp : 35720C10            2st. mp :  316D4A10        3ST : 316D8C10,  316D6010


;address x ÁÂÇ¥ :  316D4A1C    4B00Â÷ÀÌ     316D8C1C
;address y ÁÂÇ¥ :  316D4A18    4B00Â÷ÀÌ     316D8C18



