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
SELECT *
FROM EMP
WHERE sal < (   SELECT (hisal + losal) / 2
                FROM SALGRADE
                WHERE GRADE = 2);
                
                
-- �ǽ� 9��
SELECT dname, loc
FROM DEPT
WHERE deptno IN (   SELECT deptno
                    FROM EMP
                    WHERE ename = 'SMITH');    
                