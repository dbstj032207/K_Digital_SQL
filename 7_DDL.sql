---- DDL

-- ROWID 확인
SELECT ROWID, deptno
FROM DEPT;

SELECT *
FROM DEPT
WHERE rowid = 'AAAE5cAABAAALCJAAA';


--- CREATE
CREATE Table employee
( empno     NUMBER(4),
  ename     VARCHAR2(20),
  hiredate  DATE,
  sal       NUMBER(7,2));
  
-- INSERT
INSERT INTO employee
VALUES (7698, 'smith', sysdate, 700);
INSERT INTO employee
VALUES (null, 'aa', null, 100);     
        -- null제약조건을 주지 않았기때문에 문제없이 삽입됨
INSERT INTO employee
VALUES (10000, 'bb', sysdate, 200);
        -- 테이블을 생성할때 NUMBER(4)로 4바이트로 생성했기때문에 삽입 불가

SELECT * FROM employee;

-- DEFAULT 옵션
CREATE Table employee2
( empno     NUMBER(4),
  ename     VARCHAR2(20),
  hiredate  DATE DEFAULT SYSDATE,
  sal       NUMBER(7,2));
  
INSERT INTO employee2(empno, ename, sal)
VALUES (10, '홍길동', 3000);
  
SELECT * FROM employee2;      -- hiredate에 자동으로 오늘날짜가 들어갔음을 볼 수 있다.

------------------
CREATE TABLE DEF_TABLE
( NUM       NUMBER(2),
  WRITEDAY  DATE);
  
CREATE TABLE DEF_TABLE2
( NUM       NUMBER(2),
  WRITEDAY  DATE DEFAULT SYSDATE); 
  
INSERT INTO def_table( NUM)
VALUES (1);     -- WRITEDAY에 NULL값 저장

INSERT INTO def_table2( NUM)
VALUES (1);     -- WRITEDAT에 오늘날짜 저장

INSERT INTO def_table2( NUM, WRITEDAY)
VALUES (2, DEFAULT);        -- DEFAULT 명시 가능
  
SELECT * FROM DEF_TABLE;
SELECT * FROM DEF_TABLE2;


-- 제약 조건
-- 제약 조건의 추가 위치 2가지: 컬럼레벨, 테이블 레벨 중 선택
CREATE Table employee
( empno     NUMBER(4)   /* (컬럼 레벨) 키본키 */,
  ename     VARCHAR2(20),
  hiredate  DATE DEFAULT SYSDATE,
  DEPTNO    NUMBER(2) /* , */
  /* (테이블 레벨) empno 키본키 */
);

INSERT INTO employee
VALUES (1111, 'SMITH', SYSDATE, 4);

SELECT * FROM employee;

-- 컬럼 레벨
-- 제약 조건 이름 생략
CREATE TABLE DEPARTMENT
( deptno    NUMBER(2)   PRIMARY KEY,
  dname     VARCHAR2(15),
  loc       VARCHAR2(15)
);

-- 제약조건 이름 명시
CREATE TABLE DEPARTMENT 
( deptno    NUMBER(2)   CONSTRAINT departmnet_deptno_pk  PRIMARY KEY,
  dname     VARCHAR2(15),
  loc       VARCHAR2(15)
);

INSERT INTO department
VALUES (1, 'aa', 'aa');

INSERT INTO department
VALUES (NULL, 'bb', 'bb');      -- PK 제약조건에 걸려서 삽입 불가(NOT NULL)

INSERT INTO department
VALUES (1, 'cc', 'cc');         -- PK 제약조건에 걸려서 삽입 불가(UNIQUE)

INSERT INTO department
VALUES (10, '인사', '서울');     

INSERT INTO department
VALUES (10, '개발', '경기');        -- PK 제약조건에 걸려서 삽입 불가(UNIQUE)

INSERT INTO department
VALUES (NULL, '인사', '서울');      -- PK 제약조건에 걸려서 삽입 불가(NOT NULL)

