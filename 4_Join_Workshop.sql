-- 1번. 대학에 다니는 동명이인 학생들의 이름을 찾고자 한다
SELECT student_name
FROM TB_STUDENT
GROUP BY student_name
HAVING COUNT(*) > 1;

-- 2번. 주소지가 강원도나 경기도인 학생들 중 1900년대 학번을 가진 학생들의 이름과
--      학번, 주소를 이름의 오름차순으로 출력하시오
--      단 헤더에 '학생이름', '학번', '거주지 주소'가 출력되게 함
SELECT student_name 이름, student_no 학번, student_address 주소
FROM TB_STUDENT
WHERE   (       student_address     LIKE    '%강원도%'
            OR  student_address     LIKE    '%경기도%' )
AND     student_no LIKE '9%'
ORDER BY 1;

-- 3번. 현재 법학과 교수 중 나이가 많은 사람부터 이름을 확인하자
--      단, JOIN을 사용하기(USING절로 처리) - TB_PROFESSOR, TB_DEPARTMENT
SELECT professor_name, professor_ssn
FROM TB_PROFESSOR
JOIN TB_DEPARTMENT
USING(department_no)
WHERE department_name = '법학과'
ORDER BY 2;

-- 4번. 과목이름과 과목의 학과이름을 출력하는 SQL을 작성하시오
--      (USING절 사용) TB_CLASS, TB_DEPARTMENT
SELECT class_name, department_name
FROM TB_CLASS
JOIN TB_DEPARTMENT
USING(department_no)
ORDER BY 2;

-- 5번. 과목별로 교수 이름을 찾고자 한다. 과목이름과 교수이름을 출력하시오
--      (USING절) TB_CLASS, TB_CLASS_PROFESSOR, TB_PROFESSOR
SELECT class_name, professor_name
FROM tb_class_professor
JOIN tb_class
USING(class_no)
JOIN tb_professor
USING(professor_no);

-- 6번. 학번이 A313047 학생이 학교에 나오지 않고 있다.
--      지도교수에게 전달하기 위해 학과 이름, 학생이름, 지도교수 이름이 필요하다
--      헤더는 "학과 이름", "학생 이름", "지도교수 이름"으로 출력
SELECT department_name 학과이름, student_name 학생이름, professor_name "지도교수 이름"
FROM tb_student s
JOIN tb_department d
USING (department_no)
JOIN tb_professor p
ON s.coach_professor_no = p.professor_no
WHERE s.student_no = 'A313047';





