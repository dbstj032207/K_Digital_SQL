-- 1
SELECT deptno, COUNT(*)
FROM EMP
GROUP BY deptno
HAVING COUNT(*) >= 6;

-- 2
SELECT TO_CHAR(hiredate, 'YYYY') ³â, 
       TO_CHAR(hiredate, 'MM') ¿ù,
       SUM(sal)
FROM EMP
GROUP BY TO_CHAR(hiredate, 'YYYY'),
         TO_CHAR(hiredate, 'MM')
ORDER BY 1, 2;
         
