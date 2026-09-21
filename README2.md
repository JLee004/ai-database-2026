## FastAPI 

FastAPI - Web framework making API server with Python
- Client requests -> FastAPI handle the request and return the result
- Return as JSON type from server
- Auto complete UI for text
- use Pydantic 
- easy integrate with DB such as postgreSql, Oracle and MySQL

### FastAPI Package Installation
1. install fastapi uvicorn (package to develop api) in VS code's terminal
```bash
pip install fastapi uvicorn
```
2. Check the installation
```bash
pip list
```
### Fundamental FastAPI Server
1.  write a source in VS code (save a file 'main.py')
```bash
from fastapi import FastAPI

app = FastAPI()

@app.get('/')
def read_root():
    return {'message':'Hello FastAPI'}
```
2. VS Code restart

3. Problem solving:
Check: installed uvicorn.exe and python saved in same location
--> Find location of uvicorn.exe and register the path
--> sysdm.cpl -> Environment Variable -> In System Variable, double click Path -> add the path of uvicorn.exe in the System Variable -> reopen VS code -> In VS code terminal, type uvicorn -> then type cd 'filename' -> type dir -> type below (can change the port) to start FastAPI server -> Check the result (message) and local host ip address
```bash
uvicorn main:app --reload --port 8000
```
* --reload: automatically restart as soon as modified
 --port 8000: assign a port 

cd {assign file directory}
![alt text]({0F15D944-4332-4B4F-B133-78BCBD5554C6}-1.png)

![alt text]({5F124814-FAE5-46DF-A1BC-854A08520D4E}-1.png)

![alt text](image-12.png)  --> Click the link with ctrl key.

![alt text](image-14.png)

### Web Response Code
- 200: OK
- 404: client error
- 500: internal server error

### Swagger UI 
- test page for FastAPI (provided automatically)
- http(s):

###
- API's results = JSON type, Python's result is Dictionary
- JSON은 "" 씀, Python은 '' 쓴다.

### URL Path
- 

### HTTP(s) Method
GET, POST, PATCH, PUT, DELETE
- POST and PATCH : cleient should 

### Requst
- FastAPI, use pydantic package model 
- JSON data는 Null, Python은 None 

### HTTP Exception
- 200 --> request successful, 201 --> creation successful
- 403 --> not authorized, 404 --> no data
- 500 --> server error




