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
SELECT sal+100 FROM EMP;
SELECT sal/100 FROM EMP;

SELECT ename,hiredate, hiredate + 1 FROM EMP;

-- dual ���̺� : �ܼ��� ������ ����� ���� �׽�Ʈ�� ���� ����� �� �ִ� ���̺�
SELECT 245*567
FROM dual;

-- �ý��� ��¥ ǥ��
SELECT SYSDATE FROM dual;

-- AS�� ���� ��Ī �ο�
SELECT empno AS ���, ename AS ����, sal AS �޿�, sal*1.1 AS �λ��_�޿� FROM EMP;

-- AS�� ��������
SELECT ename ����, sal ����, sal*12 ���� FROM EMP;

-- �����̳� Ư�����ڸ� ����� ��� " "�� ��������Ѵ�.
SELECT ename "��� �̸�", sal ����, sal*12 ���� FROM EMP;

-- ��Ī���� " " ���
-- ' ' : ����, ��¥ �����Ϳ� ���
-- �˻��� ������ ��ҹ��� ������ �Ѵ�
SELECT * FROM EMP
WHERE ENAME = 'SMITH';

--null���� ������ �������� 
SELECT ENAME, MGR, MGR + 1 FROM EMP;

-- �����ڹ�ȣ 7698�� ����� �̸�, �����ڹ�ȣ SELECT
SELECT ENAME, MGR FROM EMP
WHERE MGR = 7698;

-- null ���� �񱳴� IS NULL, IS NOT NULL �̶�� ������ ������ ����ؾ� ����� �� ����� ���� �� �ִ�.
SELECT ENAME, MGR FROM EMP
WHERE MGR IS NULL;

SELECT ENAME, MGR FROM EMP
WHERE MGR IS NOT NULL;

-- null�� ���� �Ұ�: comm�� 0�ΰ�� ��� 0�� ǥ��
SELECT ENAME �̸�, SAL ����, comm Ŀ�̼�, SAL*12 + comm ���� FROM EMP;

-- NVL�� ���� null���� 0���� ��ü
SELECT ENAME, comm, NVL(comm, 0) FROM EMP;
SELECT ENAME �̸�, SAL ����, comm Ŀ�̼�, SAL*12 + NVL(comm, 0) ���� FROM EMP;

--���� ���� ���ڿ��� �����Ͽ� �ϳ��� ���ڿ��� ����
SELECT ENAME || JOB AS "�̸� ����" FROM EMP;

SELECT ENAME || '�� ������ '|| JOB || '�̴�.' AS "����� ����" 
FROM EMP;

SELECT JOB FROM EMP;

-- �ߺ� ����
SELECT DISTINCT JOB FROM EMP;

-- EMP ���̺��� �μ���ȣ �ߺ����� SELECT
SELECT DISTINCT deptno FROM EMP;

-- EMP ���̺��� ����� ����� �ٿ��� SELECT
SELECT ename||'���' AS "��� �̸�" FROM EMP;

-- SMITH�� �̸��� ������ ã�� "SMITH�� ������ CLERK" ��Ī "�������"
SELECT ENAME || '�� ������ ' || JOB AS "�������"
FROM EMP
WHERE ENAME = 'SMITH';

-- �����ȣ 7369���� ����̸��� ����, ����(����*12 + comm) "����"���� select
SELECT ENAME �̸�, SAL ����, SAL*12 + NVL(comm, 0) ���� 
FROM EMP
WHERE EMPNO = 7369;

-- �μ���ȣ 30�� ���, �̸�, �Ի��� select
SELECT empno ���, ename �̸�, hiredate �Ի���
FROM EMP
WHERE DEPTNO = 30;