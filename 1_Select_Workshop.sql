-- 1. 학과 이름과 계열을 표시하시오. 단 헤더는 "학과 명". "계열"로 표시(TB_DEPARTMENT)
SELECT department_name "학과 명", category 계열
FROM TB_DEPARTMENT;

-- 2. 학과의 학과 정원을 다음과 같이 출력함 (TB_DEPARTMENT)
SELECT department_name || '의 정원은' || capacity || '입니다.' "학과별 정원"
FROM TB_DEPARTMENT;

-- 3. 국어국문학과 다니는 학생 중 현재 휴학중인 학생을 검색
--    (국문학과의 '학과코드'는 TB_DEPARTMENT에서 조회)
SELECT student_name
FROM TB_STUDENT
WHERE department_no = ( SELECT department_no
                        FROM TB_DEPARTMENT
                        WHERE department_name = '국어국문학과')
AND absence_yn = 'Y';

-- 4. 도서관 장기 연체자를 찾아 이름을 게시함. 대상자 학번은 다음과 같다.(TB_STUDENT)
-- A513079, A513091, A513110
SELECT student_name
FROM TB_STUDENT
WHERE student_no IN ('A513079', 'A513091', 'A513110');

-- 5. 입학정원이 20명 이상, 30명 이하인 학과 이름과 계열을 출력하시오 (TB_DEPARTMENT)
-- >= <= 이용, BETWEEN 이용 두가지 전부 작성
-- 입학정원이 큰거부터 정렬
SELECT department_name, category, capacity
FROM TB_DEPARTMENT
WHERE -- capacity BETWEEN 20 AND 30;
capacity >= 20 
AND capacity <= 30
ORDER BY capacity DESC;

-- 6. 총장을 제외하고 모구 소속학과를 가지고 있다.
--    기술대학교 총장의 이름을 알아 낼 수 있는 SQL문장을 작성하시오(TB_PROFESSOR)
SELECT professor_name
FROM TB_PROFESSOR
WHERE department_no IS NULL;

-- 7. CATEGORY를 중복없이 출력 (TB_DEPARTMENT)
SELECT DISTINCT category
FROM TB_DEPARTMENT;

-- 8. 02학번 전주 거주자들의 모임을 만들려 한다.
--    휴학한 사람을 제외한 재학중인 학생들의 학번, 이름, 주민번호를 출력하시오
SELECT student_no, student_name, student_ssn
FROM TB_STUDENT
WHERE student_no LIKE 'A2%'
AND student_address LIKE '%전주%'
AND absence_yn = 'N';

-- 9. 계열이 '공학'인 학과 중 입학정원이 20이상, 30 이하인 학과의 계열, 학과이름, 정원을 조회하시오
--    단 학과이름을 기준으로 오름차순 정렬(TB_DEPARTMENT)
SELECT category 계열, department_name 학과이름, capacity 정원
FROM TB_DEPARTMENT
WHERE category = '공학'
AND capacity BETWEEN 20 AND 30
ORDER BY 2;


