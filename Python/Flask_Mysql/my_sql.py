import pymysql

try:
    #连接
    db = pymysql.connect(
        host='127.0.0.1',
        user='root',
        password='/YIolNyWj1MS',
        db='dbtest',
        charset='utf8'
    )
    print('连接成功')
    #创建游标
    cur = db.cursor()
    #创建表之前先检查是否存在，如果存在则删除
    #cur.execute('DROP TABLE IF EXISTS Student')

    #SQL语句
    #sqlQuery = "CREATE TABLE Student(Name CHAR(20) NOT NULL ,Email CHAR(20),Age int )"
    #cur.execute(sqlQuery)       
except pymysql.Error as e:
    print(e)


def insert(Name,Email,Age):
    sqlQuery=" INSERT INTO Student (Name, Email, Age) VALUE (%s,%s,%s) "
    value=(Name,Email,Age)
    try:
        cur.execute(sqlQuery,value)
        db.commit()
        print('数据插入成功！')
    except pymysql.Error as e:
        print("数据插入失败："+e )
        db.rollback()

def update():
    #更新表中数据
    sqlQuery = "UPDATE Student SET Name= %s WHERE Name=%s"
    value = ('John', 'updated name')
    try:
        cur.execute(sqlQuery, value)
        db.commit()
        print('数据更新成功！')
    except pymysql.Error as e:
        print("数据更新失败："+str(e))
        # 发生错误时回滚
        db.rollback()

def get():
    #查询表中数据
    sqlQuery = "SELECT * FROM Student"
    try:
        cur.execute(sqlQuery)
        results=cur.fetchall()
        for row in results:
            name=row[0]
            email=row[1]
            age=row[2]
            print('Name:%s,Email:%s,Age:%s'%(name,email,age))
    except pymysql.Error as e:
        print("数据查询失败："+str(e))    

def delete():
    #删除表中的数据
    sqlQuery = "DELETE FROM Student where Name=%s"
    value = ('John')
    try:
        cur.execute(sqlQuery, value)
        db.commit()
        print('Date Deleted Successfully')
    except pymysql.Error as e:
        print("数据删除失败："+str(e))
        # 发生错误时回滚
        db.rollback()   

def deletetable():
    #删除一张表
    sqlQuery='DROP TABLE IF EXISTS Student'
    cur.execute(sqlQuery)
    print('表删除成功!')  


insert('Mike3','123456@163.com',20)

insert('Mike4','123456@163.com',20)

insert('Mike','123456@163.com',20)

get()