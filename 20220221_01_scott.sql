SELECT USER
FROM DUAL;
--==>> SCOTT


--�� BETWEEN �� AND �� �� ��¥��, ������, ������ ������ ��ο� ����ȴ�.
--   ��, �������� ��� �ƽ�Ű�ڵ� ������ ������ ������(������ �迭)
--   �빮�ڰ� ���ʿ� ��ġ�ϰ� �ҹ��ڰ� ���ʿ� ��ġ�Ѵ�.
--   ����, BETWEEN �� AND �δ� �ش� ������ ����Ǵ� ��������
--   ����Ŭ ���������δ� �ε�ȣ �������� ���·� �ٲ�� ���� ó���ȴ�.

SELECT ASCII('A'), ASCII('B'), ASCII('a'), ASCII('b') 
FROM DUAL;
--==>> 65	66	97	98

--��
SELECT ENAME, JOB, SAL
FROM TBL_EMP
WHERE JOB = 'SALESMAN'
   OR JOB = 'CLERK';
/*
SMITH	CLERK	     800
ALLEN	SALESMAN	1600
WARD	SALESMAN	1250
MARTIN	SALESMAN	1250
TURNER	SALESMAN	1500
ADAMS	CLERK	    1100
JAMES	CLERK	     950
MILLER	CLERK	    1300
ȣ����	SALESMAN	(NULL)
������	SALESMAN	(NULL)
*/

--��
SELECT ENAME, JOB, SAL
FROM TBL_EMP
WHERE JOB IN ('SALESMAN', 'CLERK');
/*
SMITH	CLERK	     800
ALLEN	SALESMAN	1600
WARD	SALESMAN	1250
MARTIN	SALESMAN	1250
TURNER	SALESMAN	1500
ADAMS	CLERK	    1100
JAMES	CLERK	     950
MILLER	CLERK	    1300
ȣ����	SALESMAN	(NULL)
������	SALESMAN	(NULL)
*/

--��
SELECT ENAME, JOB, SAL
FROM TBL_EMP
WHERE JOB = ANY('SALESMAN', 'CLERK');
/*
SMITH	CLERK	     800
ALLEN	SALESMAN	1600
WARD	SALESMAN	1250
MARTIN	SALESMAN	1250
TURNER	SALESMAN	1500
ADAMS	CLERK	    1100
JAMES	CLERK	     950
MILLER	CLERK	    1300
ȣ����	SALESMAN	(NULL)
������	SALESMAN	(NULL)
*/

--�� ���� 3���� ������ �������� ��� ���� ����� ��ȯ�Ѵ�.
--   ������, �� �� Ŀ������(OR)�� ���� ������ ó���ȴ�.
--   ���� �޸𸮿� ���� ������ �ƴ϶� CPU ó���� ���� �����̹Ƿ�
--   �� �κб��� �����Ͽ� �������� �����ϰ� �Ǵ� ���� ���� �ʴ�.
--   �� ��,�鿡�� ��IN������=ANY���� ���� ������ ȿ���� ������. 
--     �̵� ��δ� ���������� ��OR�������� ����Ǿ� ���� ó�� �ȴ�.
-------------------------------------------------------------------------------

--�� �߰� �ǽ� ���̺� ����(TBL_SAWON)
CREATE TABLE TBL_SAWON
( SANO        NUMBER(4)
, SANAME      VARCHAR2(30)  
, JUBUN       CHAR(13) 
, HIREDATE    DATE      DEFAULT SYSDATE
, SAL         NUMBER(10)   
);
--==>> Table TBL_SAWON��(��) �����Ǿ����ϴ�.

SELECT *
FROM TBL_SAWON;

DESC TBL_SAWON;
/*
�̸�       ��? ����           
-------- -- ------------ 
SANO        NUMBER(4)    
SANAME      VARCHAR2(30) 
JUBUN       CHAR(13)     
HIREDATE    DATE         
SAL         NUMBER(10)   
*/

--�� ������ ���̺��� ������ �Է�(TBL_SAWON)
INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1001, '��μ�', '9707251234567', TO_DATE('2005-01-03', 'YYYY-MM-DD'), 3000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1002, '������', '9505152234567', TO_DATE('1999-11-23', 'YYYY-MM-DD'), 4000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1003, '������', '9905192234567', TO_DATE('2006-08-10', 'YYYY-MM-DD'), 3000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1004, '�̿���', '9508162234567', TO_DATE('2007-10-10', 'YYYY-MM-DD'), 4000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1005, '���̻�', '9805161234567', TO_DATE('2007-10-10', 'YYYY-MM-DD'), 4000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1006, '������', '8005122234567', TO_DATE('1999-10-10', 'YYYY-MM-DD'), 1000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1007, '������', '0204053234567', TO_DATE('2010-10-10', 'YYYY-MM-DD'), 1000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1008, '������', '6803171234567', TO_DATE('1998-10-10', 'YYYY-MM-DD'), 1500);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1009, '������', '6912232234567', TO_DATE('1998-10-10', 'YYYY-MM-DD'), 1300);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1010, '���켱', '0303044234567', TO_DATE('2010-10-10', 'YYYY-MM-DD'), 1600);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1011, '������', '0506073234567', TO_DATE('2012-10-10', 'YYYY-MM-DD'), 2600);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1012, '���ù�', '0208073234567', TO_DATE('2012-10-10', 'YYYY-MM-DD'), 2600);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1013, '����', '6712121234567', TO_DATE('1998-10-10', 'YYYY-MM-DD'), 2200);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1014, 'ȫ����', '0005044234567', TO_DATE('2015-10-10', 'YYYY-MM-DD'), 5200);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1015, '�Ӽҹ�', '9711232234567', TO_DATE('2007-10-10', 'YYYY-MM-DD'), 5500);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.  X 15

