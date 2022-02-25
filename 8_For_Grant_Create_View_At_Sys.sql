-- scott ���� ����
--  �н����� ����: 
ALTER USER scott IDENTIFIED BY tiger;         

-- ���� ����: 
CREATE USER scott IDENTIFIED BY tiger;   

-- ���� �ο�: 
GRANT connect, resource TO scott;
    /*  ����: ���̺���� ����(���̺� ������ scott - INSERT, UPDATE, DELETE, ...���� �ο�), ...
        ��(����): �������� �ʿ��� ���ѵ��� �ϳ��� �������� ����� Ȱ��, ����ڿ��� ���Ѵ�� ���� �ο�
        connect�� ������ �ƴ� ���� (CREATE SESSION ������ ���ԵǾ�����)
        resource���� ���� (���̺� ����, ���ν��� ����, ������ ����, ...�� ������������, �� ���� ������ ����)
        */
-- db ���� �� ������ �ο�

-- USER03 ����
CREATE USER user03 IDENTIFIED BY user03;

-- clerk�� ����
CREATE ROLE clerk;

-- clerk�ѿ� CREATE SESSION�� CREATE TABLE �ý��� ���� �ο�
GRANT CREATE SESSION, CREATE TABLE
TO clerk;

-- clerku�� select ���� �ο�
GRANT SELECT 
ON scott.dept
TO clerk;

-- user03�� clerk �� �ο�
GRANT clerk TO user03;


-- scott�� view ���� ���� �ο�
GRANT CREATE VIEW
TO scott;




