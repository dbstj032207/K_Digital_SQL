/*  student(학생정보):  학번(pk), 이름(nn)
    subject(강좌):  강좌번호(pk), 강좌명(nn), 학기(ck (1,2)), 필수선택(ck (필수, 선택))
    sugang(수강정보):  pk [학번(fk, student테이블), 강좌번호(fk, subject테이블)], 등록일(date), 평가결과
*/
/*  테이블 생성 순서
    1. 학생, 강좌 테이블 생성
    2. 수강정보 테이블 생성
    3. 데이터 또한 학생, 강좌에 먼저 INSERT
    4. 위 테이블의 학번, 강좌정보를 이용해서 수강정보에 INSERT
*/

-- 학생 테이블 생성
CREATE TABLE student
( studno    NUMBER(5)   CONSTRAINT student_studo_pk PRIMARY KEY,
  stuname   VARCHAR2(10)    CONSTRAINT student_stuname_nn NOT NULL);

-- 강좌 테이블 생성
CREATE TABLE subject
( subno     NUMBER(5),
  subname   VARCHAR2(20)    CONSTRAINT subject_subname_nn NOT NULL,
  term      VARCHAR2(1),
  type      VARCHAR2(6),
  CONSTRAINT subject_subno_pk   PRIMARY KEY(subno),
  CONSTRAINT subject_trem_ck    CHECK (term IN ('1', '2')),
  CONSTRAINT subject_type_ck    CHECK (type IN ('필수', '선택'))
);

-- 수강 테이블 생성
CREATE TABLE sugang
( studno    NUMBER(5) CONSTRAINT sugang_studno_fk REFERENCES student(studno),
  subno     NUMBER(5) CONSTRAINT sugang_subno_fk REFERENCES subject(subno),
  regdate   DATE DEFAULT sysdate,
  result    NUMBER(3),
  CONSTRAINT sugang_studno_subno_pk PRIMARY KEY (studno, subno)
);


-- 학생 테이블에 레코드 값 insert
INSERT INTO student
VALUES (1, '홍길동');

INSERT INTO student
VALUES (2, '이순신');

-- 강좌 테이블에 레코드 값 insert
INSERT INTO subject
VALUES(1, 'a', '1', '필수');
INSERT INTO subject
VALUES(2, 'a', '3', '필수');      -- err: CHECK 제약조건 위배(term)
INSERT INTO subject
VALUES(3, 'a', '1', '필');        -- err: CHECK 제약조건 위배(type)
INSERT INTO subject
VALUES(1, 'b', '1', '필수');      -- err: PK 제약조건 위배(studno)


-- DROP 후 다시 INSERT
/*  학생테이블:  10, 홍길동
                20, 이순신
    과목테이블:  1, 'java', '1', '필수'
                2, 'db', '2', '필수'
                3, 'html', '1', '선택'
    수강테이블:  10, 1, 오늘날짜, null
                20, 2, 오늘날짜, null       */
DROP TABLE SUGANG;
DROP TABLE SUBJECT;
DROP TABLE STUDENT;
INSERT INTO student
VALUES (10, '홍길동');
INSERT INTO student
VALUES (20, '이순신');

INSERT INTO subject
VALUES(1, 'java', '1', '필수');
INSERT INTO subject
VALUES(2, 'db', '2', '필수');
INSERT INTO subject
VALUES(3, 'html', '1', '필수');

INSERT INTO sugang
VALUES(10, 1, sysdate, null);
INSERT INTO sugang
VALUES(10, 2, sysdate, null);
INSERT INTO sugang
VALUES(20, 2, sysdate, null);

select * from student;
select * from subject;
select * from sugang;

commit;

--- 학생이 듣고있는 과목 이름을 select
-- ANSI 조인
select stuname, subname
from student
JOIN sugang
USING(studno)
JOIN subject
USING(subno)
WHERE stuname = '홍길동';

-- Oracle 조인
select stuname, subname
from student stu, sugang su, subject sub
WHERE stu.studno = su.studno
AND su.subno = sub.subno
AND stuname = '홍길동';

-- 홍길동이 듣고있는 과목 (SUB쿼리 이용)

-- 1. 홍길동의 학번을 검색해서 듣고있는 과목의 과목 번호를 알아냄
select subno
from sugang
where studno IN (select studno 
                 from student
                 where stuname = '홍길동');

-- 2. 찾아낸 과목번호를 이용해 해당 과목번호의 과목이름을 알아냄                
select subname
from subject
where subno IN ( select subno
                 from sugang
                 where studno IN (select studno 
                                  from student
                                  where stuname = '홍길동') );                

-- 테이블 레벨로 다시 만들기
DROP TABLE SUGANG;
DROP TABLE SUBJECT;
DROP TABLE STUDENT;

-- 학생 테이블 생성
CREATE TABLE student
( studno    NUMBER(5),
  stuname   VARCHAR2(10)    CONSTRAINT student_stuname_nn NOT NULL,
  CONSTRAINT student_studo_pk PRIMARY KEY(studno)
);

-- 강좌 테이블 생성
CREATE TABLE subject
( subno     NUMBER(5),
  subname   VARCHAR2(20)    CONSTRAINT subject_subname_nn NOT NULL,
  term      VARCHAR2(1),
  type      VARCHAR2(6),
  CONSTRAINT subject_subno_pk   PRIMARY KEY(subno),
  CONSTRAINT subject_trem_ck    CHECK (term IN ('1', '2')),
  CONSTRAINT subject_type_ck    CHECK (type IN ('필수', '선택'))
);

-- 수강 테이블 생성
CREATE TABLE sugang
( studno    NUMBER(5),
  subno     NUMBER(5),
  regdate   DATE DEFAULT sysdate,
  result    NUMBER(3),
  CONSTRAINT sugang_studno_subno_pk PRIMARY KEY (studno, subno),
  CONSTRAINT sugang_studno_fk FOREIGN KEY (studno)
                                REFERENCES student(studno),
  CONSTRAINT sugang_subno_fk FOREIGN KEY (subno)
                                REFERENCES subject(subno)
);


INSERT INTO student
VALUES (10, '홍길동');
INSERT INTO student
VALUES (20, '이순신');

INSERT INTO subject
VALUES(1, 'java', '1', '필수');
INSERT INTO subject
VALUES(2, 'db', '2', '필수');
INSERT INTO subject
VALUES(3, 'html', '1', '필수');

INSERT INTO sugang
VALUES(10, 1, sysdate, null);
INSERT INTO sugang
VALUES(20, 2, sysdate, null);