SELECT * FROM DEPARTMENT;

DROP TABLE DEPARTMENT;

-- USER_CONSTRINTS를 통해 제약조건 확인
SELECT *
FROM user_constraints
WHERE table_name = 'DEPARTMENT';

-- 테이블 레벨
CREATE TABLE DEPARTMENT2
( deptno    NUMBER(2),
  dname     VARCHAR2(15),
  loc       VARCHAR2(15),
  CONSTRAINT departmnet2_deptno_pk  PRIMARY KEY(deptno)
);

INSERT INTO department2
VALUES (10, '인사', '서울');     

INSERT INTO department2
VALUES (10, '개발', '경기');        -- PK 제약조건에 걸려서 삽입 불가(UNIQUE)

INSERT INTO department2
VALUES (NULL, '인사', '서울');      -- PK 제약조건에 걸려서 삽입 불가(NOT NULL)

SELECT * FROM department2;

-- USER_CONSTRINTS를 통해 제약조건 확인
SELECT *
FROM user_constraints
WHERE table_name IN ('DEPARTMENT2');

-- 두개의 컬럼을 기본 키로 설정
CREATE TABLE DEPARTMENT3
( deptno    NUMBER(2),
  dname     VARCHAR2(15),
  loc       VARCHAR2(15),
  CONSTRAINT departmnet3_deptno_pk  PRIMARY KEY(deptno, loc)
);

-- USER_CONSTRINTS를 통해 제약조건 확인
SELECT *
FROM user_constraints
WHERE table_name IN ('DEPARTMENT3');

INSERT INTO department3
VALUES (10, '인사', '서울');     

INSERT INTO department3
VALUES (10, '개발', '경기');        -- (deptno, loc)의 조합이 유일하기 때문에 삽입 가능

INSERT INTO department3
VALUES (NULL, '인사', '서울');      -- PK 제약조건에 걸려서 삽입 불가(NOT NULL)

INSERT INTO department3
VALUES (10, '설비', '경기');        -- PK 제약조건에 걸려서 삽입 불가(UNIQUE)

select * from department3;



-- UNIQUE 제약 조건
CREATE TABLE department4
( deptno    NUMBER(2)       CONSTRAINT departmnet4_deptno_pk    PRIMARY KEY,
  dname     VARCHAR2(15)    CONSTRAINT departmnet4_dname_uk     UNIQUE,
  loc       VARCHAR2(15) );
  
INSERT INTO department4
VALUES (10, '개발', '서울');     

INSERT INTO department4
VALUES (20, '개발', '경기');        -- UNIQUE 제약조건 위반 (dname) 

INSERT INTO department4
VALUES (30, NULL, '서울');         -- NULL 값은 문제없이 삽입 가능 

-- 테이블 테벨
CREATE TABLE department5
( deptno    NUMBER(2)       CONSTRAINT departmnet5_deptno_pk    PRIMARY KEY,
  dname     VARCHAR2(15),    
  loc       VARCHAR2(15),
  CONSTRAINT departmnet5_dname_uk     UNIQUE(dname));
  
INSERT INTO department5
VALUES (10, '개발', '서울');     

INSERT INTO department5
VALUES (20, '개발', '경기');        -- UNIQUE 제약조건 위반 (dname) 

INSERT INTO department5
VALUES (30, NULL, '서울');         -- NULL 값은 문제없이 삽입 가능 

drop table department5;

-- 테이블 레벨에서 2개의 제약조건 생성
drop table department5;
CREATE TABLE department5
( deptno    NUMBER(2),
  dname     VARCHAR2(15),    
  loc       VARCHAR2(15),
  CONSTRAINT departmnet5_dname_uk     UNIQUE(dname),
  CONSTRAINT departmnet5_deptno_pk    PRIMARY KEY(deptno));