--�� Ȯ��
SELECT *
FROM TBL_SAWON;
/*
1001	��μ�	    9707251234567	2005-01-03	3000
1002	������	    9505152234567	1999-11-23	4000
1003	������	    9905192234567	2006-08-10	3000
1004	�̿���	    9508162234567	2007-10-10	4000
1005	���̻�	    9805161234567	2007-10-10	4000
1006	������	    8005122234567	1999-10-10	1000
1007	������	    0204053234567	2010-10-10	1000
1008	������	    6803171234567	1998-10-10	1500
1009	������	6912232234567	1998-10-10	1300
1010	���켱	    0303044234567	2010-10-10	1600
1011	������	    0506073234567	2012-10-10	2600
1012	���ù�	    0208073234567	2012-10-10	2600
1013	����	    6712121234567	1998-10-10	2200
1014	ȫ����	    0005044234567	2015-10-10	5200
1015	�Ӽҹ�	    9711232234567	2007-10-10	5500
*/


--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

--�� TBL_SAWON ���̺����� ������ ����� �����͸� ��ȸ�Ѵ�.

SELECT *
FROM TBL_SAWON
WHERE SANAME = '������';
--==>> 1003	������	9905192234567	2006-08-10	3000

SELECT *
FROM TBL_SAWON
WHERE SANAME LIKE '������';
--==>> 1003	������	9905192234567	2006-08-10	3000

--�� LIKE : ���� �� �����ϴ�.
--        : �λ� �� ~�� ����, ó��     CHECK~!!

--�� WHILD CARD(CHARACTER) �� ��%��
--   ��LIKE���� �Բ� ���Ǵ� ��%���� ��� ���ڸ� �ǹ��ϰ�
--   ��LIKE���� �Բ� ���Ǵ� ��_���� �ƹ� ���� �Ѱ��� �ǹ��Ѵ�.

--�� TBL_SAWON ���̺����� ������ ���衻���� ����� 
--   �����, �ֹι�ȣ, �޿� �׸��� ��ȸ
SELECT *
FROM TBL_SAWON
WHERE SANAME ='��';    -- �̴� �̸��� '��' �� ����� ã�°� ���� ���Ե� ��� ã�°� �ƴ�
--==>> ��ȸ ��� ����

SELECT *
FROM TBL_SAWON
WHERE SANAME LIKE '��__';   -- �� + ����� 2�� �� �褷�� �̸� ã��
--==>> 1001	��μ�	9707251234567	2005-01-03	3000

SELECT *
FROM TBL_SAWON
WHERE SANAME LIKE '��%';-- �� + % ������ �����ϴ� ��� ã��.
--==>> 1001	��μ�	9707251234567	2005-01-03	3000

--�� TBL_SAWON ���̺����� ������ ���̡����� �����
--   �����, �ֹι�ȣ, �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '��%';
--==>> 
/*
������	9905192234567	3000
�̿���	9508162234567	4000
������	8005122234567	1000
*/

--�� TBL_SAWON ���̺����� �̸��� ������ ��¥�� ���Ρ��� �����
--   �����, �ֹι�ȣ, �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '%��';
/*
���ù�	0208073234567	2600
ȫ����	0005044234567	5200
�Ӽҹ�	9711232234567	5500
*/

--�� �߰� ������ �Է�(TBL_SAWON)
INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1016, '���̰�', '0603194234567', TO_DATE('2015-01-20','YYYY-MM-DD'), 1500);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

--�� Ȯ��
SELECT *
FROM tbl_sawon;
/*
1001	��μ�	    9707251234567	2005-01-03	3000
1002	������	    9505152234567	1999-11-23	4000
1003	������	    9905192234567	2006-08-10	3000
1004	�̿���	    9508162234567	2007-10-10	4000
1005	���̻�	    9805161234567	2007-10-10	4000
1006	������	    8005122234567	1999-10-10	1000
1007	������	    0204053234567	2010-10-10	1000
1008	������	    6803171234567	1998-10-10	1500
1009	������	6912232234567	1998-10-10	1300
1010	���켱	    0303044234567	2010-10-10	1600
1011	������	    0506073234567	2012-10-10	2600
1012	���ù�	    0208073234567	2012-10-10	2600
1013	����	    6712121234567	1998-10-10	2200
1014	ȫ����	    0005044234567	2015-10-10	5200
1015	�Ӽҹ�	    9711232234567	2007-10-10	5500
1016	���̰�	    0603194234567	2015-01-20	1500
*/
--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�


--�� TBL_SAWON ���̺����� ����� �̸��� ���̡���� ���ڰ�
--   �ϳ��� ���ԵǾ� �ִٸ� �� ����� 
--   �����, �ֹι�ȣ, �޿� �׸��� ��ȸ�Ѵ�.

SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '%��' OR SANAME LIKE '��%' OR SANAME LIKE '_��_';
/*
������	9905192234567	3000
�̿���	9508162234567	4000
���̻�	9805161234567	4000
������	8005122234567	1000
������	0204053234567	1000
���̰�	0603194234567	1500
*/

SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '%��%';
/*
������	9905192234567	3000
�̿���	9508162234567	4000
���̻�	9805161234567	4000
������	8005122234567	1000
������	0204053234567	1000
���̰�	0603194234567	1500
*/

--�� TBL_SAWON ���̺����� ����� �̸��� ���̡���� ���ڰ�
--   �������� �� �� ����ִ� �����
--   �����ȣ, �����, �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANO, SANAME, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '%����%';
--==>> 1016	���̰�	1500

--�� TBL_SAWON ���̺����� ����� �̸��� ���̡���� ���ڰ� �� �� ����ִ� �����
--   �����ȣ, �����, �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANO, SANAME, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '%��%��%';
/*
1006	������	1000
1016	���̰�	1500
*/

--�� TBL_SAWON ���̺����� ��� �̸��� �� ��° ���ڰ� ���̡��� �����
-- �����ȣ, �����, �޿� �׸��� ��ȸ�Ѵ�.

SELECT SANO, SANAME, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '_��%';
/*
1005	���̻�	4000
1016	���̰�	1500
*/

--�� TBL_SAWON ���̺����� ����� ������ ���������� �����
-- �����ȣ, �����, �޿� �׸��� ��ȸ�Ѵ�.

SELECT SANO, SANAME, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '��%' AND SANAME NOT LIKE '����%';
--==>> 1008	������	1500

