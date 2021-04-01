
from MySQLdb import connect, OperationalError


try:
    # connection
    db = connect(user='webdb',
                password='webdb',
                host='localhost',
                port=3306,
                db='webdb',
                charset='utf8')

    # cusor
    cursor = db.cursor()

    # SQL
    sql = "insert into emaillist values(null,'마','이콜','micol@naver.com')"
    count = cursor.execute(sql)

    # commit
    db.commit()

    #
    cursor.close()
    db.close()

    #
    print(f'result : {count==1}')

except OperationalError as e:
    print(f'error : {e}')
