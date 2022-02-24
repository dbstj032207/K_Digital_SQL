-- DML

-- INSERT
INSERT INTO dept (deptno, dname, loc)
values (50, '�λ��', '����');       -- tx ���� ��

SELECT * FROM DEPT;      -- �˻��ϸ� �����Դ� �������� ���� ���̺��� �ݿ����� ����

ROLLBACK;       -- �ݿ����, tx ����

SELECT * FROM DEPT;      -- ������ ���� Ȯ��

INSERT INTO dept (deptno, dname, loc)
values (50, '�λ��', '����');       -- tx ���� ��

INSERT INTO dept (deptno, dname, loc)
values (60, '���ߺ�', '���');       -- �ϳ��� tx�� �ν� ��

SELECT * FROM DEPT;     -- �� ���� ���� ���Ե� ���� Ȯ�� ��(�����δ� �ƴ�)

ROLLBACK;       -- �ݿ����, tx ����

SELECT * FROM DEPT;      -- ������ ���� Ȯ��

-- 1. �÷� �̸� ���
INSERT INTO dept(loc, dname, deptno)    -- �÷��� ���� ����
VALUES ('����', '�λ��', 50);           -- ���� ������ ���缭 �ۼ�   -- tx ����

SELECT * FROM DEPT;

INSERT INTO dept(dname, loc, deptno)    -- �÷��� ���� ����
VALUES ('���ߺ�', '���', 60);           -- ���� ������ ���缭 �ۼ�    -- tx ����

SELECT * FROM DEPT;

COMMIT;     -- Ŀ�� => tx�ݿ�, tx����

ROLLBACK;       

SELECT * FROM DEPT;     -- �̹� tx�� ����Ǿ��� ������, Rollback �Ͽ��� �ݿ���������

INSERT INTO dept
VALUES (70, 'aa', 'bb');    -- tx ����

ROLLBACK;     -- tx ����

INSERT INTO dept
VALUES (70, 'aa', 'bb');    -- tx ����

COMMIT;       -- tx ����

-- Ʈ�����
-- 70 insert ��� : tx����
-- 30 ����
-- 40 �μ��̸� aa ����
-- rollback;        -- tx���� �������� ��� ����

-- 2. �÷� �̸� ����
INSERT INTO DEPT
VALUES (60, '�λ�', '���');

COMMIT;

SELECT * FROM DEPT;

-- 3. NULL�� INSERT
-- 3-1 ������ NULL �� INSERT
INSERT INTO DEPT(deptno, dname)
VALUES (70, '�λ�');

SELECT * FROM DEPT;

INSERT INTO DEPT( dname, loc)
VALUES ('�λ�', '����');        -- err: deptno�� PK��, null���� ������ �� ���� ����

-- 3-2 ����� NULL �� INSERT : null, ''
INSERT INTO DEPT(deptno, dname, loc)
VALUES( 80, '�λ�', null);        -- null ���

INSERT INTO DEPT(deptno, dname, loc)
VALUES( 90, '�λ�', '');          -- ''���

INSERT INTO DEPT(deptno, dname, loc)
VALUES( 95, '�λ�', ' ');          -- (����)''�� ���������� ���ڿ��� ó��

SELECT * FROM dept;

ROLLBACK;

-- 1. 5��, NULL, NULL INSERT ������ INSERT
INSERT INTO DEPT(deptno)
VALUES (5);

-- 2. 6��, NULL, '����'�� ����� INSERT
INSERT INTO DEPT(deptno, dname, loc)
VALUES (6, null, '����');

-- 3. 7��, NULL, '����'�� ������ INSERT
INSERT INTO DEPT(deptno, loc)
VALUES (7, '����');

SELECT * FROM dept;


-- EMP ���̺� INSERT
--EMPNO       NUMBER(4) => 4�ڸ� ����  PK:�⺻Ű
--ENAME
--JOB
--MGR         NUMBER(4) => 4�ڸ� ����
--HIREDATE    DATE
--SAL         NUMBER(7,2) => 7�ڸ� ����, �Ҽ� ��°�ڸ�����
--COMM        NUMBER(7,2) => 7�ڸ� ����, �Ҽ� ��°�ڸ�����
--DEPTNO      NUMBER(2) => 2�ڸ� ����     FK: �ܷ�Ű => DEPT���̺� �ִ� �μ��� ����

-- 4. 9000, 'scott', '������', 7839, sysdate, 5000, null, 10�� EMP�� INSERT
INSERT INTO EMP
VALUES (9000, 'scott', '������', 7839, sysdate, 5000, null, 10); 

INSERT INTO EMP
VALUES (9001, user, '������', 7839, sysdate, 5000, null, 10); 
               -- user�� ����� ����� �̸��� 'SCOTT'�� �ڵ����� ��
               -- USER: ����� ����(��Ű��)
               
INSERT INTO EMP
VALUES (9002, user, '������', 7839, sysdate, 5000, null, 60);      
                                                         -- ERR : FK �������� ����
                                                         
