--Create ERD Table
create table enrollments (
	id int generated always as identity primary key,
	students_id int not null, 
	course_name varchar(100) not null,
	enrolled_at timestamp default current_timestamp,
	constraint fk_enrollments_students
		foreign key (students_id)
		references students(id)
);

--INSERT INTO products (name, price, stock, category)
--VALUES
--('키보드', 30000, 10, '컴퓨터주변기기'),


insert into enrollments (students_id, course_name)
values (4, 'psychology'),
(5, 'psychology'),
(2, 'psychology');

select * from enrollments e ;

delete from students ;
