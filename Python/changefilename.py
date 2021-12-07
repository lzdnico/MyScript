import os


def Change_File_Name(mypath,split_str,suffix_str):
    
    fileList=os.listdir(mypath)

    for i in fileList:
        try:
            #设置旧文件名（就是路径+文件名）
            oldname = mypath + os.sep + fileList[i]   # os.sep添加系统分隔符

            lens  = len(fileList[i].split(split_str))

            if lens == 2:

                needname = fileList[i].split(split_str)[0]
                
                newname=mypath + os.sep + needname + suffix_str
                
                os.rename(oldname,newname)   #用os模块中的rename方法对文件改名

                print(oldname,'======>',newname)
                      
        except:
            pass 

Change_File_Name("D:/GitHub/Python/test/",".doc","测试.doc")