-- SQL�� ��ҹ��ڸ� �������� ����
SELECT * FROM EMP;
select * from emp;

-- �ǻ��ڵ� 
SELECT *
FROM EMP
WHERE ROWNUM < 10;

-- ��� �÷� Ž��
SELECT * FROM EMP;

-- EMPNO�÷��� Ž��  // PROJECTION
SELECT EMPNO FROM EMP;

-- EMPNO, ENAME�÷��� Ž��  // PROJECTION
SELECT EMPNO, ENAME FROM EMP;

-- EMPNO, ENAME, DEPTNO�÷��� Ž��  // PROJECTION
SELECT EMPNO, ENAME, DEPTNO FROM EMP;

-- �μ� ��ȣ�� 10�� ��(�ο�)�� Ž��
SELECT * FROM EMP
WHERE DEPTNO = 10;

-- ����ڰ� �������ִ� ��� ���̺��� ǥ�����ش�
SELECT * FROM tab;

-- ���̺��� ������ Ȯ���ϱ� ���� ��ɾ�
DESC EMP;
DESC DEPT;
DESC SALGRADE;
DESC BONUS;

-- ������ ������ ���̺� ��� ����
SELECT * FROM tab;

-- Ư�� ���̺��� �÷� ���� ����
DESC DEPT;

-- ���̺��� ��� ������ ����
SELECT * FROM DEPT;

-- ���̺��� Ư�� �÷� ������ ����
SELECT EMPNO, ENAME, JOB, HIREDATE FROM EMP;

SELECT empno, ename, sal FROM EMP;

-- ��� ������
-- sal*12�� �����÷���
SELECT empno, ename, sal, sal*12 FROM EMP;

-- AS�� ���� ��Ī �ο�
SELECT empno AS ���, ename AS ����, sal AS �޿�, sal*1.1 AS �λ��_�޿� FROM EMP;
