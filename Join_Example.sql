----- Oracle JOIN ���

-- �ǽ� 2
-- �μ� ���̺�� ������̺��� ���, �����, �޿�, �μ������� �˻��Ͻÿ�
-- ��, �޿��� 2000�̻��� ����� ���Ͽ� �޿��������� �������� ������ ��
SELECT empno ���, ename �����, sal �޿�, dname �μ���
FROM EMP e, DEPT d
WHERE e.deptno = d.deptno
AND sal >= 2000
ORDER BY 3 DESC;

-- �ǽ� 4
-- ��� ���̺�� �޿� ��� ���̺��� ���, �����, �޿�, ����� �˻��Ͻÿ�
-- ��, ����� �޿��� ���Ѱ��� ���Ѱ� ������ ���Եǰ� ����� 4�̸� 
-- �޿��� �������� �������� ������ ��
SELECT empno ���, ename �����, sal �޿�, grade ���
FROM EMP, SALGRADE
WHERE sal BETWEEN losal AND hisal
AND grade = 4
ORDER BY 3 DESC;

-- �ǽ� 
-- �μ� ���̺�, ��� ���̺�, �޿���� ���̺��� 
-- ���, �����, �μ���, �޿�, ����� �˻��Ͻÿ�
-- ��, ����� �޿��� ���Ѱ��� ���Ѱ� ������ ���ԵǸ� ����� �������� �������� ������ ��
SELECT empno ���, ename �����, dname �μ���, sal �޿�, grade ���
FROM EMP e, DEPT d, SALGRADE
WHERE e.deptno = d.deptno
AND sal BETWEEN losal AND hisal
ORDER BY 5 DESC;

-- �ǽ� 10
-- Ŀ�̼��� �޴� ����� �̸�, Ŀ�̼�, �μ��̸��� ����Ͻÿ�
SELECT ename �̸�, comm Ŀ�̼�, dname �μ���
FROM EMP e, DEPT d
WHERE e.deptno = d.deptno
AND comm IS NOT NULL
AND comm != 0;

SELECT ename �̸�, comm Ŀ�̼�, dname �μ���
FROM EMP e, DEPT d
WHERE e.deptno = d.deptno
AND NVL(comm, 0) > 0;

-- �ǽ� 11
-- �̸��� 'A'�� ���� ������� �̸��� �μ��� ����ϱ�
SELECT ename �̸�, dname �μ���
FROM EMP e, DEPT d
WHERE e.deptno = d.deptno
AND ename LIKE '%A%';

-- �ǽ� 13
-- �ڽ��� �����ں��� ����(sal)�� ���� �޴� ����� �̸��� ������ ����Ͻÿ�
SELECT e.ename �̸�, e.sal ����
FROM    EMP e,  -- ����� ���� ���� 
        EMP m   -- �����ڿ� ���� ����
WHERE e.mgr = m.empno
AND e.sal > m.sal;

-- �ǽ� 15
-- �� �μ����� 1982�� ������ �Ի��� �������� �ο����� ����Ͻÿ�
SELECT COUNT(*)
FROM EMP e, DEPT d
WHERE e.deptno = d.deptno
AND TO_CHAR(hiredate, 'YYYY') < '1982'
GROUP BY d.deptno;

----- ANSI JOIN ���

-- �ǽ� 3
-- �μ� ���̺�� ��� ���̺��� ���, �����, ����, �޿�, �μ����� �˻��Ͻÿ�.
-- ��, ������ MANAGER�̸� �޿��� 2500�̻��� ����� ���Ͽ� ����� �������� �������� ������ ��
SELECT empno ���, ename �����, job ����, sal �޿�, dname �μ���
FROM EMP
JOIN DEPT
USING (deptno)
WHERE job = 'MANAGER'
AND sal >= 2500
ORDER BY 1;


-- �ǽ� 12
-- DALLAS�� �ٹ��ϴ� ��� �� �޿� 1500 �̻��� ����� �̸�, �޿�, �Ի���, ���ʽ�(COMM)�� ����Ͻÿ�
SELECT ename �̸�, sal �޿�, hiredate �Ի���, comm ���ʽ�
FROM EMP
JOIN DEPT
USING (deptno)
WHERE loc = 'DALLAS'
AND sal >= 1500;
