---- DDL

-- ROWID Ȯ��
SELECT ROWID, deptno
FROM DEPT;

SELECT *
FROM DEPT
WHERE rowid = 'AAAE5cAABAAALCJAAA';


--- CREATE
CREATE Table employee
( empno     NUMBER(4),
  ename     VARCHAR2(20),
  hiredate  DATE,
  sal       NUMBER(7,2));
  
-- INSERT
INSERT INTO employee
VALUES (7698, 'smith', sysdate, 700);
INSERT INTO employee
VALUES (null, 'aa', null, 100);     
        -- null���������� ���� �ʾұ⶧���� �������� ���Ե�
INSERT INTO employee
VALUES (10000, 'bb', sysdate, 200);
        -- ���̺��� �����Ҷ� NUMBER(4)�� 4����Ʈ�� �����߱⶧���� ���� �Ұ�

SELECT * FROM employee;

-- DEFAULT �ɼ�
CREATE Table employee2
( empno     NUMBER(4),
  ename     VARCHAR2(20),
  hiredate  DATE DEFAULT SYSDATE,
  sal       NUMBER(7,2));
  
INSERT INTO employee2(empno, ename, sal)
VALUES (10, 'ȫ�浿', 3000);
  
SELECT * FROM employee2;      -- hiredate�� �ڵ����� ���ó�¥�� ������ �� �� �ִ�.

------------------
CREATE TABLE DEF_TABLE
( NUM       NUMBER(2),
  WRITEDAY  DATE);
  
CREATE TABLE DEF_TABLE2
( NUM       NUMBER(2),
  WRITEDAY  DATE DEFAULT SYSDATE); 
  
INSERT INTO def_table( NUM)
VALUES (1);     -- WRITEDAY�� NULL�� ����

INSERT INTO def_table2( NUM)
VALUES (1);     -- WRITEDAT�� ���ó�¥ ����

INSERT INTO def_table2( NUM, WRITEDAY)
VALUES (2, DEFAULT);        -- DEFAULT ��� ����
  
SELECT * FROM DEF_TABLE;
SELECT * FROM DEF_TABLE2;


-- ���� ����
-- ���� ������ �߰� ��ġ 2����: �÷�����, ���̺� ���� �� ����
CREATE Table employee
( empno     NUMBER(4)   /* (�÷� ����) Ű��Ű */,
  ename     VARCHAR2(20),
  hiredate  DATE DEFAULT SYSDATE,
  DEPTNO    NUMBER(2) /* , */
  /* (���̺� ����) empno Ű��Ű */
);

INSERT INTO employee
VALUES (1111, 'SMITH', SYSDATE, 4);

SELECT * FROM employee;

-- �÷� ����
-- ���� ���� �̸� ����
CREATE TABLE DEPARTMENT
( deptno    NUMBER(2)   PRIMARY KEY,
  dname     VARCHAR2(15),
  loc       VARCHAR2(15)
);

-- �������� �̸� ���
CREATE TABLE DEPARTMENT 
( deptno    NUMBER(2)   CONSTRAINT departmnet_deptno_pk  PRIMARY KEY,
  dname     VARCHAR2(15),
  loc       VARCHAR2(15)
);

INSERT INTO department
VALUES (1, 'aa', 'aa');

INSERT INTO department
VALUES (NULL, 'bb', 'bb');      -- PK �������ǿ� �ɷ��� ���� �Ұ�(NOT NULL)

INSERT INTO department
VALUES (1, 'cc', 'cc');         -- PK �������ǿ� �ɷ��� ���� �Ұ�(UNIQUE)

INSERT INTO department
VALUES (10, '�λ�', '����');     

INSERT INTO department
VALUES (10, '����', '���');        -- PK �������ǿ� �ɷ��� ���� �Ұ�(UNIQUE)

INSERT INTO department
VALUES (NULL, '�λ�', '����');      -- PK �������ǿ� �ɷ��� ���� �Ұ�(NOT NULL)

SELECT * FROM DEPARTMENT;

DROP TABLE DEPARTMENT;

