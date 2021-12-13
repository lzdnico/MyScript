from xlutils.copy import copy
import xlrd
import xlwt
from xlwt.Formatting import Alignment, Borders

tem_excel = xlrd.open_workbook('C:/github/MyAHKScript/Python/Excel/模板.xls',formatting_info=True)
tem_sheet = tem_excel.sheet_by_index(0)

new_excel = copy(tem_excel)
new_sheet = new_excel.get_sheet(0)

#初始化格式
style = xlwt.XFStyle()

#字体
font = xlwt.Font()
font.name = '微软雅黑'
font.bold = True
font.height = 200 #xls字体大小，乘20才是这里设置的大小
style.font = font

#边界
borders = xlwt.Borders()
borders.top = xlwt.Borders.THIN
borders.bottom = xlwt.Borders.THIN
borders.left = xlwt.Borders.THIN
borders.right = xlwt.Borders.THIN 
style.borders = borders

#对齐方式
alignment = xlwt.Alignment()
alignment.horz = xlwt.Alignment.HORZ_CENTER
alignment.vert = xlwt.Alignment.VERT_CENTER
style.alignment = alignment

#写，保存
new_sheet.write(2,1,12,style)
new_sheet.write(3,1,13,style)
new_sheet.write(4,1,14,style)
new_excel.save('C:/github/MyAHKScript/Python/Excel/填写.xls')