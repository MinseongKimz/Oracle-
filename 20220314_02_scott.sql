SELECT USER
FROM DUAL;
--==>> SCOTT

SELECT *
FROM TBL_��ǰ;
/*
H001	�ٹ��	 600	30
H002	�ҽ���	 500	20
H003	�޷γ�	 500	30
H004	������	 600	70
H005	�ֹֽ�	 600	0
H006	���ڹ�	 500	0
H007	������	 500	0
C001	������	1600	50
C002	������	1700	10
C003	������	1800	0
C004	��Ÿ��	1500	0
C005	�ζ�	1500	0
C006	������	1500	0
E001	���Ǿ�	1100	0
E002	������	1700	0
E003	���Դ�	2500	0
E004	�źϾ�	1500	0
E005	�Ϻ���	1500	0
*/

--�� Ȯ��
SELECT *
FROM TBL_���;
/*
1	H001	2022-03-11	20	 600
2	H002	2022-03-11	 5	 500
3	H003	2022-03-11	 5	 500
4	H004	2022-03-11	 5	 600
5	C001	2022-03-11	10	1600
6	C002	2022-03-11	10	1600
*/

--�� ������ ���ν����� ����� �۵��ϴ����� ���� Ȯ�� �� ���ν��� ȣ��
EXEC PRC_���_UPDATE(6, 20);
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.

--�� ���ν��� ȣ�� �� �ٽ� ���̺� Ȯ��
SELECT *
FROM TBL_���;
/*
1	H001	2022-03-11	20	 600
2	H002	2022-03-11	 5	 500
3	H003	2022-03-11	 5	 500
4	H004	2022-03-11	 5	 600
5	C001	2022-03-11	10	1600
6	C002	2022-03-11	20	1600    �� ������ ����� �ٲ��~
*/

SELECT *
FROM TBL_��ǰ;
/*
H001	�ٹ��	 600	30
H002	�ҽ���	 500	20
H003	�޷γ�	 500	30
H004	������	 600	70
H005	�ֹֽ�	 600	0
H006	���ڹ�	 500	0
H007	������	 500	0
C001	������	1600	50
C002	������	1700	0   �� ������ ����� �� �پ�����..
C003	������	1800	0
C004	��Ÿ��	1500	0
C005	�ζ�	1500	0
C006	������	1500	0
E001	���Ǿ�	1100	0
E002	������	1700	0
E003	���Դ�	2500	0
E004	�źϾ�	1500	0
E005	�Ϻ���	1500	0
*/

--�� ������ (C001)�� 70������� �ٲ㺸��..
EXEC PRC_���_UPDATE(5, 70);
--==>> �����߻�
--     (ORA-20003: �������)
SELECT *
FROM TBL_��ǰ;
--==>> C001	������	1600	50   �� ������� �ʾҴ�~
SELECT *
FROM TBL_���;
/*
1	H001	2022-03-11	20	 600
2	H002	2022-03-11	 5	 500
3	H003	2022-03-11	 5	 500
4	H004	2022-03-11	 5	 600
5	C001	2022-03-11	10	1600 �� ������� �ʾҴ�~
6	C002	2022-03-11	20	1600
*/


/*
1	H001	2022-03-11	30	400
2	H001	2022-03-11	20	500
3	H002	2022-03-11	25	450
4	H003	2022-03-11	35	450
5	H004	2022-03-11	75	520
6	C001	2022-03-11	20	1500
7	C001	2022-03-11	20	1500
8	C001	2022-03-11	20	1500
9	C002	2022-03-11	10	1500
10	C002	2022-03-11	10	1500
���� �԰� �� ��  H001 �ٲܲ��� 20���� 
H001	�ٹ��	 600	30
*/
SELECT *
FROM TBL_�԰�;


-- 1. PRC_�԰�_UPDATE(�԰���ȣ, �԰�����) ����� Ȯ��
EXEC PRC_�԰�_UPDATE(1, 20);
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.

SELECT *
FROM TBL_�԰�;
--==>> 1	H001	2022-03-11	20	400
SELECT *
FROM TBL_��ǰ;
--==>> 1	H001	2022-03-11	20	400 �߹ٲ���.. (H001�� 20�� ����ѻ���)


SELECT *
FROM TBL_�԰�;

SELECT *
FROM TBL_��ǰ;

-- ���� ������ H004 �԰���ȣ 5�� 75�� �԰� �߰�
-- ����� 5�� �� ���� ����� 70��
-- ���� �� �԰��� 1���� �ٲٸ� - 4 ���� �Ǽ� ������..

