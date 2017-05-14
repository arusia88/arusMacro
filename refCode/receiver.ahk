#SingleInstance, force
#InstallKeybdHook

OnMessage(6000, "Test")
Gosub, receive
Return



receive:
Loop
{
    Sleep,10

    if (GetKeystate("Left") = 1)
    {
        arrowkey := "left"
        break
    }

    if (GetKeystate("Right") = 1)
    {
        arrowkey := "right"
        break
    }

    if (GetKeystate("Up") = 1)
    {
        arrowkey := "up"
        break
    }

    if (GetKeystate("Down") = 1)
    {
        arrowkey := "down"
        break
    }

}
MsgBox, this is pressed %arrowkey%

Gosub, receive
Return


Test(wparam,lparam, msg)
{
tooltip, Test works! message number: %msg%
}



