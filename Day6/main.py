#main.py = FastAPI related
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel

#database we created
from database import get_connection
from psycopg.rows import dict_row

app = FastAPI(title='sync FastAPI DB')

class StudentModel(BaseModel):
    name: str
    email: str | None = None
    age: int  | None = None
    major: str 

# Retrival all students
@app.get('/students')
def get_students():
    conn = get_connection()
    cursor = conn.cursor(row_factory=dict_row) # Pointing each row like mouse cursor
    try: 
        #Copy
        cursor.execute("""
            select id, name, email, age, major, created_at
             from students 
            order by id
        """)

        students = cursor.fetchall()

        if students is None:
            raise HTTPException(status_code=404, detail='Student not found')
        
        return students

    # except

    finally:
        cursor.close()    
        conn.close() #Always close DB connection regardless of exception

# Retrieval one student
@app.get('/students/{id}')
def get_student(id:int):
    conn  = get_connection()
    cursor = conn.cursor(row_factory=dict_row)

    try:
        #Execute Query, 
        cursor.execute("""
            select id, name, email, age, major, created_at
             from students
            where id = %s
        """,(id, ) )

        student = cursor.fetchone() #retrieve one data
        if student is None:
            raise HTTPException(status_code=404, detail='Student not found')

        return student

    
    finally:
        cursor.close()    
        conn.close()

# Register student
@app.post('/students')
def create_student(student: StudentModel):
    conn = get_connection()
    cursor = conn.cursor(row_factory=dict_row)

    try: 
        # %d doesn't work
        cursor.execute(""" 
            insert into students (name, email, age, major)
            values (%s, %s, %s, %s)
        """, (student.name, student.email, student.age, student.major))

       # new_student = cursor.fetchone()

        conn.commit()

        return { 'message': 'Student registration done' }
    except: 
        conn.rollback()
        raise
    finally:
        cursor.close()
        conn.close()

# Update
@app.put('/students/{id}')
def update_student():
    pass

# Delete
@app.delete('/students/{id}')
def delete_student(id: int):
    pass