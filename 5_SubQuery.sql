-- 'WARD'�� ����
SELECT sal
FROM EMP
WHERE ename = 'WARD';

-- 'WARD'�� ���޺��� �� ���� �޴� ���
SELECT ename
FROM EMP
WHERE sal > 1250;

-- �� ���� ��ħ
SELECT ename
FROM EMP
WHERE sal > (   SELECT sal
                FROM EMP
                WHERE ename = 'WARD'    );
                

-- SMITH�� �μ���ȣ�� ���� �μ���ȣ�� ���� ������� �̸�, �μ���ȣ SELECT(��������)
SELECT ename, deptno
FROM EMP
WHERE deptno = (    SELECT deptno
                    FROM EMP
                    WHERE ename = 'SMITH');
                    
-- EMP���̺��� ��ü ������ ��պ��� ������ �� �޴� ������ �̸�, SAL�� SELECT
SELECT ename, sal
FROM EMP
WHERE sal > (   SELECT AVG(SAL)
                FROM EMP   );

-- WARD�� �Ի糯¥ ���Ŀ� �Ի��� ����� SELECT
SELECT ename, hiredate
FROM EMP
WHERE hiredate > (  SELECT hiredate
                    FROM EMP
                    WHERE ename = 'WARD');
                    
-- �μ���ȣ�� 20�� ����� �߿��� �ִ� ������ �޴� ������� 
-- ���� ������ �޴� ����� ��ȸ
SELECT ename, sal
FROM EMP
WHERE sal > (   SELECT MAX(sal)
                FROM EMP
                WHERE deptno = 20   );

-- 20�� �μ��� �ְ� ���� ���� �ְ� ������ �� ū �μ��� �μ���ȣ�� ��ȸ
SELECT deptno
FROM EMP
GROUP BY deptno
HAVING MAX(sal) > ( SELECT MAX(sal)
                    FROM EMP
                    WHERE deptno = 20   );   
                    
-- Sub Query�� ������ ���
-- EMP ���̺��� �����ȣ�� 7521�� ������ ���� 
-- �޿��� �����ȣ�� 7934���� ���� �����
-- �����ȣ, �̸�, ������, �Ի�����, �޿��� ���
SELECT empno, ename, job, hiredate, sal
FROM EMP
WHERE   job = ( SELECT job
                FROM EMP
                WHERE empno = 7521)
AND
        sal > ( SELECT sal
                FROM EMP
                WHERE empno = 7934);
                
-- ������ ��������
-- EMP ���̺��� �������� �ּ� �޿��� �޴� ����� 
-- �����ȣ, �̸�, ����, �Ի�����, �޿�, �μ���ȣ�� ���

-- IN
SELECT empno, ename, job, hiredate, sal, deptno
FROM EMP
WHERE sal IN (  SELECT MIN(sal)
                FROM EMP
                GROUP BY job);

-- WARD, SMITH�� ������ ���� ����� �̸��� ����                
SELECT ename, job
FROM EMP
WHERE job IN (  SELECT job
                FROM EMP
                WHERE ename IN ('SMITH', 'WARD'));                

-- SMITH�� ���� �μ��� �̸��� ����
SELECT dname, loc
FROM DEPT
WHERE deptno = (    SELECT deptno
                    FROM EMP
                    WHERE ename = 'SMITH');
                    
                    
-- ������ 2850 �̻��� ����� ���� �μ��� �̸��� ����
SELECT dname, loc
FROM DEPT
WHERE deptno IN (   SELECT deptno
                    FROM EMP
                    WHERE sal >= 2850);
                    
-- ALL ������
-- MANAGER ������ ���� ����� ����
-- �� �� ���� ���� ���� 2450
SELECT SAL
FROM EMP
WHERE JOB = 'MANAGER';

-- ���� ���� ������ 2450 ���� ���� ������ �޴� ��� �˻�
SELECT empno, ename, sal
FROM EMP
WHERE sal < 2450;

-- �� ���� ���������� �̿��Ͽ� ��ĥ�� < ALL ������ ���
SELECT empno, ename, sal
FROM EMP
WHERE sal < ALL (   SELECT sal
                    FROM EMP
                    WHERE JOB = 'MANAGER');

-- �ݴ��                    
SELECT empno, ename, sal
FROM EMP
WHERE sal > ALL (   SELECT sal
                    FROM EMP
                    WHERE JOB = 'MANAGER');      
                    

-- ANY ������
-- MANAGER ������ ���� ����� ����
-- �� �� ���� ���� ���� 2450                    
SELECT sal
FROM EMP
WHERE job = 'MANAGER';

-- ���� ���� ������ 2450 ���� ū ������ �޴� ��� �˻�
SELECT empno, ename, sal
FROM EMP
WHERE sal > 2450;

-- �� ���� ���������� �̿��Ͽ� ��ĥ�� > ANY ������ ���
SELECT empno, ename, sal
FROM EMP
WHERE sal > ANY (   SELECT sal
                    FROM EMP
                    WHERE JOB = 'MANAGER');     

-- �ݴ��                    
SELECT empno, ename, sal
FROM EMP
WHERE sal < ANY (   SELECT sal
                    FROM EMP
                    WHERE JOB = 'MANAGER');     
                    
                    


