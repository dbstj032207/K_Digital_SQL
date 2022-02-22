-- 실습 1번
SELECT empno 사번, ename 이름, sal 급여
FROM EMP
WHERE sal > (   SELECT sal
                FROM EMP
                WHERE ename = 'BLAKE');
                
-- 실습 2번
SELECT empno 사번, ename 이름, hiredate 입사일
FROM EMP
WHERE hiredate > (  SELECT hiredate
                    FROM EMP
                    WHERE ename = 'MILLER');
                    
-- 실습 3번
SELECT empno 사번, ename 이름, sal 급여
FROM EMP
WHERE sal > (   SELECT AVG(sal)
                FROM EMP);
                
-- 실습 4번
SELECT empno 사번, ename 이름, deptno 부서코드, sal 급여
FROM EMP
WHERE sal IN (  SELECT MAX(sal)
                FROM EMP
                GROUP BY deptno);
                
-- 실습 5번
SELECT *
FROM EMP
WHERE sal < (   SELECT (hisal + losal) / 2
                FROM SALGRADE
                WHERE GRADE = 2);
                
                
-- 실습 9번
SELECT dname, loc
FROM DEPT
WHERE deptno IN (   SELECT deptno
                    FROM EMP
                    WHERE ename = 'SMITH');    
                