-- NOT NULL 칼럼 레벨에서 선언
CREATE TABLE department6
( deptno    NUMBER(2),
  dname     VARCHAR2(15),    
  loc       VARCHAR2(15)    CONSTRAINT departmnet6_loc_nn   NOT NULL,
  CONSTRAINT departmnet6_dname_uk     UNIQUE(dname),
  CONSTRAINT departmnet6_deptno_pk    PRIMARY KEY(deptno));
  
INSERT INTO department6
VALUES (10, '인사', '서울'); 
INSERT INTO department6
VALUES (10, 'aa', '경기');        -- PK 제약조건 위반 (deptno) 
INSERT INTO department6
VALUES (10, '인사', '경기');        -- UNIQUE 제약조건 위반 (dname)
INSERT INTO department6
VALUES (20, '개발', NULL);        -- NOT NULL 제약조건 위반 (loc)
INSERT INTO department6
VALUES (20, NULL, '경기'); 

-- 테이블 레벨에서 NOT NULL 선언불가
CREATE TABLE department6
( deptno    NUMBER(2),
  dname     VARCHAR2(15),    
  loc       VARCHAR2(15)    CONSTRAINT departmnet6_loc_nn   NOT NULL,
  CONSTRAINT departmnet6_dname_uk     UNIQUE(dname),
  CONSTRAINT departmnet6_deptno_pk    PRIMARY KEY(deptno));


--- CHECK 제약조건
CREATE TABLE department7
( deptno    NUMBER(2),
  dname     VARCHAR2(15) CONSTRAINT departmnet7_dame_ck CHECK( dname IN('개발', '인사')) ,    
  loc       VARCHAR2(15));
  
INSERT INTO department7
VALUES (10, '개발', '서울');

INSERT INTO department7
VALUES (20, '인사', '경기');

INSERT INTO department7
VALUES (30, '개발부', '서울');       -- CHECK 제약조건 위배(dname)
  
SELECT * FROM department7;

CREATE TABLE department8
( deptno    NUMBER(2),
  dname     VARCHAR2(15),     
  loc       VARCHAR2(15),
  CONSTRAINT departmnet8_dame_ck CHECK( dname IN('개발', '인사')) );
  
INSERT INTO department8
VALUES (10, '개발', '서울');

INSERT INTO department8
VALUES (20, '인사', '경기');

INSERT INTO department8
VALUES (30, '개발부', '서울');       -- CHECK 제약조건 위배(dname)

INSERT INTO department8
VALUES (30, NULL, '서울');          -- NULL 값은 문제없이 삽입 가능

-- CHECK 조건에 부등호 연산자 사용
-- 테이블 레벨
CREATE TABLE SAWON_7
( s_no      NUMBER(2),
  s_name    VARCHAR2(15),     
  s_sal     NUMBER(10),
  CONSTRAINT SAWON_7s_sal_ck CHECK( s_sal < 500 ) );
  
INSERT INTO SAWON_7
VALUES (1, '홍길동', 600);     -- CHECK 제약조건 위배( s_sal < 500 )

INSERT INTO SAWON_7
VALUES (1, '홍길도', 400);

-- 컬럼 레벨
CREATE TABLE SAWON_8
( s_no      NUMBER(2),
  s_name    VARCHAR2(15),     
  s_sal     NUMBER(10) CONSTRAINT SAWON_8_s_sal_ck CHECK( s_sal < 500 )
);

-- FOREIGN KEY
-- EMP테이블 : 사원번호 9000, 이름을 'aa', 부서번호 50, 나머지는 null
INSERT INTO EMP(empno, ename, deptno)
VALUES (9000, 'aa', 50);        -- dept 테이블에 50 값이 없기 때문에 삽입 불가
                                -- FK 제약조건 위배 (deptno)

-- 제약조건 확인                                
SELECT table_name, constraint_type, constraint_name, r_constraint_name
FROM user_constraints
WHERE table_name IN ('DEPT', 'EMP');

/* emp02.deptno(fk) -> dept02.deptno(pk)인, emp02, dept02 테이블 두개를 만들고자 한다.
   1. 기본키를 가지고있는 dept02가 먼저 생성되어야한다.
   2. 이후 deptno를 FK로 갖게끔 제약조건을 설정하여 emp02를 생성한다.    */

