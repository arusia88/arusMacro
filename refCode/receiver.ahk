#SingleInstance, force

OnMessage(6000, "Test")
return

Test(wparam,lparam, msg)
{
tooltip, Test works! message number: %msg%
}