-- USER_CONSTRINTS�� ���� �������� Ȯ��
SELECT *
FROM user_constraints
WHERE table_name = 'DEPARTMENT';

-- ���̺� ����
CREATE TABLE DEPARTMENT2
( deptno    NUMBER(2),
  dname     VARCHAR2(15),
  loc       VARCHAR2(15),
  CONSTRAINT departmnet2_deptno_pk  PRIMARY KEY(deptno)
);

INSERT INTO department2
VALUES (10, '�λ�', '����');     

INSERT INTO department2
VALUES (10, '����', '���');        -- PK �������ǿ� �ɷ��� ���� �Ұ�(UNIQUE)

INSERT INTO department2
VALUES (NULL, '�λ�', '����');      -- PK �������ǿ� �ɷ��� ���� �Ұ�(NOT NULL)

SELECT * FROM department2;

-- USER_CONSTRINTS�� ���� �������� Ȯ��
SELECT *
FROM user_constraints
WHERE table_name IN ('DEPARTMENT2');

-- �ΰ��� �÷��� �⺻ Ű�� ����
CREATE TABLE DEPARTMENT3
( deptno    NUMBER(2),
  dname     VARCHAR2(15),
  loc       VARCHAR2(15),
  CONSTRAINT departmnet3_deptno_pk  PRIMARY KEY(deptno, loc)
);

-- USER_CONSTRINTS�� ���� �������� Ȯ��
SELECT *
FROM user_constraints
WHERE table_name IN ('DEPARTMENT3');

INSERT INTO department3
VALUES (10, '�λ�', '����');     

INSERT INTO department3
VALUES (10, '����', '���');        -- (deptno, loc)�� ������ �����ϱ� ������ ���� ����

INSERT INTO department3
VALUES (NULL, '�λ�', '����');      -- PK �������ǿ� �ɷ��� ���� �Ұ�(NOT NULL)

INSERT INTO department3
VALUES (10, '����', '���');        -- PK �������ǿ� �ɷ��� ���� �Ұ�(UNIQUE)

select * from department3;



-- UNIQUE ���� ����
CREATE TABLE department4
( deptno    NUMBER(2)       CONSTRAINT departmnet4_deptno_pk    PRIMARY KEY,
  dname     VARCHAR2(15)    CONSTRAINT departmnet4_dname_uk     UNIQUE,
  loc       VARCHAR2(15) );
  
INSERT INTO department4
VALUES (10, '����', '����');     

INSERT INTO department4
VALUES (20, '����', '���');        -- UNIQUE �������� ���� (dname) 

INSERT INTO department4
VALUES (30, NULL, '����');         -- NULL ���� �������� ���� ���� 

-- ���̺� �׺�
CREATE TABLE department5
( deptno    NUMBER(2)       CONSTRAINT departmnet5_deptno_pk    PRIMARY KEY,
  dname     VARCHAR2(15),    
  loc       VARCHAR2(15),
  CONSTRAINT departmnet5_dname_uk     UNIQUE(dname));
  
INSERT INTO department5
VALUES (10, '����', '����');     

INSERT INTO department5
VALUES (20, '����', '���');        -- UNIQUE �������� ���� (dname) 

INSERT INTO department5
VALUES (30, NULL, '����');         -- NULL ���� �������� ���� ���� 

drop table department5;

-- ���̺� �������� 2���� �������� ����
drop table department5;
CREATE TABLE department5
( deptno    NUMBER(2),
  dname     VARCHAR2(15),    
  loc       VARCHAR2(15),
  CONSTRAINT departmnet5_dname_uk     UNIQUE(dname),
  CONSTRAINT departmnet5_deptno_pk    PRIMARY KEY(deptno));


-- NOT NULL Į�� �������� ����
CREATE TABLE department6
( deptno    NUMBER(2),
  dname     VARCHAR2(15),    
  loc       VARCHAR2(15)    CONSTRAINT departmnet6_loc_nn   NOT NULL,
  CONSTRAINT departmnet6_dname_uk     UNIQUE(dname),
  CONSTRAINT departmnet6_deptno_pk    PRIMARY KEY(deptno));
  
