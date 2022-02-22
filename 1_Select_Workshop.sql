-- 1. �а� �̸��� �迭�� ǥ���Ͻÿ�. �� ����� "�а� ��". "�迭"�� ǥ��(TB_DEPARTMENT)
SELECT department_name "�а� ��", category �迭
FROM TB_DEPARTMENT;

-- 2. �а��� �а� ������ ������ ���� ����� (TB_DEPARTMENT)
SELECT department_name || '�� ������' || capacity || '�Դϴ�.' "�а��� ����"
FROM TB_DEPARTMENT;

-- 3. ������а� �ٴϴ� �л� �� ���� �������� �л��� �˻�
--    (�����а��� '�а��ڵ�'�� TB_DEPARTMENT���� ��ȸ)
SELECT student_name
FROM TB_STUDENT
WHERE department_no = ( SELECT department_no
                        FROM TB_DEPARTMENT
                        WHERE department_name = '������а�')
AND absence_yn = 'Y';

-- 4. ������ ��� ��ü�ڸ� ã�� �̸��� �Խ���. ����� �й��� ������ ����.(TB_STUDENT)
-- A513079, A513091, A513110
SELECT student_name
FROM TB_STUDENT
WHERE student_no IN ('A513079', 'A513091', 'A513110');

-- 5. ���������� 20�� �̻�, 30�� ������ �а� �̸��� �迭�� ����Ͻÿ� (TB_DEPARTMENT)
-- >= <= �̿�, BETWEEN �̿� �ΰ��� ���� �ۼ�
-- ���������� ū�ź��� ����
SELECT department_name, category, capacity
FROM TB_DEPARTMENT
WHERE -- capacity BETWEEN 20 AND 30;
capacity >= 20 
AND capacity <= 30
ORDER BY capacity DESC;

-- 6. ������ �����ϰ� �� �Ҽ��а��� ������ �ִ�.
--    ������б� ������ �̸��� �˾� �� �� �ִ� SQL������ �ۼ��Ͻÿ�(TB_PROFESSOR)
SELECT professor_name
FROM TB_PROFESSOR
WHERE department_no IS NULL;

-- 7. CATEGORY�� �ߺ����� ��� (TB_DEPARTMENT)
SELECT DISTINCT category
FROM TB_DEPARTMENT;

-- 8. 02�й� ���� �����ڵ��� ������ ����� �Ѵ�.
--    ������ ����� ������ �������� �л����� �й�, �̸�, �ֹι�ȣ�� ����Ͻÿ�
SELECT student_no, student_name, student_ssn
FROM TB_STUDENT
WHERE student_no LIKE 'A2%'
AND student_address LIKE '%����%'
AND absence_yn = 'N';

-- 9. �迭�� '����'�� �а� �� ���������� 20�̻�, 30 ������ �а��� �迭, �а��̸�, ������ ��ȸ�Ͻÿ�
--    �� �а��̸��� �������� �������� ����(TB_DEPARTMENT)
SELECT category �迭, department_name �а��̸�, capacity ����
FROM TB_DEPARTMENT
WHERE category = '����'
AND capacity BETWEEN 20 AND 30
ORDER BY 2;


