-- SQL은 대소문자를 구분하지 않음
SELECT * FROM EMP;
select * from emp;

-- 의사코드 
SELECT *
FROM EMP
WHERE ROWNUM < 10;

-- 모든 컬럼 탐색
SELECT * FROM EMP;

-- EMPNO컬럼만 탐색  // PROJECTION
SELECT EMPNO FROM EMP;

-- EMPNO, ENAME컬럼만 탐색  // PROJECTION
SELECT EMPNO, ENAME FROM EMP;

-- EMPNO, ENAME, DEPTNO컬럼만 탐색  // PROJECTION
SELECT EMPNO, ENAME, DEPTNO FROM EMP;

-- 부서 번호가 10인 열(로우)만 탐색
SELECT * FROM EMP
WHERE DEPTNO = 10;

-- 사용자가 가지고있는 모든 테이블을 표시해준다
SELECT * FROM tab;

-- 테이블의 구조를 확인하기 위한 명령어
DESC EMP;
DESC DEPT;
DESC SALGRADE;
DESC BONUS;

-- 계정이 소유한 테이블 목록 보기
SELECT * FROM tab;

-- 특정 테이블의 컬럼 구조 보기
DESC DEPT;

-- 테이블내의 모든 데이터 보기
SELECT * FROM DEPT;

-- 테이블내의 특정 컬럼 데이터 보기
SELECT EMPNO, ENAME, JOB, HIREDATE FROM EMP;

SELECT empno, ename, sal FROM EMP;

-- 산술 연산자
-- sal*12는 가상컬럼임
SELECT empno, ename, sal, sal*12 FROM EMP;

-- AS를 통해 별칭 부여
SELECT empno AS 사번, ename AS 성명, sal AS 급여, sal*1.1 AS 인상된_급여 FROM EMP;
