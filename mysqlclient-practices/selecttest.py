
from MySQLdb import connect, OperationalError
from MySQLdb.cursors import DictCursor


try:
    # connection
    db = connect(user='webdb',
                password='webdb',
                host='localhost',
                port=3306,
                db='webdb',
                charset='utf8')

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
    for result in results:
        print(result)

except OperationalError as e:
    print(f'error : {e}')