--�� �����ͺ��̽� ���� ��������
--   ���� �̸��� �и��Ͽ� ó���ؾ� �� ���� ��ȹ�� �ִٸ�
--   (���� ������ �ƴϴ���...)
--   ���̺����� �� �÷��� �̸� �÷��� �и��Ͽ� �����ؾ� �Ѵ�..
--   ���켱���� ���� ���ΰ� ���찡 ���ΰ�..?? 

--�� TBL_SAWON ���̺����� ����������
--   �����, �ֹι�ȣ �޿��׸��� ��ȸ�Ѵ�.
SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE JUBUN LIKE '______2%' OR JUBUN LIKE '______4%'; 
/*
������	    9505152234567	4000
������	    9905192234567	3000
�̿���	    9508162234567	4000
������     	8005122234567	1000
������	6912232234567	1300
���켱	    0303044234567	1600
ȫ����	    0005044234567	5200
�Ӽҹ�	    9711232234567	5500
���̰�	    0603194234567	1500
*/
SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE JUBUN LIKE '______2______' OR JUBUN LIKE '______4______'; 
/*
������	    9505152234567	4000
������	    9905192234567	3000
�̿���	    9508162234567	4000
������	    8005122234567	1000
������	6912232234567	1300
���켱	    0303044234567	1600
ȫ����	    0005044234567	5200
�Ӽҹ�	    9711232234567	5500
���̰�	    0603194234567	1500
*/


--�� ���̺� ���� (TBL_WATCH)
CREATE TABLE TBL_WATCH
( WATCH_NANE    VARCHAR2(20)
, BIGO          VARCHAR2(100)
);
--==>> Table TBL_WATCH��(��) �����Ǿ����ϴ�.

--�� ������ �Է� (TBL_WATCH)
INSERT INTO TBL_WATCH(WATCH_NANE, BIGO)
VALUES('�ݽð�', '���� 99.99% ������ �ְ��� �ð�');

INSERT INTO TBL_WATCH(WATCH_NANE, BIGO)
VALUES('���ð�', '���� ������ 99.99���� ȹ���� ���� �ð�');


SELECT *
FROM TBL_WATCH;

COMMIT;

--�� TBL_WATCH ���̺��� BIGO �÷��� 
--   ��99.99%����� ���ڰ� ���Ե� ���� 
--   �����͸� ��ȸ�Ѵ�.

SELECT *
FROM TBL_WATCH
WHERE BIGO LIKE '99.99%';
--==>> ��ȸ ��� ����

SELECT *
FROM TBL_WATCH
WHERE BIGO LIKE '%99.99%%';
/*
�ݽð�	���� 99.99% ������ �ְ��� �ð�
���ð�	���� ������ 99.99���� ȹ���� ���� �ð�
*/

SELECT *
FROM TBL_WATCH
WHERE BIGO LIKE '%99.99%%%';
/*
�ݽð�	���� 99.99% ������ �ְ��� �ð�
���ð�	���� ������ 99.99���� ȹ���� ���� �ð�
*/


SELECT *
FROM TBL_WATCH
WHERE BIGO LIKE '%99.99\%%' ESCAPE '\';
--==>> �ݽð�	���� 99.99% ������ �ְ��� �ð�

SELECT *
FROM TBL_WATCH
WHERE BIGO LIKE '%99.99$%%' ESCAPE '$';
--==>> �ݽð�	���� 99.99% ������ �ְ��� �ð�

--�� ESCAPE �� ���� ������ ���� �� ���ڸ� ���ϵ�ī�忡�� Ż�� ���Ѷ�...
--   �Ϲ������� ��� �󵵰� ���� Ư������(Ư����ȣ)�� ����Ѵ�.
--------------------------------------------------------------------------------

--���� COMMIT/ ROLLBACK ����--

SELECT *
FROM TBL_DEPT;
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
*/

--�� ������ �Է�
INSERT INTO TBL_DEPT VALUES(50, '���ߺ�', '����');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

--�� Ȯ��
SELECT *
FROM TBL_DEPT;
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
50	���ߺ�	    ����
*/

-- 50�� ���ߺ� ����.... 
-- �� �����ʹ� TBL_DEPT ���̺��� ����Ǿ� �ִ� 
-- �ϵ��ũ�� ���������� ����Ǿ� ����� ���� �ƴϴ�.
-- �޸�(RAM)�� �Էµ� ���̴�.

--�� �ѹ�
ROLLBACK;
--==>> �ѹ� �Ϸ�.

--�� Ȯ��
SELECT *
FROM TBL_DEPT;
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
*/
--> ��50 ���ߺ� ��������Ͱ� �ҽǵǾ����� Ȯ��(�������� ����)

--�� �ٽ� ������ �Է�
INSERT INTO TBL_DEPT VALUES(50, '���ߺ�', '����');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

-- 50�� ���ߺ� ����...
-- �� �����ʹ� TBL_DEPT ���̺��� ����Ǿ� �ִ� 
-- �ϵ��ũ�� ���������� ����Ǿ� ����� ���� �ƴϴ�.
-- �޸�(RAM)�� �Էµ� ���̴�.
-- �̸� ���� �ϵ��ũ�� ���������� �����ϱ� ���ؼ���
-- COMMIT ���־�� �Ѵ�.

--�� Ȯ��
SELECT *
FROM TBL_DEPT;
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
50	���ߺ�	    ����
*/

--�� Ŀ�� 
COMMIT;
--==>> Ŀ�� �Ϸ�

--�� Ŀ�� ���� Ȯ��

SELECT *
FROM TBL_DEPT;
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
50	���ߺ�	    ����
*/

--�� Ŀ�� ���� �ѹ� 
ROLLBACK;
--==>> �ѹ� �Ϸ�.

--�� �ѹ� ���� Ȯ��
SELECT *
FROM TBL_DEPT;
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
50	���ߺ�	    ����
*/
--> �ѹ�(ROLLBACK)�� ������������ �ұ��ϰ�
--  ��50 ���ߺ� ��� �� �� �����ʹ� �ҽǵ��� �ʾ����� Ȯ��.

