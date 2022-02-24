CREATE TABLE subject
( subno     NUMBER(5),
  subname   VARCHAR2(20)    CONSTRAINT subject_subname_nn NOT NULL,
  term      VARCHAR2(1),
  type      VARCHAR2(6),
  CONSTRAINT subject_subno_pk   PRIMARY KEY(subno),
  CONSTRAINT subject_trem_ck    CHECK (term IN ('1', '2')),
  CONSTRAINT subject_type_ck    CHECK (type IN ('필수', '선택'))
);

INSERT INTO subject
VALUES(1, 'a', '1', '필수');
INSERT INTO subject
VALUES(2, 'a', '3', '필수');      -- err: CHECK 제약조건 위배(term)
INSERT INTO subject
VALUES(3, 'a', '1', '필');        -- err: CHECK 제약조건 위배(type)