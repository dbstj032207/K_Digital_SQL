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

-- 2�ܰ� Self ���� 
-- �������� �����ڱ��� Ž��
SELECT  *
FROM    EMP e,  -- ����� ���� ���� 
        EMP m,  -- �����ڿ� ���� ����
        EMP mm  -- �������� �����ڿ� ��������
WHERE   e.mgr = m.empno
AND     m.mgr = mm.empno;

-- ��� ��ȣ, ��� �̸�, ������ ��ȣ, ������ �̸�, ������ �μ���ȣ Ž��
-- + SMITH�� �����ڿ� ���� ����
-- + �������� �������� ��ȣ, �������� �������� �̸�
SELECT  e.empno "��� ��ȣ", e.ename "��� �̸�", e.mgr "������(M) ��ȣ",
        m.ename "������(M) �̸�", m.deptno "������(M) �μ���ȣ", m.mgr "M�� ������ ��ȣ",
        mm.ename "M�� ������ �̸�"
FROM    EMP e,  -- ����� ���� ���� 
        EMP m,  -- �����ڿ� ���� ����
        EMP mm  -- �������� �����ڿ� ��������
WHERE   e.mgr = m.empno
AND     m.mgr = mm.empno
AND     e.ename = 'SMITH';

-- outer Join
SELECT *
FROM    EMP e,  -- ����� ���� ���� 
        EMP m,  -- �����ڿ� ���� ����
        EMP mm  -- �������� �����ڿ� ��������
WHERE   e.mgr = m.empno(+)
AND     m.mgr = mm.empno(+);



-- ANSI JOIN

-- Cross Join
SELECT empno, ename, dname, loc
FROM DEPT
CROSS JOIN EMP;

-- Natural Join
SELECT deptno
FROM EMP
NATURAL JOIN DEPT;

-- USING
SELECT *
FROM EMP
JOIN DEPT
USING (deptno);

SELECT empno, deptno
FROM EMP
JOIN DEPT
USING (deptno);

SELECT empno, e.deptno
FROM EMP e
JOIN DEPT d
USING (deptno);

-- JOIN ON 
SELECT *
FROM EMP e
JOIN DEPT d
ON e.deptno = d.deptno;

-- �˻� ������ ON���� AND�� ����Ͽ� �����ص� �ǰ�
-- WHERE�� ����Ͽ� �����Ͽ����ȴ�
SELECT *
FROM EMP e
JOIN DEPT d
ON e.deptno = d.deptno
-- AND ename = 'SMITH';
WHERE ename = 'SMITH';		-- ������, �˻������� WHERE�� ����ϴ� ���� �����Ѵ�.

-- 1. USING�� �̿� SMITH�� �̸��� �μ���ȣ, �μ��̸� SELECT
SELECT ename �̸�, deptno �μ���ȣ, dname �μ��̸�
FROM EMP
JOIN DEPT
USING (deptno)
WHERE ename = 'SMITH';

-- 2. JOIN ON�� �̿�, ��Ī ���
SELECT e.ename �̸�, e.deptno �μ���ȣ, d.dname �μ��̸�
FROM EMP e
JOIN DEPT d
ON e.deptno = d.deptno
WHERE e.ename = 'SMITH';

-- 3�� ���̺� ����, ON�� ���
SELECT empno ���, ename �̸�, e.deptno �μ���ȣ,   -- �μ���ȣ�� ���̺�� ����
       dname �μ���, sal ����, grade ��� 
FROM EMP e
JOIN DEPT d
ON e.deptno = d.deptno
JOIN SALGRADE 
ON sal BETWEEN losal AND hisal
WHERE ename = 'SMITH'
ORDER BY 5;

-- 3�� ���̺� ���� , USING�� ���
SELECT empno ���, ename �̸�, deptno �μ���ȣ,     -- �μ���ȣ�� ���̺�� ����x
       dname �μ���, sal ����, grade ��� 
FROM EMP e
JOIN DEPT d
USING (deptno)
JOIN SALGRADE 
ON sal BETWEEN losal AND hisal
WHERE ename = 'SMITH'
ORDER BY 5;

