------ 8. ��Ÿ ��Ű�� ��ü

---- 1) ��
-- �μ� ��ȣ�� 20�� ����� ��������� �μ������� �˻�
-- Oracle ����
SELECT empno, ename, e.deptno, dname 
FROM EMP e, DEPT d
WHERE e.deptno = d.deptno
AND e.deptno = 20;

-- ANSI ����
SELECT empno, ename, deptno, dname 
FROM emp
JOIN dept
USING (deptno)
WHERE deptno = 20;

-- ���� ����� view�� ����
CREATE VIEW emp_view
AS
SELECT empno, ename, e.deptno, dname 
FROM EMP e, DEPT d
WHERE e.deptno = d.deptno
AND e.deptno = 20;          -- ERR: ���� ����
-- scott ������ �� ������ ���� ������ �ο����� ���߱⶧���� ���� �߻�

-------- sys �������� view ���� ���� �ο� ------------
-- view �ٽ� ����
CREATE VIEW emp_view
AS
SELECT empno, ename, e.deptno, dname 
FROM EMP e, DEPT d
WHERE e.deptno = d.deptno
AND e.deptno = 20;                  -- ���� ���� ����

DESC emp_view;
SELECT * FROM emp_view;

-- ����
-- emp_view2 : emp���̺��� sal�� �� ������ Į������ �� ����
CREATE VIEW emp_view2
AS
SELECT empno, ename, job, mgr, hiredate, comm, deptno
FROM emp;

DESC emp_view2;
SELECT * FROM emp_view2;

-- �� ����
CREATE OR REPLACE VIEW emp_view2
AS
SELECT empno, ename, job, mgr, comm, deptno
FROM emp;

SELECT * FROM emp_view2;

-- �ܼ� ��
CREATE VIEW emp_view3 ( �����ȣ, �̸�, ����)
AS
SELECT empno, ename, sal
FROM emp
WHERE deptno = 20;

DESC emp_view3;

UPDATE emp_view3
SET �̸� = 'aa'
WHERE �����ȣ = 7369;

-- View���� ����� ���� Ȯ��
SELECT * FROM emp_view3;

-- ���� Table Ȯ��
SELECT * FROM emp;      -- ���� ���̺� ���� �� ���� Ȯ��

-- �ٽ� ������� ����
UPDATE emp_view3
SET �̸� = 'SMITH'
WHERE �����ȣ = 7369;


------------------
-- err
CREATE VIEW emp_view4
AS
SELECT deptno, SUM(sal)
FROM emp
GROUP BY deptno;

-- �Լ� ���� ��Ī ����
CREATE VIEW emp_view4
AS
SELECT deptno, SUM(sal) ����
FROM emp
GROUP BY deptno;

select * from emp_view4;

-- EMP_VIEW5 ����
CREATE VIEW emp_view5
AS
SELECT empno, ename, sal, deptno
FROM emp;

SELECT * FROM emp_view5;

-- 10�� �μ� ��� ����
DELETE FROM emp_view5
WHERE deptno = 10;

-- ���� ���̺����� ���� ��
SELECT * FROM EMP;

ROLLBACK;

-------------------------------------------------------
-------------- 2. ������(Sequence) ---------------------

CREATE SEQUENCE dept_detpno_seq
    START WITH 10
    INCREMENT BY 10
    MAXVALUE 100
    MINVALUE 5
    CYCLE
    NOCACHE;
    
SELECT DEPT_DETPNO_SEQ.nextval    
FROM DUAL;   
-- ó���� 10 �� ��µ�
-- �ѹ� �� �����ϸ� 20 
-- �����Ҷ����� 10�� ����
-- 100���� �����ߴٰ� 
-- 100���� �ѹ� �� �����ϸ� CYCLE ���ǿ� ���� MINVALUE�� 5���� �ٽ� ����
-- �����Ҷ����� 10�� ����

------------- ó������ �ٽ� �����ϰ� ������ DROP �� �� �����ؾ���
DROP SEQUENCE dept_detpno_seq;


-- �ٽ� ���� �� 50���� ��� �ɶ����� ����
SELECT DEPT_DETPNO_SEQ.nextval    
FROM DUAL;   

-- �μ� ��ȣ 60�� �ڵ����� �����Ǽ� ����
INSERT INTO dept
VALUES (DEPT_DETPNO_SEQ.nextval, 'aa', 'aa');


SELECT  DEPT_DETPNO_SEQ.nextval,
        DEPT_DETPNO_SEQ.currval
FROM DUAL;       


CREATE SEQUENCE dept_detpno_seq2
    START WITH 100
    INCREMENT BY -10
    MAXVALUE 150
    MINVALUE 10
    CYCLE
    NOCACHE;
    
SELECT DEPT_DETPNO_SEQ2.nextval
FROM dual;
-- 100���� ������ 10�� �پ��� 10���� �����
-- 10���� ����� 150���� ����Ǿ� �ٽ� 10�� �پ��� ��


-- sequence �� Ȯ��
select *
from user_sequences
WHERE sequence_name = 'DEPT_DETPNO_SEQ2';

-- ���� �������� �ʰ� ������ ����
CREATE SEQUENCE dept_detpno_seq3;

-- �� Ȯ��
select *
from user_sequences
WHERE sequence_name = 'DEPT_DETPNO_SEQ3';
-- LAST_NUMBER = 1
-- MIN_VALUE = 1
-- MAX_CALUE = 9999999999999999999999999999
-- INCREMENT BY = 1
-- CYCLE = N
-- CACHE_SIZE = 20

-- INCREMENT BY�� 10����, CYCLE�� Y�� ����
ALTER SEQUENCE DEPT_DETPNO_SEQ3
    INCREMENT BY 10
    CYCLE;

-- ���� �� ���� Ȯ��
select *
from user_sequences
WHERE sequence_name = 'DEPT_DETPNO_SEQ3';

-- START WITH�� ���� �õ�
ALTER SEQUENCE DEPT_DETPNO_SEQ3
    START WITH 5;       -- ERR
    

-- ���ο� ���̺� ����    
CREATE TABLE dept06
( deptno    NUMBER(4)   PRIMARY KEY,
  dname     VARCHAR2(15),
  loc       VARCHAR2(15)
);

CREATE SEQUENCE DEPT_DETPNO_SEQ4
    START WITH 10
    INCREMENT BY 10
    NOCYCLE;
    
INSERT INTO dept06
VALUES( DEPT_DETPNO_SEQ4.NEXTVAL, '����', '����');
INSERT INTO dept06
VALUES( DEPT_DETPNO_SEQ4.NEXTVAL, '�λ�', '���');
INSERT INTO dept06
VALUES( DEPT_DETPNO_SEQ4.NEXTVAL, '����', '�λ�');
COMMIT;

SELECT * FROM DEPT06;

DROP SEQUENCE dept_detpno_seq4;