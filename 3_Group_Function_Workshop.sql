-- 1. 2001�⿡ ������ ���а� �л��� �� ������ ��ȸ�Ͻÿ�.
-- ���а� �ڵ�� TB_DEPARTMENT���� ��ȸ ��.
SELECT COUNT(*) �л���
FROM TB_STUDENT
WHERE SUBSTR(entrance_date, 1, 2) = '01'
AND department_no = (   SELECT department_no
                        FROM TB_DEPARTMENT
                        WHERE department_name = '���а�'   );
                        
-- TO_CHAR�� �̿��ؼ��� ���� �� ����
SELECT COUNT(*) �л���
FROM TB_STUDENT
WHERE  TO_CHAR(entrance_date, 'YY') = '01'
AND department_no = (   SELECT department_no
                        FROM TB_DEPARTMENT
                        WHERE department_name = '���а�'   );

                        
-- 2. '��'�ڰ� �� �迭�� �Ҽ� �а��� �� �� �ִ��� �迭��, �а����� ����Ͻÿ�.
--     �� �а����� ���� ������ �����Ͻÿ�.
SELECT category �迭, COUNT(*) �а���
FROM TB_DEPARTMENT
WHERE category LIKE '%��%'
GROUP BY category
ORDER BY 2 DESC;


-- 3. ������а� �л� �� ���￡ �����ϴ� �л��� �а���ȣ, �л��̸�, ���e���θ� ��ȸ�ϰ�
--    �л��̸����� �������� �����Ͻÿ�.
--    ��, ���п��δ� ���� 'Y'�̸� '����'���� 'N'�̸� '����'���� ����Ѵ�.
--    ������а� �ڵ�� TB_DEPARTMENT���� ã�´�. (JOIN�� ������� �ʴ´�)
SELECT department_no �а���ȣ, student_name �л��̸�,
       CASE absence_yn WHEN 'Y' THEN '����'
                       WHEN 'N' THEN '����'
                       ELSE 'etc'
       END ���п���
FROM TB_STUDENT
WHERE department_no = ( SELECT department_no
                        FROM TB_DEPARTMENT
                        WHERE department_name = '������а�' )
AND student_address LIKE '����%';








