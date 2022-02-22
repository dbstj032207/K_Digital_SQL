-- 1��. ���п� �ٴϴ� �������� �л����� �̸��� ã���� �Ѵ�
SELECT student_name
FROM TB_STUDENT
GROUP BY student_name
HAVING COUNT(*) > 1;

-- 2��. �ּ����� �������� ��⵵�� �л��� �� 1900��� �й��� ���� �л����� �̸���
--      �й�, �ּҸ� �̸��� ������������ ����Ͻÿ�
--      �� ����� '�л��̸�', '�й�', '������ �ּ�'�� ��µǰ� ��
SELECT student_name �̸�, student_no �й�, student_address �ּ�
FROM TB_STUDENT
WHERE   (       student_address     LIKE    '%������%'
            OR  student_address     LIKE    '%��⵵%' )
AND     student_no LIKE '9%'
ORDER BY 1;

-- 3��. ���� ���а� ���� �� ���̰� ���� ������� �̸��� Ȯ������
--      ��, JOIN�� ����ϱ�(USING���� ó��) - TB_PROFESSOR, TB_DEPARTMENT
SELECT professor_name, professor_ssn
FROM TB_PROFESSOR
JOIN TB_DEPARTMENT
USING(department_no)
WHERE department_name = '���а�'
ORDER BY 2;

-- 4��. �����̸��� ������ �а��̸��� ����ϴ� SQL�� �ۼ��Ͻÿ�
--      (USING�� ���) TB_CLASS, TB_DEPARTMENT
SELECT class_name, department_name
FROM TB_CLASS
JOIN TB_DEPARTMENT
USING(department_no)
ORDER BY 2;

-- 5��. ���񺰷� ���� �̸��� ã���� �Ѵ�. �����̸��� �����̸��� ����Ͻÿ�
--      (USING��) TB_CLASS, TB_CLASS_PROFESSOR, TB_PROFESSOR
SELECT class_name, professor_name
FROM tb_class_professor
JOIN tb_class
USING(class_no)
JOIN tb_professor
USING(professor_no);

-- 6��. �й��� A313047 �л��� �б��� ������ �ʰ� �ִ�.
--      ������������ �����ϱ� ���� �а� �̸�, �л��̸�, �������� �̸��� �ʿ��ϴ�
--      ����� "�а� �̸�", "�л� �̸�", "�������� �̸�"���� ���
SELECT department_name �а��̸�, student_name �л��̸�, professor_name "�������� �̸�"
FROM tb_student s
JOIN tb_department d
USING (department_no)
JOIN tb_professor p
ON s.coach_professor_no = p.professor_no
WHERE s.student_no = 'A313047';





