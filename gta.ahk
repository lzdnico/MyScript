;刷屏清屏
~Space & T::
Loop, 6
{
    Send, {T}
    Send, {Space}
    Sleep, 500
    Send, {Enter}
}
Return


;CEO 吃药
~Space & c:: 
    Input, key, L1 T0.5 
    if (key == "1")   ;CEO吃药
        Send, {M}
        Send, {Enter}
        Send, {Down}
        Send, {Down}
        Send, {Down}
        Send, {Down}
        Send, {Enter}
        Send, {Down}
        Send, {Enter}
    if (key == "2")   ;CEO幽灵
        Send, {M}
        Send, {Enter}
        Send, {Down}
        Send, {Down}
        Send, {Down}
        Send, {Down}
        Send, {Enter}
        Send, {Down}
        Send, {Down}
        Send, {Down}
        Send, {Down}
        Send, {Enter}
    if (key == "3")   ;CEO贿赂
        Send, {M}
        Send, {Enter}
        Send, {Down}
        Send, {Down}
        Send, {Down}
        Send, {Down}
        Send, {Enter}
        Send, {Down}
        Send, {Down}
        Send, {Down}
        Send, {Down}
        Send, {Down}
        Send, {Enter}
Return 

;普通吃药
~Space & 1::
Send, {M}
Send, {Down}
Send, {Down}
Send, {Enter}
Send, {Down}
Send, {Down}
Send, {Enter}
Return

;普通打甲
~Space & 2::
Send, {M}
Send, {Down}
Send, {Down}
Send, {Enter}
Send, {Down}
Send, {Enter}
Send, {Down}
Send, {Down}
Send, {Down}
Send, {Down}
Return

;打电话给Lester
~Space & L::
Send, {Up}
Send, {WheelUp}
Send, {WheelUp}
Send, {Enter}
Send, {Up}
Send, {Up}
Send, {Up}
Send, {Up}
Send, {Up}
Send, {Up}
Send, {Up}
Send, {Up}
Send, {Up}
Send, {Up}
Send, {Up}
Send, {Up}
Send, {Up}
Send, {Up}
Send, {Enter}
Return
