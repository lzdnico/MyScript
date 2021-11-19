import pandas as pd
import numpy as np
import os
import sys
from tkinter import*
import subprocess

#获取文件夹下文件全路径名
def get_files(path):
    try:
        fs = []
        for root, dirs, files in os.walk(path):
            for file in files:
                fs.append(os.path.join(root, file))
        return fs
    except Exception as e:
        print('读取文件错误',e)   

#合并文件D:\GitHub\MyAHK\Python
def merge():
    try:
        files = get_files('./excels')
        arr = []
        for i in files:
            df = pd.read_excel(i)    #读取excel
            df['大类'] = df['大类'].fillna(method='pad') #填充‘大类’
            arr.append(df)
        writer = pd.ExcelWriter('./merge.xlsx')
        pd.concat(arr).to_excel(writer, 'Sheet1', index=False)
        writer.save()
    except Exception as e:
        print('合并文件错误',e)   

#根据大类，子类合并
def sort():
    try:
        stexcel=pd.read_excel('./merge.xlsx')
        stexcel.sort_values(by=['大类','子类','姓名'],inplace=True,ascending=True)
        #print(stexcel)
        stexcel.to_excel('./sort.xlsx')
    except Exception as e:
        print('排序错误',e)   

def openexcel():
    mypath = os.getcwd().replace('\\','/')
    p=subprocess.Popen(mypath+'/bat/openexcel.bat',shell=False)
    p.wait()



if __name__ == '__main__':
    top = Tk()
    top.title('Fast Excel By Nico')
    top.geometry('280x280')
    top.resizable(width=False, height=False)
    #标签控件，显示文本和位图，展示在第一行
    Label(top,text="").grid(row=0, column=1)#靠右
    Label(top,text="").grid(row=1, column=2)#第二行，靠左
    Label(top,text="").grid(row=2, column=3)#靠右
    Label(top,text="").grid(row=3, column=4)#第二行，靠左
   
    C = Button(top, text ="合并", command = merge, width=8, height=2)
    C.grid(row=4, column=4,  padx=5,pady=5)
    B = Button(top, text ="排序", command = sort, width=8, height=2)
    B.grid(row=4, column=5,  padx=5,pady=5)
    D = Button(top, text ="打开", command = openexcel, width=8, height=2)
    D.grid(row=4, column=6, padx=5,pady=5)
    top.mainloop()