--�� COMMIT �� ������ ���ķ� DML����(INSERT, UPDATE, DELETE)�� ����
--   ����� �����͸� ����� �� �ִ� ���� ��...
--   DML ������ ����� �� COMMIT �� �ϰ����� ROLLBACK�� �����غ���
--   �ƹ��� �ҿ��� ����.


--�� ������ ����(UPDATE �� TBL_DEPT)
UPDATE TBL_DEPT
SET DNAME = '������', LOC = '���'
WHERE DEPTNO = 50;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.
 
--�� Ȯ��
SELECT *
FROM TBL_DEPT;
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
50	������	    ���
*/

--�� �ѹ�
ROLLBACK;
--==>> �ѹ� �Ϸ�.

--�� �ѹ� �� �ٽ� Ȯ��
SELECT *
FROM TBL_DEPT;
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
50	���ߺ�	    ����
*/

--�� ������ ����(DELETE �� TBL_DEPT)
-- 1. ��ȸ���� �ϱ� (���� ����� ��Ȯ�� Ȯ������!!!!)
SELECT *
FROM TBL_DEPT
WHERE DEPTNO = 50;

--2. SELECT * �� DELETE �� �ٲٱ� 
DELETE 
FROM TBL_DEPT
WHERE DEPTNO = 50;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

--�� Ȯ��
SELECT *
FROM TBL_DEPT;
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
*/


--�� �ѹ�
ROLLBACK;
--==>> �ѹ� �Ϸ�.

--�� �ѹ� ���� �� Ȯ��
SELECT *
FROM TBL_DEPT;
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
50	���ߺ�	    ����
*/
--------------------------------------------------------------------------------

--���� ORDER BY �� ����--

SELECT ENAME "�����", DEPTNO "�μ���ȣ",
        JOB "������", SAL "�޿�", SAL*12+NVL(COMM,0) "����"
FROM EMP;
/*
SMITH	20	CLERK	     800	 9600
ALLEN	30	SALESMAN	1600	19500
WARD	30	SALESMAN	1250	15500
JONES	20	MANAGER	    2975	35700
MARTIN	30	SALESMAN	1250	16400
BLAKE	30	MANAGER	    2850	34200
CLARK	10	MANAGER	    2450	29400
SCOTT	20	ANALYST	    3000	36000
KING	10	PRESIDENT	5000	60000
TURNER	30	SALESMAN	1500	18000
ADAMS	20	CLERK	    1100	13200
JAMES	30	CLERK	     950	11400
FORD	20	ANALYST	    3000	36000
MILLER	10	CLERK	    1300	15600
*/

SELECT ENAME "�����", DEPTNO "�μ���ȣ",
        JOB "������", SAL "�޿�", SAL*12+NVL(COMM,0) "����"
FROM EMP
ORDER BY DEPTNO ASC;     -- DEPTNO �� ���� ���� : �μ� ��ȣ 
                         -- ASC    �� ���� ���� : ��������
/*
CLARK	10	MANAGER	    2450	29400
KING	10	PRESIDENT	5000	60000
MILLER	10	CLERK	    1300	15600
JONES	20	MANAGER 	2975	35700
FORD	20	ANALYST	    3000	36000
ADAMS	20	CLERK	    1100	13200
SMITH	20	CLERK	     800	 9600
SCOTT	20	ANALYST	    3000	36000
WARD	30	SALESMAN	1250	15500
TURNER	30	SALESMAN	1500	18000
ALLEN	30	SALESMAN	1600	19500
JAMES	30	CLERK	     950	11400
BLAKE	30	MANAGER	    2850	34200
MARTIN	30	SALESMAN	1250	16400
*/

SELECT ENAME "�����", DEPTNO "�μ���ȣ",
        JOB "������", SAL "�޿�", SAL*12+NVL(COMM,0) "����"
FROM EMP
ORDER BY DEPTNO;           -- ASC �� �������� �ʾƵ� ������������ ����
/*
CLARK	10	MANAGER	    2450	29400
KING	10	PRESIDENT	5000	60000
MILLER	10	CLERK	    1300	15600
JONES	20	MANAGER	    2975	35700
FORD	20	ANALYST	    3000	36000
ADAMS	20	CLERK	    1100	13200
SMITH	20	CLERK	     800	 9600
SCOTT	20	ANALYST	    3000	36000
WARD	30	SALESMAN	1250	15500
TURNER	30	SALESMAN	1500	18000
ALLEN	30	SALESMAN	1600	19500
JAMES	30	CLERK	     950	11400
BLAKE	30	MANAGER	    2850	34200
*/

SELECT ENAME "�����", DEPTNO "�μ���ȣ",
        JOB "������", SAL "�޿�", SAL*12+NVL(COMM,0) "����"
FROM EMP
ORDER BY DEPTNO DESC;      -- ���ı��� : DESC ��������(���� �Ұ�!!)
/*                         -- DESCRIBE �� DESC �ξ��� �� ������ ���ƿ� �°� ����Ŭ�� �˾Ƽ� �Ǵ�.                                         
BLAKE	30	MANAGER	    2850	34200
TURNER	30	SALESMAN	1500	18000
ALLEN	30	SALESMAN	1600	19500
MARTIN	30	SALESMAN	1250	16400
WARD	30	SALESMAN	1250	15500
JAMES	30	CLERK	     950	11400
SCOTT	20	ANALYST	    3000	36000
JONES	20	MANAGER	    2975	35700
SMITH	20	CLERK	     800	 9600
ADAMS	20	CLERK	    1100	13200
FORD	20	ANALYST	    3000	36000
KING	10	PRESIDENT	5000	60000
MILLER	10	CLERK	    1300	15600
CLARK	10	MANAGER	    2450	29400
*/


SELECT ENAME "�����", DEPTNO "�μ���ȣ",
        JOB "������", SAL "�޿�", SAL*12+NVL(COMM,0) "����"
