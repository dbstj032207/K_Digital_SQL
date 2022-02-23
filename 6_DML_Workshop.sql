-- 1��. 2007�⵵�� '�ΰ������'������ ������ �л��� ã�� �л��̸��� �����б⸦ ǥ���Ͻÿ�.
--      (TB_CLASS, TB_GRADE, TB_STUDENT)
SELECT student_name, term_no, class_name
FROM TB_STUDENT 
JOIN TB_GRADE 
USING(student_no)
JOIN TB_CLASS 
USING(class_no)
WHERE class_name = '�ΰ������'
AND SUBSTR(term_no, 1, 4) = '2007';

-- 
SELECT ROUND(123.56, 0) FROM dual;

-- 2��. �а��� ������ 10% ������Ű�� �Ǿ���. �ݿø��Ͽ� �Ҽ��� �ڸ����� ������ �ʰ� ��
--      (TB_DEPARTMENT, ROUND)
---------------- Ȯ�� �� �ݵ�� �ѹ� -------------------
SELECT capacity
FROM TB_DEPARTMENT;

UPDATE TB_DEPARTMENT
SET capacity = ROUND(capacity * 1.1);

ROLLBACK;

-- 3��. �й��� A413042�� �ڰǿ� �л��� �ּҰ� '����� ���α� ���ε� 181-21'�� ���� ��
---------------- Ȯ�� �� �ݵ�� �ѹ� -------------------
SELECT student_address
FROM TB_STUDENT
WHERE student_no = 'A413042';

UPDATE TB_STUDENT
SET student_address = '����� ���α� ���ε� 181-21'
WHERE student_no = 'A413042';

ROLLBACK;

-- 4��. �ֹι�ȣ ���ڸ��� �������� �ʱ�� �ߴ�. ������ ������Ѷ�
--      ��: 830530-2124663 =====> 830530 ���� ����
---------------- Ȯ�� �� �ݵ�� �ѹ� -------------------
SELECT student_ssn
FROM TB_STUDENT;

UPDATE TB_STUDENT
SET student_ssn = SUBSTR(student_ssn, 1, 6);

ROLLBACK;


