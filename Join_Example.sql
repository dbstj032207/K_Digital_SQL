-- �ǽ� 2
-- 
SELECT empno ���, ename �����, sal �޿�, dname �μ���
FROM EMP e, DEPT d
WHERE e.deptno = d.deptno
AND sal > 2000
ORDER BY 3 DESC;