-- 1   
CREATE TABLE dept02 
( deptno NUMBER(2) CONSTRAINT dept02_deptno_pk PRIMARY KEY,
  dename VARCHAR2(15),
  loc    VARCHAR2(15)
);
  
-- 2  
CREATE TABLE emp02
( empno     NUMBER(4) CONSTRAINT emp02_empno_pk PRIMARY KEY,
  ename     VARCHAR2(15),
  deptno    NUMBER(2) CONSTRAINT emp02_deptno_fk REFERENCES dept02(deptno)
);

INSERT INTO emp02 
VALUES (1000, 'John', 10);      -- deptno 10이 dept02에 없기 때문에 삽입 불가

-- dept02에 정보 삽입
INSERT INTO dept02
VALUES (10, '인사', '서울');
INSERT INTO dept02
VALUES (20, '개발', '광주');
INSERT INTO dept02
VALUES (30, '관리', '부산');
INSERT INTO dept02
VALUES (40, '영업', '경기');

COMMIT;

INSERT INTO emp02 
VALUES (1000, 'John', 10);
INSERT INTO emp02 
VALUES (2000, 'Smith', 20);
INSERT INTO emp02 
VALUES (3000, 'Sam', NULL);     -- NULL값도 문제 없이 삽입 가능
INSERT INTO emp02 
VALUES (4000, 'Mike', 50);      -- dept 50이 dept02에 없기 때문에 삽입 불가

-- 삭제할때는 emp02 먼저 삭제하고 dept02를 삭제
DROP TABLE emp02;
DROP TABLE dept02;

CREATE TABLE dept02
( deptno    NUMBER(02)      CONSTRAINT dept02_deptno_pk PRIMARY KEY,
  dname     VARCHAR2(15)    CONSTRAINT dept02_dname_uk UNIQUE,
  loc       VARCHAR2(15)    CONSTRAINT dept02_loc_nn NOT NULL
);

CREATE TABLE emp02
( empno     NUMBER(4)       CONSTRAINT emp02_empno_pk   PRIMARY KEY,
  ename     VARCHAR2(15)    CONSTRAINT emp02_ename_nn   NOT NULL,
  deptno    NUMBER(2)       CONSTRAINT emp02_deptno_fk  REFERENCES dept02(deptno)
);

INSERT INTO DEPT02
VALUES (10, 'aa', '서울');

INSERT INTO EMP02
VALUES (2000, 'smith', 10);

-- 테이블 레벨
CREATE TABLE emp03
( empno     NUMBER(4) CONSTRAINT emp03_empno_pk PRIMARY KEY,
  ename     VARCHAR2(15),
  deptno    NUMBER(2),
  CONSTRAINT    emp03_deptno_fk     FOREIGN KEY (deptno)
                                    REFERENCES  dept02(deptno)
);

INSERT INTO emp03
VALUES (100, 'aa', 50);     -- 50번 부서가 dept 테이블에 없기때문에 삽입 불가

INSERT INTO emp03
VALUES (100, 'aa', 10);     -- 정상적으로 삽입 됨

/* 2/25 */
----- FOREIGN키 제약조건 추가 옵션
DROP TABLE EMP02;
DROP TABLE EMP03;
DROP TABLE DEPT02;

CREATE TABLE dept02
( deptno    NUMBER(02)      CONSTRAINT dept02_deptno_pk PRIMARY KEY,
  dname     VARCHAR2(15)    CONSTRAINT dept02_dname_nn NOT NULL,
  loc       VARCHAR2(15)
);

-- dept02에 정보 삽입
INSERT INTO dept02
VALUES (10, '인사', '서울');
INSERT INTO dept02
VALUES (20, '개발', '광주');
INSERT INTO dept02
VALUES (30, '관리', '부산');
INSERT INTO dept02
VALUES (40, '영업', '경기');

