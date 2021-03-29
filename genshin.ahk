;原神音乐脚本，需要用管理员模式运行
~Space & c:: 
    Gui, Destroy
    Gui +AlwaysOnTop
    Gui, Add, Text,, ================
    Gui Add, Button, g生日快乐 w100, 生日快乐
    gui, add, Text, ys ,================
    Gui Add, Button, ggithub w100, 项目地址
    Gui, Show, AutoSize Center
Return

;BBNBAM BBNBSA BBGDAMN FFDASA
github:
    Run, https://github.com/lzdnico/MyAHKScript
    Return

生日快乐:
    WinActivate, ahk_exe YuanShen.exe
    Sleep 1000  
    Loop 1
    { 
        mysend("B")
        mysend("B")
        mysend("N")
        mysend("B")
        mysend("A")
        mysend("M") 
        Sleep 500
        mysend("B")
        mysend("B")
        mysend("N")
        mysend("B")
        mysend("S")
        mysend("A")         
        Sleep 500
        mysend("B")
        mysend("B")
        mysend("G")
        mysend("D")
        mysend("A")
        mysend("M")    
        mysend("N")    
        Sleep 500
        mysend("F")
        mysend("F")
        mysend("D") 
        mysend("A")
        mysend("S")
        mysend("A")  
        Sleep 5000 
    }  
    ;WinActivate, ahk_exe genshinahk.exe                ;生成的exe一定要是这个名称
    ;WinClose
Return


mysend(key){ 

    Send {%key% down} 
    Sleep 500 ; 试试不同的毫秒数  
    Send {%key% up}
}
      