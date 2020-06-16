;GUI版GTA宏，空格+C弹出选择菜单。
;Nico主要维护这个。正在使用的也是这个
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
    Gui Add, Button, ghide w100, 开关差事
    Gui Add, Button, gS2 w100, 普通零食
    Gui Add, Button, gS3 w100, 普通盔甲
    Gui Add, Button, gnbullet w100, 普通子弹
    Gui Add, Button, gnhelmet w100, 普通热感
    Gui Add, Button, gS1 w100, 清理刷屏
    gui, add, Text, ys ,================
    Gui Add, Button, gkill w100, 自杀
    Gui Add, Button, gtool w100, 技工
    Gui Add, Button, glester w100, 莱斯特
    Gui Add, Button, gbojia w100, 珀加索斯
    Gui Add, Button, gbaoxian w100, 共荣保险
    Gui Add, Button, gmeili w100, 梅利危瑟
    Gui Add, Button, ggithub w100, 项目地址
    Gui, Show, AutoSize Center
Return

github:
    Run, https://github.com/lzdnico/MyAHKScript
    WinActivate, ahk_exe gtagui.exe                ;生成的exe一定要是这个名称
    WinClose
    Return

kill:                                                ;自杀
    WinActivate, ahk_exe GTA5.exe
    Send,{m down}
    Sleep 10
    Send,{m up}
    Sleep 200
    Send,{Up down}
    Sleep 10
    Send,{Up up}
    Sleep 20
    Send,{Up down}
    Sleep 10
    Send,{Up up}
    Sleep 20
    Send,{Enter down}
    Sleep 10
    Send,{Enter up}
    WinActivate, ahk_exe gtagui.exe                ;生成的exe一定要是这个名称
    WinClose
Return

baoxian:                                          ;共荣保险
    WinActivate, ahk_exe GTA5.exe
    Send,{Up down}
    Sleep 10
    Send,{Up up}
    Sleep 800
    Send,{Right down}
    Sleep 10
    Send,{Right up}
    Sleep 20
    Send,{Up down}
    Sleep 10
    Send,{Up up}
    Sleep 20
    Send,{Enter down}
    Sleep 10
    Send,{Enter up}
    Sleep 300
    Send,{Left down}
    Sleep 10
    Send,{Left up}
    Sleep 150
    Send,{Left down}
    Sleep 10
    Send,{Left up}
    Sleep 150
    Send,{Down down}
    Sleep 10
    Send,{Down up}
    Sleep 150
    Send,{Down down}
    Sleep 10
    Send,{Down up}
    Sleep 150
    Send,{Enter down}
    Sleep 10
    WinActivate, ahk_exe gtagui.exe                ;生成的exe一定要是这个名称
    WinClose
Return

meili:                                             ;梅利威
    WinActivate, ahk_exe GTA5.exe
    Send,{Up down}
    Sleep 10
    Send,{Up up}
    Sleep 800
    Send,{Right down}
    Sleep 10
    Send,{Right up}
    Sleep 20
    Send,{Up down}
    Sleep 10
    Send,{Up up}
    Sleep 20
    Send,{Enter down}
    Sleep 10
    Send,{Enter up}
    Sleep 300
    Send,{Left down}
    Sleep 10
    Send,{Left up}
    Sleep 150
    Send,{Left down}
    Sleep 10
    Send,{Left up}
    Sleep 150
    Send,{Down down}
    Sleep 10
    Send,{Down up}
    Sleep 150
    Send,{Enter down}
    Sleep 10
    WinActivate, ahk_exe gtagui.exe                ;生成的exe一定要是这个名称
    WinClose
Return

tool:                                              ;技工
    WinActivate, ahk_exe GTA5.exe
    Send,{Up down}
    Sleep 10
    Send,{Up up}
    Sleep 800
    Send,{Right down}
    Sleep 10
    Send,{Right up}
    Sleep 20
    Send,{Up down}
    Sleep 10
    Send,{Up up}
    Sleep 20
    Send,{Enter down}
    Sleep 10
    Send,{Enter up}
    Sleep 300
    Send,{Left down}
    Sleep 10
    Send,{Left up}
    Sleep 150
    Send,{Left down}
    Sleep 10
    Send,{Left up}
    Sleep 150
    Send,{Enter down}
    Sleep 10
    WinActivate, ahk_exe gtagui.exe                ;生成的exe一定要是这个名称
    WinClose
Return

bojia:                                            ;军用载具
    WinActivate, ahk_exe GTA5.exe
    Send,{Up down}
    Sleep 10
    Send,{Up up}
    Sleep 500
    Send,{Right down}
    Sleep 10
    Send,{Right up}
    Sleep 20
   Send,{Up down}
    Sleep 10
    Send,{Up up}
    Sleep 20
    Send,{Enter down}
    Sleep 10
    Send,{Enter up}
    Sleep 300
    Send,{Left down}
    Sleep 10
    Send,{Left up}
    Sleep 150
    Send,{Up down}
    Sleep 20
    Send,{Up up}
    Sleep 10
    Send,{Enter down}
    Sleep 10
    WinActivate, ahk_exe gtagui.exe                ;生成的exe一定要是这个名称
    WinClose
Return

lester:                                         ;莱斯特
    WinActivate, ahk_exe GTA5.exe
    Send,{Up down}
    Sleep 10
    Send,{Up up}
    Sleep 500
    Send,{Right down}
    Sleep 10
    Send,{Right up}
    Sleep 20
   Send,{Up down}
    Sleep 10
    Send,{Up up}
    Sleep 20
    Send,{Enter down}
    Sleep 10
    Send,{Enter up}
    Sleep 300
    Send,{Left down}
    Sleep 10
    Send,{Left up}
    Sleep 150
    Send,{Left down}
    Sleep 10
    Send,{Left up}
    Sleep 150
    Send,{Left down}
    Sleep 10
    Send,{Left up}
    Sleep 150
    Send,{Down down}
    Sleep 20
    Send,{Down up}
    Sleep 10
    Send,{Enter down}
    Sleep 10
    WinActivate, ahk_exe gtagui.exe                ;生成的exe一定要是这个名称
    WinClose
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

hide:                                              ;开关差事
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

nhelmet:                                           ;普通热感                 
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
    Send, {M}
    Sleep 10
    WinActivate, ahk_exe gtagui.exe                ;生成的exe一定要是这个名称
    WinClose
Return

nbullet:                                        ;普通子弹
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

helmet:                                    ;CEO热感
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
    Send, {M}
    Sleep 10
    WinActivate, ahk_exe gtagui.exe                ;生成的exe一定要是这个名称
    WinClose
Return

bullet:                                          ;CEO子弹
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

S1:                                                  ;刷屏
    WinActivate, ahk_exe GTA5.exe
    Loop, 6
    {
        Sleep 10
        Send, {T}
        Sleep 10
        Send, {Space}                               
        Sleep, 500                                   ;定义刷屏间隔
        Sleep 10
        Send, {Enter}
    }
    Sleep 10
    WinActivate, ahk_exe gtagui.exe                ;生成的exe一定要是这个名称
    WinClose
Return

S2:                                                ;普通零食
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

S3:                                                 ;普通盔甲
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

S4:                                               ;CEO嗑药
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
 
S5:                                               ;CEO幽灵
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

S6:                                             ;CEO通缉
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

S7:                                                ;CEO小鸟载具
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

S8:                                                ;开启CEO
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

S9:                                                ;关闭CEO
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
 