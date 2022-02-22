-- ���� ������ ���� �ܼ����� : ī���� ���δ�Ʈ
SELECT *
FROM EMP, DEPT ;

SELECT empno, sal
FROM EMP, DEPT 
where empno = 7369;

-- EMP���̺��� deptno�� �ְ�, DEPT���̺��� deptno�� �ֱ⶧����
-- SELECT������ deptno �׳� ���Ұ�
-- err code
SELECT deptno
FROM EMP, DEPT ;

-- ���̺���� ����� �����ν� �ذ� �� �� �ִ�.
SELECT EMP.deptno, dept.deptno
FROM EMP, DEPT ;

-- err code : deptno�� ���̺� ��� �ʿ�
SELECT empno, deptno
FROM EMP e, DEPT d
WHERE e.deptno = d.deptno
AND empno = 7369;

SELECT empno, e.deptno
FROM EMP e, DEPT d
WHERE e.deptno = d.deptno
AND empno = 7369;

SELECT empno, e.deptno, dname, loc
FROM EMP e, DEPT d
WHERE e.deptno = d.deptno
AND empno = 7369;

-- 1. KING�� ���, �̸�, �μ���ȣ, �μ����� Ž��
SELECT empno ���, ename �̸�, e.deptno �μ���ȣ, dname �μ���
FROM EMP e, DEPT d
WHERE e.deptno = d.deptno
AND ename = 'KING';

-- 2. SALES�μ��� ���� ������ ���, �̸�, �μ���ȣ, �μ����� Ž��
SELECT empno ���, ename �̸�, e.deptno �μ���ȣ, dname �μ���
FROM EMP e, DEPT d
WHERE e.deptno = d.deptno
AND dname = 'SALES';

-- Equi ����
SELECT *
FROM EMP e, DEPT d
WHERE e.deptno = d.deptno;

-- Equi ����
-- ������ ���, �̸�, �μ���ȣ, �μ����� Ž��
SELECT empno ���, ename �̸�, e.deptno �μ���ȣ, dname �μ���
FROM EMP e, DEPT d
WHERE e.deptno = d.deptno;

-- �����ȣ�� 7900���� ����� ���, �̸�, �μ���ȣ, �μ����� Ž��
SELECT empno ���, ename �̸�, e.deptno �μ���ȣ, dname �μ���
FROM EMP e, DEPT d
WHERE e.deptno = d.deptno
AND empno = '7900';

-- SALES�μ��� ���� ����� ���, �̸�, �μ���ȣ, �μ����� Ž��
SELECT empno ���, ename �̸�, e.deptno �μ���ȣ, dname �μ���
FROM EMP e, DEPT d
WHERE e.deptno = d.deptno
AND dname = 'SALES';


-- Non-Equi ����
SELECT empno, ename, job, sal, grade, losal, hisal
FROM EMP e, SALGRADE s
WHERE sal BETWEEN losal AND hisal;

SELECT e.empno, e.ename, e.job, e.sal, s.grade, s.losal, s.hisal
FROM EMP e, SALGRADE s
WHERE e.sal BETWEEN s.losal AND s.hisal;

-- 10�� �μ��� ���� ����� ����
SELECT empno, ename, job, sal, grade, losal, hisal, deptno
FROM EMP e, SALGRADE s
WHERE sal BETWEEN losal AND hisal
AND deptno = 10;

-- GRADE 1����� ����� ���, �̸�, ���� , ���
SELECT empno ���, ename �̸�, sal ����, grade ���
FROM EMP e, SALGRADE s
WHERE sal BETWEEN losal AND hisal
AND grade = 1;

-- ���� p190
-- 3���� ���̺��� �����ϰ��� �Ѵ�. ������� ���� ��� �� �μ������
-- Equi���ΰ� Non-Equi������ ��
SELECT ename, sal, dname, grade
FROM EMP e, DEPT d, SALGRADE g
WHERE e.deptno = d.deptno
AND sal BETWEEN losal AND hisal;

-- 7369�� ���, �̸�, �μ���ȣ, �μ��̸�, ����, ���
SELECT empno ���, ename �̸�, e.deptno �μ���ȣ, dname �μ��̸�, sal ����, grade ���
FROM EMP e, DEPT d, SALGRADE g
WHERE e.deptno = d.deptno
AND sal BETWEEN losal AND hisal
AND empno = '7369';


-- Self Join
SELECT *
FROM    EMP e,  -- ����� ���� ���� 
        EMP m   -- �����ڿ� ���� ����
WHERE e.mgr = m.empno;

-- ��� ��ȣ, ��� �̸�, ������ ��ȣ, ������ �̸�, ������ �μ���ȣ Ž��
SELECT  e.empno "��� ��ȣ", e.ename "��� �̸�", e.mgr "������ ��ȣ",
        m.empno "�������� �����ȣ", m.ename "������ �̸�", m.deptno "������ �μ���ȣ"
FROM    EMP e,  -- ����� ���� ���� 
        EMP m   -- �����ڿ� ���� ����
WHERE e.mgr = m.empno;

-- SMITH�� �����ڿ� ���� ����
SELECT  e.empno "��� ��ȣ", e.ename "��� �̸�", e.mgr "������ ��ȣ",
        m.empno "�������� �����ȣ", m.ename "������ �̸�", m.deptno "������ �μ���ȣ"
FROM    EMP e,  -- ����� ���� ���� 
        EMP m   -- �����ڿ� ���� ����
WHERE e.mgr = m.empno
AND e.ename = 'SMITH';



