-- 1번. 2007년도에 '인간관계론'과목을 수강한 학생을 찾아 학생이름과 수강학기를 표시하시오.
--      (TB_CLASS, TB_GRADE, TB_STUDENT)
SELECT student_name, term_no, class_name
FROM TB_STUDENT 
JOIN TB_GRADE 
USING(student_no)
JOIN TB_CLASS 
USING(class_no)
WHERE class_name = '인간관계론'
AND SUBSTR(term_no, 1, 4) = '2007';

-- 
SELECT ROUND(123.56, 0) FROM dual;

-- 2번. 학과의 정원을 10% 증가시키게 되었음. 반올림하여 소수점 자리수는 생기지 않게 함
--      (TB_DEPARTMENT, ROUND)
---------------- 확인 후 반드시 롤백 -------------------
SELECT capacity
FROM TB_DEPARTMENT;

UPDATE TB_DEPARTMENT
SET capacity = ROUND(capacity * 1.1);

ROLLBACK;

-- 3번. 학번이 A413042인 박건우 학생의 주소가 '서울시 종로구 숭인동 181-21'로 변경 됨
---------------- 확인 후 반드시 롤백 -------------------
SELECT student_address
FROM TB_STUDENT
WHERE student_no = 'A413042';

UPDATE TB_STUDENT
SET student_address = '서울시 종로구 숭인동 181-21'
WHERE student_no = 'A413042';

ROLLBACK;

-- 4번. 주민번호 뒷자리를 저장하지 않기로 했다. 내용을 변경시켜라
--      예: 830530-2124663 =====> 830530 으로 저장
---------------- 확인 후 반드시 롤백 -------------------
SELECT student_ssn
FROM TB_STUDENT;

UPDATE TB_STUDENT
SET student_ssn = SUBSTR(student_ssn, 1, 6);

ROLLBACK;


