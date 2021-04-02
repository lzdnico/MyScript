;原神音乐脚本，需要用管理员模式运行
Gui, Destroy
Gui +AlwaysOnTop
Gui, Add, Text,, ================
Gui Add, Button, g生日快乐 w100, 生日歌
Gui Add, Button, g彩虹 w100, 彩虹
Gui Add, Button, g突然好想你 w100, 突然好想你
Gui Add, Button, g卡农 w100, 卡农
Gui Add, Button, g测试 w100, 测试
gui, add, Text, ys ,================
Gui Add, Button, g葫芦娃 w100, 葫芦娃
Gui Add, Button, ggithub w100, 项目地址
Gui, Show, AutoSize Center
Return

github:
    Run, https://github.com/lzdnico/MyAHKScript
    Return

测试:
    WinActivate, ahk_exe YuanShen.exe
    Sleep 1000
    Loop 5
    {
    mysend_sync("wsx","500")
    Sleep 500
    mysend_sync("qaz","500")
    Sleep 500
    }
Return

葫芦娃:
    WinActivate, ahk_exe YuanShen.exe
    ;WinActivate, ahk_exe notepad.exe
    Sleep 1000  
    Loop 1
    { 
        mysend("AAD AAD HHHGHGAD","350")
        mysend("QHGH GAS JGDG","250")
        mysend("QQHHGGHHGAD","200")
        mysend("QQHHGGHHGAS","200")
        mysend("DANA DGH DGH QJGH","350")
        Sleep 5000 
    }  
    ;WinActivate, ahk_exe genshinahk.exe                ;生成的exe一定要是这个名称
    ;WinClose
Return

卡农:
    WinActivate, ahk_exe YuanShen.exe
    ;WinActivate, ahk_exe notepad.exe
    Sleep 1000  
    Loop 1
    { 
        ;mysend("ADGQ BSGJ NADH CMDG ","350")

        ;mysend("VNAF ZBAD VNAF BMSG ","350")

        mysend_sync("EA","300")
        mysend("DGQ ","300")
        mysend_sync("WB","300")
        mysend("MSG ","300")
        mysend_sync("QN","300")
        mysend("ADH ","300")

        mysend_sync("JC","300")
        mysend("BMD ","300")
        mysend_sync("HV","300")
        mysend("NAF ","300")
        mysend_sync("GZ","300")
        mysend("CBA ","300")

        mysend_sync("HV","250")
        mysend("NAF ","250")
        mysend_sync("JB","250")
        mysend("MSG ","250")
        mysend_sync("EZ","250")
        mysend("CNA ","250")

        mysend_sync("WB","250")
        mysend("MSG ","250")
        mysend_sync("QN","250")
        mysend("ADA ","250")
        mysend_sync("JC","250")
        mysend("BMD ","250")        

        mysend_sync("HV","250")
        mysend("NAN ","250")
        mysend_sync("GZ","250")
        mysend("CBA ","250")
        mysend_sync("HV","250")
        mysend("NAN ","250")       

        mysend_sync("JB","350")
        mysend("MS ","350") 

        Sleep 500

        mysend_sync("QZ","200")
        mysend("JQA ","200")
        mysend_sync("JX","200")
        mysend("GSD ","200")
        mysend_sync("AN","200")
        mysend("QJH ","200") 

        mysend_sync("JC","200")
        mysend("ETY ","200")
        mysend_sync("RV","200")
        mysend("EWR ","200")
        mysend_sync("EZ","200")
        mysend("WQJ ","200") 

        mysend_sync("HV","200")
        mysend("GFD ","200")
        mysend_sync("SB","200")
        mysend("FDS ","200")
        mysend_sync("QZ","200")
        mysend("SDF ","200") 

        mysend_sync("JB","200")
        mysend("SGF ","200")
        mysend_sync("DN","200")
        mysend("HGF ","200")
        mysend_sync("GC","200")
        mysend("FDS ","200") 

        mysend_sync("AV","200")
        mysend("NHJ ","200")
        mysend_sync("QZ","200")
        mysend("JHG ","200")
        mysend_sync("FV","200")
        mysend("DSH ","200") 

        mysend_sync("GB","350")
        mysend("HG ","350") 

        Sleep 500 

        Loop 2
        {
            mysend_sync("TA","350")
            mysend("ERT ER","350")
            mysend_sync("TB","350")
            mysend("GHJQWER ","350")

            mysend_sync("EN","350")
            mysend("QWE DF","350")
            mysend_sync("GC","350")
            mysend("HGF GDFG ","350")

            mysend_sync("FV","350")
            mysend("HGF DS","350")
            mysend_sync("DZ","350")
            mysend("SASDFGH ","350")

            mysend_sync("FV","350")
            mysend("HGF JQ","350")
            mysend_sync("GB","350")
            mysend("HJQWERT ","350")         
        }    

        Sleep 500

        mysend_sync("EZ","350")
        mysend("CBA ","350")
        mysend_sync("WB","350")
        mysend("MSG ","350")
        mysend_sync("QN","350")
        mysend("ADH ","350")    

    }  
    ;WinActivate, ahk_exe genshinahk.exe                ;生成的exe一定要是这个名称
    ;WinClose
