-- 집 PC 복습용 샘플 데이터 (PostgreSQL)
-- Day6/create_tables.sql 실행 후 사용한다.
-- 같은 자연 키(이메일, 과목명, 상품명, 계좌번호)가 있으면 중복 삽입하지 않는다.


-- =========================================================
-- 1. 학생 데이터
-- =========================================================

INSERT INTO students (name, email, age, major)
SELECT sample.name, sample.email, sample.age, sample.major
FROM (
    VALUES
        ('김철수', 'kim@example.com',  21, '인공지능'),
        ('이영희', 'lee@example.com',  22, '데이터분석'),
        ('박민수', 'park@example.com', 23, '웹개발'),
        ('최지훈', 'choi@example.com', 24, '임베디드'),
        ('정수빈', 'jung@example.com', 20, '클라우드')
) AS sample(name, email, age, major)
WHERE NOT EXISTS (
    SELECT 1
    FROM students
    WHERE students.email = sample.email
);


-- =========================================================
-- 2. 과목 데이터
-- =========================================================

INSERT INTO courses (title, instructor, hours)
SELECT sample.title, sample.instructor, sample.hours
FROM (
    VALUES
        ('PostgreSQL 기본',   '성명건', 8),
        ('FastAPI 서버 개발', '성명건', 12),
        ('데이터 분석 기초',   '성명건', 10)
) AS sample(title, instructor, hours)
WHERE NOT EXISTS (
    SELECT 1
    FROM courses
    WHERE courses.title = sample.title
);


-- =========================================================
-- 3. 수강신청 데이터
--    ID를 직접 가정하지 않고 학생 이메일과 과목명으로 찾아 연결한다.
-- =========================================================

WITH requested_enrollments (student_email, course_title) AS (
    VALUES
        ('kim@example.com',  'PostgreSQL 기본'),
        ('kim@example.com',  'FastAPI 서버 개발'),
        ('lee@example.com',  'PostgreSQL 기본'),
        ('park@example.com', 'FastAPI 서버 개발'),
        ('choi@example.com', '데이터 분석 기초'),
        ('jung@example.com', 'PostgreSQL 기본')
)
INSERT INTO enrollments (student_id, course_id)
SELECT students.id, courses.id
FROM requested_enrollments
JOIN students
  ON students.email = requested_enrollments.student_email
JOIN courses
  ON courses.title = requested_enrollments.course_title
WHERE NOT EXISTS (
    SELECT 1
    FROM enrollments
    WHERE enrollments.student_id = students.id
      AND enrollments.course_id = courses.id
);


-- =========================================================
-- 4. 상품 데이터
-- =========================================================

INSERT INTO products (name, price, stock, category)
SELECT sample.name, sample.price, sample.stock, sample.category
FROM (
    VALUES
        ('키보드',        30000, 10, '컴퓨터주변기기'),
        ('마우스',        15000, 20, '컴퓨터주변기기'),
        ('모니터',       250000,  5, '디스플레이'),
        ('USB 메모리',    12000, 30, '저장장치'),
        ('노트북 거치대', 22000,  8, '액세서리'),
        ('웹캠',          45000, 12, '컴퓨터주변기기'),
        ('외장하드',      89000,  7, '저장장치'),
        ('노트북 파우치', 18000, 15, '액세서리'),
        ('HDMI 케이블',    9000, 40, '케이블'),
        ('무선 이어폰',   79000,  6, '음향기기')
) AS sample(name, price, stock, category)
WHERE NOT EXISTS (
    SELECT 1
    FROM products
    WHERE products.name = sample.name
);


-- =========================================================
-- 5. 계좌 데이터
-- =========================================================

INSERT INTO accounts (account_id, owner_name, balance)
SELECT sample.account_id, sample.owner_name, sample.balance
FROM (
    VALUES
        (1, '김철수', 100000::NUMERIC),
        (2, '박영희',  50000::NUMERIC)
) AS sample(account_id, owner_name, balance)
WHERE NOT EXISTS (
    SELECT 1
    FROM accounts
    WHERE accounts.account_id = sample.account_id
);


-- 입력 결과 확인
SELECT 'students' AS table_name, COUNT(*) AS row_count FROM students
UNION ALL
SELECT 'courses',     COUNT(*) FROM courses
UNION ALL
SELECT 'enrollments', COUNT(*) FROM enrollments
UNION ALL
SELECT 'products',    COUNT(*) FROM products
UNION ALL
SELECT 'accounts',    COUNT(*) FROM accounts
ORDER BY table_name;
