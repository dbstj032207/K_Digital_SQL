-- ������ �Լ� INITCAP
SELECT INITCAP('ORACLE SQL')
FROM dual;

SELECT ename, INITCAP(ename)
FROM EMP;
 
 -- UPPER
 SELECT UPPER('Oracle Sql')
 FROM dual;
 
 SELECT UPPER(ename)
 FROM EMP;
 
 -- ��ҹ��ڿ� ������� ������� ��� ������ ����� �� �ִ�.
SELECT *
FROM EMP
WHERE UPPER(ename) = 'WARD';

-- LOWER
SELECT lower(ename)
FROM EMP;
 
SELECT *
FROM EMP
WHERE LOWER (ename) = 'ward'; 

-- CONCAT
SELECT CONCAT('Oracle', 'Sql')
FROM dual;

-- Į���� ���ڿ�
SELECT CONCAT(ename, '���') �����
FROM EMP;

-- Į���� Į��
SELECT CONCAT(ename, sal)
FROM EMP;

-- LENGTH �Լ�
SELECT LENGTH('Oracle')
FROM dual;

SELECT ename
FROM EMP
WHERE LENGTH(ename) = ( SELECT MAX(LENGTH(ename))
                        FROM EMP);
                        
-- INSTR �Լ�
SELECT INSTR('MILLER', 'L', 1, 2), INSTR('MILLER', 'X', 1, 2)
FROM DUAL;

SELECT ename, INSTR(ename, 'L') e_null, INSTR(ename, 'L', 1, 1)
FROM EMP;

-- SUBSTR �Լ�
SELECT SUBSTR('900303-1234567' , 8, 1)
FROM DUAL;

-- ��� �⵵
SELECT SUBSTR('900303-1234567' , 1, 2)
FROM DUAL;

-- ��� ��
SELECT SUBSTR('900303-1234567' , 3, 2)
FROM DUAL;

-- �������� �ڸ���
SELECT SUBSTR('900303-1234567' , 1, 8)
FROM DUAL;

-- ���ڸ��� ���
SELECT SUBSTR('900303-1234567' , 8)
FROM DUAL;

SELECT ename ����̸�, hiredate �Ի���, SUBSTR(hiredate, 1, 2) �Ի�⵵
FROM EMP;

-- REPLACE �Լ�
SELECT REPLACE('JACK AND JUE', 'J', 'BL')
FROM dual;

-- �Լ��� �̿��� �ֹε�� ��ȣ ó��
-- SUBSTR
SELECT SUBSTR('900303-123456', 1, 8) || '******'
FROM dual;

-- SUBSTR, CONCAT
SELECT CONCAT( SUBSTR( '900303-123456', 1, 8 ), '******') "�ֹε�� ��ȣ"
FROM dual;

-- SUBSTR, REPLACE
SELECT REPLACE('900303-123456', SUBSTR('900303-123456', 9), '******') "�ֹε�� ��ȣ"
FROM dual;

-- LPAD, RPAD
SELECT LPAD('MILLER', 10, '*')
FROM DUAL;

SELECT LPAD('MILLER', 4, '*')
FROM DUAL;

SELECT RPAD('MILLER', 10, '*')
FROM DUAL;

SELECT RPAD('MILLER', 4, '*')
FROM DUAL;

-- SUBSTR, RPAD
SELECT RPAD( SUBSTR('900303-123456', 1, 8), 14, '*' ) "�ֹε�� ��ȣ"
FROM dual;

-- TRIM
SELECT LENGTH('    abcd    ')
FROM dual;

SELECT LENGTH(TRIM('    abcd    '))
FROM dual;

SELECT * FROM EMP
WHERE ename = TRIM('  KING  ');

-- ROUND
SELECT ROUND( 456.789, 2)
FROM dual;

SELECT ROUND( 456.789)
FROM dual;

SELECT ROUND( 456.789, -1)
FROM dual;

-- TRUNC 
SELECT TRUNC( 456.789, 2)
FROM dual;

SELECT TRUNC( 456.789)
FROM dual;

