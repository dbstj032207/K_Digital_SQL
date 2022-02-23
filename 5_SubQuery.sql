-- 'WARD'의 월급
SELECT sal
FROM EMP
WHERE ename = 'WARD';

-- 'WARD'의 월급보다 더 많이 받는 사원
SELECT ename
FROM EMP
WHERE sal > 1250;

-- 이 둘을 합침
SELECT ename
FROM EMP
WHERE sal > (   SELECT sal
                FROM EMP
                WHERE ename = 'WARD'    );
                

-- SMITH의 부서번호와 같은 부서번호를 가진 사람들의 이름, 부서번호 SELECT(서브쿼리)
SELECT ename, deptno
FROM EMP
WHERE deptno = (    SELECT deptno
                    FROM EMP
                    WHERE ename = 'SMITH');
                    
-- EMP테이블에서 전체 월급의 평균보다 월급을 더 받는 직원의 이름, SAL을 SELECT
SELECT ename, sal
FROM EMP
WHERE sal > (   SELECT AVG(SAL)
                FROM EMP   );

-- WARD의 입사날짜 이후에 입사한 사람을 SELECT
SELECT ename, hiredate
FROM EMP
WHERE hiredate > (  SELECT hiredate
                    FROM EMP
                    WHERE ename = 'WARD');
                    
-- 부서번호가 20인 사원들 중에서 최대 월듭을 받는 사원보다 
-- 많은 월급을 받는 사원을 조회
SELECT ename, sal
FROM EMP
WHERE sal > (   SELECT MAX(sal)
                FROM EMP
                WHERE deptno = 20   );

-- 20번 부서의 최고 월급 보다 최고 월급이 더 큰 부서의 부서번호를 조회
SELECT deptno
FROM EMP
GROUP BY deptno
HAVING MAX(sal) > ( SELECT MAX(sal)
                    FROM EMP
                    WHERE deptno = 20   );   
                    
-- Sub Query를 여러개 사용
-- EMP 테이블에서 사원번호가 7521의 업무와 같고 
-- 급여가 사원번호가 7934보다 많은 사원의
-- 사원번호, 이름, 담당업무, 입사일자, 급여를 출력
SELECT empno, ename, job, hiredate, sal
FROM EMP
WHERE   job = ( SELECT job
                FROM EMP
                WHERE empno = 7521)
AND
        sal > ( SELECT sal
                FROM EMP
                WHERE empno = 7934);
                
-- 복수행 서브쿼리
-- EMP 테이블에서 업무별로 최소 급여를 받는 사원의 
-- 사원번호, 이름, 업무, 입사일자, 급여, 부서번호를 출력

-- IN
SELECT empno, ename, job, hiredate, sal, deptno
FROM EMP
WHERE sal IN (  SELECT MIN(sal)
                FROM EMP
                GROUP BY job);

-- WARD, SMITH의 직업과 같은 사람의 이름과 직업                
SELECT ename, job
FROM EMP
WHERE job IN (  SELECT job
                FROM EMP
                WHERE ename IN ('SMITH', 'WARD'));                

-- SMITH가 속한 부서의 이름과 지역
SELECT dname, loc
FROM DEPT
WHERE deptno = (    SELECT deptno
                    FROM EMP
                    WHERE ename = 'SMITH');
                    
                    
-- 월급이 2850 이상인 사원이 속한 부서의 이름과 지역
SELECT dname, loc
FROM DEPT
WHERE deptno IN (   SELECT deptno
                    FROM EMP
                    WHERE sal >= 2850);
                    
-- ALL 연산자
-- MANAGER 업무를 보는 사원의 월급
-- 그 중 제일 작은 값은 2450
SELECT SAL
FROM EMP
WHERE JOB = 'MANAGER';

-- 가장 적은 월급인 2450 보다 적은 월급을 받는 사원 검색
SELECT empno, ename, sal
FROM EMP
WHERE sal < 2450;

-- 이 둘을 서브쿼리를 이용하여 합칠때 < ALL 연산자 사용
SELECT empno, ename, sal
FROM EMP
WHERE sal < ALL (   SELECT sal
                    FROM EMP
                    WHERE JOB = 'MANAGER');

-- 반대로                    
SELECT empno, ename, sal
FROM EMP
WHERE sal > ALL (   SELECT sal
                    FROM EMP
                    WHERE JOB = 'MANAGER');      
                    

-- ANY 연산자
-- MANAGER 업무를 보는 사원의 월급
-- 그 중 제일 작은 값은 2450                    
SELECT sal
FROM EMP
WHERE job = 'MANAGER';

-- 가장 적은 월급인 2450 보다 큰 월급을 받는 사원 검색
SELECT empno, ename, sal
FROM EMP
WHERE sal > 2450;

-- 이 둘을 서브쿼리를 이용하여 합칠때 > ANY 연산자 사용
SELECT empno, ename, sal
FROM EMP
WHERE sal > ANY (   SELECT sal
                    FROM EMP
                    WHERE JOB = 'MANAGER');     

-- 반대로                    
SELECT empno, ename, sal
FROM EMP
WHERE sal < ANY (   SELECT sal
                    FROM EMP
                    WHERE JOB = 'MANAGER');     
                    
                    