-- EMP02테이블의 deptno에 ON DELETE CASCADE 옵션 추가
CREATE TABLE emp02
( empno     NUMBER(4)       CONSTRAINT emp02_empno_pk   PRIMARY KEY,
  ename     VARCHAR2(15),
  deptno    NUMBER(2)       CONSTRAINT emp02_deptno_fk  REFERENCES dept02(deptno)
                                    ON DELETE CASCADE
);

-- emp02에 10번 부서 사원 삽입
INSERT INTO EMP02
VALUES(1000, 'aa', 10);

commit;

-- dept02에 10번 부서 삭제
DELETE FROM dept02
WHERE deptno = 10;

-- 10번 부서의 사원도 같이 삭제 된 것을 확인
SELECT * FROM EMP02;

DROP TABLE EMP02;
-- EMP02테이블의 deptno에 ON DELETE SET NULL 옵션 추가
CREATE TABLE emp02
( empno     NUMBER(4)       CONSTRAINT emp02_empno_pk   PRIMARY KEY,
  ename     VARCHAR2(15),
  deptno    NUMBER(2)       CONSTRAINT emp02_deptno_fk  REFERENCES dept02(deptno)
                                    ON DELETE SET NULL
);

-- DEPT02에 10번 부서 정보 삽입
INSERT INTO DEPT02
VALUES (10, 'aa', '서울');

-- emp02에 10번 부서 사원 삽입
INSERT INTO EMP02
VALUES(1000, 'aa', 10);

commit;

-- dept02에 10번 부서 삭제
DELETE FROM dept02
WHERE deptno = 10;

-- 10번 부서의 사원의 DEPTNO가 NULL값이 되는 것을 확인
SELECT * FROM EMP02;


-- DROP
-- DEPT02테이블 삭제 시도
DROP TABLE DEPT02;
-- 삭제 불가: EMP02 테이블에서 참조하고 있기 때문

-- CASCADE CONSTRAINTS 옵션 사용: 테이블 삭제 시 관련된 제약조건까지 같이 삭제
DROP TABLE DEPT02 CASCADE CONSTRAINTS;
-- 삭제 완료

-- EMP02 의 DEPTNO의 데이터가 그대로 남아있음을 확인
SELECT * FROM EMP02;
-- 하지만 제약조건은 삭제 됨 (DEPTNO의 FK 제약조건)

-- 제약조건 확인
-- 나머지는 그대로 살아있고 dept02와 관련된 제약조건만 삭제 됨
SELECT table_name, constraint_type, constraint_name, r_constraint_name 
FROM USER_CONSTRAINTS
WHERE table_name IN ('DEPT02', 'EMP02', 'EMP03');

--- ALTER
-- emp 테이블을 emp04에 복사
CREATE TABLE emp04
AS
SELECT * FROM emp;

-- 제대로 복사 됐는지 확인
select * from emp04;

-- 테이블의 구조 확인
DESC emp04;

--- ADD: 컬럼 추가
ALTER TABLE emp04
ADD (   email       VARCHAR2(10),
        address     VARCHAR2(20) );

-- 컬럼이 추가 되었는지 확인        
select * from emp04;        
-- 추가 된 컬럼의 레코드는 NULL값으로 지정 되어있음을 확인   


-- MODIFY: 컬럼 변경
ALTER TABLE emp04
MODIFY ( email VARCHAR2(40) );

-- 변경 된 것을 확인
DESC emp04;


-- DROP: 컬럼 삭제
ALTER TABLE emp04
DROP (email);

---- 제약조건 추가
-- TABLE 생성
CREATE TABLE dept03
( deptno    NUMBER(2),
  dname     VARCHAR2(15),
  loc       VARCHAR2(15)
);

-- 기본 키 제약조건 추가
ALTER TABLE dept03
ADD CONSTRAINT dept03_deptno_pk PRIMARY KEY(deptno);