EXEC PRC_�԰�_UPDATE(5, 1);
--==>> ORA-20004: �԰� ���� ���� �Ұ���!

EXEC PRC_�԰�_UPDATE(2, 30);

SELECT *
FROM TBL_�԰�;
--==>> 2	H001	2022-03-11	30	500

SELECT *
FROM TBL_��ǰ;
--==>> H001	�ٹ��	600	10






-- 2. PRC_�԰�_DELETE(�԰���ȣ) ����� Ȯ��
--    1�� �����غ�... �׷��� ���� �ٹ�ٴ� 0���� �Ǿ� ����
EXEC PRC_�԰�_DELETE(1);
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.

SELECT *
FROM TBL_�԰�;
/*
2	H001	2022-03-11	20	500  �� 1�� �����
3	H002	2022-03-11	25	450
4	H003	2022-03-11	35	450
5	H004	2022-03-11	75	520
6	C001	2022-03-11	20	1500
7	C001	2022-03-11	20	1500
8	C001	2022-03-11	20	1500
9	C002	2022-03-11	10	1500
10	C002	2022-03-11	10	1500
*/

SELECT *
FROM TBL_��ǰ;
--==>> H001	�ٹ��	600	0 << 0 ���� �ٲ�./.
-- �߰��� ���� C002 �������� ��ǰ���� 0����. 
-- �� ���¿��� �԰���ȣ 10���� �����ϸ�? �� ERROR..
EXEC PRC_�԰�_DELETE(10);
--==>> �����߻�
--     (ORA-20005: ������ �԰������� ���� ����� �۽��ϴ�.)



--��  Procedure PRC_���_DELETE �׽�Ʈ
SELECT *
FROM TBL_���;
/*
1	H001	2022-03-11	20	600
2	H002	2022-03-11	5	500
3	H003	2022-03-11	5	500
4	H004	2022-03-11	5	600
5	C001	2022-03-11	10	1600
6	C002	2022-03-11	20	1600
*/

-- ���� ������ �� 0�� ����
-- 6�� COO2�� ���������� �� ����� ������(C002)�� 20���� �Ǿ����;
EXEC PRC_���_DELETE(6);
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
SELECT *
FROM TBL_���;
/*
1	H001	2022-03-11	20	600
2	H002	2022-03-11	5	500
3	H003	2022-03-11	5	500
4	H004	2022-03-11	5	600
5	C001	2022-03-11	10	1600
*/

SELECT *
FROM TBL_��ǰ;
--==>> C002	������	1700	20 �� �þ �ִ�..


--���� AFTER STATEMENT TRIGGER ��Ȳ �ǽ� ����
--�� DML �۾��� ���� �̺�Ʈ ���

--�� �ǽ��� ���� �غ� �� �ǽ� ���̺� ����
CREATE TABLE TBL_TEST1
( ID    NUMBER
, NAME  VARCHAR2(30)
, TEL   VARCHAR2(60)
, CONSTRAINT TEST1_ID_PK PRIMARY KEY(ID) 
);
--==>> Table TBL_TEST1��(��) �����Ǿ����ϴ�.

--�� �ǽ��� ���� �غ� �� ���̺� ����
CREATE TABLE TBL_EVENTLOG
( MEMO VARCHAR2(200)
, ILJA DATE DEFAULT SYSDATE
);
--==>> Table TBL_EVENTLOG��(��) �����Ǿ����ϴ�.

--�� Ȯ��
SELECT *
FROM TBL_TEST1;
--==>> ��ȸ��� ����

SELECT *
FROM TBL_EVENTLOG;
--==>> ��ȸ��� ����


--�� ������ TRIGGER �۵� ���� Ȯ��
-- �� TBL_TEST1 ���̺��� ������� INSERT, UPDATE, DELETE ����

INSERT INTO TBL_TEST1(ID, NAME, TEL)
VALUES(1, 'ȫ����', '010-1111-1111');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_TEST1(ID, NAME, TEL)
VALUES(2, '��ȣ��', '010-2222-2222');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_TEST1(ID, NAME, TEL)
VALUES(3, '�Ӽҹ�', '010-3333-3333');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


UPDATE TBL_TEST1
SET NAME = '�Ӵ��'
WHERE ID = 3;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.

UPDATE TBL_TEST1
SET NAME = '���߹�'
WHERE ID = 3;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.

DELETE
FROM TBL_TEST1
WHERE ID = 1;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

DELETE
FROM TBL_TEST1
WHERE ID = 2;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

DELETE
FROM TBL_TEST1
WHERE ID = 3;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

