# Fast API
from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI() # start API Server

# Class: 데이터 구조 만들기 (나중에 sql 연결)
# Data verification 
class StudentModel(BaseModel):
    name: str
    email: str
    age: int
    major: str | None = None


@app.get('/lalala')
def read_root():
    return {'message': 'Hello FastAPI!'}

@app.get('/students')
def get_students():
    return [
        {'id': 1, 'name': 'John Doe', 'major': 'Psychology'},
        {'id': 2, 'name': 'Sera Kim', 'major': 'CS'},
        {'id': 3, 'name': 'Bob Gavin', 'major': 'Literature'},
    ]
@app.get('/students/{id}')
def get_student(id:int):
    return {'student_id': id}

@app.get('/search')
def search_student(major: str | None = None):
    return{'major' : major}

@app.post('/students')
def create_students(student: StudentModel):
    return {'message': 'student enrollment',
            'data' : student
            }

@app.patch('/students/{id}')
def update_student(id:int):
    return {'message': f'{id}s student information change'}

@app.delete('/students/{id}')
def delete_student(id:int):
    return {'message': f'{id}s student information remove'}

@app.put('/students/{id}')
def put_student(id:int):
    return {'message': f'{id}s student information remove'}