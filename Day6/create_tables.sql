-- 집 PC 복습용 테이블 생성 스크립트 (PostgreSQL)
--
-- 실행 전 확인:
--   1. DBeaver에서 ai_db 데이터베이스에 연결한다.
--   2. 이 파일 전체를 실행한다.
--
-- Day6/database.py가 dbname='ai_db'를 사용하므로 ai_db가 아직 없다면
-- postgres 데이터베이스에 연결한 뒤 아래 문장을 먼저 한 번 실행한다.
-- CREATE DATABASE ai_db;


-- =========================================================
-- 1. 학생 수강 관리
--    Day1~Day4 SQL 복습 및 Day6 FastAPI에서 사용하는 핵심 테이블
-- =========================================================

CREATE TABLE IF NOT EXISTS students (
    id         INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name       VARCHAR(50) NOT NULL,
    email      VARCHAR(120),
    age        INT,
    major      VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS courses (
    id         INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title      VARCHAR(100),
    instructor VARCHAR(50),
    hours      INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS enrollments (
    id          INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    student_id  INT NOT NULL,
    course_id   INT NOT NULL,
    enrolled_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_enrollments_student
        FOREIGN KEY (student_id)
        REFERENCES students(id),

    CONSTRAINT fk_enrollments_course
        FOREIGN KEY (course_id)
        REFERENCES courses(id)
);


-- =========================================================
-- 2. 상품 관리
--    Day2 SELECT / UPDATE / DELETE 복습용
-- =========================================================

CREATE TABLE IF NOT EXISTS products (
    id         INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name       VARCHAR(100) NOT NULL,
    price      INT NOT NULL,
    stock      INT DEFAULT 0,
    category   VARCHAR(50) DEFAULT '미정',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- =========================================================
-- 3. 계좌 관리
--    Day4 트랜잭션(COMMIT / ROLLBACK) 복습용
-- =========================================================

CREATE TABLE IF NOT EXISTS accounts (
    account_id INT PRIMARY KEY,
    owner_name VARCHAR(50) NOT NULL,
    balance    NUMERIC(12, 0) NOT NULL CHECK (balance >= 0)
);


-- 생성 결과 확인
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
  AND table_name IN (
      'students',
      'courses',
      'enrollments',
      'products',
      'accounts'
  )
ORDER BY table_name;
