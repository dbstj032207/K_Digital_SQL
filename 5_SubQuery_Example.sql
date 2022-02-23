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
-- ANSI 조인
SELECT *
FROM EMP
WHERE sal < (   SELECT AVG(sal)
                FROM EMP e JOIN SALGRADE s
                ON sal BETWEEN losal AND hisal
                WHERE grade = 2) ;

-- Oracle 조인                
SELECT *
FROM EMP
WHERE sal < (   SELECT AVG(sal)
                FROM EMP e, SALGRADE s
                WHERE sal BETWEEN losal AND hisal
                AND grade = 2) ;                
            
-- 실습 6번
-- ANSI 조인
SELECT ename, grade
FROM EMP JOIN SALGRADE 
ON sal BETWEEN losal AND hisal
WHERE grade = ( SELECT grade
                FROM EMP JOIN SALGRADE 
                ON sal BETWEEN losal AND hisal
                WHERE ename = 'SMITH');    
      
-- Oracle 조인                
SELECT ename, grade
FROM EMP, SALGRADE
WHERE sal BETWEEN losal AND hisal
AND grade = (   SELECT grade
                FROM EMP, SALGRADE
                WHERE sal BETWEEN losal AND hisal
                AND ename = 'SMITH');                 
                
-- 실습 7번
SELECT dname 부서명, COUNT(*) 인원
FROM dept JOIN emp
USING (deptno) 
GROUP BY dname
HAVING COUNT(*) < ( SELECT COUNT(*)
                    FROM dept JOIN emp
                    USING (deptno)
                    WHERE dname = 'SALES');
                                
                    
-- 실습 8번
SELECT ename 이름, TO_CHAR(hiredate, 'YYYY') 입사년도
FROM emp
WHERE TO_CHAR(hiredate, 'YYYY') = TO_CHAR(( SELECT hiredate
                                            FROM EMP
                                            WHERE ename = 'WARD'), 'YYYY'); 
                
-- 실습 9번
SELECT dname, loc
FROM DEPT
WHERE deptno IN (   SELECT deptno
                    FROM EMP
                    WHERE ename = 'SMITH');    
                