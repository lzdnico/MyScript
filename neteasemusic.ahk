Process,Exist, cloudmusic.exe ;                         
if ErrorLevel
{   
    MsgBox, 已打开
}
else
{
    MsgBox, 未打开
    Run "cloudmusic.exe" 
}
Return