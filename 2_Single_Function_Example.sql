-- �ǽ� 1
SELECT empno ���, ename �����, hiredate �Ի��� 
FROM EMP
WHERE TO_CHAR(hiredate, 'MM') = '12';

-- �ǽ� 2
SELECT empno, ename, LPAD(sal, 10, '*') �޿�
FROM emp;

-- �ǽ� 3
-- ��¥ ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

-- TO_CHAR ���
SELECT empno, ename, TO_CHAR(hiredate, 'YYYY-MM-DD') �Ի���
FROM emp
ORDER BY 1;

-- �ǽ� 4
SELECT empno, ename, comm, 
       CASE WHEN    comm is null    THEN    '�Ϲݻ��'
            ELSE '�������'
       END �������
FROM EMP;

-- �ǽ� 5
SELECT LOC, 
       CASE     WHEN LOC IN ('NEW YORK', 'BOSTON')   THEN 'EAST'
                WHEN LOC IN ('DALLAS', 'CHICAGO')    THEN 'CENTER'
                ELSE 'ETC'
       END AREA
FROM DEPT;

-- �ǽ� 6
SELECT ename, sal, 
       CASE WHEN    sal >= 2000 THEN    1000
            WHEN    sal >= 1000 THEN    500
            WHEN    sal < 1000  THEN    0
       END BONUS
FROM EMP;

-- �ǽ� 7
-- CASE ���
SELECT empno ���,ename �̸�, sal �޿�,
       CASE     WHEN    sal  BETWEEN 0 AND 1000     THEN    'E'
                WHEN    sal  BETWEEN 1001 AND 2000  THEN    'D'
                WHEN    sal  BETWEEN 2001 AND 3000  THEN    'C'
                WHEN    sal  BETWEEN 3001 AND 4000  THEN    'B'
                WHEN    sal  BETWEEN 4001 AND 5000  THEN    'A' 
       END ���
FROM EMP;

-- DECODE ���
SELECT empno ���, ename �̸�, sal �޿�,
       DECODE(-1,   SIGN(4000 - sal),   'A', 
                    SIGN(3000 - sal),   'B',
                    SIGN(2000 - sal),   'C',
                    SIGN(1000 - sal),   'D',
                    SIGN((-1) - sal),   'E',
       'etc') ��� 
FROM EMP;

-- SIGN �Լ��� ���,����,0���� �Ǻ�

SELECT EMPNO, ENAME,sal,
	DECODE( SIGN(SAL-4000),1,'A',
	DECODE( SIGN(SAL-3000),1,'B',
	DECODE( SIGN(SAL-2000),1,'C',
	DECODE( SIGN(SAL-1000),1,'D', 'E')
	)))GRADE 
FROM EMP;

