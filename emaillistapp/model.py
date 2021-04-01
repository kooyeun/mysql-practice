from MySQLdb import connect,OperationalError
from MySQLdb.cursors import DictCursor


def findall():
    try:
        # connection
        db = conn()

        # cusor
        cursor = db.cursor(DictCursor)

        # SQL
        sql = 'select no,first_name,last_name,email from emaillist order by no desc'
        cursor.execute(sql)

        # result
        results = cursor.fetchall()

        #
        cursor.close()
        db.close()

        #
        return results

    except OperationalError as e:
        print(f'error : {e}')


def insert(firstname,lastname,email):
    try:
        # connection
        db = conn()

        # cusor
        cursor = db.cursor()

        # SQL
        sql = "insert into emaillist values(null,%s,%s,%s)"
        count = cursor.execute(sql,(firstname,lastname,email))

        # commit
        db.commit()

        #
        cursor.close()
        db.close()

        #
        return count == 1

    except OperationalError as e:
        print(f'error : {e}')


def deletebyemail(email):
    try:
        # connection
        db = conn()

        # cusor
        cursor = db.cursor()

        # SQL
        sql = 'delete from emaillist where email=%s'
        count = cursor.execute(sql, (email,))

        # commit
        db.commit()

        #
        cursor.close()
        db.close()

        #
        return count == 1

    except OperationalError as e:
        print(f'error : {e}')

def conn():
    return connect(user='webdb',
                     password='webdb',
                     host='localhost',
                     port=3306,
                     db='webdb',
                     charset='utf8')