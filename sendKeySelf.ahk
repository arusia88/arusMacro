; #SingleInstance, force
; gosub, sendDirectionKey

; sendDirectionKey:

; Loop {
;     Sleep, 10
;     if (GetKeystate("Left") = 1)
;     {
;         ControlSend, , {Left}, self
;         break
;     }

;     if (GetKeystate("Right") = 1)
;     {
;         ControlSend, , {Right}, self
;         break
;     }

;     if (GetKeystate("Up") = 1)
;     {
;         ControlSend, , {Up}, self
;         break
;     }

;     if (GetKeystate("Down") = 1)
;     {
;         ControlSend, , {Down}, self
;         break
;     }
; }

; gosub, sendDirectionKey


; Return