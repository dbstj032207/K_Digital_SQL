-- �ǽ� 1��
SELECT empno ���, ename �̸�, sal �޿�
FROM EMP
WHERE sal > (   SELECT sal
                FROM EMP
                WHERE ename = 'BLAKE');
                
-- �ǽ� 2��
SELECT empno ���, ename �̸�, hiredate �Ի���
FROM EMP
WHERE hiredate > (  SELECT hiredate
                    FROM EMP
                    WHERE ename = 'MILLER');
                    
-- �ǽ� 3��
SELECT empno ���, ename �̸�, sal �޿�
FROM EMP
WHERE sal > (   SELECT AVG(sal)
                FROM EMP);
                
-- �ǽ� 4��
SELECT empno ���, ename �̸�, deptno �μ��ڵ�, sal �޿�
FROM EMP
WHERE sal IN (  SELECT MAX(sal)
                FROM EMP
                GROUP BY deptno);
                
-- �ǽ� 5��
-- ANSI ����
SELECT *
FROM EMP
WHERE sal < (   SELECT AVG(sal)
                FROM EMP e JOIN SALGRADE s
                ON sal BETWEEN losal AND hisal
                WHERE grade = 2) ;

-- Oracle ����                
SELECT *
FROM EMP
WHERE sal < (   SELECT AVG(sal)
                FROM EMP e, SALGRADE s
                WHERE sal BETWEEN losal AND hisal
                AND grade = 2) ;                
            
-- �ǽ� 6��
-- ANSI ����
SELECT ename, grade
FROM EMP JOIN SALGRADE 
ON sal BETWEEN losal AND hisal
WHERE grade = ( SELECT grade
                FROM EMP JOIN SALGRADE 
                ON sal BETWEEN losal AND hisal
                WHERE ename = 'SMITH');    
      
-- Oracle ����                
SELECT ename, grade
FROM EMP, SALGRADE
WHERE sal BETWEEN losal AND hisal
AND grade = (   SELECT grade
                FROM EMP, SALGRADE
                WHERE sal BETWEEN losal AND hisal
                AND ename = 'SMITH');                 
                
-- �ǽ� 7��
SELECT dname �μ���, COUNT(*) �ο�
FROM dept JOIN emp
USING (deptno) 
GROUP BY dname
HAVING COUNT(*) < ( SELECT COUNT(*)
                    FROM dept JOIN emp
                    USING (deptno)
                    WHERE dname = 'SALES');
                                
                    
-- �ǽ� 8��
SELECT ename �̸�, TO_CHAR(hiredate, 'YYYY') �Ի�⵵
FROM emp
WHERE TO_CHAR(hiredate, 'YYYY') = TO_CHAR(( SELECT hiredate
                                            FROM EMP
                                            WHERE ename = 'WARD'), 'YYYY'); 
                
-- �ǽ� 9��
SELECT dname, loc
FROM DEPT
WHERE deptno IN (   SELECT deptno
                    FROM EMP
                    WHERE ename = 'SMITH');    
                