FROM EMP
ORDER BY ���� DESC;       -- ������ ��Ī�� ���� ������� ������ �ۼ� ���� 
/*                        -- FROM, WHERE, GROUP BY, HAVING, SELECT, ORDER BY ���̱� ������
KING	10	PRESIDENT	5000	60000   -- SELECT���� ���� ��Ī���� ORDER BY ���� ����� �����ϴ�.
FORD	20	ANALYST	    3000	36000
SCOTT	20	ANALYST	    3000	36000
JONES	20	MANAGER	    2975	35700
BLAKE	30	MANAGER	    2850	34200
CLARK	10	MANAGER	    2450	29400
ALLEN	30	SALESMAN	1600	19500
TURNER	30	SALESMAN	1500	18000
MARTIN	30	SALESMAN	1250	16400
MILLER	10	CLERK	    1300	15600
WARD	30	SALESMAN	1250	15500
ADAMS	20	CLERK	    1100	13200
JAMES	30	CLERK	     950	11400
SMITH	20	CLERK	     800	 9600
*/

SELECT ENAME "�����", DEPTNO "�μ���ȣ",
        JOB "������", SAL "�޿�", SAL*12+NVL(COMM,0) "����"
FROM EMP
ORDER BY 2;   --�μ���ȣ �������� , ���ڴ� SELECT���� ������ ���� �̴�.(1���� ����...)
-- ORDER BY �μ���ȣ; --(���� ������) 
--> EMP ���̺��� ������ �ִ� ���̺��� ������ �÷����� (2�� ENAME, �����)�� �ƴ϶�
--  SELECT ó���Ǵ� �� ��° �÷�(2�� DEPTNO, �μ���ȣ)�� �������� ���ĵǴ� ���� Ȯ��.
--  ASC ������ ���� �� ������������ ���ĵǴ� ���� Ȯ��
--  �� �� �������� ��ORDER BY 2;���¡�ORDER BY DEPTNO ASC;�� �� ���� �����̴�.
/*
CLARK	10	MANAGER	    2450	29400
KING	10	PRESIDENT	5000	60000
MILLER	10	CLERK	    1300	15600
JONES	20	MANAGER	    2975	35700
FORD	20	ANALYST	    3000	36000
ADAMS	20	CLERK	    1100	13200
SMITH	20	CLERK	     800	 9600
SCOTT	20	ANALYST	    3000	36000
WARD	30	SALESMAN	1250	15500
TURNER	30	SALESMAN	1500	18000
ALLEN	30	SALESMAN	1600	19500
JAMES	30	CLERK	     950	11400
BLAKE	30	MANAGER	    2850	34200
MARTIN	30	SALESMAN	1250	16400
*/


SELECT ENAME, DEPTNO, JOB, SAL
FROM EMP
ORDER BY 2, 4; -- DEPTNO�� ���� ����, �� �� �ȿ��� SAL ����... ASC
/*
MILLER	10	CLERK	    1300
CLARK	10	MANAGER	    2450
KING	10	PRESIDENT	5000
SMITH	20	CLERK	     800
ADAMS	20	CLERK	    1100
JONES	20	MANAGER	    2975
SCOTT	20	ANALYST	    3000
FORD	20	ANALYST	    3000
JAMES	30	CLERK	     950
MARTIN	30	SALESMAN	1250
WARD	30	SALESMAN	1250
TURNER	30	SALESMAN	1500
ALLEN	30	SALESMAN	1600
BLAKE	30	MANAGER	    2850
*/

SELECT ENAME, DEPTNO, JOB, SAL
FROM EMP
ORDER BY 2, 3, 4 DESC;
--> �� 2 �� DEPT(�μ���ȣ) ���� �������� ����
--> �� 3 �� JOB(������)    ���� �������� ����
--> �� 4 �� SAL(�޿�) ���� ������������ ���� �� 3��° �����̶� ������ ��ġ�� ������ �������� Ȯ�� ����
/*
MILLER	10	CLERK	1300
CLARK	10	MANAGER	2450
KING	10	PRESIDENT	5000
SCOTT	20	ANALYST	3000
FORD	20	ANALYST	3000
ADAMS	20	CLERK	1100
SMITH	20	CLERK	800
JONES	20	MANAGER	2975
JAMES	30	CLERK	950
BLAKE	30	MANAGER	2850
ALLEN	30	SALESMAN	1600
TURNER	30	SALESMAN	1500
MARTIN	30	SALESMAN	1250
WARD	30	SALESMAN	1250
*/
--------------------------------------------------------------------------------

--�� CONCAT() 
SELECT ENAME || JOB "COL1", CONCAT(ENAME, JOB) "COL2"
FROM EMP; -- COL1�� COL2 �� ���� ����� ������.
/*
SMITHCLERK	    SMITHCLERK
ALLENSALESMAN	ALLENSALESMAN
WARDSALESMAN	WARDSALESMAN
JONESMANAGER	JONESMANAGER
MARTINSALESMAN	MARTINSALESMAN
BLAKEMANAGER	BLAKEMANAGER
CLARKMANAGER	CLARKMANAGER
SCOTTANALYST	SCOTTANALYST
KINGPRESIDENT	KINGPRESIDENT
TURNERSALESMAN	TURNERSALESMAN
ADAMSCLERK	    ADAMSCLERK
JAMESCLERK	    JAMESCLERK
FORDANALYST	    FORDANALYST
MILLERCLERK	    MILLERCLERK
*/

-- ���ڿ��� �����ϴ� ����� ���� CONCAT()
-- ������ 2���� ���ڿ��� ���ս����� �� �ִ�.
SELECT ENAME|| JOB|| DEPTNO "COL1", CONCAT(ENAME, JOB, DEPTNO) "COL2"
FROM EMP;
--==>> �����߻�
-- ( ORA-00909: invalid number of arguments)   -- �Ű����� 3���� ����

SELECT ENAME|| JOB|| DEPTNO "COL1", CONCAT(CONCAT(ENAME, JOB), DEPTNO) "COL2"
FROM EMP;-- �Լ��� ��ø���� 3���� �����..
/*
SMITHCLERK20	    SMITHCLERK20
ALLENSALESMAN30	    ALLENSALESMAN30
WARDSALESMAN30	    WARDSALESMAN30
JONESMANAGER20	    JONESMANAGER20
MARTINSALESMAN30	MARTINSALESMAN30
BLAKEMANAGER30	    BLAKEMANAGER30
CLARKMANAGER10	    CLARKMANAGER10
SCOTTANALYST20	    SCOTTANALYST20
KINGPRESIDENT10	    KINGPRESIDENT10
TURNERSALESMAN30	TURNERSALESMAN30
ADAMSCLERK20	    ADAMSCLERK20
JAMESCLERK30	    JAMESCLERK30
FORDANALYST20	    FORDANALYST20
MILLERCLERK10	    MILLERCLERK10
*/

--> �������� �� ��ȯ�� �Ͼ�� ������ �����ϰ� �ȴ�.
--  CONCAT()�� ���ڿ��� ���ڿ��� ���ս����ִ� �Լ�������
--  ���������� ���ڳ� ��¥�� ���ڷ� �ٲ��ִ� ������ ���ԵǾ� �ִ�.


/*
Java����.....
obj.substring()
----
���ڿ�.substring(n, m);
                ------     
                n ���� m-1 ����.. (�ε����� 0����)
*/

--�� SUBSTR() ���� ���� ��� / SUBSTRB() ���� ����Ʈ ���
SELECT ENAME "COL1"
     , SUBSTR(ENAME, 1, 2) "COL2" -- ENAME ���� 1��° ���ں��� �� 2���� ���Ͷ�...
FROM EMP;
--> ���ڿ��� �����ϴ� ����� ���� �Լ�
--  ù ��° �Ķ���� ���� ��� ���ڿ�(������ ���, TARGET)
--  �� ��° �Ķ���� ���� ������ �����ϴ� ��ġ(�ε����� 1 ���� ����)
--  �� ��° �Ķ���� ���� ������ ���ڿ��� ����(������ ������..)
/*
SMITH	SM
ALLEN	AL
WARD	WA
JONES	JO
MARTIN	MA
BLAKE	BL
CLARK	CL
SCOTT	SC
KING	KI
TURNER	TU
ADAMS	AD
JAMES	JA
FORD	FO
MILLER	MI
*/


--�� TBL_SAWON ���̺����� ������ ������ �����
--   �����ȣ, �����, �ֹι�ȣ, �޿� �׸��� ��ȸ�Ѵ�.
--   ��, SUBSTR() �Լ��� Ȱ���ؼ� �غ���.
SELECT SANO, SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SUBSTR(JUBUN,7,1) = '1' OR SUBSTR(JUBUN,7,1) = '3'; 
/*
1001	��μ�	9707251234567	3000
1005	���̻�	9805161234567	4000
1007	������	0204053234567	1000
1008	������	6803171234567	1500
1011	������	0506073234567	2600
1012	���ù�	0208073234567	2600
1013	����	6712121234567	2200
*/

SELECT SANO, SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SUBSTR(JUBUN,7,1) IN('1','3'); 
/*
1001	��μ�	9707251234567	3000
1005	���̻�	9805161234567	4000
1007	������	0204053234567	1000
1008	������	6803171234567	1500
1011	������	0506073234567	2600
1012	���ù�	0208073234567	2600
1013	����	6712121234567	2200
*/

--�� LENGTH() ���� �� / LENGTHB() ����Ʈ ��
SELECT ENAME "COL1", LENGTH(ENAME) "COL2", LENGTHB(ENAME) "COL3"
FROM EMP;
/*
SMITH	5	5
ALLEN	5	5
WARD	4	4
JONES	5	5
MARTIN	6	6
BLAKE	5	5
CLARK	5	5
SCOTT	5	5
KING	4	4
TURNER	6	6
ADAMS	5	5
JAMES	5	5
FORD	4	4
MILLER	6	6
*/
SELECT *
FROM NLS_DATABASE_PARAMETERS;
/*
NLS_LANGUAGE	        AMERICAN
NLS_TERRITORY	        AMERICA
NLS_CURRENCY	        $
NLS_ISO_CURRENCY	    AMERICA
NLS_NUMERIC_CHARACTERS	.,
NLS_CHARACTERSET	    AL32UTF8 -----------------------CHECK
NLS_CALENDAR	        GREGORIAN
NLS_DATE_FORMAT	        DD-MON-RR
NLS_DATE_LANGUAGE	    AMERICAN
NLS_SORT	            BINARY
NLS_TIME_FORMAT	        HH.MI.SSXFF AM
NLS_TIMESTAMP_FORMAT	DD-MON-RR HH.MI.SSXFF AM
NLS_TIME_TZ_FORMAT	    HH.MI.SSXFF AM TZR
NLS_TIMESTAMP_TZ_FORMAT	DD-MON-RR HH.MI.SSXFF AM TZR
NLS_DUAL_CURRENCY	    $
NLS_COMP	            BINARY
NLS_LENGTH_SEMANTICS	BYTE
NLS_NCHAR_CONV_EXCP	    FALSE
NLS_NCHAR_CHARACTERSET	AL16UTF16 -----------------------CHECK
NLS_RDBMS_VERSION	    11.2.0.2.0
*/

--�� INSTR()
SELECT 'ORACLE ORAHOME BIORA' "COL1"                       -- 1
    ,  INSTR('ORACLE ORAHOME BIORA', 'ORA', 1, 1) "COL2"   -- 8
    ,  INSTR('ORACLE ORAHOME BIORA', 'ORA', 1, 2) "COL3"   -- 8 
    ,  INSTR('ORACLE ORAHOME BIORA', 'ORA', 2, 1) "COL4"   -- 8
    ,  INSTR('ORACLE ORAHOME BIORA', 'ORA', 2) "COL5"      -- 8
    ,  INSTR('ORACLE ORAHOME BIORA', 'ORA', 2, 3) "COL6"   -- 0 
    ,  INSTR('ORACLE ORAHOME BIORA', 'ORA', -3) "COL7"     -- 18
    ,  INSTR('ORACLE ORAHOME BIORA', 'ORA', -4) "COL8"     -- 8
    ,  INSTR('ORACLE ORAHOME BIORA', 'ORA', -4, 2) "COL9"  -- 1
