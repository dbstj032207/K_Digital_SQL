-- 조인 조건이 없는 단순조인 : 카사디안 프로덕트
SELECT *
FROM EMP, DEPT ;

SELECT empno, sal
FROM EMP, DEPT 
where empno = 7369;

-- EMP테이블에도 deptno가 있고, DEPT테이블에도 deptno가 있기때문에
-- SELECT문에서 deptno 그냥 사용불가
-- err code
SELECT deptno
FROM EMP, DEPT ;

-- 테이블명을 명시해 줌으로써 해결 할 수 있다.
SELECT EMP.deptno, dept.deptno
FROM EMP, DEPT ;

-- err code : deptno의 테이블 명시 필요
SELECT empno, deptno
FROM EMP e, DEPT d
WHERE e.deptno = d.deptno
AND empno = 7369;

SELECT empno, e.deptno
FROM EMP e, DEPT d
WHERE e.deptno = d.deptno
AND empno = 7369;

SELECT empno, e.deptno, dname, loc
FROM EMP e, DEPT d
WHERE e.deptno = d.deptno
AND empno = 7369;

-- 1. KING의 사번, 이름, 부서번호, 부서명을 탐색
SELECT empno 사번, ename 이름, e.deptno 부서번호, dname 부서명
FROM EMP e, DEPT d
WHERE e.deptno = d.deptno
AND ename = 'KING';

-- 2. SALES부서에 속한 직원의 사번, 이름, 부서번호, 부서면을 탐색
SELECT empno 사번, ename 이름, e.deptno 부서번호, dname 부서명
FROM EMP e, DEPT d
WHERE e.deptno = d.deptno
AND dname = 'SALES';




