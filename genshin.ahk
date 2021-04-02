;原神音乐脚本，需要用管理员模式运行
;部分脚本来源：https://space.bilibili.com/12586633
;anser='mysend_test("'
;for i in "F F F D D D S S S G S D ":
;    anser+=i+','
;anser+='","350")'
;print(anser)
#Persistent 
Goto,页面

页面:
Gui, Destroy
Gui, Add, Text,, ================
Gui Add, Button, g生日快乐 w100, 生日歌
Gui Add, Button, g彩虹 w100, 彩虹
Gui Add, Button, g突然好想你 w100, 突然好想你
Gui Add, Button, g卡农 w100, 卡农
Gui Add, Button, g无垠之白 w100, 无垠之白
Gui Add, Button, g葫芦娃 w100, 葫芦娃
Gui Add, Button, g南山南 w100, 南山南
gui, add, Text, ys ,================
Gui Add, Button, ggithub  w100, 项目地址
Gui, Show, AutoSize Center
Return


github:
    Run, https://github.com/lzdnico/MyAHKScript
    Return

无垠之白:
    keymusic:=[]
    Music:="AE, ,G, ,E, ,G, ,E, ,G, ,E, ,R,----,ME, ,G, ,E, ,G, ,E, ,G, ,Q, ,W,----,NE, ,G, ,E, ,G, ,E, ,G, ,R, ,G,----,BT, ,G, ,R, ,G, ,E, ,G, ,W,-=-,VQ, ,G, ,Q, ,G, ,Q, ,G, ,W,-=-,CQ, ,G, ,Q, ,G, ,Q, ,G, ,T,-=-,XQ, ,G, ,Q, ,W, ,E, ,WEWQ, ,G, ,BQ, ,G, ,Q, ,W, ,E, ,WEWQ, ,W, ,AE, ,G, ,E, ,G, ,E, ,G, ,E, ,R, ,ME, ,G, ,E, ,G, ,E, ,G, ,Q, ,W, ,NE, ,G, ,E, ,G, ,E, ,G, ,E, ,R, ,BT, ,G, ,Q, ,G, ,T, ,RTRE, ,W,----,VQ, ,G, ,Q, ,G, ,Q, ,G, ,T,-=-,CG, ,Q, ,T, ,R, ,E, ,WEWQ, ,G,----,XQ, ,G, ,Q, ,W, ,E, ,WEWQ, ,G,----,BQ, ,G, ,Q, ,T, ,R, ,E, ,WQZQ"
    WinActivate, ahk_exe YuanShen.exe
    loop, Parse, Music, `,
    {
        keymusic[A_Index] := A_LoopField
    }
		for key,value in keymusic
		{

			if value=WEWQ
			{
				Send w
				Sleep 105
				Send e
				Sleep 105
				Send w
				Sleep 105
				Send q
				Sleep 161
				continue
			}
			if value=RTRE
			{
				Send r
				Sleep 105
				Send t
				Sleep 105
				Send r
				Sleep 105
				Send e
				Sleep 161
				continue
			}
			if value=WQZQ
			{
				Send w
				Sleep 340
				loop 2
				{
					Send q
					Sleep 15
				}
				Sleep 450
				loop 2
				{
					Send qz
					Sleep 15
				}
				continue
			}
			if value=----
			{
				Sleep 185
				continue
			}
			if value=-=-
			{
				Sleep 570
				continue
			}
			if value=====
			{
				Sleep 260
				continue
			}

			{
				Send,%value%
				Sleep,161
			}

	}
return

南山南:
    WinActivate, ahk_exe YuanShen.exe
    ;WinActivate, ahk_exe notepad.exe
    Sleep 1000  
    mysend_test("H,H,H,F,F,H,E,W, ,E,J,G,Q, ,","350")
    mysend_test("F,F,F,D,D,D,S,S, ,S,G,S,D, ,","350")
    mysend_test("G,G,H,H,H,F,H,H,E, ,W,Q,W,E,J,J,J,G,Q, ,","350")
    mysend_test("D,D,F,F, ,A,S,S, ,A,M,A, ,","350") 
    mysend_test("B,G,S,S,A,S,S,S,S,S,S,A, ,","350")
    mysend_test("F,D,F,F, ,F,D,S,S, ,A,D, ,","350")
    mysend_test("B,B,G,S,S,A,S,S, ,A,S,A, ,","350")
    mysend_test("F,D,F, ,F,D,D,S,S,A,M,M,A, ,","350")
    mysend_test("G,G,H,H,H,H,H,H,F,H,E,W, ,","350")
    mysend_test("Q,Q,W,E,J,J,J,G,Q, ,","350")
    mysend_test("F,F,F,D,D,S,S,G,H,D, ,","350")
    mysend_test("G,G,H,H,H,H, ,F,G,E,W, ,","350")
    mysend_test("Q,Q,W,E,E,E,E,E,E,H, ,","350")
    mysend_test("F,F,F, ,F,D,S, ,M,A,","350")
    TrayTip % Format("📢通知📢"),弹奏南山南结束
Return

葫芦娃:
    WinActivate, ahk_exe YuanShen.exe
    ;WinActivate, ahk_exe notepad.exe
    Sleep 1000  
    mysend_test("A,A,D, ,A,A,D, ,H,H,H,G,H,G,A,D, ,","350")
    mysend_test("Q,H,G,H, ,G,A,S, ,J,G,D,G, ,","350")
    mysend_test("Q,Q,H,H,G,G,H,H,G,A,D, ,","350")
    mysend_test("Q,Q,H,H,G,G,H,H,G,A,S, ,","350")
    mysend_test("D,A,N,A, ,D,G,H, ,D,G,H, ,Q,J,G,H,","350")
    TrayTip % Format("📢通知📢"),弹奏葫芦娃结束
    ;WinActivate, ahk_exe genshinahk.exe                ;生成的exe一定要是这个名称
    ;WinClose
Return

卡农:
    WinActivate, ahk_exe YuanShen.exe
    ;WinActivate, ahk_exe notepad.exe
    Sleep 1000  
    mysend_test("A,D,G,Q, ,B,S,G,J, ,N,A,D,H, ,C,M,D,G, ,","350")
    mysend_test("V,N,A,F, ,Z,B,A,D, ,V,N,A,F, ,B,M,S,G, ,","350")

    mysend_test("EA,D,G,Q, ,WB,M,S,G, ,QN,A,D,H, ,","350")
    mysend_test("JC,B,M,D, ,HV,N,A,F, ,GZ,C,B,A, ,","350")
    mysend_test("HV,N,A,F, ,JB,M,S,G, ,EZ,C,N,A, ,","350")
    mysend_test("WB,M,S,G, ,QN,A,D,A, ,JC,B,M,D, ,","350")
    mysend_test("HV,N,A,N, ,GZ,C,B,A, ,HV,N,A,N, ,","350")
    mysend_test("JB,M,S, ,","350")

    mysend_test("QZ,J,Q,A, ,JX,G,S,D, ,AN,Q,J,H, ,","350")
    mysend_test("JC,E,T,Y, ,RV,E,W,R, ,EZ,W,Q,J, ,","350")
    mysend_test("HV,G,F,D, ,SB,F,D,S, ,QZ,S,D,F, ,","350")
    mysend_test("JB,S,G,F, ,DN,H,G,F, ,GC,F,D,S, ,","350")
    mysend_test("AV,N,H,J, ,QZ,J,H,G, ,FV,D,S,H, ,","350")
    mysend_test("GB,H,G, ,","350")

    Loop 2
    {
        mysend_test("TA,E,R,T, ,E,R, ,TB,G,H,J,Q,W,E,R, ,","350")
        mysend_test("EN,Q,W,E, ,D,F, ,GC,H,G,F,G,D,F,G, ,","300")
        mysend_test("FV,H,G,F, ,D,S, ,DZ,S,A,S,D,F,G,H, ,","350")
        mysend_test("FV,H,G,F, ,J,Q, ,GB,H,J,Q,W,E,R,T, ,","300")    
    }   
    mysend_test("EZ,C,B,A, ,WB,M,S,G, ,QN,A,D,H, ,","350")
    mysend_test("JC,B,M,D, ,HV,N,A,F, ,GZ,C,B,A, ,","350")
    mysend_test("HV,N,WA,F, ,JB,M,WS,G, ,EZ,","350")      
    TrayTip % Format("📢通知📢"),弹奏卡农结束
Return

生日快乐:
    WinActivate, ahk_exe YuanShen.exe
    ;WinActivate, ahk_exe notepad.exe
    Sleep 1000  
    mysend_test("B,N,B,A,M, ,B,B,N,B,S,A, ,B,B,G,D,A,M,N, ,F,F,D,A,S,A,","350")
    TrayTip % Format("📢通知📢"),弹奏生日歌结束
Return

彩虹:
    WinActivate, ahk_exe YuanShen.exe
    Sleep 1000  
    mysend_test("D,D,D,D,F,G,G,Q, ,A,S,D,D,D,D,D,H,J,W,Q, ,H,H,H,H,J,Q,W, ,G, ,","350")
    mysend_test("Q,W,E,E,E,W,W,Q,E,W, ,S,D,D,D,D,F,G,G,Q, ,","350")
    mysend_test("Q,W,E,E,E,R,E,W,J,W,Q, ,J,H, H,H, ,H,J,Q,W, ,G, ,G,Q,W,E, ,H,H,H,E,R,E,W, ,","350")
    mysend_test("G, ,R,E,W,Q,Q,Q,J,Q,W,E,G, ,G,Q,J,H,G,G,F, ,D,S, ,D,F,G, ,G,G,G,H, ,H,G,H,J,D,Q, ,","350")
    mysend_test("Q,J,Q,W, ,W,W,Q,E,R,W, ,G,F,G,E, ,E,R,E,W,J,Q, Q,J,Q,T, ,T,R,E,W,E,E, ,G,F,G,E, ,E, ,R,E,W,J,Q,W,E,U,Y,","350")
    TrayTip % Format("📢通知📢"),弹奏彩虹结束
Return

突然好想你:
    WinActivate, ahk_exe YuanShen.exe
    Sleep 1000  
    mysend_test("B,D,D,A,S,A,M,A, ,A,F,F,D,F,D,F,G,S, ,A,M,A,H,H,J,W,Q,J,H,G,G,H,D,A,J,M,A,G,G,G,F,N,M,A, ,","350")
    mysend_test("B,D,D,A,S,A,M,A, ,A,D,D,D,F,D,F,G,S, ,A,M,A,H,H,J,W,Q,J,H,G,G,H,D,A,J,M,A,G,G,G,F,N,M,A, ,","350")
    mysend_test("H,J,Q,E,W,Q,W,G,W,Q,H,J,Q,E,W,Q,E, ,H,J,Q,E,W,T,W,R,E,W,E, ,W,Q,H,J,Q,E,W,Q,Q, ,","350")
    mysend_test("B,D,D,D,A,S,D,F,D,M,A, ,A,F,F,D,F,D,F,G,S, ,A,M,A,H, ,H,J,W,Q,J,H,G,G,H,D,A,J,A,G,G,G,F,E,E,W,Q, ,","350")
    mysend_test("H,J,Q,E,W,Q,W,G,W,Q,H,J,Q,E,W,Q,E, ,H,J,Q,E,W,T,W,R,E,W,E, ,W,Q,H,J,Q,E,W,Q,Q,","350")
    TrayTip % Format("📢通知📢"),弹奏突然好想你结束
Return

mysend(key,delay){ 
Loop, Parse, key
{
    Send {%A_LoopField%} 
    Sleep %delay% ; 试试不同的毫秒数  
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

mysend_test(mymusic,delay)
{
    keymusic := []
    loop, Parse, mymusic, `,
    {
        keymusic[A_Index] := A_LoopField
    }  
    for key,value in keymusic
    {
        Send,%value%
        Sleep,%delay%      
    }
}

F5::Reload

F1::Pause