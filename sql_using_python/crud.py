import mysql.connector
mysqldb=mysql.connector.connect(host="localhost", user="root", password="", database="testdataset")
mysqlcursor=mysqldb.cursor()

# TO CREATE THE TABLE
# mysqlcursor.execute("create table studentrecord(rollno int, name varchar(40), marks int)")

# TO INSERT INTO TABLE
'''try:
     mysqlcursor.execute("insert into studentrecord (rollno, name, marks)values(2, 'rohit', 94)")
     mysqldb.commit()
     print("Record inserted into the table successfully")
except:
        mysqldb.rollback()
mysqldb.close()'''

# TO DISPLAY RECORD
'''try:
      mysqlcursor.execute("select * from studentrecord")
      result=mysqlcursor.fetchall()
      for i in result:
            rollno=i[0]
            name=i[1]
            marks=i[2]
            # marks=i[0]
            # name=i[1]
            # print(marks, name)
            print(rollno, name , marks)
except:
        print("Some issue in the code")
mysqlcursor.close()'''

# TO UPDATE THE RECORD
'''try:
     mysqlcursor.execute("update studentrecord set name='Sachin', marks=85 where rollno=1")
     mysqldb.commit()
     print("Record updated")

except:
       mysqldb.rollback()

mysqlcursor.close()'''

# TO DELETE THE RECORD
try:
     mysqlcursor.execute("delete from studentrecord where rollno=1")
     mysqldb.commit()
     print("Record deleted")

except:
       mysqldb.rollback()

mysqlcursor.close()