COMMIT;
--==>> Ŀ�� �Ϸ�.


--�� Ȯ��
SELECT *
FROM TBL_TEST1;
--==>> ��ȸ��� ����.

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';

SELECT *
FROM TBL_EVENTLOG;


--���� BEFORE STATMENT TRIGGER ��Ȳ �ǽ� ����--
-- �� DML �۾� ���� ���� �۾��� ���� ���� ���� Ȯ��

INSERT INTO TBL_TEST1(ID, NAME, TEL)
VALUES(4, '������', '010-4444-4444');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


INSERT INTO TBL_TEST1(ID, NAME, TEL)
VALUES(5, '�ּ���', '010-5555-5555');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_TEST1(ID, NAME, TEL)
VALUES(6, '������', '010-6666-6666');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

UPDATE TBL_TEST1
SET NAME ='������'
WHERE ID = 6;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.

DELETE
FROM TBL_TEST1
WHERE ID= 5;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

------------[����Ŭ ������ �ý��� �ð� ����(16�� �� 19�� )]---------------------


INSERT INTO TBL_TEST1(ID, NAME, TEL)
VALUES(7, '�̿���', '010-7777-7777');
--==>> ���� �߻�
--     (ORA-20003: �۾��� 09:00 ~ 18:00 ������ �����մϴ�.)


UPDATE TBL_TEST1
SET NAME = '������'
WHERE ID = 6;
--==>> ���� �߻�
--     (ORA-20003: �۾��� 09:00 ~ 18:00 ������ �����մϴ�.)

