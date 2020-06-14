;GUI版GTA宏，空格+C弹出选择菜单。
;Nico主要维护这个。正在使用的也是这个
~Space & c:: 
    Gui, Destroy
    Gui +AlwaysOnTop
    Gui, Add, Text,, ================
    Gui Add, Button, gS8 w100, 开启CEO
    Gui Add, Button, ghide w100, 开关差事
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
    WinActivate, ahk_exe GTA5.exe
    Sleep 10
    Send, {M}
    Sleep 100
    Send, {M}    
    Sleep 10
    WinActivate, ahk_exe gtagui.exe                ;生成的exe一定要是这个名称
    WinClose
Return

hide:
    WinActivate, ahk_exe GTA5.exe
    Sleep 10
    Send, {M}
    Loop, 8
    {
        Send, {Up}
        Sleep 10
    }
    Sleep 10
    Send, {Enter}    
    Sleep 10
    Send, {Enter} 
    Sleep 10
    Send, {Right} 
    Sleep 10
    Send, {M} 
    WinActivate, ahk_exe gtagui.exe                ;生成的exe一定要是这个名称
    WinClose
Return

nhelmet:
    WinActivate, ahk_exe GTA5.exe
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
    WinActivate, ahk_exe gtagui.exe                ;生成的exe一定要是这个名称
    WinClose
Return

nbullet:
    WinActivate, ahk_exe GTA5.exe
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
    WinActivate, ahk_exe gtagui.exe                ;生成的exe一定要是这个名称
    WinClose
Return

helmet:
    WinActivate, ahk_exe GTA5.exe
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
    WinActivate, ahk_exe gtagui.exe                ;生成的exe一定要是这个名称
    WinClose
Return

bullet:
    WinActivate, ahk_exe GTA5.exe
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
    WinActivate, ahk_exe gtagui.exe                ;生成的exe一定要是这个名称
    WinClose
Return

S1:
    WinActivate, ahk_exe GTA5.exe
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
    WinActivate, ahk_exe gtagui.exe                ;生成的exe一定要是这个名称
    WinClose
Return

S2:
    WinActivate, ahk_exe GTA5.exe
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
    WinActivate, ahk_exe gtagui.exe                ;生成的exe一定要是这个名称
    WinClose
Return

S3:
    WinActivate, ahk_exe GTA5.exe
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
    WinActivate, ahk_exe gtagui.exe                ;生成的exe一定要是这个名称
    WinClose
Return

S4:
    WinActivate, ahk_exe GTA5.exe
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
    WinActivate, ahk_exe gtagui.exe                ;生成的exe一定要是这个名称
    WinClose
Return
 
S5:
    WinActivate, ahk_exe GTA5.exe
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
    WinActivate, ahk_exe gtagui.exe                ;生成的exe一定要是这个名称
    WinClose
Return

S6:
    WinActivate, ahk_exe GTA5.exe
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
    WinActivate, ahk_exe gtagui.exe                ;生成的exe一定要是这个名称
    WinClose
Return

S7:
    WinActivate, ahk_exe GTA5.exe
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
    WinActivate, ahk_exe gtagui.exe                ;生成的exe一定要是这个名称
    WinClose
Return

S8:
    WinActivate, ahk_exe GTA5.exe
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
    WinActivate, ahk_exe gtagui.exe                ;生成的exe一定要是这个名称
    WinClose
Return

S9:
    WinActivate, ahk_exe GTA5.exe
        Sleep 10
        Send, {M}
        Sleep 10
        Send, {Enter}
        Sleep 10
        Send, {Up}
        Sleep 10
        Send, {Enter}
        Sleep 10
    WinActivate, ahk_exe gtagui.exe                ;生成的exe一定要是这个名称
    WinClose
Return
 