/*  student(�л�����):  �й�(pk), �̸�(nn)
    subject(����):  ���¹�ȣ(pk), ���¸�(nn), �б�(ck (1,2)), �ʼ�����(ck (�ʼ�, ����))
    sugang(��������):  pk [�й�(fk, student���̺�), ���¹�ȣ(fk, subject���̺�)], �����(date), �򰡰��
*/
/*  ���̺� ���� ����
    1. �л�, ���� ���̺� ����
    2. �������� ���̺� ����
    3. ������ ���� �л�, ���¿� ���� INSERT
    4. �� ���̺��� �й�, ���������� �̿��ؼ� ���������� INSERT
*/

-- �л� ���̺� ����
CREATE TABLE student
( studno    NUMBER(5)   CONSTRAINT student_studo_pk PRIMARY KEY,
  stuname   VARCHAR2(10)    CONSTRAINT student_stuname_nn NOT NULL);

-- ���� ���̺� ����
CREATE TABLE subject
( subno     NUMBER(5),
  subname   VARCHAR2(20)    CONSTRAINT subject_subname_nn NOT NULL,
  term      VARCHAR2(1),
  type      VARCHAR2(6),
  CONSTRAINT subject_subno_pk   PRIMARY KEY(subno),
  CONSTRAINT subject_trem_ck    CHECK (term IN ('1', '2')),
  CONSTRAINT subject_type_ck    CHECK (type IN ('�ʼ�', '����'))
);

-- ���� ���̺� ����
CREATE TABLE sugang
( studno    NUMBER(5) CONSTRAINT sugang_studno_fk REFERENCES student(studno),
  subno     NUMBER(5) CONSTRAINT sugang_subno_fk REFERENCES subject(subno),
  regdate   DATE DEFAULT sysdate,
  result    NUMBER(3),
  CONSTRAINT sugang_studno_subno_pk PRIMARY KEY (studno, subno)
);


-- �л� ���̺� ���ڵ� �� insert
INSERT INTO student
VALUES (1, 'ȫ�浿');

INSERT INTO student
VALUES (2, '�̼���');

-- ���� ���̺� ���ڵ� �� insert
INSERT INTO subject
VALUES(1, 'a', '1', '�ʼ�');
INSERT INTO subject
VALUES(2, 'a', '3', '�ʼ�');      -- err: CHECK �������� ����(term)
INSERT INTO subject
VALUES(3, 'a', '1', '��');        -- err: CHECK �������� ����(type)
INSERT INTO subject
VALUES(1, 'b', '1', '�ʼ�');      -- err: PK �������� ����(studno)


-- DROP �� �ٽ� INSERT
/*  �л����̺�:  10, ȫ�浿
                20, �̼���
    �������̺�:  1, 'java', '1', '�ʼ�'
                2, 'db', '2', '�ʼ�'
                3, 'html', '1', '����'
    �������̺�:  10, 1, ���ó�¥, null
                20, 2, ���ó�¥, null       */
DROP TABLE SUGANG;
DROP TABLE SUBJECT;
DROP TABLE STUDENT;
INSERT INTO student
VALUES (10, 'ȫ�浿');
INSERT INTO student
VALUES (20, '�̼���');

INSERT INTO subject
VALUES(1, 'java', '1', '�ʼ�');
INSERT INTO subject
VALUES(2, 'db', '2', '�ʼ�');
INSERT INTO subject
VALUES(3, 'html', '1', '�ʼ�');

INSERT INTO sugang
VALUES(10, 1, sysdate, null);
INSERT INTO sugang
VALUES(10, 2, sysdate, null);
INSERT INTO sugang
VALUES(20, 2, sysdate, null);

select * from student;
select * from subject;
select * from sugang;

commit;

--- �л��� ����ִ� ���� �̸��� select
-- ANSI ����
select stuname, subname
from student
JOIN sugang
USING(studno)
JOIN subject
USING(subno)
WHERE stuname = 'ȫ�浿';

-- Oracle ����
select stuname, subname
from student stu, sugang su, subject sub
WHERE stu.studno = su.studno
AND su.subno = sub.subno
AND stuname = 'ȫ�浿';

-- ȫ�浿�� ����ִ� ���� (SUB���� �̿�)

-- 1. ȫ�浿�� �й��� �˻��ؼ� ����ִ� ������ ���� ��ȣ�� �˾Ƴ�
select subno
from sugang
where studno IN (select studno 
                 from student
                 where stuname = 'ȫ�浿');

-- 2. ã�Ƴ� �����ȣ�� �̿��� �ش� �����ȣ�� �����̸��� �˾Ƴ�                
select subname
from subject
where subno IN ( select subno
                 from sugang
                 where studno IN (select studno 
                                  from student
                                  where stuname = 'ȫ�浿') );                

-- ���̺� ������ �ٽ� �����
DROP TABLE SUGANG;
DROP TABLE SUBJECT;
DROP TABLE STUDENT;

-- �л� ���̺� ����
CREATE TABLE student
( studno    NUMBER(5),
  stuname   VARCHAR2(10)    CONSTRAINT student_stuname_nn NOT NULL,
  CONSTRAINT student_studo_pk PRIMARY KEY(studno)
);

-- ���� ���̺� ����
CREATE TABLE subject
( subno     NUMBER(5),
  subname   VARCHAR2(20)    CONSTRAINT subject_subname_nn NOT NULL,
  term      VARCHAR2(1),
  type      VARCHAR2(6),
  CONSTRAINT subject_subno_pk   PRIMARY KEY(subno),
  CONSTRAINT subject_trem_ck    CHECK (term IN ('1', '2')),
  CONSTRAINT subject_type_ck    CHECK (type IN ('�ʼ�', '����'))
);

-- ���� ���̺� ����
CREATE TABLE sugang
( studno    NUMBER(5),
  subno     NUMBER(5),
  regdate   DATE DEFAULT sysdate,
  result    NUMBER(3),
  CONSTRAINT sugang_studno_subno_pk PRIMARY KEY (studno, subno),
  CONSTRAINT sugang_studno_fk FOREIGN KEY (studno)
                                REFERENCES student(studno),
  CONSTRAINT sugang_subno_fk FOREIGN KEY (subno)
                                REFERENCES subject(subno)
);


INSERT INTO student
VALUES (10, 'ȫ�浿');
INSERT INTO student
VALUES (20, '�̼���');

INSERT INTO subject
VALUES(1, 'java', '1', '�ʼ�');
INSERT INTO subject
VALUES(2, 'db', '2', '�ʼ�');
INSERT INTO subject
VALUES(3, 'html', '1', '�ʼ�');

INSERT INTO sugang
VALUES(10, 1, sysdate, null);
INSERT INTO sugang
VALUES(20, 2, sysdate, null);