INSERT INTO department6
VALUES (10, '�λ�', '����'); 
INSERT INTO department6
VALUES (10, 'aa', '���');        -- PK �������� ���� (deptno) 
INSERT INTO department6
VALUES (10, '�λ�', '���');        -- UNIQUE �������� ���� (dname)
INSERT INTO department6
VALUES (20, '����', NULL);        -- NOT NULL �������� ���� (loc)
INSERT INTO department6
VALUES (20, NULL, '���'); 

-- ���̺� �������� NOT NULL ����Ұ�
CREATE TABLE department6
( deptno    NUMBER(2),
  dname     VARCHAR2(15),    
  loc       VARCHAR2(15)    CONSTRAINT departmnet6_loc_nn   NOT NULL,
  CONSTRAINT departmnet6_dname_uk     UNIQUE(dname),
  CONSTRAINT departmnet6_deptno_pk    PRIMARY KEY(deptno));


--- CHECK ��������
CREATE TABLE department7
( deptno    NUMBER(2),
  dname     VARCHAR2(15) CONSTRAINT departmnet7_dame_ck CHECK( dname IN('����', '�λ�')) ,    
  loc       VARCHAR2(15));
  
INSERT INTO department7
VALUES (10, '����', '����');

INSERT INTO department7
VALUES (20, '�λ�', '���');

INSERT INTO department7
VALUES (30, '���ߺ�', '����');       -- CHECK �������� ����(dname)
  
SELECT * FROM department7;

CREATE TABLE department8
( deptno    NUMBER(2),
  dname     VARCHAR2(15),     
  loc       VARCHAR2(15),
  CONSTRAINT departmnet8_dame_ck CHECK( dname IN('����', '�λ�')) );
  
INSERT INTO department8
VALUES (10, '����', '����');

INSERT INTO department8
VALUES (20, '�λ�', '���');

INSERT INTO department8
VALUES (30, '���ߺ�', '����');       -- CHECK �������� ����(dname)

INSERT INTO department8
VALUES (30, NULL, '����');          -- NULL ���� �������� ���� ����

-- CHECK ���ǿ� �ε�ȣ ������ ���
-- ���̺� ����
CREATE TABLE SAWON_7
( s_no      NUMBER(2),
  s_name    VARCHAR2(15),     
  s_sal     NUMBER(10),
  CONSTRAINT SAWON_7s_sal_ck CHECK( s_sal < 500 ) );
  
INSERT INTO SAWON_7
VALUES (1, 'ȫ�浿', 600);     -- CHECK �������� ����( s_sal < 500 )

INSERT INTO SAWON_7
VALUES (1, 'ȫ�浵', 400);

-- �÷� ����
CREATE TABLE SAWON_8
( s_no      NUMBER(2),
  s_name    VARCHAR2(15),     
  s_sal     NUMBER(10) CONSTRAINT SAWON_8_s_sal_ck CHECK( s_sal < 500 )
);

-- FOREIGN KEY
-- EMP���̺� : �����ȣ 9000, �̸��� 'aa', �μ���ȣ 50, �������� null
INSERT INTO EMP(empno, ename, deptno)
VALUES (9000, 'aa', 50);        -- dept ���̺� 50 ���� ���� ������ ���� �Ұ�
                                -- FK �������� ���� (deptno)

-- �������� Ȯ��                                
SELECT table_name, constraint_type, constraint_name, r_constraint_name
FROM user_constraints
WHERE table_name IN ('DEPT', 'EMP');

/* emp02.deptno(fk) -> dept02.deptno(pk)��, emp02, dept02 ���̺� �ΰ��� ������� �Ѵ�.
   1. �⺻Ű�� �������ִ� dept02�� ���� �����Ǿ���Ѵ�.
   2. ���� deptno�� FK�� ���Բ� ���������� �����Ͽ� emp02�� �����Ѵ�.    */

