-- 1. 2001�⿡ ������ ���а� �л��� �� ������ ��ȸ�Ͻÿ�.
-- ���а� �ڵ�� TB_DEPARTMENT���� ��ȸ ��.
SELECT COUNT(student_no) �л���
FROM TB_STUDENT
WHERE SUBSTR(entrance_date, 1, 2) = '01'
AND department_no = (   SELECT department_no
                        FROM TB_DEPARTMENT
                        WHERE department_name = '���а�'   );
                        



