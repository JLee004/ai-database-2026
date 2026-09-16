DROP TABLE IF EXISTS products;

CREATE TABLE products (
id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
name VARCHAR(100) NOT NULL,
price INT NOT NULL,
stock INT DEFAULT 0,
category VARCHAR(50),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


INSERT INTO products (name, price, stock, category)
VALUES
('키보드', 30000, 10, '컴퓨터주변기기'),
('마우스', 15000, 20, '컴퓨터주변기기'),
('모니터', 250000, 5, '디스플레이'),
('USB 메모리', 12000, 30, '저장장치'),
('노트북 거치대', 22000, 8, '액세서리'),
('웹캠', 45000, 12, '컴퓨터주변기기'),
('외장하드', 89000, 7, '저장장치'),
('노트북 파우치', 18000, 15, '액세서리'),
('HDMI 케이블', 9000, 40, '케이블'),
('무선 이어폰', 79000, 6, '음향기기');

-- 1. 
select * from products p ;

--2.
select p."name", p."price"
 from products p;

--3. 
select * from products p
 where p.price >= 20000;

--4. 
select * from products p
 where p.stock <= 10;

--5. 
select * from products p
 order by price desc;

--6. 
select * from products p
 order by price desc
  limit 2;

--7. 
update products p 
 set price = 18000
 where name = '마우스';

--8. 
update products p 
 set stock = 25
 where name = 'USB 메모리';

--9.
delete from products p
 where name = '노트북 거치대';

--10. 
select * from products p ;


    
    
    