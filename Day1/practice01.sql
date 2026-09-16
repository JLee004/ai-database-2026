/* javascript 주석과 동일 */
-- 한 줄 주석

-- 데이터베이스 생성
create database ai_db;

-- 테이블 생성
create table students (
	id int generated always as identity primary key, 
	name varchar(50) not null,
	age int,
	email varchar(100),
	created_at timestamp default current_timestamp -- 현재 작성된 일자
);

--Insert Data (INSERT)
insert into public.students (name, age, email)
values ('John Doe', 20, 'johndoe@example.com'),
	   ('Don Bob', 21, 'dbob@gmail.com'),
	   ('Charles Stow', 22, 'cs@gmail.com'),
	   ('Gary Lile', 23, 'gl@gmail.com');

-- Check Data (SELECT)
select * from public.students;

-- Edit Data (UPDATE)
update students set
		email = 'johndoe@kakao.com'
 where id = 1;

-- Delete Data (DELETE)
delete from students
 where name = 'Don Bob';
-- Select Query 

