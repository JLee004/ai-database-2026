select * from pg_tables;

select * from students s ;
select * from enrollments e ;

-- Modify Column Size 
alter table students 
alter column "email" type varchar(120);

-- Error in Data Insert
insert into students (age, major)
values (23, 'economics')


insert into students  (name, email)
values ('Sung Min', 'cs@example.com');

select * from students s 
 where id = 5;


update students set
	grade = 4;

update students s set 
	grade = 88
where id = 1;

-- add a new student after 
insert into students (name, email, major, grade)
values ('Ashley', 'ash@example.com', 'literature', 2);

ALTER TABLE public.products ALTER COLUMN category SET DEFAULT '미정';

-- Add  products
insert into products (name, price)
values ('testttt', 1000);

select * from products p ;