-- 기본 키 제약조건이 추가 된 것을 확인
SELECT *
FROM user_constraints
WHERE table_name = 'DEPT03';

-- NOT NULL 제약조건을 추가
ALTER TABLE dept03
MODIFY ( dname VARCHAR2(15) CONSTRAINT dept03_dname_nn NOT NULL);

-- NOT NULL은 ADD로는 추가 불가
ALTER TABLE dept03
ADD CONSTRAINT dept03_loc_nn NOT NULL(loc);    -- err code


---- 제약조건 삭제
-- PRIMARY KEY 삭제
ALTER TABLE dept03
DROP PRIMARY KEY;
-- OR
ALTER TABLE dept03
DROP CONSTRAINT dept03_deptno_pk;

-- NOT NULL 제약조건 삭제
ALTER TABLE dept03
DROP CONSTRAINT dept03_dname_nn;

-- CASCADE 옵션

-- DEPT05 생성
CREATE TABLE dept05
( deptno    NUMBER(02),
  dname     VARCHAR2(15),
  loc       VARCHAR2(15)
);

-- PK 옵션 추가
ALTER TABLE dept05
ADD CONSTRAINT dept05_deptno_pk PRIMARY KEY(deptno);

-- dept05에 정보 삽입
INSERT INTO dept05
VALUES (10, '인사', '서울');

COMMIT;

-- EMP 05 생성
CREATE TABLE emp05
( empno     NUMBER(4),
  ename     VARCHAR2(15),
  deptno    NUMBER(2)
);

-- 기본 키 제약조건 추가
ALTER TABLE emp05
ADD CONSTRAINT emp05_empno_pk PRIMARY KEY(empno);

-- 외래 키 제약조건 추가
ALTER TABLE emp05
ADD CONSTRAINT    emp05_deptno_fk       FOREIGN KEY (deptno)
                                        REFERENCES  dept05(deptno)
                                        ON DELETE CASCADE;

-- NOT NULL 제약조건 추가
ALTER TABLE emp05
MODIFY ( ename VARCHAR2(15) CONSTRAINT emp05_ename_nn NOT NULL);
-- VARCHAR2(15) 생략해도 무방
ALTER TABLE emp05
MODIFY ( ename CONSTRAINT emp05_ename_nn NOT NULL);

DESC EMP05;

ALTER TABLE dept05
DROP PRIMARY KEY;       -- err: emp05에서 dept05의 deptno를 참조하고 있기 때문

ALTER TABLE dept05
DROP PRIMARY KEY CASCADE;

-- DEPT05의 기본키 제약조건, EMP05의 외래키 제약 조건이 삭제된 것을 확인
SELECT *
FROM user_constraints
WHERE table_name IN ('DEPT05', 'EMP05');

---- 제약조건 비활성화 / 활성화
-- 기본 키 비활성화
ALTER TABLE emp05
DISABLE CONSTRAINT emp05_empno_pk;

-- 비활성화 된 것을 확인
SELECT constraint_name, status
FROM user_constraints
WHERE table_name IN ('EMP05');

SELECT * FROM EMP05;

INSERT INTO emp05
VALUES (1000, 'John', 10);

INSERT INTO emp05
VALUES (1000, 'Smith', 20);     -- 키본 키가 비활성화 되었기 때문에 empno가 중복되어도 삽입됨

-- 다시 활성화
ALTER TABLE emp05
ENABLE CONSTRAINT emp05_empno_pk;   -- err: empno에 이미 중복된 값이 있으므로

-- empno가 중복된 행 삭제
DELETE FROM emp05
WHERE ename = 'Smith';

-- 다시 활성화
ALTER TABLE emp05
ENABLE CONSTRAINT emp05_empno_pk;   

-- 활성화 된 것을 확인
SELECT constraint_name, status
FROM user_constraints
WHERE table_name IN ('EMP05');

INSERT INTO emp05
VALUES (1000, 'Smith', 20);     -- err: 활성화된 pk 조건에 의해 삽입 불가
