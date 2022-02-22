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

-- 2. SALES부서에 속한 직원의 사번, 이름, 부서번호, 부서명을 탐색
SELECT empno 사번, ename 이름, e.deptno 부서번호, dname 부서명
FROM EMP e, DEPT d
WHERE e.deptno = d.deptno
AND dname = 'SALES';

-- Equi 조인
SELECT *
FROM EMP e, DEPT d
WHERE e.deptno = d.deptno;

-- Equi 조인
-- 직원의 사번, 이름, 부서번호, 부서명을 탐색
SELECT empno 사번, ename 이름, e.deptno 부서번호, dname 부서명
FROM EMP e, DEPT d
WHERE e.deptno = d.deptno;

-- 사원번호가 7900번인 사원의 사번, 이름, 부서번호, 부서명을 탐색
SELECT empno 사번, ename 이름, e.deptno 부서번호, dname 부서명
FROM EMP e, DEPT d
WHERE e.deptno = d.deptno
AND empno = '7900';

-- SALES부서에 속한 사원의 사번, 이름, 부서번호, 부서명을 탐색
SELECT empno 사번, ename 이름, e.deptno 부서번호, dname 부서명
FROM EMP e, DEPT d
WHERE e.deptno = d.deptno
AND dname = 'SALES';


-- Non-Equi 조인
SELECT empno, ename, job, sal, grade, losal, hisal
FROM EMP e, SALGRADE s
WHERE sal BETWEEN losal AND hisal;

SELECT e.empno, e.ename, e.job, e.sal, s.grade, s.losal, s.hisal
FROM EMP e, SALGRADE s
WHERE e.sal BETWEEN s.losal AND s.hisal;

-- 10번 부서에 속한 사원의 정보
SELECT empno, ename, job, sal, grade, losal, hisal, deptno
FROM EMP e, SALGRADE s
WHERE sal BETWEEN losal AND hisal
AND deptno = 10;

-- GRADE 1등급인 사원의 사번, 이름, 월급 , 등급
SELECT empno 사번, ename 이름, sal 월급, grade 등급
FROM EMP e, SALGRADE s
WHERE sal BETWEEN losal AND hisal
AND grade = 1;

-- 교재 p190
-- 3개의 테이블을 조인하고자 한다. 사원들의 월급 등급 및 부서명까지
-- Equi조인과 Non-Equi조인의 합
SELECT ename, sal, dname, grade
FROM EMP e, DEPT d, SALGRADE g
WHERE e.deptno = d.deptno
AND sal BETWEEN losal AND hisal;

-- 7369의 사번, 이름, 부서번호, 부서이름, 월급, 등급
SELECT empno 사번, ename 이름, e.deptno 부서번호, dname 부서이름, sal 월급, grade 등급
FROM EMP e, DEPT d, SALGRADE g
WHERE e.deptno = d.deptno
AND sal BETWEEN losal AND hisal
AND empno = '7369';


-- Self Join
SELECT *
FROM    EMP e,  -- 사원에 대한 정보 
        EMP m   -- 관리자에 대한 정보
WHERE e.mgr = m.empno;

-- 사원 번호, 사원 이름, 관리자 번호, 관리자 이름, 관리자 부서번호 탐색
SELECT  e.empno "사원 번호", e.ename "사원 이름", e.mgr "관리자 번호",
        m.empno "관리자의 사원번호", m.ename "관리자 이름", m.deptno "관리자 부서번호"
FROM    EMP e,  -- 사원에 대한 정보 
        EMP m   -- 관리자에 대한 정보
WHERE e.mgr = m.empno;

-- SMITH의 관리자에 대한 내용
SELECT  e.empno "사원 번호", e.ename "사원 이름", e.mgr "관리자 번호",
        m.empno "관리자의 사원번호", m.ename "관리자 이름", m.deptno "관리자 부서번호"
FROM    EMP e,  -- 사원에 대한 정보 
        EMP m   -- 관리자에 대한 정보