Return

生日快乐:
    WinActivate, ahk_exe YuanShen.exe
    ;WinActivate, ahk_exe notepad.exe
    Sleep 1000  
    Loop 1
    { 
        mysend("BNBAM BBNBSA BBGDAMN FFDASA","350")
        Sleep 5000 
    }  
    ;WinActivate, ahk_exe genshinahk.exe                ;生成的exe一定要是这个名称
    ;WinClose
Return

彩虹:
    WinActivate, ahk_exe YuanShen.exe
    ;WinActivate, ahk_exe notepad.exe
    Sleep 1000  
    Loop 1
    { 
        mysend("DDDDFGGQ ASDDDDDHJWQ HHHHJQW G ","350")
        mysend("QWEEEWWQEW SDDDDFGGQ ","350")
        mysend("QWEEEREWJWQ JH HH HJQW G GQWE HHHEREW ","350")
        mysend("G REWQQQJQWEG GQJHGGF DS DFG GGGH HGHJDQ ","350")
        mysend("QJQW WWQERW GFGE EREWJQ QJQT TREWEE GFGE E REWJQWEUY ","350")
        Sleep 5000 
    }  
    ;WinActivate, ahk_exe genshinahk.exe                ;生成的exe一定要是这个名称
    ;WinClose
Return

突然好想你:
    WinActivate, ahk_exe YuanShen.exe
    ;WinActivate, ahk_exe notepad.exe
    Sleep 1000  
    Loop 1
    { 
        mysend("BDDASAMA AFFDFDFGS AMAHHJWQJHGGHDAJMAGGGFNMA ","350")
        mysend("BDDASAMA ADDDFDFGS AMAHHJWQJHGGHDAJMAGGGFNMA ","350")
        mysend("HJQEWQWGWQHJQEWQE HJQEWTWREWE WQHJQEWQQ","350")
        mysend("BDDDASDFDMA AFFDFDFGS AMAH HJWQJHGGHDAJAGGGFEEWQ","350")
        mysend("HJQEWQWGWQHJQEWQE HJQEWTWREWE WQHJQEWQQ","350")
        Sleep 5000 
    }  
    ;WinActivate, ahk_exe genshinahk.exe                ;生成的exe一定要是这个名称
    ;WinClose
Return

mysend(key,delay){ 
Loop, Parse, key
{
    if (A_LoopField = " ")
    {
        Sleep 500
    }
    Else
    {
        Send {%A_LoopField% down} 
        Sleep %delay% ; 试试不同的毫秒数  
        Send {%A_LoopField% up}
    }
}
}
      
mysend_sync(key,delay)
{
    Loop, Parse, key
    {
        Send {%A_LoopField% down}  
    }
    Sleep %delay% ; 试试不同的毫秒数 
    Loop, Parse, key
    {
        Send {%A_LoopField% up}
    }
}
