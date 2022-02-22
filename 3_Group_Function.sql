

-- SUM �Լ�
SELECT SUM(DISTINCT sal), SUM(ALL sal), SUM(sal)
FROM emp;

-- AVG �Լ�
SELECT SUM(sal), AVG(sal)
FROM emp;

-- MAX �Լ�
SELECT MAX(sal), MIN(sal)
FROM EMP;

SELECT MIN(hiredate), MAX(hiredate)
FROM EMP;

-- err code
-- SELECT sal, MAX(sal), MIN(sal)
-- FROM EMP;
-- �׷��Լ��� �����Լ��� ���� ǥ���� �� ����
-- ������, ������ ��½� ����

-- COUNT
-- Ư�� �÷��� ����� ���� ������ ���� ������ ��ȯ
SELECT COUNT(ename), COUNT(comm)
FROM EMP;

-- �ߺ��� ����
SELECT COUNT(job), COUNT(DISTINCT job)
FROM EMP;

-- ���̺� ����� ���� ������� ��ü ���� ������ ���Ϸ���
-- COUNT(*) ���
SELECT COUNT(comm), COUNT(*)
FROM EMP;

-- err code
-- �ܼ� Į���� �׷� �Լ�
-- : �׷��Լ��� ���� ����� �ϳ�������, �ܼ� �÷��� ����� �������̱� ������ ������ �߻��ϰ� �ȴ�.
-- SELECT ename, MAX(sal)
-- FROM EMP;

-- GROUP BY
SELECT DEPTNO
FROM EMP
GROUP BY DEPTNO;

SELECT JOB
FROM EMP
GROUP BY JOB;

-- �׷��Լ����� ����� �� �ִ�.
-- ������ �޿��� ��
SELECT JOB, SUM(sal)
FROM EMP
GROUP BY JOB;

-- �μ��� �ο� ��
SELECT DEPTNO, COUNT(DEPTNO), COUNT(*)
FROM EMP
GROUP BY DEPTNO;

-- �μ��� �ο���, ������ �հ�, ���� ���
SELECT DEPTNO �μ���ȣ, COUNT(*) �ο���, SUM(sal) "������ �հ�", AVG(sal) "���� ���", MIN(sal) "�ְ� �޿�", MAX(sal) "���� �޿�"
FROM EMP
GROUP BY DEPTNO
ORDER BY SUM(sal) DESC;

-- GROUP BY 
SELECT AVG(sal), MAX(sal), MIN(sal), SUM(sal)
FROM emp
WHERE job LIKE 'SAL%';

SELECT AVG(NVL(comm, 0)), AVG(comm)
FROM EMP;

-- ERR
-- SELECT ���� �÷����� GROUP BY�� ����� �÷��̾�� �Ѵ�.
SELECT ename, AVG(sal)
FROM EMP
GROUP BY deptno;

-- ERR
-- WHERE�������� �׷��Լ� ���Ұ�
SELECT deptno, AVG(sal)
FROM EMP
WHERE AVG(SAL) > 1500
GROUP BY deptno;

-- ERR
-- GROUP BY �� ���� SELECT �ڿ� �Ϲ� �÷��� �׷��Լ� ���ÿ� ���Ұ�
SELECT deptno, AVG(sal)
FROM EMP;

-- GROUP BY�� �ι��ϴ� ���
SELECT deptno, job, COUNT(*), AVG(sal), SUM(sal)
FROM EMP
GROUP BY deptno, job;

-- HAVING
-- �޿��� ���� 9000�̻��� �μ�
SELECT deptno, SUM(sal)
FROM EMP
GROUP BY deptno
HAVING SUM(SAL) > 9000;

-- ���� �޿��� 800�� �Ѵ� ������� �� �μ��� �޿��� ���� 9000�̻��� �μ�
SELECT deptno, SUM(sal)
FROM EMP
WHERE sal > 800
GROUP BY deptno
HAVING SUM(SAL) > 9000;

-- �޿��� �ִ� 2900�̻��� �μ��� ���ؼ�, �μ���ȣ, ��ձ޿�, �޿��� ���� ���Ͽ� ���
SELECT deptno, AVG(sal), SUM(sal)
FROM EMP
GROUP BY deptno
HAVING MAX(sal) > 2900;

-- ������ �޿��� ����� 3000�̻��� ������ ���ؼ� ������, ��� �޿�, �޿��� ���� ���Ͽ�
SELECT job, AVG(sal), SUM(sal)
FROM EMP
GROUP BY job
HAVING AVG(sal) > 3000;

-- ��ü ������ 5000�� �ʰ��ϴ� �� ������ ���ؼ� ������ ���� �հ踦 ����Ͽ���. 
-- �� �Ǹſ��� �����ϰ� �� �޿� �հ�� ����(��������)
SELECT job, SUM(sal) PAYROLL
FROM EMP
WHERE job != 'SALESMAN'
GROUP BY job
HAVING SUM(sal) > 5000
ORDER BY 2;


-- �� ���� �׷����ϱ�
SELECT TO_CHAR(hiredate, 'YYYY') ��, 
       TO_CHAR(hiredate, 'MM') ��,
       SUM(sal)
FROM EMP
GROUP BY TO_CHAR(hiredate, 'YYYY'),
         TO_CHAR(hiredate, 'MM')
ORDER BY �� ASC;

-- �μ��� �ο����� 4�� �̻��� �μ��� ã���ÿ�
SELECT deptno, COUNT(*)
FROM EMP
GROUP BY deptno
HAVING COUNT(*) >= 4;






