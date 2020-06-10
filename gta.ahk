;快捷键版GTA宏。 难点在于记住多个快捷键。但是速度更快。
;记不住的可以看gtagui.ahk可视化操作


;刷屏清屏
~Space & T::            ;空格+T，清楚烦人的广告，容易被踢下线
Loop, 6 
{
    Send, {T}
    Send, {Space}
    Sleep, 500
    Send, {Enter}
}
Return


;CEO 吃药c
~Space & c::             ;空格+c,触发CE0相关功能
    Input, key, L1 T0.5 
    if (key == "1")   ;CEO吃药           ；再按下1，吃药
        Send, {M}
        Send, {Enter}
        Send, {Down}
        Send, {Down}
        Send, {Down}
        Send, {Down}
        Send, {Enter}
        Send, {Down}
        Send, {Enter}
    if (key == "2")   ;CEO幽灵         ；再按下2，幽灵组织
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

;打电话给Lester,不可用
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
