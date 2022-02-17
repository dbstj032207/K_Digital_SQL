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
SELECT sal+100 FROM EMP;
SELECT sal/100 FROM EMP;

SELECT ename,hiredate, hiredate + 1 FROM EMP;

-- dual 테이블 : 단순한 연산의 결과값 등의 테스트를 위해 사용할 수 있는 테이블
SELECT 245*567
FROM dual;

-- 시스템 날짜 표시
SELECT SYSDATE FROM dual;

-- AS를 통해 별칭 부여
SELECT empno AS 사번, ename AS 성명, sal AS 급여, sal*1.1 AS 인상된_급여 FROM EMP;

-- AS는 생략가능
SELECT ename 성명, sal 월급, sal*12 연봉 FROM EMP;

-- 공백이나 특수문자를 사용할 경우 " "로 묶어줘야한다.
SELECT ename "사원 이름", sal 월급, sal*12 연봉 FROM EMP;

-- 별칭에는 " " 사용
-- ' ' : 문자, 날짜 데이터에 사용
-- 검색할 내용은 대소문자 구별을 한다
SELECT * FROM EMP
WHERE ENAME = 'SMITH';

--null값은 연산이 되지않음 
SELECT ENAME, MGR, MGR + 1 FROM EMP;

-- 관리자번호 7698인 사원의 이름, 관리자번호 SELECT
SELECT ENAME, MGR FROM EMP
WHERE MGR = 7698;

-- null 값의 비교는 IS NULL, IS NOT NULL 이라는 정해진 문구를 사용해야 제대로 된 결과를 얻을 수 있다.
SELECT ENAME, MGR FROM EMP
WHERE MGR IS NULL;

SELECT ENAME, MGR FROM EMP
WHERE MGR IS NOT NULL;

-- null값 연산 불가: comm이 0인경우 모두 0을 표출
SELECT ENAME 이름, SAL 월급, comm 커미션, SAL*12 + comm 연봉 FROM EMP;

-- NVL을 통해 null값을 0으로 대체
SELECT ENAME, comm, NVL(comm, 0) FROM EMP;
SELECT ENAME 이름, SAL 월급, comm 커미션, SAL*12 + NVL(comm, 0) 연봉 FROM EMP;

--여러 개의 문자열을 연결하여 하나의 문자열로 생성
SELECT ENAME || JOB AS "이름 직업" FROM EMP;

SELECT ENAME || '의 직급은 '|| JOB || '이다.' AS "사원별 직급" 
FROM EMP;

SELECT JOB FROM EMP;

-- 중복 제거
SELECT DISTINCT JOB FROM EMP;

-- EMP 테이블에서 부서번호 중복제거 SELECT
SELECT DISTINCT deptno FROM EMP;

-- EMP 테이블에서 사원명에 사원을 붙여서 SELECT
SELECT ename||'사원' AS "사원 이름" FROM EMP;

-- SMITH의 이름과 직업을 찾아 "SMITH의 직업은 CLERK" 별칭 "사원직업"
SELECT ENAME || '의 직업은 ' || JOB AS "사원직업"
FROM EMP
WHERE ENAME = 'SMITH';

-- 사원번호 7369번의 사원이름과 월급, 연봉(월급*12 + comm) "연봉"으로 select
SELECT ENAME 이름, SAL 월급, SAL*12 + NVL(comm, 0) 연봉 
FROM EMP
WHERE EMPNO = 7369;

-- 부서번호 30번 사번, 이름, 입사일 select
SELECT empno 사번, ename 이름, hiredate 입사일
FROM EMP
WHERE DEPTNO = 30;