INSERT INTO EMP
VALUES (9002, user, '������', 7839, sysdate, 5000, null, 40);                                                            

               
INSERT INTO EMP
VALUES (9002, user, '������', 7839, sysdate, 40);     
        -- ERR: ����� ������ ���� �־����� ����
        
INSERT INTO EMP(empno, ename, job, mgr, hiredate, deptno) -- ���� ���
VALUES (9002, user, '������', 7839, sysdate, 40);            

SELECT *
FROM EMP
WHERE ename = 'scott';

-- TABLE ����
CREATE TABLE aa
AS 
SELECT * From dept;

CREATE TABLE MYDEPT
AS
SELECT * FROM DEPT
WHERE 1 = 2;        -- ���ڵ尡 ����ä�� �÷��� ����

ROLLBACK;       -- ���̺� ������ tx�� �ƴϱ⶧���� �ѹ��ص� ȿ�� ����

-- ���� INSERT
-- DEPT���̺� ��� �����͸� �ѹ��� MYDEPT�� INSERT
INSERT INTO MYDEPT
SELECT deptno, dname, loc
FROM DEPT;

COMMIT;


INSERT INTO MYDEPT
SELECT deptno, dname        -- �÷��� ������ �ȸ´� ��� 
FROM DEPT;

-- ���� ���̺� ������ INSERT

-- MYEMP_HIRE���̺� ����
CREATE TABLE MYEMP_HIRE
AS
SELECT empno, ename, hiredate, sal
FROM EMP
WHERE 1=2;

-- MYEMP_MGR���̺� ����
CREATE TABLE MYEMP_MGR
AS
SELECT empno, ename, mgr
FROM EMP
WHERE 1=2;

-- ������ ����
INSERT ALL
    INTO MYEMP_HIRE VALUES (empno, ename, hiredate, sal)
    INTO MYEMP_MGR  VALUES (empno, ename, mgr)
SELECT empno, ename, hiredate, sal, mgr
FROM EMP;

rollback;

INSERT ALL
    INTO MYEMP_HIRE VALUES (empno, ename, hiredate, sal)
    INTO MYEMP_MGR  VALUES (empno, ename, mgr)
SELECT *        -- *�� ����ص� ����
FROM EMP;


-- MYEMP_HIRE2���̺� ����
CREATE TABLE MYEMP_HIRE2
AS
SELECT empno, ename, hiredate, sal
FROM EMP
WHERE 1=2;

-- MYEMP_MGR2���̺� ����
CREATE TABLE MYEMP_MGR2
AS
SELECT empno, ename, mgr
FROM EMP
WHERE 1=2;

-- ���ǽ��� ����ؼ� ������ INSERT
INSERT ALL
    WHEN sal > 3000 THEN
        INTO MYEMP_HIRE2 VALUES (empno, ename, hiredate, sal)
    WHEN mgr = 7698 THEN
        INTO MYEMP_MGR2  VALUES (empno, ename, mgr)
SELECT empno, ename, hiredate, sal, mgr
FROM EMP;

-- ������ 4000 �̰� MRG�� 7698�� ����� �ִٸ� 
-- INSERT ALL�� ��� �ΰ��� ���̺� ��ο� ������
-- INSERT FIRST�� ��� ���� ���̺��� ���� �ȴ�.
INSERT FIRST
    WHEN sal > 3000 THEN
        INTO MYEMP_HIRE2 VALUES (empno, ename, hiredate, sal)
    WHEN mgr = 7698 THEN
        INTO MYEMP_MGR2  VALUES (empno, ename, mgr)
SELECT empno, ename, hiredate, sal, mgr
FROM EMP;



---------------------------------
------ UPDATE -------------------
---------------------------------

-- ����: KING�� sal 5000 => 1�� UPDATE
UPDATE EMP 
SET sal = 1;    -- ���⼭ ������� ��� ���ڵ��� sal�� 1�� ���� ��

UPDATE EMP
SET sal = 1
WHERE ename = 'KING';

ROLLBACK;

-- 1. DEPT�� 50, ����, ���� INSERT
INSERT INTO DEPT
VALUES (50, '����', '����');

SELECT * FROM DEPT;

COMMIT;

-- 2. DEPT���� 50�� �μ��� ����, ���� UPDATE
UPDATE DEPT 
SET dname = '����', loc = '���'
WHERE deptno = 50;

SELECT * FROM DEPT;

COMMIT;

3. EMP���� ������ SALSEMAN�� ����� COMM�� ��� 1000���� ����
UPDATE EMP
SET comm = 1000
WHERE job = 'SALESMAN';

SELECT * FROM EMP;

ROLLBACK;

