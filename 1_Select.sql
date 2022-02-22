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

-- �μ���ȣ 40�� ���, �̸�, �Ի��� select
-- ���� ����� ã�°� ������ �ƴ�
SELECT empno ���, ename �̸�, hiredate �Ի���
FROM EMP
WHERE DEPTNO = 40;

-- ��ҹ��� ����
SELECT empno ���, ename �̸�, hiredate �Ի���
FROM EMP
WHERE JOB = 'SALESMAN';

-- ��¥�� ''�� ��� ���
SELECT empno ���, ename �̸�, hiredate �Ի���
FROM EMP
WHERE hiredate = '81/11/17';

-- �񱳿�����
SELECT empno ���, ename �̸�, sal ����
FROM EMP
WHERE sal <= 1000;

SELECT empno ���, ename �̸�, sal ����
FROM EMP
WHERE sal <= 1250;

SELECT empno ���, ename �̸�, sal ����
FROM EMP
WHERE sal < 1250;

SELECT empno ���, ename �̸�, hiredate �Ի糯¥
FROM EMP
WHERE hiredate > '81/02/22';

-- BETWEEN AND
SELECT empno ���, ename �̸�, sal ����
FROM EMP
WHERE sal BETWEEN 1000 AND 2000;

-- �ִ� �ּҸ� �ٲٸ� ��� �ȳ���
SELECT empno ���, ename �̸�, sal ����
FROM EMP
WHERE sal BETWEEN 2000 AND 1000;

-- ��¥�� between ��밡��
SELECT empno ���, ename �̸�, hiredate �Ի糯¥
FROM EMP
WHERE hiredate BETWEEN '81/02/20' AND '81/12/03';

-- IN
SELECT empno ���, ename �̸�, job ����
FROM EMP
WHERE EMPNO IN (7839, 7844, 7876);

SELECT empno ���, ename �̸�, sal ����
FROM EMP
WHERE ename IN ('KING', 'SMITH');

-- IS NULL
SELECT empno ���, ename �̸�, comm Ŀ�̼�
FROM EMP
WHERE comm IS NULL;

SELECT empno ���, ename �̸�, comm Ŀ�̼�
FROM EMP
WHERE comm IS NOT NULL;

-- LIKE
-- A%, %A, %A%
SELECT empno ���, ename �̸�, job ����
FROM EMP
WHERE ename LIKE 'A%';

SELECT empno ���, ename �̸�, job ����
FROM EMP
WHERE ename LIKE '%A%';

SELECT empno ���, ename �̸�, job ����
FROM EMP
WHERE ename LIKE '%T%';

SELECT empno ���, ename �̸�, job ����
FROM EMP
WHERE ename LIKE '_L%'; -- ù��° ���ڴ� ���� ���� �������, �ι�° ���ڰ� �빮�� L�� ���ڿ�

SELECT empno ���, ename �̸�, job ����
FROM EMP
WHERE ename LIKE '___D';

SELECT empno ���, ename �̸�, job ����
FROM EMP
WHERE ename LIKE '%S';

-- �� ������
SELECT empno ���, ename �̸�, job ����, sal ����
FROM EMP
WHERE job = 'SALESMAN' AND sal >= 1500;

SELECT empno ���, ename �̸�, job ����, sal ����
FROM EMP
WHERE job = 'SALESMAN' OR sal >= 1500;

SELECT empno ���, ename �̸�, comm Ŀ�̼�
FROM EMP
WHERE comm IS NOT NULL;

-- AND OR�� �켱����
SELECT ename �̸�, job ����, sal ��, comm Ŀ�̼�
FROM EMP
WHERE job = 'CLERK' OR job = 'ANALYST'
AND comm IS NULL
AND sal BETWEEN 1000 AND 3000;

-- �̺κ��� ���� �����
SELECT ename �̸�, job ����, sal ��, comm Ŀ�̼�
FROM EMP
WHERE comm IS NULL
AND sal BETWEEN 1000 AND 3000;

SELECT ename �̸�, job ����, sal ��, comm Ŀ�̼�
FROM EMP
WHERE (job IN 'CLERK' OR job = 'ANALYST')
AND comm IS NULL
AND sal BETWEEN 1000 AND 3000;

SELECT ename �̸�, job ����, sal ��, comm Ŀ�̼�
FROM EMP
WHERE job IN ('CLERK', 'ANALYST')
AND comm IS NULL
AND sal BETWEEN 1000 AND 3000;

SELECT ename �̸�, job ����, sal ����
FROM EMP
WHERE NOT sal > 1000;

SELECT ename �̸�, job ����, sal ����, deptno �μ���ȣ
FROM EMP
WHERE deptno NOT IN (10, 20);

SELECT ename �̸�, job ����
FROM EMP
WHERE ename NOT LIKE 'J%';

--���� �⺻�� ��������
SELECT empno ���, ename �̸�, hiredate �Ի糯¥
FROM EMP
ORDER BY hiredate;
--ORDER BY 3;

-- ������������ ����SELECT empno ���, ename �̸�, hiredate �Ի糯¥
SELECT empno ���, ename �̸�, hiredate �Ի糯¥
FROM EMP
ORDER BY hiredate DESC;

--��Ī�� �̿��ؼ��� ���� ����
SELECT empno ���, ename �̸�, SAL * 12 ANNUAL
FROM EMP
ORDER BY ANNUAL;
--ORDER BY 3;

-- ���Ŀ� null���� ���Ե� ��� null�� ���� ū������ ��ȯ
SELECT empno ���, ename �̸�, SAL * 12 ANNUAL, comm Ŀ�̼�
FROM EMP
ORDER BY 4;

-- ���� ���ǿ� ���� �ѹ� ���� ��, ���� ���� ������ ���� ���ǿ� ���� ���ĵ�
SELECT empno ���, ename �̸�, SAL ����
FROM EMP
ORDER BY SAL DESC, EMPNO;