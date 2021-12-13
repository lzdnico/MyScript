import xlrd
import xlwt
from xlwt.Worksheet import Worksheet

#读数据

xlsx = xlrd.open_workbook('C:/github/MyAHKScript/Python/Excel/test.xlsx')

table = xlsx.sheet_by_index(0)

#table = xlsx.sheet_by_name('sheet名称')

print(table.cell_value(0,0))

print(table.cell(0,0).value)

print(table.row(0)[0].value)

#写数据

new_Workbook = xlwt.Workbook()

Worksheet = new_Workbook.add_sheet('sheet1')

Worksheet.write(2,0,'李四')

new_Workbook.save('C:/github/MyAHKScript/Python/Excel/test.xls')