FROM DUAL;
--> ù ��° �Ķ���� ���� �ش��ϴ� ���ڿ�����... (��� ���ڿ�, TARGET)
--  �� ��° �Ķ���� ���� �ش��ϴ� ���ڿ��� �����ϴ� ��ġ�� ã�ƶ�...
--  �� ��° �Ķ���� ���� ã�� �����ϴ� ��ġ(��ĵ�ϴ� ��ġ)
--  �� ��° �Ķ���� ���� �� ��° �����ϴ� ���� ã�� �������� ���� ����(�ߺ�)
--  ��,COL2�� ORACLE ORAHOME BIORA�� ó������ ��ĵ�ؼ� ù ORA�� ã�� ��ġ�� ����ΰ�!!
--  COL3�� ORACLE ORAHOME BIORA�� ó������ ��ĵ�ؼ� �� ��° ORA�� ã�� ��ġ�� ����ΰ�!! �� 8�� ��ġ...
--  COL4�� 2���� �����ؼ� ù ORA���� R���� �����ϱ� ������ ù ORA�� ��ã�� �׷��� COL3�� ���� 8�� ��ġ.
--  COL5�� 4��° �Ķ���͸� ������ ������ 2���� �����ؼ� ORA�� ã�±��� . COL4�� ���� ����.. �� 8�� ��ġ
--  COL6�� 2���� �����ؼ� �� �ڴ� ORA�� 2�� �ֱ� ������ 3��° ORA�� ���� �� 0 ����...
--  COL7�� �ڿ��� 3��° ���� �������� ��ĵ�ؼ� ù ORA �� ã��  �� 18�� ° 
--  COL8 COL9�� �ڿ��� 4��° ���� �����ؼ� ���� ù ORA �ι�° ORA�� ã��...
--==>> ORACLE ORAHOME BIORA	1	8	8	8	0	18	8	1


SELECT '���ǿ���Ŭ �����ο��� �մϴ�.' "COL1"
    ,  INSTR('���ǿ���Ŭ �����ο��� �մϴ�.' , '����' , 1) "COL2"    
    ,  INSTR('���ǿ���Ŭ �����ο��� �մϴ�.' , '����' , 2) "COL3"   
    ,  INSTR('���ǿ���Ŭ �����ο��� �մϴ�.' , '����' , 10) "COL4"
    ,  INSTR('���ǿ���Ŭ �����ο��� �մϴ�.' , '����' , 11) "COL5"  
FROM DUAL;
--==>> ���ǿ���Ŭ �����ο��� �մϴ�.	3	3	10	0

--�� REVERSE()
SELECT 'ORACLE' "COL1"
    ,  REVERSE('ORACLE') "COL2"
    ,  REVERSE('����Ŭ') "COL3"
FROM DUAL;
/*
ORACLE	ELCARO	???
*/
--> ��� ���ڿ��� �Ųٷ� ��ȯ��. (��, �ѱ��� ����.)


--�� �ǽ� ���̺� ����(TBL_FILES)
CREATE TABLE TBL_FILES
( FILENO    NUMBER(3)
, FILENAME  VARCHAR2(100)
);
--==>> Table TBL_FILES��(��) �����Ǿ����ϴ�.

--�� ������ �Է�(TBL_FILES)
INSERT INTO TBL_FILES VALUES(1, 'C:\AAA\BBB\CCC\SALES.DOC');
INSERT INTO TBL_FILES VALUES(2, 'C:\AAA\PANMAE.XXLS');
INSERT INTO TBL_FILES VALUES(3, 'D:\RESEARCH.PPT');
INSERT INTO TBL_FILES VALUES(4, 'C:\DOCUMENTS\STUDY.HWP');
INSERT INTO TBL_FILES VALUES(5, 'C:\DOCUMENTS\TEMP\SQL.TXT');
INSERT INTO TBL_FILES VALUES(6, 'D:\SHARE\F\TEST.PNG');
INSERT INTO TBL_FILES VALUES(7, 'E:\STUDY\ORACLE.SQL');

--�� Ȯ��
SELECT *
FROM TBL_FILES;
/*
1	C:\AAA\BBB\CCC\SALES.DOC
2	C:\AAA\PANMAE.XXLS
3	D:\RESEARCH.PPT
4	C:\DOCUMENTS\STUDY.HWP
5	C:\DOCUMENTS\TEMP\SQL.TXT
6	D:\SHARE\F\TEST.PNG
7	E:\STUDY\ORACLE.SQL
*/

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

SELECT FILENO "���Ϲ�ȣ", FILENAME "���ϸ�"
FROM TBL_FILES;
/*
1	C:\AAA\BBB\CCC\SALES.DOC
2	C:\AAA\PANMAE.XXLS
3	D:\RESEARCH.PPT
4	C:\DOCUMENTS\STUDY.HWP
5	C:\DOCUMENTS\TEMP\SQL.TXT
6	D:\SHARE\F\TEST.PNG
7	E:\STUDY\ORACLE.SQL
*/

--�� TBL_FILES ���̺���
--   ������ ���� ��ȸ�� �� �ֵ��� �������� �ۼ��� ����
/*
1	SALES.DOC
2	PANMAE.XXLS
3	RESEARCH.PPT
4	STUDY.HWP
5	SQL.TXT
6	TEST.PNG
7	ORACLE.SQL
*/