DELETE
FROM TBL_TEST1
WHERE ID =4;
--==>> ���� �߻�
--     (ORA-20003: �۾��� 09:00 ~ 18:00 ������ �����մϴ�

--���� BEFORE ROW TRIGGER ��Ȳ �ǽ� ����
--�� ���� ���谡 ������ ������(�ڽ�) ������ ���� �����ϴ� ��

--�� �ǽ� ȯ�� ������ ���� ���̺� ���� �� TBL_TEST2
CREATE TABLE TBL_TEST2
( CODE NUMBER
, NAME VARCHAR2(40)
, CONSTRAINT TEST2_CODE_PK PRIMARY KEY(CODE)
);
--==>> Table TBL_TEST2��(��) �����Ǿ����ϴ�.

--�� �ǽ� ȯ�� ������ ���� ���̺� ���� �� TBL_TEST3
CREATE TABLE TBL_TEST3
( SID   NUMBER
, CODE  NUMBER
, SU    NUMBER
, CONSTRAINT TEST3_SID_PK PRIMARY KEY(SID)
, CONSTRAINT TEST3_CODE_FK FOREIGN KEY(CODE)
             REFERENCES TBL_TEST2(CODE)
);
--==>> Table TBL_TEST3��(��) �����Ǿ����ϴ�.

--�� �ǽ� ���� ������ �Է� TEST_2
INSERT INTO TBL_TEST2(CODE, NAME) VALUES(1, '�ڷ�����');
INSERT INTO TBL_TEST2(CODE, NAME) VALUES(2, '�����');
INSERT INTO TBL_TEST2(CODE, NAME) VALUES(3, '��Ź��');
INSERT INTO TBL_TEST2(CODE, NAME) VALUES(4, '������');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 4

SELECT *
FROM TBL_TEST2;
/*
1	�ڷ�����
2	�����
3	��Ź��
4	������
*/
COMMIT;
--==>> Ŀ�� �Ϸ�.

--�� �ǽ� ���� ������ �Է� TEST_3
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(1, 1, 30);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(2, 1, 50);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(3, 1, 60);

INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(4, 1, 30);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(5, 2, 20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(6, 3, 30);

INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(7, 2, 30);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(8, 2, 20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(9, 2, 30);

INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(10, 3, 30);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(11, 3, 20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(12, 3, 30);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 12

SELECT *
FROM TBL_TEST3;
/*
1	1	30
2	1	50
3	1	60
4	1	30
5	2	20
6	3	30
7	2	30
8	2	20
9	2	30
10	3	30
11	3	20
12	3	30
*/

COMMIT;
--==>> Ŀ�� �Ϸ�.


--�� �θ����̺�(TBL_TEST2)�� ������ ���� �õ�
DELETE
FROM TBL_TEST2
WHERE CODE =1;
--==>> ���� �߻�
--     (ORA-02292: integrity constraint (SCOTT.TEST3_CODE_FK) violated - child record found)

DELETE
FROM TBL_TEST2
WHERE CODE =2;
--==>> ���� �߻�
--     (ORA-02292: integrity constraint (SCOTT.TEST3_CODE_FK) violated - child record found)

DELETE
FROM TBL_TEST2
WHERE CODE =3;
--==>> ���� �߻�
--     (ORA-02292: integrity constraint (SCOTT.TEST3_CODE_FK) violated - child record found)

DELETE
FROM TBL_TEST2
WHERE CODE =4;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.


--�� TRIGGER(Ʈ����) ���� ���� �ǽ�

SELECT *
FROM TBL_TEST2;
--==>> 
/*
1	�ڷ�����
2	�����
3	��Ź��
*/

SELECT  *
FROM TBL_TEST3;
/*
1	1	30
2	1	50
3	1	60
4	1	30
5	2	20  �� ����� 
6	3	30
7	2	30  �� ����� 
8	2	20  �� ����� 
9	2	30  �� ����� 
10	3	30
11	3	20
12	3	30
*/

DELETE
FROM TBL_TEST2
WHERE CODE = 2;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

SELECT *
FROM TBL_TEST2; -- ������ ������ �ȵ�����(TEST3������) TRIGGER �����ؼ� 
/*              -- ������ �� �ְ� ������� (TEST3���� ���� ��Ŵ.)
1	�ڷ�����
3	��Ź��
*/
SELECT  *
FROM TBL_TEST3; -- ������� �θ�� ���� �÷����� �� �����Ǿ���..
/*
1	1	30
2	1	50
3	1	60
4	1	30
6	3	30
10	3	30
11	3	20
12	3	30
*/

--------------------------------------------------------------------------------

--���� AFTER ROW TRIGGER ��Ȳ �ǽ� ����--
--�� ���� ���̺� ���� Ʈ����� ó��

UPDATE TBL_��ǰ
SET ������� = 0;
--==>>  18�� �� ��(��) ������Ʈ�Ǿ����ϴ�.

TRUNCATE TABLE TBL_�԰�;
--==>> Table TBL_�԰���(��) �߷Ƚ��ϴ�.

TRUNCATE TABLE TBL_���;
--==>> Table TBL_�����(��) �߷Ƚ��ϴ�.

SELECT *
FROM TBL_��ǰ;
/*
H001	�ٹ��	 600	0
H002	�ҽ���	 500	0
H003	�޷γ�	 500	0
H004	������	 600	0
H005	�ֹֽ�	 600	0
H006	���ڹ�	 500	0
H007	������	 500	0
C001	������	1600	0
C002	������	1700	0
C003	������	1800	0
C004	��Ÿ��	1500	0
C005	�ζ�	1500	0
C006	������	1500	0
E001	���Ǿ�	1100	0
E002	������	1700	0
E003	���Դ�	2500	0
E004	�źϾ�	1500	0
E005	�Ϻ���	1500	0
*/

SELECT *
FROM TBL_���;
--==>> ��ȸ��� ����

SELECT *
FROM TBL_�԰�;
--==>> ��ȸ��� ����

--�� Ʈ����(TRG_IBGO) ���� ���� �ǽ� �׽�Ʈ
INSERT INTO TBL_�԰�(�԰���ȣ, ��ǰ�ڵ�, �԰�����, �԰�����, �԰��ܰ�)
VALUES(1, 'H001', SYSDATE, 40, 1000);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_�԰�(�԰���ȣ, ��ǰ�ڵ�, �԰�����, �԰�����, �԰��ܰ�)
VALUES(2, 'H001', SYSDATE, 60, 1000);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_�԰�(�԰���ȣ, ��ǰ�ڵ�, �԰�����, �԰�����, �԰��ܰ�)
VALUES(3, 'H002', SYSDATE, 50, 1000);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.




SELECT *
FROM TBL_�԰�;
/*
1	H001	2022-03-14 17:41:17	40	1000
2	H001	2022-03-14 17:41:48	60	1000
3	H002	2022-03-14 17:42:06	50	1000
*/

SELECT *
FROM TBL_��ǰ;
/*
H001	�ٹ��	 600	100
H002	�ҽ���	 500	50
H003	�޷γ�	 500	0
H004	������	 600	0
H005	�ֹֽ�	 600	0
H006	���ڹ�	 500	0
H007	������	 500	0
C001	������	1600	0
C002	������	1700	0
C003	������	1800	0
C004	��Ÿ��	1500	0
C005	�ζ�	1500	0
C006	������	1500	0
E001	���Ǿ�	1100	0
E002	������	1700	0
E003	���Դ�	2500	0
E004	�źϾ�	1500	0
E005	�Ϻ���	1500	0
*/
























