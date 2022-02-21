-- 1. 2001년에 입학한 사학과 학생이 몇 명인지 조회하시오.
-- 사학과 코드는 TB_DEPARTMENT에서 조회 함.
SELECT COUNT(*) 학생수
FROM TB_STUDENT
WHERE SUBSTR(entrance_date, 1, 2) = '01'
AND department_no = (   SELECT department_no
                        FROM TB_DEPARTMENT
                        WHERE department_name = '사학과'   );
                        
-- TO_CHAR를 이용해서도 구할 수 있음
SELECT COUNT(*) 학생수
FROM TB_STUDENT
WHERE  TO_CHAR(entrance_date, 'YY') = '01'
AND department_no = (   SELECT department_no
                        FROM TB_DEPARTMENT
                        WHERE department_name = '사학과'   );

                        
-- 2. '학'자가 들어간 계열의 소속 학과가 몇 개 있는지 계열별, 학과수를 출력하시오.
--     단 학과수가 많은 순으로 정렬하시오.
SELECT category 계열, COUNT(*) 학과수
FROM TB_DEPARTMENT
WHERE category LIKE '%학%'
GROUP BY category
ORDER BY 2 DESC;


-- 3. 국어국문학과 학생 중 서울에 거주하는 학생의 학과번호, 학생이름, 휴햑여부를 조회하고
--    학생이름으로 오름차순 정렬하시오.
--    단, 휴학여부는 값이 'Y'이면 '휴학'으로 'N'이면 '정상'으로 출력한다.
--    국어국문학과 코드는 TB_DEPARTMENT에서 찾는다. (JOIN을 사용하지 않는다)
SELECT department_no 학과번호, student_name 학생이름,
       CASE absence_yn WHEN 'Y' THEN '휴학'
                       WHEN 'N' THEN '정상'
                       ELSE 'etc'
       END 휴학여부
FROM TB_STUDENT
WHERE department_no = ( SELECT department_no
                        FROM TB_DEPARTMENT
                        WHERE department_name = '국어국문학과' )
AND student_address LIKE '서울%';








