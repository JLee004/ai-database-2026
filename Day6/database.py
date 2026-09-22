## Sync PostgreSQL database
import psycopg
# from psycopg.rows import dict_row

# Def function
def get_connection():
    return psycopg.connect(
        host='localhost', # 127.0.0.1 과 동일
        port=5432,
        dbname='ai_db',
        user='postgres',
        password='123456'
    )
