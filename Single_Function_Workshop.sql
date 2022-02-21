-- 1. '������а�' �����̸�, ����⵵, �ּҸ� ��ȸ�ϰ� ���̰� ���� ������ �����Ͻÿ�.
--    ������а� �ڵ�� TB_DEPARTMENT���� �˻��Ѵ�.
--    (JOIN�� ������� �ʴ´�.)

SELECT professor_name �����̸�, SUBSTR(professor_ssn, 1, 2) ����⵵, professor_address �ּ�
FROM TB_PROFESSOR
WHERE department_no = ( SELECT department_no
                        FROM TB_DEPARTMENT
                        WHERE department_name = '������а�')
ORDER BY 2 DESC;

-- 2. 80����� ���л� �� ���� '��'�� �л��� �ֹι�ȣ, �л��̸��� ��ȸ�Ͻÿ�.
--    �л��̸����� �������� ����, �ֹι�ȣ -> [�ֹι�ȣ]�� ǥ��
SELECT '[' || RPAD(SUBSTR(student_ssn, 1, 8), 14, '*') || ']' �ֹι�ȣ, student_name �̸� 
FROM TB_STUDENT
WHERE SUBSTR(student_ssn, 1, 2) = '80' 
AND SUBSTR(student_ssn, 8, 1) = '2'
AND student_name LIKE '��%'
ORDER BY 2;


-- 3. �迭�� '��ü��'�� �а��� ������ �������� 40 �̻��̸� '�밭�ǽ�' 30�̻��̸� '�߰��ǽ�'
--    �������� '�Ұ��ǽ�'�� ����Ѵ�. ��, ������ ���� ������ ���� �Ѵ�.
SELECT department_name �а��̸�, capacity ��������, 
       CASE WHEN    capacity >= 40  THEN '�밭�ǽ�'
            WHEN    capacity >= 30  THEN '�߰��ǽ�'
            ELSE    '�Ұ��ǽ�'
       END ���ǽ�ũ��
FROM TB_DEPARTMENT
WHERE category = '��ü��'
ORDER BY 2 DESC;








