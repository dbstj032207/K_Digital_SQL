-- 1. '영어영문학과' 교수이름, 출생년도, 주소를 조회하고 나이가 적은 순으로 정렬하시오.
--    영어영문학과 코드는 TB_DEPARTMENT에서 검색한다.
--    (JOIN을 사용하지 않는다.)

SELECT professor_name 교수이름, SUBSTR(professor_ssn, 1, 2) 출생년도, professor_address 주소
FROM TB_PROFESSOR
WHERE department_no = ( SELECT department_no
                        FROM TB_DEPARTMENT
                        WHERE department_name = '영어영문학과')
ORDER BY 2 DESC;