--- UPDATE �������� ��������
-- MTDEPT���̺��� �μ���ȣ�� 60�� ����� �μ�����
-- DEPT���̺��� �μ���ȣ�� 10�� �μ��� �μ������� �����ϰ�
-- �μ���ġ�� DEPT���̺��� �μ���ȣ�� 20�� �μ���ġ�� ����
UPDATE MYDEPT
SET dname = (   SELECT dname
                FROM DEPT
                WHERE deptno = 10),
    loc = ( SELECT loc
            FROM DEPT
            WHERE deptno = 20)
WHERE deptno = 60;


-- 4. EMP�� �����ȣ 9000, �̸� SCOTT, �Ի��� ���ó�¥, �μ���ȣ 10 INSERT
INSERT INTO EMP (empno, ename, hiredate, deptno)
VALUES  ('9000', 'scott', sysdate, 10);

-- SELECT Ȯ��
SELECT * FROM EMP;

-- SAL 100, JOB SALESMAN, COMM 150���� UPDATE
UPDATE EMP
SET sal = 100, job = 'SALESMAN', comm = 150
WHERE ename = 'scott';

-- SELECT Ȯ��
SELECT * FROM EMP;

-- ROLLBACK
ROLLBACK;

-----------------------------------------------
SELECT * FROM EMP;
SELECT * FROM scott.EMP;


---------------------------------
------ DELETE -------------------
---------------------------------

DELETE FROM dept;   -- err: emp���̺��� deptno�� �����ϰ� �ֱ⶧���� ���� �Ұ�
DELETE FROM EMP;    -- ������ ���ٸ� ��� �� ����
ROLLBACK;

DELETE FROM DEPT
WHERE deptno = 50;

SELECT *
FROM DEPT;

COMMIT;

-- 1. emp���̺��� comm �� null�� ��� ���� �� �ѹ�
DELETE FROM EMP
WHERE comm IS NULL;

ROLLBACK;

-- 2. DEPT���̺��� 20�� �μ��� ������ ������ ������ �μ��� ����
DELETE FROM DEPT
WHERE loc = (   SELECT loc
                FROM DEPT
                WHERE deptno = 20)
AND deptno != 20;       -- �μ���ȣ 20�� ����

ROLLBACK;


---------------------------------
------ MERGE --------------------
---------------------------------

CREATE TABLE pt_01
(   �ǸŹ�ȣ    VARCHAR2(8),
    ��ǰ��ȣ    NUMBER,
    ����      NUMBER,
    �ݾ�      NUMBER);
    
CREATE TABLE pt_02
(   �ǸŹ�ȣ    VARCHAR2(8),
    ��ǰ��ȣ    NUMBER,
    ����      NUMBER,
    �ݾ�      NUMBER);
    
CREATE TABLE p_total
(   �ǸŹ�ȣ    VARCHAR2(8),
    ��ǰ��ȣ    NUMBER,
    ����      NUMBER,
    �ݾ�      NUMBER);
    
INSERT INTO pt_01 VALUES( '20170101', 1000, 10, 500);   
INSERT INTO pt_01 VALUES( '20170102', 1001, 10, 400);   
INSERT INTO pt_01 VALUES( '20170103', 1002, 10, 300);   

INSERT INTO pt_02 VALUES( '20170201', 1003, 5, 500);   
INSERT INTO pt_02 VALUES( '20170202', 1004, 5, 400);   
INSERT INTO pt_02 VALUES( '20170203', 1005, 5, 300);   

COMMIT;

-- pt_01 ����
MERGE INTO p_total total
USING pt_01 p01
ON( total.�ǸŹ�ȣ = p01.�ǸŹ�ȣ)
WHEN MATCHED THEN
    UPDATE SET total.��ǰ��ȣ = p01.��ǰ��ȣ
WHEN NOT MATCHED THEN
    INSERT VALUES (p01.�ǸŹ�ȣ, p01.��ǰ��ȣ, p01.����, p01.�ݾ�);
    
-- pt_02 ����
MERGE INTO p_total total
USING pt_02 p02
ON( total.�ǸŹ�ȣ = p02.�ǸŹ�ȣ)
WHEN MATCHED THEN
    UPDATE SET total.��ǰ��ȣ = p02.��ǰ��ȣ
WHEN NOT MATCHED THEN
    INSERT VALUES (p02.�ǸŹ�ȣ, p02.��ǰ��ȣ, p02.����, p02.�ݾ�);
    
    
-- Ʈ������

-- DEPT 50, aa, aa INSERT           - tx ����
INSERT INTO DEPT
VALUES (50, 'aa', 'aa');

-- DEPT 40�� �ּ� aa�� update
UPDATE DEPT
SET loc = 'aa'
WHERE deptno = 40;

-- Ȯ��
SELECT * FROM DEPT;

-- ROLLBACK                     - tx ����
ROLLBACK;

-- Ȯ��
SELECT * FROM DEPT;


---- lock
UPDATE DEPT
SET loc = '�λ�'
WHERE deptno = 40;
-- ROLLBACK�̳� COMMIT �ϱ� ������
-- �ٸ� ����ڰ� ���� �Ұ�

ROLLBACK;