-- 1   
CREATE TABLE dept02 
( deptno NUMBER(2) CONSTRAINT dept02_deptno_pk PRIMARY KEY,
  dename VARCHAR2(15),
  loc    VARCHAR2(15)
);
  
-- 2  
CREATE TABLE emp02
( empno     NUMBER(4) CONSTRAINT emp02_empno_pk PRIMARY KEY,
  ename     VARCHAR2(15),
  deptno    NUMBER(2) CONSTRAINT emp02_deptno_fk REFERENCES dept02(deptno)
);

INSERT INTO emp02 
VALUES (1000, 'John', 10);      -- deptno 10�� dept02�� ���� ������ ���� �Ұ�

-- dept02�� ���� ����
INSERT INTO dept02
VALUES (10, '�λ�', '����');
INSERT INTO dept02
VALUES (20, '����', '����');
INSERT INTO dept02
VALUES (30, '����', '�λ�');
INSERT INTO dept02
VALUES (40, '����', '���');

COMMIT;

INSERT INTO emp02 
VALUES (1000, 'John', 10);
INSERT INTO emp02 
VALUES (2000, 'Smith', 20);
INSERT INTO emp02 
VALUES (3000, 'Sam', NULL);     -- NULL���� ���� ���� ���� ����
INSERT INTO emp02 
VALUES (4000, 'Mike', 50);      -- dept 50�� dept02�� ���� ������ ���� �Ұ�

-- �����Ҷ��� emp02 ���� �����ϰ� dept02�� ����
DROP TABLE emp02;
DROP TABLE dept02;

CREATE TABLE dept02
( deptno    NUMBER(02)      CONSTRAINT dept02_deptno_pk PRIMARY KEY,
  dname     VARCHAR2(15)    CONSTRAINT dept02_dname_uk UNIQUE,
  loc       VARCHAR2(15)    CONSTRAINT dept02_loc_nn NOT NULL
);

CREATE TABLE emp02
( empno     NUMBER(4)       CONSTRAINT emp02_empno_pk   PRIMARY KEY,
  ename     VARCHAR2(15)    CONSTRAINT emp02_ename_nn   NOT NULL,
  deptno    NUMBER(2)       CONSTRAINT emp02_deptno_fk  REFERENCES dept02(deptno)
);

INSERT INTO DEPT02
VALUES (10, 'aa', '����');

INSERT INTO EMP02
VALUES (2000, 'smith', 10);

-- ���̺� ����
CREATE TABLE emp03
( empno     NUMBER(4) CONSTRAINT emp03_empno_pk PRIMARY KEY,
  ename     VARCHAR2(15),
  deptno    NUMBER(2),
  CONSTRAINT    emp03_deptno_fk     FOREIGN KEY (deptno)
                                    REFERENCES  dept02(deptno)
);

INSERT INTO emp03
VALUES (100, 'aa', 50);     -- 50�� �μ��� dept ���̺� ���⶧���� ���� �Ұ�

INSERT INTO emp03
VALUES (100, 'aa', 10);     -- ���������� ���� ��

/* 2/25 */
----- FOREIGNŰ �������� �߰� �ɼ�
DROP TABLE EMP02;
DROP TABLE EMP03;
DROP TABLE DEPT02;

CREATE TABLE dept02
( deptno    NUMBER(02)      CONSTRAINT dept02_deptno_pk PRIMARY KEY,
  dname     VARCHAR2(15)    CONSTRAINT dept02_dname_nn NOT NULL,
  loc       VARCHAR2(15)
);

-- dept02�� ���� ����
INSERT INTO dept02
VALUES (10, '�λ�', '����');
INSERT INTO dept02
VALUES (20, '����', '����');
INSERT INTO dept02
VALUES (30, '����', '�λ�');
INSERT INTO dept02
VALUES (40, '����', '���');

-- EMP02���̺��� deptno�� ON DELETE CASCADE �ɼ� �߰�
CREATE TABLE emp02
( empno     NUMBER(4)       CONSTRAINT emp02_empno_pk   PRIMARY KEY,
  ename     VARCHAR2(15),
  deptno    NUMBER(2)       CONSTRAINT emp02_deptno_fk  REFERENCES dept02(deptno)
                                    ON DELETE CASCADE
);

