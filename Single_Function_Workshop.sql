-- 1. '영어영문학과' 교수이름, 출생년도, 주소를 조회하고 나이가 적은 순으로 정렬하시오.
--    영어영문학과 코드는 TB_DEPARTMENT에서 검색한다.
--    (JOIN을 사용하지 않는다.)

SELECT professor_name 교수이름, SUBSTR(professor_ssn, 1, 2) 출생년도, professor_address 주소
FROM TB_PROFESSOR
WHERE department_no = ( SELECT department_no
                        FROM TB_DEPARTMENT
                        WHERE department_name = '영어영문학과')
ORDER BY 2 DESC;

-- 2. 80년생인 여학생 중 성이 '김'인 학생의 주민번호, 학생이름을 조회하시오.
--    학생이름으로 오름차순 정렬, 주민번호 -> [주민번호]로 표시
SELECT '[' || RPAD(SUBSTR(student_ssn, 1, 8), 14, '*') || ']' 주민번호, student_name 이름 
FROM TB_STUDENT
WHERE SUBSTR(student_ssn, 1, 2) = '80' 
AND SUBSTR(student_ssn, 8, 1) = '2'
AND student_name LIKE '김%'
ORDER BY 2;


-- 3. 계열이 '예체능'인 학과의 정원을 기준으로 40 이상이면 '대강의실' 30이상이면 '중강의실'
--    나머지는 '소강의실'로 출력한다. 단, 정원이 많은 순으로 정렬 한다.
SELECT department_name 학과이름, capacity 현재정원, 
       CASE WHEN    capacity >= 40  THEN '대강의실'
            WHEN    capacity >= 30  THEN '중강의실'
            ELSE    '소강의실'
       END 강의실크기
FROM TB_DEPARTMENT
WHERE category = '예체능'
ORDER BY 2 DESC;