SELECT TRUNC( 456.789, -1)
FROM dual;

-- MOD �Լ�
SELECT MOD(10, 3), MOD(10, 0), MOD(10, 2)
FROM dual;

-- ����� Ȧ���� ���
SELECT empno "��� ��ȣ", ename "��� ��" 
FROM EMP
WHERE MOD(empno, 2) = 1;

-- CEIL �Լ�
SELECT CEIL(10.6), CEIL(-10.6)
FROM dual;

-- FLOOR �Լ�
SELECT FLOOR(10.6), FLOOR(-10.6)
FROM dual;

-- SIGN �Լ�
SELECT SIGN (100), SIGN(-20), SIGN(0)
FROM dual;

-- �ε�ȣ�� ��ü
SELECT ename "��� ��", sal ����
FROM EMP
WHERE SIGN(SAL - 1600) = 1;

SELECT ename "��� ��", sal ����
FROM EMP
WHERE SIGN(SAL - 1600) > 0;

-- 1600 ����
SELECT ename "��� ��", sal ����
FROM EMP
WHERE SIGN(SAL - 1600) >= 0;

SELECT *
FROM nls_session_parameters;

-- SYSDATE
SELECT SYSDATE
FROM dual;

-- ��¥ ����
SELECT SYSDATE - 1 ����, SYSDATE ����, SYSDATE + 1 ����
FROM dual;

SELECT ename, hiredate, (SYSDATE - hiredate)/365 "��"
FROM EMP
ORDER BY 3 DESC;

SELECT ename, hiredate, TRUNC((SYSDATE - hiredate)/365) "��"
FROM EMP
ORDER BY 3 DESC;

-- MONTHS_BETWEEN
SELECT ename, hiredate, TRUNC(MONTHS_BETWEEN(SYSDATE, hiredate)) "�ٹ� ����"
FROM EMP
ORDER BY 3 DESC;

-- ADD_MONTHS
SELECT ename, hiredate, ADD_MONTHS(hiredate, 5), ADD_MONTHS(hiredate, -5)
FROM EMP;

SELECT sysdate ����, ADD_MONTHS(sysdate, 1) ������, ADD_MONTHS(sysdate, -1) ������
FROM EMP;


SELECT ename, hiredate, ADD_MONTHS(hiredate, 5)
FROM EMP
WHERE deptno = 10
ORDER BY hiredate DESC;

-- NEXT_DAY
SELECT NEXT_DAY(SYSDATE, '������') "������ ������"
FROM dual;



SELECT NEXT_DAY(SYSDATE, 2) "������ ������"
FROM dual;

SELECT SYSDATE + 100
FROM dual;

-- LAST_DAY
SELECT LAST_DAY(SYSDATE) "�̹����� ������ ��¥"
FROM dual;

SELECT ename �̸�, hiredate �Ի���, LAST_DAY(hiredate) "�Ի� ���� ������ ��¥"
FROM EMP
WHERE ename = 'SMITH';

-- ���ó�¥�� �������� �Ѵ޵��� ù��° �Ͽ���
SELECT NEXT_DAY(ADD_MONTHS(SYSDATE, 1), '�Ͽ���')
FROM dual;

-- ROUND �Լ�
SELECT ename �̸�, hiredate �Ի���, 
ROUND(hiredate, 'YEAR') "�⵵�� �ݿø�", 
ROUND(hiredate, 'MONTH') "���� �ݿø�"
FROM EMP;

SELECT ROUND(SYSDATE, 'YEAR') "�⵵�� �ݿø�",
ROUND(SYSDATE, 'MONTH') "���� �ݿø�"
FROM DUAL;

-- TRUNC �Լ�
SELECT ename �̸�, hiredate �Ի���, 
TRUNC(hiredate, 'YEAR') "�⵵�� ����", 
TRUNC(hiredate, 'MONTH') "���� ����"
FROM EMP;

-- ������ Ÿ�� ��ȯ
SELECT * FROM EMP WHERE DEPTNO = '10';