-- emp02�� 10�� �μ� ��� ����
INSERT INTO EMP02
VALUES(1000, 'aa', 10);

commit;

-- dept02�� 10�� �μ� ����
DELETE FROM dept02
WHERE deptno = 10;

-- 10�� �μ��� ����� ���� ���� �� ���� Ȯ��
SELECT * FROM EMP02;

DROP TABLE EMP02;
-- EMP02���̺��� deptno�� ON DELETE SET NULL �ɼ� �߰�
CREATE TABLE emp02
( empno     NUMBER(4)       CONSTRAINT emp02_empno_pk   PRIMARY KEY,
  ename     VARCHAR2(15),
  deptno    NUMBER(2)       CONSTRAINT emp02_deptno_fk  REFERENCES dept02(deptno)
                                    ON DELETE SET NULL
);

-- DEPT02�� 10�� �μ� ���� ����
INSERT INTO DEPT02
VALUES (10, 'aa', '����');

-- emp02�� 10�� �μ� ��� ����
INSERT INTO EMP02
VALUES(1000, 'aa', 10);

commit;

-- dept02�� 10�� �μ� ����
DELETE FROM dept02
WHERE deptno = 10;

-- 10�� �μ��� ����� DEPTNO�� NULL���� �Ǵ� ���� Ȯ��
SELECT * FROM EMP02;


-- DROP
-- DEPT02���̺� ���� �õ�
DROP TABLE DEPT02;
-- ���� �Ұ�: EMP02 ���̺��� �����ϰ� �ֱ� ����

-- CASCADE CONSTRAINTS �ɼ� ���: ���̺� ���� �� ���õ� �������Ǳ��� ���� ����
DROP TABLE DEPT02 CASCADE CONSTRAINTS;
-- ���� �Ϸ�

-- EMP02 �� DEPTNO�� �����Ͱ� �״�� ���������� Ȯ��
SELECT * FROM EMP02;
-- ������ ���������� ���� �� (DEPTNO�� FK ��������)

-- �������� Ȯ��
-- �������� �״�� ����ְ� dept02�� ���õ� �������Ǹ� ���� ��
SELECT table_name, constraint_type, constraint_name, r_constraint_name 
FROM USER_CONSTRAINTS
WHERE table_name IN ('DEPT02', 'EMP02', 'EMP03');

--- ALTER
-- emp ���̺��� emp04�� ����
CREATE TABLE emp04
AS
SELECT * FROM emp;

-- ����� ���� �ƴ��� Ȯ��
select * from emp04;

-- ���̺��� ���� Ȯ��
DESC emp04;

--- ADD: �÷� �߰�
ALTER TABLE emp04
ADD (   email       VARCHAR2(10),
        address     VARCHAR2(20) );

-- �÷��� �߰� �Ǿ����� Ȯ��        
select * from emp04;        
-- �߰� �� �÷��� ���ڵ�� NULL������ ���� �Ǿ������� Ȯ��   


-- MODIFY: �÷� ����
ALTER TABLE emp04
MODIFY ( email VARCHAR2(40) );

-- ���� �� ���� Ȯ��
DESC emp04;


-- DROP: �÷� ����
ALTER TABLE emp04
DROP (email);

---- �������� �߰�
-- TABLE ����
CREATE TABLE dept03
( deptno    NUMBER(2),
  dname     VARCHAR2(15),
  loc       VARCHAR2(15)
);

-- �⺻ Ű �������� �߰�
ALTER TABLE dept03
ADD CONSTRAINT dept03_deptno_pk PRIMARY KEY(deptno);

-- �⺻ Ű ���������� �߰� �� ���� Ȯ��
SELECT *
FROM user_constraints
WHERE table_name = 'DEPT03';

-- NOT NULL ���������� �߰�
ALTER TABLE dept03
MODIFY ( dname VARCHAR2(15) CONSTRAINT dept03_dname_nn NOT NULL);

