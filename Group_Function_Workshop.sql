-- 1. 2001년에 입학한 사학과 학생이 몇 명인지 조회하시오.
-- 사학과 코드는 TB_DEPARTMENT에서 조회 함.
SELECT COUNT(student_no) 학생수
FROM TB_STUDENT
WHERE SUBSTR(entrance_date, 1, 2) = '01'
AND department_no = (   SELECT department_no
                        FROM TB_DEPARTMENT
                        WHERE department_name = '사학과'   );
                        