WHERE e.mgr = m.empno
AND e.ename = 'SMITH';

-- 2단계 Self 조인 
-- 관리자의 관리자까지 탐색
SELECT  *
FROM    EMP e,  -- 사원에 대한 정보 
        EMP m,  -- 관리자에 대한 정보
        EMP mm  -- 관리자의 관리자에 대한정보
WHERE   e.mgr = m.empno
AND     m.mgr = mm.empno;

-- 사원 번호, 사원 이름, 관리자 번호, 관리자 이름, 관리자 부서번호 탐색
-- + SMITH의 관리자에 대한 내용
-- + 관리자의 관리자의 번호, 관리자의 관리자의 이름
SELECT  e.empno "사원 번호", e.ename "사원 이름", e.mgr "관리자(M) 번호",
        m.ename "관리자(M) 이름", m.deptno "관리자(M) 부서번호", m.mgr "M의 관리자 번호",
        mm.ename "M의 관리자 이름"
FROM    EMP e,  -- 사원에 대한 정보 
        EMP m,  -- 관리자에 대한 정보
        EMP mm  -- 관리자의 관리자에 대한정보
WHERE   e.mgr = m.empno
AND     m.mgr = mm.empno
AND     e.ename = 'SMITH';

-- outer Join
SELECT *
FROM    EMP e,  -- 사원에 대한 정보 
        EMP m,  -- 관리자에 대한 정보
        EMP mm  -- 관리자의 관리자에 대한정보
WHERE   e.mgr = m.empno(+)
AND     m.mgr = mm.empno(+);



-- ANSI JOIN

-- Cross Join
SELECT empno, ename, dname, loc
FROM DEPT
CROSS JOIN EMP;

-- Natural Join
SELECT deptno
FROM EMP
NATURAL JOIN DEPT;

-- USING
SELECT *
FROM EMP
JOIN DEPT
USING (deptno);

SELECT empno, deptno
FROM EMP
JOIN DEPT
USING (deptno);

SELECT empno, e.deptno
FROM EMP e
JOIN DEPT d
USING (deptno);

-- JOIN ON 
SELECT *
FROM EMP e
JOIN DEPT d
ON e.deptno = d.deptno;

-- 검색 조건을 ON절에 AND를 사용하여 적용해도 되고
-- WHERE를 사용하여 지정하여도된다
SELECT *
FROM EMP e
JOIN DEPT d
ON e.deptno = d.deptno
-- AND ename = 'SMITH';
WHERE ename = 'SMITH';		-- 하지만, 검색조건은 WHERE을 사용하는 것을 권장한다.

-- 1. USING을 이용 SMITH의 이름과 부서번호, 부서이름 SELECT
SELECT ename 이름, deptno 부서번호, dname 부서이름
FROM EMP
JOIN DEPT
USING (deptno)
WHERE ename = 'SMITH';

-- 2. JOIN ON을 이용, 별칭 사용
SELECT e.ename 이름, e.deptno 부서번호, d.dname 부서이름
FROM EMP e
JOIN DEPT d
ON e.deptno = d.deptno
WHERE e.ename = 'SMITH';

-- 3개 테이블 조인, ON절 사용
SELECT empno 사번, ename 이름, e.deptno 부서번호,   -- 부서번호의 테이블명 지정
       dname 부서명, sal 월급, grade 등급 
FROM EMP e
JOIN DEPT d
ON e.deptno = d.deptno
JOIN SALGRADE 
ON sal BETWEEN losal AND hisal
WHERE ename = 'SMITH'
ORDER BY 5;

-- 3개 테이블 조인 , USING절 사용
SELECT empno 사번, ename 이름, deptno 부서번호,     -- 부서번호의 테이블명 지정x
       dname 부서명, sal 월급, grade 등급 
FROM EMP e
JOIN DEPT d
USING (deptno)
JOIN SALGRADE 
ON sal BETWEEN losal AND hisal
WHERE ename = 'SMITH'
ORDER BY 5;

