# ai-database-2026

AI Agentic Service Develop Database Repository

## Day 1

### Postgre SQL

Databas: a system managing collected data in a single space
In short, it is called Postgre, and it is **relational** database.
It allows save, edit, delete, and search the data with `SQL`.

- OTher Relational Database
  - Oracle
  - MySQL / MariaDB
  - SQL Server
  - Postgre is an **open source system** --> No license fee 123123

### What is DB?

- Data Integrity
- Data Stability
- Data Concurrency
- Data Scalability
- Support standard SQL

### How to Install PostgreSQL?

- Desktop Download
- superuser ID: postgres, current password: 123456, current port:5432

### Install DBeaver

- GUI DB management tool

#### DBeaver

1. Execute DBeaver
2. Connect New database - click Postgres
3. Install necessary drive and connected
4. Click complete

![alt text](image.png)

![alt text](image-1.png)

#### What is Docker?

- Container technology solution that resolves environmental dependency issues
- Provides the ability to run programs in a virtual environment
- Container: an image containing the OS, libraries, settings, and more, bundled into a single package.
- Install Docker Desktop
  ![](image-2.png)

WSL (install Windows subsystem for Linux )

#### Docker Command:
```bash
docker --version
```

#### Download PostgreSQL image
- image: system package that is already existed in docker repository

```bash
docker pull postgres:latest
```

#### Execute Container
```bash
docker run --name my-postgres_PASSWORD-123456 -p 5432:5432 -d postgres:latest
```

#### Connect to DBeaver

### How to use DB?

#### PostgreSQL Structure

- ![alt text](image-5.png)

#### Create DB

- SQL Editor -> Create database 'new name' ;
- ![alt text](image-4.png)
- Save as New, save as *.sql
- Write below:

```sql
create database ai_db;
```

- ctrl + Enter to execute query
- ![ ](image-3.png)
  *Check on Edit Connection (mouse right click of Local_Postgres) -> click 'show all databases.
- Create database
- To change ai_db (or other) database:
  ![alt text](image-6.png)
  ![alt text](image-7.png)
  --> Refresh/ F5

#### Create table

- Write code below:

```sql
create table students (
	id int generated always as identity primary key, 
	name varchar(50) not null,
	age int,
	email varchar(100),
	created_at timestamp default current_timestamp 
```

Ctrl + enter to execute.

#### Create Data

- Insert query

```sql
insert into public.students (name, age, email)
values ('John Doe', 20, 'johndoe@example.com'),
	   ('Don Bob', 21, 'dbob@gmail.com'),
	   ('Charles Stow', 22, 'cs@gmail.com'),
	   ('Gary Lile', 23, 'gl@gmail.com');
     ```

- Check Query
```sql
select * from public.students;
```

- Edit Query

```sql
update students set
		email = 'johndoe@kakao.com'
 where id = 1;
```

- Delete Query

```sql
delete from students
where name = 'Don Bob';
```

- Select Query

#### Basic Types of Postgres


| Data Type   | Details          | Example                   |
| ----------- | ---------------- | ------------------------- |
| INT         | Integer          | 10, 25, -9                |
| BEGINT      | Big Integer      | 10000000000000            |
| NUMERIC     |                  | 1233.45                   |
| VARCHAR (n) | Limited String   | 'John' or Resident number |
| TEXT        | Long String (1G) | News post text            |
| BOOLEAN     | T or F           |                           |
| DATE        |                  | 2026-09-15                |
| TIMESTAMP   | Date with time   | 2026-09-15 16:00:20       |
| JSONB       | JSON data        | {"name" : John Doe"}      |
