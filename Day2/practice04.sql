-- UPDATE
select * from students s ;

-- Change age
update students set 
		age = 60 -- if ; is added, it updates all the rows!
 where name = 'Jamie Smile';

-- Delete
delete from students
	where id = 33; -- **if ; is added, it delete all the rows!!!
-- Please do not do:
	--delete from student;

-- Delete table
drop table students ;
	
-- Create table
CREATE TABLE students (
id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, -- basic key(PK): NO duplicate allowed & NOT NULL.
name VARCHAR(50) NOT NULL, -- Name cannot be NULL with NOT NULL 
age INT, --age can be NULL
email VARCHAR(100), -- can be NULL
major VARCHAR(50), -- can be NULL
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- can be NULL
);

-- Check table (empty)
select * from students s; 

-- Add data
insert into students (name, age, email, major)
values ('Hong Gil', 20, 'hong@example.com', 'computer science');

insert into students (name, age, email, major)
values ('Sung Yoo', 20, 'hugo@example.com', null);

insert into students (name, age, email, major)
values ('Sung Min', null, 'Smin@example.com', null);

insert into students (name)
values ('Choi Sik');

-- Retrieval users without email value
select * from students s 
 where s. email is null;
 --where s.email = null; -- = null is NOT Working
select * from students s 
 where s. email is not null;

select * from students s 
 where s."name" != 'Sung Min';
  