SELECT FILENO "���Ϲ�ȣ", SUBSTR(FILENAME, INSTR(FILENAME, '\',-1)+1) "���ϸ�"
FROM TBL_FILES;       -- C:\AAA\BBB\CCC\SALES.DOC �� �ڿ����� �����ؼ� \ ã�� �ű���ġ+1(\)���� ©�����.
/*
1	SALES.DOC
2	PANMAE.XXLS
3	RESEARCH.PPT
4	STUDY.HWP
5	SQL.TXT
6	TEST.PNG
7	ORACLE.SQL
*/

SELECT FILENO "���Ϲ�ȣ", REVERSE(SUBSTR(REVERSE(FILENAME), 1, INSTR(REVERSE(FILENAME), '\')-1)) "���ϸ�"
--                        COD.SELAS\CCC\BBB\AAA\:C ���� ó������ ù ������������-1 ���� ¥���� �ٽ� REVERSE
FROM TBL_FILES;
/*
1	SALES.DOC
2	PANMAE.XXLS
3	RESEARCH.PPT
4	STUDY.HWP
5	SQL.TXT
6	TEST.PNG
7	ORACLE.SQL
*/

SELECT LENGTH('C:\AAA\BBB\CCC\SALS.DOC')
FROM DUAL; --���� 24 , ������ '\' ��ġ 15��° 

SELECT INSTR(REVERSE('C:\AAA\BBB\CCC\SALES.DOC'), '\',1)
FROM DUAL; -- �ڿ��� 10 ��°  

-- ������ '\' ��ġ  24 ���� �ڿ��� 10��°
-- 24 - 10  = 14 + 1  = 15 ��° 

-- LENGTH(FILENAME) - REVERSE(FILENAME, '\', 1) + 1  =  ������ '\' ��ġ 

SELECT FILENO "���Ϲ�ȣ", SUBSTR(FILENAME, LENGTH(FILENAME)-INSTR(REVERSE(FILENAME),'\',1)+2) "���ϸ�"
FROM TBL_FILES; 
/*
1	SALES.DOC
2	PANMAE.XXLS
3	RESEARCH.PPT
4	STUDY.HWP
5	SQL.TXT
6	TEST.PNG
7	ORACLE.SQL
*/


--�� LPAD()
--> Byte�� Ȯ���ؼ� ���ʺ��� ���ڷ� ä��� ����� ���� �Լ�
SELECT 'ORACLE' "COL1"
      , LPAD('ORACLE', 10, '*') "COL2"   
FROM DUAL;
--==>> ORACLE	****ORACLE
--> �� 10Byte ������ Ȯ���Ѵ�.                �� �� ��° �Ķ���� ���� ����...
--  �� Ȯ���� ������ 'ORACLE'���ڿ��� ��´�. ��ù ��° �Ķ���� ���� ����...
--  �� �����ִ� Byte ������ �����ʡ����� �� ��° �Ķ���� ������ ä���.
--  �� �̷��� ������ ���� ��� ���� ��ȯ�Ѵ�.


--�� RPAD()
--> Byte�� Ȯ���ؼ� �����ʺ��� ���ڷ� ä��� ����� ���� �Լ�
SELECT 'ORACLE' "COL1"
      , RPAD('ORACLE', 10, '*') "COL2"   
FROM DUAL;
--==>> ORACLE	ORACLE****
--> �� 10Byte ������ Ȯ���Ѵ�.                �� �� ��° �Ķ���� ���� ����...
--  �� Ȯ���� ������ 'ORACLE'���ڿ��� ��´�. ��ù ��° �Ķ���� ���� ����...
--  �� �����ִ� Byte ������ �������ʡ����� �� ��° �Ķ���� ������ ä���.
--  �� �̷��� ������ ���� ��� ���� ��ȯ�Ѵ�.


--�� LTRIM()
SELECT 'ORAORAORACLEROLACLE' "COL1"
    ,  LTRIM('ORAORAORACLEORACLE', 'ORA') "COL2"
    ,  LTRIM('AAAAAAAAAAAAAAAAAORAORAORACLEORACLE', 'ORA') "COL3" -- 'O''A''R' AAAAAAA�� ©�� 'ORA'�̷��� ¥���°� �ƴ�
    ,  LTRIM('ORAoRAORACLEORACLE', 'ORA') "COL4"        -- ��ҹ��� ���� ��!
    ,  LTRIM('ORAORA ORACLEORACLE', 'ORA') "COL5" -- ���鿡�� ����
    ,  LTRIM('        ORACLE' ,' ') "COL6"     -- ������ ¥���� ����
    ,  LTRIM('        ORACLE') "COL7"         -- ������ ¥�� ���� �� ��° �Ķ���� ��ŵ ����
FROM DUAL;
/*
ORAORAORACLEROLACLE	
CLEORACLE	
CLEORACLE	
oRAORACLEORACLE	 
 ORACLEORACLE	
ORACLE	
ORACLE
*/
--> ù ��° �Ķ���� ���� �ش��ϴ� ���ڿ��� �������
--  ���ʺ��� ���������� �����ϴ� �� ��° �Ķ���� ������ ������ ���ڿ�
--  ���� ���ڰ� ������ ��� �̸� ������ �ɰ����� ��ȯ�Ѵ�.
--  ��, ���������� ó������ ����.

SELECT LTRIM('�̱���̱���̱��ŽŽ��̱����̽ű���̹��̱��', '�̱��') "RESULT"
FROM DUAL;
--==>> ���̱��


--�� RTRIM()
--> ù ��° �Ķ���� ���� �ش��ϴ� ���ڿ��� �������
--  �����ʺ��� ���������� �����ϴ� �� ��° �Ķ���� ������ ������ ���ڿ�
--  ���� ���ڰ� ������ ��� �̸� ������ �ɰ����� ��ȯ�Ѵ�.
--  ��, ���������� ó������ ����.

SELECT RTRIM('�̱�Ź��̱���̱��ŽŽ��̱����̽ű�����̱��', '�̱��') "RESULT"
FROM DUAL;
--==>> �̱�Ź�

SELECT RTRIM('�̱�                               ') "RESULT"
FROM DUAL;
--==>> �̱�

--�� TRANSLATE() 
--> 1:1�� �ٲ��ش�!!!
SELECT TRANSLATE('MY ORACLE SERVER'
                , 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
                , 'abcdefghijklmnopqrstuvwxyz' ) "RESULT"
FROM DUAL;
--==>> my oracle server

SELECT TRANSLATE('010-5154-6322'
                , '0123456789'
                , '�����̻�����ĥ�ȱ�') "RESULT" 
FROM DUAL;
--==>> ���Ͽ�-���Ͽ���-��������

--�� REPLACE()
SELECT REPLACE('MY ORACLE SERVER ORAHOME','ORA', '����') "RESULT"
FROM DUAL
--==>> MY ����CLE SERVER ����HOME 