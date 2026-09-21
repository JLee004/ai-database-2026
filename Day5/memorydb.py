from fastapi import FastAPI, HTTPException
from pydantic import BaseModel

app = FastAPI()

class StudentModel(BaseModel):
    name: str
    age: int
    major: str

students = [
    {'id': 1, 'name': 'Chul Kim', 'age': 21, 'major': 'big data'},
    {'id': 2, 'name': 'Young Lee', 'age': 22, 'major': 'AI'},
    {'id': 3, 'name': 'Hugo Sung', 'age': 25, 'major': 'CS'}
]

@app.get('/')
def read_root():
    return {'message': 'Hello FastAPI!'}

@app.get('/health')
def get_status():
    return { 'message' : 'Server is OK!'}

@app.get('/students')
def get_students():
    return students

@app.get('/students/{id}')
def get_students(id: int):
    for student in students:
        if student['id'] == id:
            return student

    #Make exception of 404 page error 
    raise HTTPException(status_code=404, detail='Student not found')

# Add new data

@app.post('/students')
def create_student(student: StudentModel):
    #Create new Id
    new_id = max(item['id'] for item in students) +1

    new_student = { #dictionary in python -> json type
        'id': new_id,
        'name': student.name,
        'age': student.age,
        'major': student.major
    }

    students.append(new_student)
    return students

@app.put('/students/{id}')
def update_student(id: int, student: StudentModel):
    for item in students:
        if item['id'] == id:
            item['name'] =student.name
            item['age'] =student.age
            item['major'] =student.major

            return item #Only return the completed change

    #Exception
    raise HTTPException(status_code=404, detail='Student not found')

# Patch (PUT으로 거의 다 되서 PATCH는 잘 사용 안함)
@app.patch('/students/{id}')
def patch_student(id: int, student: StudentModel):
    for item in students:
        if item['id'] == id:

            if student.name is not None:
                item['name'] = student.name

            if student.age is not None:
                item['age'] = student.age

            if student.major is not None:
                item['major'] = student.major

            return item
        
    raise HTTPException(status_code=404, detail='Student not found')

@app.delete('/students/{id}')
def delete_student(id:int):
    for index, student in enumerate(students):
        if student['id'] == id:
            delete_student = students.pop(index) #index값만 빼 사라짐

            return {
                'message': 'Student deleted',
                'studnet': delete_student
            }
    raise HTTPException(status_code=404, detail='Studnet not found')

