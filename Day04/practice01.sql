select * from students s;

select * from courses c ;

select * from enrollments e ;


-- JOIN
select s.id "student id", s."name" "student name", s.email, s.major,
	e.id "enrollment id", e.enrolled_at,
	c.id "course id", c.title, c.instructor, c.hours 
 from students s 
join enrollments e 
on s.id = e.student_id 
join courses c 
on c.id = e.course_id 
where c.hours >=8 -- can add: and s.major = '인공지능'
order by s.name desc; -- can add: , s.name desc

-- 학생 추가
insert into students (name, email, age, major)
values ('주예찬', 'joo@example.com', 24, '인공지능'),
	   ('이찬혁', 'lee@example.com', 26, '임베디드');

-- OUTER JOIN : Left outer join/ Right outer join 뒤에 쓰는 table 기준!!!
select * from students s 
left outer join enrollments e  
 on s.id = e.student_id ; -- No data is NULL value

-- 수강신청 안한 학생 찾기
select * from students s 
left outer join enrollments e  
 on s.id = e.student_id 
left outer join courses c 
 on e. course_id = c.id 
where e.id is null;

-- 집계함수 
-- count()
select count(*) from students s ;

-- sum()
select sum(age) "sum or age" from students s ;

-- 평균
select sum(age) / count(*) "average age" from students s ;
select avg(age) "average age" from students s ;

--
select min(age) "min_age" from students s ;
select max(age) "max_age" from students s ;

select * from students s ;

-- 그룹별 학생수
select count(*) "number of student" from students s 
group by s.major
order by s.major;

-- group by 는 select * 와 함께 사용 안됨.
select c.title from courses c 
 inner join enrollments e 
 on c.id = e.course_id 
 group by c.title ;

-- transaction practice
drop table accounts;

create table accounts (
	account_id int primary key, -- 직접 입력해야함
	owner_name varchar(50) not null, 
	balance numeric(12, 0) not null check (balance >=0)
);

-- 트랜젝션 시작
begin;

insert into accounts (account_id, owner_name, balance)
values (1, '김철수', 100000), (2, '박영희', 50000);

select * from accounts a ;

commit;
-- rollback;

begin;
update accounts set
 balance = 1000000;

-- commit; 
-- rollback;

-- 삭제 트랜젝션
begin;

delete from accounts ;

rollback;









