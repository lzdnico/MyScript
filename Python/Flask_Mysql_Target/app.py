

from flask import Flask, render_template, request, session
import pymysql.cursors
from sqlalchemy import create_engine,Column,String,Integer,func


app = Flask (__name__)


# 封装SQL语句函数
def func(sql,m='r'):#连接本地mysql数据库 端口号      用户名        密码             数据库名
    py = pymysql.connect(host='127.0.0.1', user='root',password="X8>yt.cu3clt", database='dbtest', charset="utf8", cursorclass=pymysql.cursors.DictCursor)
    cursor = py.cursor()
    try:
        cursor.execute (sql)
        if m == 'r':
            data = cursor.fetchall()
        elif m == 'w':
            py.commit ()
            data = cursor.rowcount
    except:
        data = False
        py.rollback ()
    py.close ()
    return data


# 首页,将mysql中表的值读出并传到网页----查
@app.route ('/')
def index():
    data = func('select * from nico')
    return render_template('sqldate.html',userlist=data)

@app.route("/analysis/")
def ana():#分析相关成绩情况（sql语句）
    math  = func('SELECT AVG(math) AS score_avg FROM nico;')#数学平均分
    math1 = func('select  ( select count(*)  from nico where math >= 90)/(select count(*) from nico) AS pass from dual')#数学及格率
    chinese = func('SELECT AVG(class) AS score_avg FROM nico;')  # 语文平均分
    chinese1 = func('select  ( select count(*)  from nico where class >= 90)/(select count(*) from nico) AS pass from dual')  # 语文及格率（表建错了，class代表语文成绩）
    english = func('SELECT AVG(english) AS score_avg FROM nico;')  # 英语平均分
    english1 = func('select  ( select count(*)  from nico where english >= 90)/(select count(*) from nico) AS pass from dual')  # 英语及格率
    data1 = func('SELECT *from nico where math<90')
    data2 = func('SELECT *from nico where class<90')#数据库表写错了class代表语文
    data3 = func('SELECT *from nico where english<90')
    return render_template('analysis.html',userlist=data1,userlist2=data2,userlist3=data3,MATH=math,math1=math1,chinese=chinese,chinese1=chinese1,english=english,english1=english1)



# 返回到添加操作的界面
@app.route ("/add/")
def ad():
    return render_template ('add.html')


# 接受添加的数据,写入数据库----增
@app.route ("/adds/",methods=["POST"])  # 注意post大写,因为post是通过form.data传数据所以下面用request.form
def adds():
    data = dict (request.form)
    print (data)

    sqlQuery = "SELECT id FROM nico"
    lens = len(func(sqlQuery,m='r'))+1
    data['id']=str(lens)
    print(data)
    
    sql = "insert into nico values ('{id}','{class}','{name}','{content}','{proof}','{number}','{done}')".format (**data)
    #sql = "insert into nico values ('3','{class}','{name}','{content}','{proof}','{number}','{done}')".format (**data)
    res = func (sql,m='w')
    if res:
        return '<script>alert("添加成功");location.href="/";</script>'
    else:
        return '<script>alert("添加失败");location.href="/";</script>'


# 返回到更改界面
@app.route ('/cha')
def ch():
    idd = request.args.get ('id')
    data = func (f'select * from nico where id={idd}')
    return render_template ('cha.html',userlist=data)


# 检察更改的数据并更新数据库----改
@app.route ('/chas/',methods=["POST"])
def chas():
    data = dict (request.form)
    res = func ("update nico set name='{name}',age='{age}',sex='{sex}',class='{banji}',math='{math}',english='{english}',comprehensive='{comprehensive}' where id={id}".format (**data),
                m='w')
    if res:
        return '<script>alert("更新成功");location.href="/";</script>'
    else:
        return '<script>alert("未更新");location.href="/";</script>'


# 删除数据----删
@app.route ('/del')
def de():
    id = request.args.get ('id')
    res = func (f'delete from nico where id={id}',m='w')
    if res:
        return '<script>alert("删除成功");location.href="/";</script>'
    else:
        return '<script>alert("删除失败");location.href="/";</script>'


# 运行
if __name__ == '__main__':
    app.run (debug=True,host='127.0.0.1',port='8080')
