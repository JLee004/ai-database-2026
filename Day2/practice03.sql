-- Check table
select * from students s ;

-- Reset all Table; Delete all
-- truncate students;

-- Add student information
-- Do not use " " for string in query!! only ' '
insert into students (name, age, email)
values ('Jamie Simson', 20, 'js.exampel.com');

-- Change column order --> Always match KEYS and VALUES
insert into students (age, email, name)
values (29, 'mj@gmail.com', 'Min Jun');

-- Add multiple data
insert into students (name, age, email)
values ('Gil Soon', 20, 'gs.exampel.com'),
 ('Gil Ja', 50, 'gj.exampel.com'),
 ('Gil Ja Ja', 50, 'gjj.exampel.com'),
 ('Terry Loy', 30, 'gm.exampel.com');

-- Retrieval All data
select * from students s ;

-- Retrieval Portion columns
select s."name", s.age from students s ;

SELECT id, name, age, email, created_at
FROM public.students;

-- Retrieval only necessary data using Filtering
select * from students s 
 where s.age <30;

select * from students s 
 where s."name" = 'Jamie Smile';

select * from students s 
 where s.age = 21
 	or s."name" = 'John Doe';

-- Check specific info (only works with String)
select * from students s ;
where s.name like 'Gi%'; -- or '%Gil'

-- Check the name with knowing in the middle
select * from students s ;
where s.name like '%Gil%';

-- When there are more characters in name
select * from students s ;
where s.name like 'G__'; -- Gil followed by exactly _(how many _) character

-- Order by array
select * from students s 
 order by id desc;

select * from students s 
 order by age asc;

-- Order with multiple conditions
select * from students s 
 order by name asc, age asc;

-- Limit view count
select * from students s 
 order by id desc 
 limit 3;

