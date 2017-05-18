json(ByRef js, s, v = "") {
    j = %js%
    Loop, Parse, s, .
    {
        p = 2
        RegExMatch(A_LoopField, "([+\-]?)([^[]+)(?:\[(\d+)\])?", q), q3 := q3 ? q3 : 0
        Loop {
            If (!p := RegExMatch(j, "(""|')([^\1]+?)\1\s*:\s*((""|')?[^\4]*?\4|(\{(?:[^{}]*+|(?5))*\})|[+\-]?\d+(?:\.\d*)?|true|false|null?)\s*(?:,|$|\})", x, p))
            Return
            Else If (-1 == q3 -= x2 == q2 or q2 == "*") {
                j = %x3%
                z += p + StrLen(x2) - 2
                Break
            }
            Else p += StrLen(x)
        }
    }

    z-=StrLen(x)
    If (v !="" ) {
        NewStr := RegExReplace(x, x3 , v)
        js := RegExReplace(js, x , NewStr,"",1,z)
    }

    Return, x3 == "false" ? 0 : x3 == "true" ? 1 : x3 == "null" or x3 == "nul" ? "" : SubStr(x3, 1, 1) == "" ? SubStr(x3, 2, -1) : x3
}