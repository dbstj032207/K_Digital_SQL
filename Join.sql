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




