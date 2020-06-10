;GUI版GTA宏，空格+C弹出选择菜单。
;Nico主要维护这个

~Space & c:: 
    Gui, Destroy
    Gui +AlwaysOnTop
    Gui, Add, Text,, ================
    Gui Add, Button, gS8 w100, 开启CEO
    Gui Add, Button, gbullet w100, CEO子弹
    Gui Add, Button, gS4 w100, CEO嗑药
    Gui Add, Button, gS5 w100, CEO幽灵
    Gui Add, Button, gS6 w100, CEO通缉
    Gui Add, Button, gS7 w100, CEO载具
    Gui Add, Button, ghelmet w100, CEO热感
    gui, add, Text, ys ,================
    Gui Add, Button, gS9 w100, 关闭CEO
    Gui Add, Button, gS2 w100, 普通零食
    Gui Add, Button, gS3 w100, 普通盔甲
    Gui Add, Button, gnbullet w100, 普通子弹
    Gui Add, Button, gnhelmet w100, 普通热感
    Gui Add, Button, gS1 w100, 清理刷屏
    Gui Add, Button, gtest w100, 测试专用
    Gui, Show, AutoSize Center
Return

test:
send {alt down}{tab}{alt up}
    Sleep 10
    Send, {M}
    Sleep 100
    Send, {M}
    Sleep 10
send {alt down}{tab}{alt up}
send {alt down}{F4}{alt up}
Return

nhelmet:
send {alt down}{tab}{alt up}
    Sleep 10
    Send, {M}
    Sleep 10
    Send, {Down}
    Sleep 10
    Send, {Down}
    Sleep 10
    Send, {Down}
    Sleep 10
    Send, {Enter}
    Sleep 10
    Send, {Down}
    Sleep 10
    Send, {Enter}
    Sleep 10
    Send, {Down}
    Sleep 10
    Send, {Down}
    Sleep 10
    Send, {Down}
    Sleep 10
    Send, {Down}
    Sleep 10
    Send, {Space}
    Sleep 10
    Send, {M}
    Sleep 10
send {alt down}{tab}{alt up}
send {alt down}{F4}{alt up}
Return

nbullet:
send {alt down}{tab}{alt up}
    Sleep 10
    Send, {M}
    Sleep 10
    Send, {Down}
    Sleep 10
    Send, {Down}
    Sleep 10
    Send, {Enter}
    Sleep 10
    Send, {Down}
    Sleep 10
    Send, {Down}
    Sleep 10
    Send, {Down}
    Sleep 10
    Send, {Enter}  ;进入武器栏
    Send, {Up}
    Sleep 10
    Send, {Enter} ;第一个武器
    Sleep 100
    Loop, 5
    {
        Send, {Up}
        Sleep 10
        Send, {Up}
        Sleep 10
        Send, {Right}
        Send, {Up}
        Sleep 10
        Send, {Up}
        Sleep 10
        Send, {Enter}
        Sleep 100
    }
    Sleep 10
    Send, {M}
    Sleep 10
send {alt down}{tab}{alt up}
send {alt down}{F4}{alt up}
Return

helmet:
send {alt down}{tab}{alt up}
    Sleep 10
    Send, {M}
    Sleep 10
    Send, {Down}
    Sleep 10
    Send, {Down}
    Sleep 10
    Send, {Down}
    Sleep 10
    Send, {Down}
    Sleep 10
    Send, {Enter}
    Sleep 10
    Send, {Down}
    Sleep 10
    Send, {Enter}
    Sleep 10
    Send, {Down}
    Sleep 10
    Send, {Down}
    Sleep 10
    Send, {Down}
    Sleep 10
    Send, {Down}
    Sleep 10
    Send, {Space}
    Sleep 10
    Send, {M}
    Sleep 10
send {alt down}{tab}{alt up}
send {alt down}{F4}{alt up}
Return

bullet:
send {alt down}{tab}{alt up}
    Sleep 10
    Send, {M}
    Sleep 10
    Send, {Down}
    Sleep 10
    Send, {Down}
    Sleep 10
    Send, {Down}
    Sleep 10
    Send, {Enter}
    Sleep 10
    Send, {Down}
    Sleep 10
    Send, {Down}
    Sleep 10
    Send, {Down}
    Sleep 10
    Send, {Enter}  ;进入武器栏
    Send, {Up}
    Sleep 10
    Send, {Enter} ;第一个武器
    Sleep 100
    Loop, 5
    {
        Send, {Up}
        Sleep 10
        Send, {Up}
        Sleep 10
        Send, {Right}
        Send, {Up}
        Sleep 10
        Send, {Up}
        Sleep 10
        Send, {Enter}
        Sleep 100
    }
    Sleep 10
    Send, {M}
    Sleep 10
send {alt down}{tab}{alt up}
send {alt down}{F4}{alt up}
Return

