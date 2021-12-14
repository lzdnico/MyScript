import pymysql

try:
    #连接
    db = pymysql.connect(
        host='127.0.0.1',
        user='root',
        password='X8>yt.cu3clt',
        db='dbtest',
        charset='utf8'
    )
    print('连接成功')
    #创建游标
    cur = db.cursor()

except pymysql.Error as e:
    print(e)

def init():
    #创建表之前先检查是否存在，如果存在则删除
    cur.execute('DROP TABLE IF EXISTS nico')
    #SQL语句
    #sqlQuery = "CREATE TABLE nico(Name CHAR(20) NOT NULL ,Email CHAR(20),Age int )"
    sqlQuery = "CREATE TABLE nico(id int,class CHAR(20), name CHAR(20) NOT NULL, content CHAR(20), proof char(20), number int, done char(20))"
    cur.execute(sqlQuery)       
    for i in range(100):     
        sqlQuery=" INSERT INTO nico (id,class, name, content, proof, number, done) VALUE (%s,%s,%s,%s,%s,%s,%s) "
        value=(i+1,'调试','张三'+str(i),'调试模块'+str(i),'调试记录手册',1,'完成')
        cur.execute(sqlQuery,value)
        db.commit()
        print('done:'+str(i))

    # sqlQuery = "SELECT id FROM nico"
    # try:
    #     cur.execute(sqlQuery)
    #     results=cur.fetchall()
    #     print(len(results))
    #     for row in results:
    #         print(row)
    # except pymysql.Error as e:
    #     print("数据查询失败："+str(e))    

def insert(Name,Email,Age):
    sqlQuery=" INSERT INTO nico (Name, Email, Age) VALUE (%s,%s,%s) "
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
    sqlQuery = "UPDATE nico SET Name= %s WHERE Name=%s"
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
    sqlQuery = "SELECT * FROM nico"
    #sqlQuery = "SELECT Email,Agez FROM nico WHERE Name=%s"
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
    sqlQuery = "DELETE FROM nico where content=%s"
    value = ('硬件开发')
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
    sqlQuery='DROP TABLE IF EXISTS nico'
    cur.execute(sqlQuery)
    print('表删除成功!')  


init()
