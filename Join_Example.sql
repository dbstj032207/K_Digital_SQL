-- 실습 2
-- 
SELECT empno 사번, ename 사원명, sal 급여, dname 부서명
FROM EMP e, DEPT d
WHERE e.deptno = d.deptno
AND sal > 2000
ORDER BY 3 DESC;