S1:
send {alt down}{tab}{alt up}
    Loop, 6
    {
        Sleep 10
        Send, {T}
        Sleep 10
        Send, {Space}
        Sleep, 500
        Sleep 10
        Send, {Enter}
    }
    Sleep 10
send {alt down}{tab}{alt up}
send {alt down}{F4}{alt up}
Return

S2:
send {alt down}{tab}{alt up}
    Sleep 10
    Send, {M}
    Sleep 10
    Send, {Down}
    Sleep 10
    Send, {Down}
    Sleep 10
    Send, {Enter}
    Sleep 10
    Send, {Down}
    Sleep 10
    Send, {Down}
    Sleep 10
    Send, {Enter}
    Sleep 10
send {alt down}{tab}{alt up}
send {alt down}{F4}{alt up}
Return

S3:
send {alt down}{tab}{alt up}
    Sleep 10
    Send, {M}
    Sleep 10
    Send, {Down}
    Sleep 10
    Send, {Down}
    Sleep 10
    Send, {Enter}
    Sleep 10
    Send, {Down}
    Sleep 10
    Send, {Enter}
    Sleep 10
    Send, {Down}
    Sleep 10
    Send, {Down}
    Sleep 10
    Send, {Down}
    Sleep 10
    Send, {Down}
    Sleep 10
send {alt down}{tab}{alt up}
send {alt down}{F4}{alt up}
Return

S4:
send {alt down}{tab}{alt up}
        Sleep 10
        Send, {M}
        Sleep 10
        Send, {Enter}
        Sleep 10
        Send, {Down}
        Sleep 10
        Send, {Down}
        Sleep 10
        Send, {Down}
        Sleep 10
        Send, {Down}
        Sleep 10
        Send, {Enter}
        Sleep 10
        Send, {Down}
        Sleep 10
        Send, {Enter}
        Sleep 10
send {alt down}{tab}{alt up}
send {alt down}{F4}{alt up}
Return
 
S5:
send {alt down}{tab}{alt up}
        Sleep 10
        Send, {M}
        Sleep 10
        Send, {Enter}
        Sleep 10
        Send, {Down}
        Sleep 10
        Send, {Down}
        Sleep 10
        Send, {Down}
        Sleep 10
        Send, {Down}
        Sleep 10
        Send, {Enter}
        Sleep 10
        Send, {Down}
        Sleep 10
        Send, {Down}
        Sleep 10
        Send, {Down}
        Sleep 10
        Send, {Down}
        Sleep 10
        Send, {Enter}
        Sleep 10
send {alt down}{tab}{alt up}
send {alt down}{F4}{alt up}
Return

S6:
send {alt down}{tab}{alt up}
        Sleep 10
        Send, {M}
        Sleep 10
        Send, {Enter}
        Sleep 10
        Send, {Down}
        Sleep 10
        Send, {Down}
        Sleep 10
        Send, {Down}
        Sleep 10
        Send, {Down}
        Sleep 10
        Send, {Enter}
        Sleep 10
        Send, {Down}
        Sleep 10
        Send, {Down}
        Sleep 10
        Send, {Down}
        Sleep 10
        Send, {Down}
        Sleep 10
        Send, {Down}
        Sleep 10
        Send, {Enter}
        Sleep 10
send {alt down}{tab}{alt up}
send {alt down}{F4}{alt up}
Return

S7:
send {alt down}{tab}{alt up}
        Sleep 10
        Send, {M}
        Sleep 10
        Send, {Enter}
        Sleep 10
        Send, {Down}
        Sleep 10
        Send, {Down}
        Sleep 10
        Send, {Down}
        Sleep 10
        Send, {Down}
        Sleep 10
        Send, {Down}
        Sleep 10
        Send, {Enter}
        Sleep 10
        Send, {Down}
        Sleep 10
        Send, {Down}
        Sleep 10
        Send, {Down}
        Sleep 10
        Send, {Down}
        Sleep 10
        Send, {Enter}
        Sleep 10
send {alt down}{tab}{alt up}
send {alt down}{F4}{alt up}
Return

S8:
send {alt down}{tab}{alt up}
        Sleep 10
        Send, {M}
        Loop, 6
        {
            Sleep 10
            Send, {Down}
        }
        Sleep 10
        Send, {Enter}
        Sleep 10
        Send, {Enter}
        Sleep 10
send {alt down}{tab}{alt up}
send {alt down}{F4}{alt up}
Return

S9:
send {alt down}{tab}{alt up}
        Sleep 10
        Send, {M}
        Sleep 10
        Send, {Enter}
        Sleep 10
        Send, {Up}
        Sleep 10
        Send, {Enter}
        Sleep 10
send {alt down}{tab}{alt up}
send {alt down}{F4}{alt up}
Return
 