-- NOT NULL�� ADD�δ� �߰� �Ұ�
ALTER TABLE dept03
ADD CONSTRAINT dept03_loc_nn NOT NULL(loc);    -- err code


---- �������� ����
-- PRIMARY KEY ����
ALTER TABLE dept03
DROP PRIMARY KEY;
-- OR
ALTER TABLE dept03
DROP CONSTRAINT dept03_deptno_pk;

-- NOT NULL �������� ����
ALTER TABLE dept03
DROP CONSTRAINT dept03_dname_nn;

-- CASCADE �ɼ�

-- DEPT05 ����
CREATE TABLE dept05
( deptno    NUMBER(02),
  dname     VARCHAR2(15),
  loc       VARCHAR2(15)
);

-- PK �ɼ� �߰�
ALTER TABLE dept05
ADD CONSTRAINT dept05_deptno_pk PRIMARY KEY(deptno);

-- dept05�� ���� ����
INSERT INTO dept05
VALUES (10, '�λ�', '����');

COMMIT;

-- EMP 05 ����
CREATE TABLE emp05
( empno     NUMBER(4),
  ename     VARCHAR2(15),
  deptno    NUMBER(2)
);

-- �⺻ Ű �������� �߰�
ALTER TABLE emp05
ADD CONSTRAINT emp05_empno_pk PRIMARY KEY(empno);

-- �ܷ� Ű �������� �߰�
ALTER TABLE emp05
ADD CONSTRAINT    emp05_deptno_fk       FOREIGN KEY (deptno)
                                        REFERENCES  dept05(deptno)
                                        ON DELETE CASCADE;

-- NOT NULL �������� �߰�
ALTER TABLE emp05
MODIFY ( ename VARCHAR2(15) CONSTRAINT emp05_ename_nn NOT NULL);
-- VARCHAR2(15) �����ص� ����
ALTER TABLE emp05
MODIFY ( ename CONSTRAINT emp05_ename_nn NOT NULL);

DESC EMP05;

ALTER TABLE dept05
DROP PRIMARY KEY;       -- err: emp05���� dept05�� deptno�� �����ϰ� �ֱ� ����

ALTER TABLE dept05
DROP PRIMARY KEY CASCADE;

-- DEPT05�� �⺻Ű ��������, EMP05�� �ܷ�Ű ���� ������ ������ ���� Ȯ��
SELECT *
FROM user_constraints
WHERE table_name IN ('DEPT05', 'EMP05');

---- �������� ��Ȱ��ȭ / Ȱ��ȭ
-- �⺻ Ű ��Ȱ��ȭ
ALTER TABLE emp05
DISABLE CONSTRAINT emp05_empno_pk;

-- ��Ȱ��ȭ �� ���� Ȯ��
SELECT constraint_name, status
FROM user_constraints
WHERE table_name IN ('EMP05');

SELECT * FROM EMP05;

INSERT INTO emp05
VALUES (1000, 'John', 10);

INSERT INTO emp05
VALUES (1000, 'Smith', 20);     -- Ű�� Ű�� ��Ȱ��ȭ �Ǿ��� ������ empno�� �ߺ��Ǿ ���Ե�

-- �ٽ� Ȱ��ȭ
ALTER TABLE emp05
ENABLE CONSTRAINT emp05_empno_pk;   -- err: empno�� �̹� �ߺ��� ���� �����Ƿ�

-- empno�� �ߺ��� �� ����
DELETE FROM emp05
WHERE ename = 'Smith';

-- �ٽ� Ȱ��ȭ
ALTER TABLE emp05
ENABLE CONSTRAINT emp05_empno_pk;   

-- Ȱ��ȭ �� ���� Ȯ��
SELECT constraint_name, status
FROM user_constraints
WHERE table_name IN ('EMP05');

INSERT INTO emp05
VALUES (1000, 'Smith', 20);     -- err: Ȱ��ȭ�� pk ���ǿ� ���� ���� �Ұ�
