----- Oracle JOIN 사용

-- 실습 2
-- 부서 테이블과 사원테이블에서 사번, 사원명, 급여, 부서명으로 검색하시오
-- 단, 급여가 2000이상인 사원에 대하여 급여기준으로 내림차순 정렬할 것
SELECT empno 사번, ename 사원명, sal 급여, dname 부서명
FROM EMP e, DEPT d
WHERE e.deptno = d.deptno
AND sal >= 2000
ORDER BY 3 DESC;

-- 실습 4
-- 사원 테이블과 급여 등급 테이블에서 사번, 사원명, 급여, 등급을 검색하시오
-- 단, 등급은 급여가 하한값과 상한값 범위에 포함되고 등급이 4이며 
-- 급여를 기준으로 내림차순 정렬할 것
SELECT empno 사번, ename 사원명, sal 급여, grade 등급
FROM EMP, SALGRADE
WHERE sal BETWEEN losal AND hisal
AND grade = 4
ORDER BY 3 DESC;

-- 실습 
-- 부서 테이블, 사원 테이블, 급여등급 테이블에서 
-- 사번, 사원명, 부서명, 급여, 등급을 검색하시오
-- 단, 긍급은 급여가 하한값과 상한값 범위에 포함되며 등급을 기준으로 내림차순 정렬할 것
SELECT empno 사번, ename 사원명, dname 부서명, sal 급여, grade 등급
FROM EMP e, DEPT d, SALGRADE
WHERE e.deptno = d.deptno
AND sal BETWEEN losal AND hisal
ORDER BY 5 DESC;

-- 실습 10
-- 커미션을 받는 사원의 이름, 커미션, 부서이름을 출력하시오
SELECT ename 이름, comm 커미션, dname 부서명
FROM EMP e, DEPT d
WHERE e.deptno = d.deptno
AND comm IS NOT NULL
AND comm != 0;

SELECT ename 이름, comm 커미션, dname 부서명
FROM EMP e, DEPT d
WHERE e.deptno = d.deptno
AND NVL(comm, 0) > 0;

-- 실습 11
-- 이름에 'A'가 들어가는 사원들의 이름과 부서명 출력하기
SELECT ename 이름, dname 부서명
FROM EMP e, DEPT d
WHERE e.deptno = d.deptno
AND ename LIKE '%A%';

-- 실습 13
-- 자신의 관리자보다 연봉(sal)을 많이 받는 사원의 이름과 연봉을 출력하시오
SELECT e.ename 이름, e.sal 연봉
FROM    EMP e,  -- 사원에 대한 정보 
        EMP m   -- 관리자에 대한 정보
WHERE e.mgr = m.empno
AND e.sal > m.sal;

-- 실습 15
-- 각 부서별로 1982년 이전에 입사한 직원들의 인원수를 출력하시오
SELECT COUNT(*)
FROM EMP e, DEPT d
WHERE e.deptno = d.deptno
AND TO_CHAR(hiredate, 'YYYY') < '1982'
GROUP BY d.deptno;

----- ANSI JOIN 사용

-- 실습 3
-- 부서 테이블과 사원 테이블에서 사번, 사원명, 업무, 급여, 부서명을 검색하시오.
-- 단, 업무가 MANAGER이며 급여가 2500이상인 사원에 대하여 사번을 기준으로 오름차순 정렬할 것
SELECT empno 사번, ename 사원명, job 업무, sal 급여, dname 부서명
FROM EMP
JOIN DEPT
USING (deptno)
WHERE job = 'MANAGER'
AND sal >= 2500
ORDER BY 1;


-- 실습 12
-- DALLAS에 근무하는 사원 중 급여 1500 이상인 사원의 이름, 급여, 입사일, 보너스(COMM)을 출력하시오
SELECT ename 이름, sal 급여, hiredate 입사일, comm 보너스
FROM EMP
JOIN DEPT
USING (deptno)
WHERE loc = 'DALLAS'
AND sal >= 1500;
