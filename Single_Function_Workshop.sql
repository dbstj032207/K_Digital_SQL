-- 1. '������а�' �����̸�, ����⵵, �ּҸ� ��ȸ�ϰ� ���̰� ���� ������ �����Ͻÿ�.
--    ������а� �ڵ�� TB_DEPARTMENT���� �˻��Ѵ�.
--    (JOIN�� ������� �ʴ´�.)

SELECT professor_name �����̸�, SUBSTR(professor_ssn, 1, 2) ����⵵, professor_address �ּ�
FROM TB_PROFESSOR
WHERE department_no = ( SELECT department_no
                        FROM TB_DEPARTMENT
                        WHERE department_name = '������а�')
ORDER BY 2 DESC;





