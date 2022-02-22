SELECT USER
FROM DUAL;
--==>> SCOTT


--�� ROUND() �ݿø��� ó���� �ִ� �Լ�
SELECT 48.678 "COL1"                                                            -- 48.678
     , ROUND(48.678, 2) "COL2"  -- �Ҽ��� ���� 2��° �ڸ����� ǥ��              -- 48.68
     , ROUND(48.674, 2) "COL3"  -- �Ҽ��� ���� 2��° �ڸ����� ǥ��              -- 48.67
     , ROUND(48.674, 1) "COL4"  -- �Ҽ��� ���� 1��° �ڸ����� ǥ��              -- 48.7
     , ROUND(48.674, 0) "COL5"  -- �Ҽ��� ���� 0��° �ڸ����� ǥ��              -- 49
     , ROUND(48.674) "COL6"     -- �Ҽ��� ���� 0��° �ڸ����� ǥ��              -- 49
     , ROUND(48.674, -1) "COL7" -- 10�� �ڸ������� ǥ��(1�� �ڸ����� �ݿø�)    -- 50
     , ROUND(48.674, -2) "COL8" -- 100���ڸ� ������ ǥ��(10�� �ڸ����� �ݿø�)  -- 0
     , ROUND(48.674, -3) "COL9" -- 1000���ڸ� ������ ǥ��(100�� �ڸ����� �ݿø�)-- 0
FROM DUAL;


--�� TRUNC() ������ ó���� �ִ� �Լ� (�ݿø� X)
SELECT 48.678 "COL1"                                                            -- 48.678
     , TRUNC(48.678, 2) "COL2"  -- �Ҽ��� ���� 2��° �ڸ����� ǥ��              -- 48.67
     , TRUNC(48.674, 2) "COL3"  -- �Ҽ��� ���� 2��° �ڸ����� ǥ��              -- 48.67
     , TRUNC(48.674, 1) "COL4"  -- �Ҽ��� ���� 1��° �ڸ����� ǥ��              -- 48.6
     , TRUNC(48.674, 0) "COL5"  -- �Ҽ��� ���� 0��° �ڸ����� ǥ��              -- 48
     , TRUNC(48.674) "COL6"     -- �Ҽ��� ���� 0��° �ڸ����� ǥ��              -- 48
     , TRUNC(48.674, -1) "COL7" -- 10�� �ڸ������� ǥ��(1�� �ڸ����� �ݿø�)    -- 40
     , TRUNC(48.674, -2) "COL8" -- 100���ڸ� ������ ǥ��(10�� �ڸ����� �ݿø�)  -- 0
     , TRUNC(48.674, -3) "COL9" -- 1000���ڸ� ������ ǥ��(100�� �ڸ����� �ݿø�)-- 0
FROM DUAL;


--�� MOD() �������� ��ȯ�ϴ� �Լ�
SELECT MOD(5, 2) "RESULT"
FROM DUAL;
--==>> 1
-- 5�� 2�� ���� ������ ����� ��ȯ

--�� POWER() ������ ����� ��ȯ�ϴ� �Լ�
SELECT POWER(5,3)
FROM DUAL;
--==>> 125
-- 5^3 =125

--�� SQRT() ��Ʈ ������� ��ȯ�ϴ� �Լ�
SELECT SQRT(2)
FROM DUAL;
--==>> 1.41421356237309504880168872420969807857 
-- ��Ʈ 2�� ���� ��

--�� LOG() �α� �Լ�
--  (����Ŭ�� ���α׸� �����ϰ�, MSSQL�� ���α� �ڿ��α� ��� �����Ѵ�.)
SELECT LOG(10, 100) "COL1"
    ,  LOG(10, 20) "COL2"
FROM DUAL;
--==>> 2	1.30102999566398119521373889472449302677

--�� �ﰢ�Լ�
SELECT SIN(1), COS(1), TAN(1)
FROM DUAL;
-- 0.8414709848078965066525023216302989996233
-- 0.5403023058681397174009366074429766037354
-- 1.55740772465490223050697480745836017308
-- ���� ������ ���� �ڻ��� ź��Ʈ 1�� ��� ��

--�� �ﰢ�Լ��� ���Լ�
SELECT ASIN(0.5), ACOS(0.5), ATAN(0.5)
FROM DUAL;
-- 0.52359877559829887307710723054658381405
-- 1.04719755119659774615421446109316762805
-- 0.4636476090008061162142562314612144020295
-- ���� ������ ��ũ����, ��ũ�ڻ���, ��ũź��Ʈ 0.5�� ��� ��.

--�� SIGN() ���� ��ȣ Ư¡....
--> ������ ���� ����̸�1, 0�̸� 0, �����̸� -1�� ��ȯ..
SELECT SIGN(5-2) "COL1", SIGN(5-5) "COL2", SIGN(4-5) "COL3"
FROM DUAL;
--==>> 1	0	-1
--> �����̳� ������ �����Ͽ� ���� �� ������ ������ ��Ÿ�� �� ���ȴ�.

--�� ASCII(), CHR() �� ���� ����(����) �ϴ� �Լ�
SELECT �� "COL1"
     , CHR(65)   "COL2"
FROM DUAL;
--==>> 65	A
--> ��ASCII()�� : �Ű������� �Ѱܹ��� ������ �ƽ�Ű�ڵ� ���� ��ȯ.        ASCII('A') �� 65
--  ��CHR()��   : �Ű������� �Ѱܹ��� �ƽ�Ű�ڵ� ������ �ش� ���ڸ� ��ȯ. CHR(65)    ��  A

--------------------------------------------------------------------------------

--�� ��¥ ���� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>>Session��(��) ����Ǿ����ϴ�.

SELECT SYSDATE "COL1"
FROM DUAL;
--==>> 2022-02-22 09:39:42

--�� ��¥ ������ �⺻ ������ DAY(�ϼ�)�̴�!!!
SELECT SYSDATE "COL1"      -- 2022-02-22 09:44:16
     , SYSDATE + 1 "COL2"  -- 2022-02-23 09:44:16  �� �Ϸ� ��
     , SYSDATE - 2 "COL3"  -- 2022-02-20 09:44:16  �� ��Ʋ ��
     , SYSDATE - 30 "COL4" -- 2022-01-23 09:44:16  �� 30�� ��
FROM DUAL;


--�� �ð� ���� ����
SELECT SYSDATE "COL1"        -- 2022-02-22 09:46:46  
     , SYSDATE + 1/24 "COL2" -- 2022-02-22 10:46:46 �� �ѽð� ��
     , SYSDATE - 2/24 "COL3" -- 2022-02-22 07:46:46 �� �νð� ��
FROM DUAL;

--�� ���� �ð���.. ���� �ð� ���� 1�� 2�ð� 3�� 4�� �ĸ� ��ȸ�ϴ� �������� ���غ���.
/*
  ���� �ð�             ���� �� �ð�  
-------------------  -------------------
2022-02-22 10:03:35  2022-02-23 12:05:39
-------------------  -------------------
*/
-- ��� 1. 
SELECT SYSDATE "���� �ð�"
     , SYSDATE + 1 + 2/24 + 3/(24*60) + 4/(24*60*60) "���� �� �ð�"  
FROM DUAL;
--==>> 2022-02-22 10:06:42	2022-02-23 12:09:46

-- ��� 2. ��� �ʷ� ó��
SELECT SYSDATE "���� �ð�"
     , SYSDATE + ((1*24*60*60)+ (2*60*60)+ (3*60) +4)/(24*60*60)
FROM DUAL;
--==>> 2022-02-22 10:19:49	2022-02-23 12:22:53


--�� ��¥ - ��¥ = �ϼ�
SELECT TO_DATE('2022-06-20', 'YYYY-MM-DD') - TO_DATE('2022-02-22', 'YYYY-MM-DD') "RESULT"
FROM DUAL;
--==>> 118

--�� ������ Ÿ���� ��ȯ
SELECT TO_DATE('2022-06-20', 'YYYY-MM-DD') "RESULT"
FROM DUAL;  --==>> 2022-06-20 00:00:00 (�Ʊ� ������ �ú��� ���� �ٲ�)

SELECT TO_DATE('2022-06-35', 'YYYY-MM-DD') "RESULT"  -- �� �������� �ʴ� ��¥ �Է��غ���
FROM DUAL;
--==>> �����߻�   
-- (ORA-01847: day of month must be between 1 and last day of month)

SELECT TO_DATE('2022-02-29', 'YYYY-MM-DD') "RESULT"  -- �� 2022-2���� 28�ϱ��� ����..
FROM DUAL;
--==>> �����߻�
-- (ORA-01839: date not valid for month specified)


SELECT TO_DATE('2022-13-29', 'YYYY-MM-DD') "RESULT"  -- �� �������� �ʴ� �� �Է�
FROM DUAL;
--==>> �����߻�
-- (ORA-01843: not a valid month)

--�� TO_DATE() �Լ��� ���� ���� Ÿ���� ��¥ Ÿ������ ��ȯ�� �����ϴ� �������� 
--   ���������� �ش� ��¥�� ���� ��ȿ�� �˻簡 �̷������.

--�� ADD_MONTHS() ���� ���� �����ִ� �Լ�
SELECT SYSDATE "COL1"                
     , ADD_MONTHS(SYSDATE, 2) "COL2"
     , ADD_MONTHS(SYSDATE, 3) "COL3"
     , ADD_MONTHS(SYSDATE, -2) "COL4"
     , ADD_MONTHS(SYSDATE, -3) "COL5"
FROM DUAL;
/* 
2022-02-22 10:30:04 �� ����
2022-04-22 10:30:04 �� 2���� ��
2022-05-22 10:30:04 �� 3���� ��
2021-12-22 10:30:04 �� 2���� ��
2021-11-22 10:30:04 �� 3���� ��
*/
-- ���� ���ϰ� �� �� �ִ�..

--�� MONTHS_BETWEEN()
-- ù ��° ���� ������ �ι�° ���� ���� �� �������� ��ȯ�Ѵ�.
SELECT MONTHS_BETWEEN(SYSDATE,TO_DATE('2002-05-31','YYYY-MM-DD')) "RESULT" --���� ��¥���� 2002�� ������ ���ֳ� ���� �����  
FROM DUAL;                                                                 --��������? 
--==>> 236.723869100955794504181600955794504182 ������.. 

--> ���� ���� ���̸� ��ȯ�ϴ� �Լ�
--  ��� ���� ��ȣ�� ��-���� ��ȯ�Ǿ��� ���
--  ù ��° ���ڰ��� �ش��ϴ� ��¥ ����
--  �� ��° ���ڰ��� �ش��ϴ� ��¥�� ���̷������ �ǹ̷� �� �� �ִ�.


--�� NEXT_DAY()
SELECT NEXT_DAY(SYSDATE, '��') "COL1" -- ���ñ������� ���� ����� ������� ������?
     , NEXT_DAY(SYSDATE, '��') "COL2" -- ���ñ������� ���� ����� �������� ������? 
FROM DUAL;
--==>> 2022-02-26 10:38:35
--     2022-02-28 10:38:35


--�� ���� ���� ����
ALTER SESSION SET NLS_DATE_LANGUAGE = 'ENGLISH';
--==>> Session��(��) ����Ǿ����ϴ�.


SELECT NEXT_DAY(SYSDATE, '��') "COL1" -- ���ñ������� ���� ����� ������� ������?
     , NEXT_DAY(SYSDATE, '��') "COL2" -- ���ñ������� ���� ����� �������� ������? 
FROM DUAL;
--==>> �����߻�
-- (ORA-01846: not a valid day of the week)


SELECT NEXT_DAY(SYSDATE, 'SAT') "COL1" -- ���ñ������� ���� ����� ������� ������?
     , NEXT_DAY(SYSDATE, 'MON') "COL2" -- ���ñ������� ���� ����� �������� ������? 
FROM DUAL;
--==>> 2022-02-26 10:40:46
--     2022-02-28 10:40:46

--�� ���� ���� ����
ALTER SESSION SET NLS_DATE_LANGUAGE = 'KOREAN';
--==>> Session��(��) ����Ǿ����ϴ�.

SELECT NEXT_DAY(SYSDATE, 'SAT') "COL1" -- ���ñ������� ���� ����� ������� ������?
     , NEXT_DAY(SYSDATE, 'MON') "COL2" -- ���ñ������� ���� ����� �������� ������? 
FROM DUAL;
--==>> �����߻�
-- (ORA-01846: not a valid day of the week)


SELECT NEXT_DAY(SYSDATE, '��') "COL1" -- ���ñ������� ���� ����� ������� ������?
     , NEXT_DAY(SYSDATE, '��') "COL2" -- ���ñ������� ���� ����� �������� ������? 
FROM DUAL;
--==>> 2022-02-26 10:42:15
--	   2022-02-28 10:42:15


--�� LAST_DAY()
--> �ش� ��¥�� ���ԵǾ� �ִ� �� ���� ������ ���� ��ȯ�Ѵ�.

SELECT LAST_DAY(SYSDATE) "COL1"
     , LAST_DAY(TO_DATE('2020-02-10','YYYY-MM-DD')) "COL2" 
     , LAST_DAY(TO_DATE('2019-02-10','YYYY-MM-DD')) "COL3" 
FROM DUAL;
/*
2022-02-28 10:44:58	
2020-02-29 00:00:00	
2019-02-28 00:00:00
*/

--�� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.

--�� ���� �η�.. ��Ⱑ ���뿡 �ٽ� ���� ����.. 
--   �����Ⱓ�� 22������ �Ѵ�.

-- 1. ���� ���ڸ� ���Ѵ�.

-- 2. �Ϸ� ���ڲ��� 3�� �Ļ縦 �Ѵٰ� �����Ѵٸ�
--    ��Ⱑ �� ���� �Ծ�� ���� �����ٱ�?

SELECT SYSDATE "���� ��¥ " 
     , ADD_MONTHS(SYSDATE, 22) "��������" 
     , 3*TRUNC(ADD_MONTHS(SYSDATE, 22)-SYSDATE) "�?"
FROM DUAL;
--==>> 2022-02-22	2023-12-22	2004

--�� ���� ��¥ �� �ð����� ����...
--   ������(2022-06-20 18:00:00) ����
--   ���� �Ⱓ�� .. ������ ���� ���·� ��ȸ�� �� �ֵ��� ������ ����

/*
----------------------------------------------------------------------
����ð�              | ������               | ��    | �ð� | ��| ��
-----------------------------------------------------------------------
2022-02-22 11:34:35   | 2022-06-20 18:00:00  | 117   | 7    | 15| 15
*/


ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session��(��) ����Ǿ����ϴ�.


SELECT SYSDATE "���� �ð�"
     , TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS') "������"
     , TRUNC(TRUNC(TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE))     "��"
     
----------------------------------------------------------------------------------------    

     , TRUNC(((TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS')
       - SYSDATE)-TRUNC(TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS')
       - SYSDATE))*24) "�ð�"
----------------------------------------------------------------------------------------    

     , TRUNC(((((TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS')
       - SYSDATE)-TRUNC(TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS')
       - SYSDATE))*24) - 
       (TRUNC(((TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS')
       - SYSDATE)-TRUNC(TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS')
       - SYSDATE))*24)))*60) "��"
-----------------------------------------------------------------------------------------

      , ROUND(((((((TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS')
       - SYSDATE)-TRUNC(TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS')
       - SYSDATE))*24) - 
       (TRUNC(((TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS')
       - SYSDATE)-TRUNC(TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS')
       - SYSDATE))*24)))*60)-
       TRUNC(((((TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS')
       - SYSDATE)-TRUNC(TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS')
       - SYSDATE))*24) - 
       (TRUNC(((TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS')
       - SYSDATE)-TRUNC(TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS')
       - SYSDATE))*24)))*60))*60) "��"
    
FROM DUAL;     
--------------------------------------------------------------------------------------------------

--��1�� 2�ð� 3�� 4�ʡ��� ���ʡ� �� ȯ���ϸ�....
SELECT (1*24*60*60) + (2*60*60) + (3*60) + 4
FROM DUAL;
--==>> 93784

--��93784�ʡ���... �ٽ� ���� �ð� �� �ʡ��� ȯ���ϸ�...?
SELECT TRUNC(TRUNC(TRUNC(93784/60)/60)/24) "��"
     , MOD(TRUNC(TRUNC(93784/60)/60),24) "��"
     , MOD(TRUNC(93784/60),60) "��"
     , MOD(93784, 60) "��"
FROM DUAL;  
--1��	2�ð�	3��	4��

-------------------------------------------------------------------------------
-- ������ ���� ���� �Ⱓ Ȯ��(���� : �ϼ�)
SELECT TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE
FROM DUAL;
--118.132893518518518518518518518518518519 �� ����

-- ������ ���� ���� �Ⱓ Ȯ��(���� : ��)

SELECT (TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE)*(24*60*60)
FROM DUAL;
--==>> 10205685.00000000000000000000000000000003

SELECT TRUNC(TRUNC(TRUNC((TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE)*(24*60*60)/60)/60)/24) "��"
     , MOD(TRUNC(TRUNC((TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE)*(24*60*60)/60)/60),24) "��"
     , MOD(TRUNC((TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE)*(24*60*60)/60),60) "��"
     , TRUNC(MOD((TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE)*(24*60*60), 60)) "��"
FROM DUAL;  
-- 118��	2�ð�	53��	13��




--�� ���� �¾ ��¥ �� �ð����κ���... �������
--   �󸶸�ŭ�� �ð��� ��� �ִ���...
--   ������ ���� ���·� ��ȸ�� �� �ֵ��� �������� �ۼ��Ѵ�.

/*
----------------------------------------------------------------------
����ð�              | �������               | ��    | �ð� | ��| ��
-----------------------------------------------------------------------
2022-02-22 15:12:35   | 1997-07-25 15:00:00    | 117   | 7    | 15| 15
*/


-- 1�� 1�ð� 1�� 1�� �� �ʷ� �ٲ���
SELECT (1*24*60*60) + (1*60*60) + (1*60) +1

FROM DUAL;
--==>> 90061

-- 90061�� �ٽ� 1�� 1�ð� 1�� 1�� �� �ٲ���

SELECT TRUNC(TRUNC(TRUNC(90061/60)/60)/24) "��" -- 1��
     , MOD(TRUNC(TRUNC(90061/60)/60), 24) "��"-- 1�� 
     , MOD(TRUNC((90061/60)),60) "��" -- 1��
     , MOD(90061,60) "��"-- 1��
FROM DUAL;

--���� ���ݱ��� ���� �� ���
SELECT  SYSDATE - TO_DATE('1997-07-25 15:00:00', 'YYYY-MM-DD HH24:MI:SS') 
FROM DUAL;
--==>> 8978.016342592592592592592592592592592593 �� �����

-- ���� �ʷ� �ٲٱ�
SELECT  (SYSDATE - TO_DATE('1997-07-25 15:00:00', 'YYYY-MM-DD HH24:MI:SS'))*(24*60*60) "��"
FROM DUAL;
--==>> 775700605 (��� �þ����)


SELECT SYSDATE "���� �ð�"
     , TO_DATE('1997-07-25 15:00:00', 'YYYY-MM-DD HH24:MI:SS') "���� ����" 
     , TRUNC(TRUNC(TRUNC((SYSDATE - TO_DATE('1997-07-25 15:00:00', 'YYYY-MM-DD HH24:MI:SS'))*(24*60*60)/60)/60)/24) "��"
     , MOD(TRUNC(TRUNC((SYSDATE - TO_DATE('1997-07-25 15:00:00', 'YYYY-MM-DD HH24:MI:SS'))*(24*60*60)/60)/60),24) "��"
     , MOD(TRUNC((SYSDATE - TO_DATE('1997-07-25 15:00:00', 'YYYY-MM-DD HH24:MI:SS'))*(24*60*60)/60),60) "��"
     , MOD((SYSDATE - TO_DATE('1997-07-25 15:00:00', 'YYYY-MM-DD HH24:MI:SS'))*(24*60*60), 60) "��"
FROM DUAL;  


--�� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.

--�� ��¥ �����͸� ������ε� �ݿø�, ���� ���� ������ ���� �� �� �ִ�.

--�� ��¥ �ݿø�
SELECT SYSDATE "COL1"                  -- 2022-02-22     �� �⺻ ���� ��¥ ������                                
     , ROUND(SYSDATE, 'YEAR') "COL2"   -- 2022-01-01     �� �⵵���� ��ȿ�� ������ (��ݱ�/�Ϲݱ� ����)
     , ROUND(SYSDATE, 'MONTH') "COL3"  -- 2022-03-01     �� ������ ��ȿ�� ������ (���� : 15��)
     , ROUND(SYSDATE, 'DD') "COL4"     -- 2022-02-23     �� �ϱ��� ��ȿ�� ������ (���� ����) (��Ͻð�  : 16�� 8��)
     , ROUND(SYSDATE, 'DAY') "COL5"    -- 2022-02-20     �� �ϱ��� ��ȿ�� ������ (������ ���� ����)(��Ͽ��� : ȭ����)  
FROM DUAL;                                               -- ���� ������ ���İ� �����ٸ� �� ���� �Ͽ��� ��¥�� ����  


--�� ��¥ ����
SELECT SYSDATE "COL1"                  -- 2022-02-22     �� �⺻ ���� ��¥ ������                                
     , TRUNC(SYSDATE, 'YEAR') "COL2"   -- 2022-01-01     �� �⵵���� ��ȿ�� ������ 
     , TRUNC(SYSDATE, 'MONTH') "COL3"  -- 2022-01-01     �� ������ ��ȿ�� ������ 
     , TRUNC(SYSDATE, 'DD') "COL4"     -- 2022-02-22     �� �ϱ��� ��ȿ�� ������ 
     , TRUNC(SYSDATE, 'DAY') "COL5"    -- 2022-02-20     �� �� ���ֿ� �ش��ϴ� �Ͽ��� ��¥ 
FROM DUAL;  

-----------------------------------------------------------------------------------------------

--���� ��ȯ �Լ� ����--

-- TO_CHAR()    : ���ڳ� ��¥�����͸� ���� Ÿ������ ��ȯ�����ִ� �Լ�
-- TO_DATE()    : ���� �����͸� ��¥ Ÿ������ ��ȯ�����ִ� �Լ�
-- TO_NUMBER()  : ���� �����͸� ���� Ÿ������ ��ȯ�����ִ� �Լ�

--�� ��¥�� ��ȭ ������ ���� ���� ���..
--   ���� ���� ���� ������ �����Ͽ� ����� �� �ִ�.

ALTER SESSION SET NLS_LANGUAGE = 'KOREAN';
ALTER SESSION SET NLS_DATE_LANGUAGE = 'KOREAN';
ALTER SESSION SET NLS_CURRENCY = '\';
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';


--�� ��¥�� �� ������
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') "COL1"   -- 2022-02-22 (�̰� ��¥Ÿ�� �ƴϰ� ���ڴ�~!!)
     , TO_CHAR(SYSDATE, 'YYYY') "COL2"         -- 2022
     , TO_CHAR(SYSDATE, 'YEAR') "COL3"         -- TWENTY TWENTY-TWO  
     , TO_CHAR(SYSDATE, 'MM') "COL4"           -- 02
     , TO_CHAR(SYSDATE, 'MONTH') "COL5"        -- 2�� 
     , TO_CHAR(SYSDATE, 'MON') "COL6"          -- 2�� 
     , TO_CHAR(SYSDATE, 'DD') "COL7"           -- 22
     , TO_CHAR(SYSDATE, 'MM-DD') "COL8"        -- 02-22
     , TO_CHAR(SYSDATE, 'DAY') "COL9"          -- ȭ����
     , TO_CHAR(SYSDATE, 'DY') "COL10"          -- ȭ
     , TO_CHAR(SYSDATE, 'HH24') "COL11"        -- 16
     , TO_CHAR(SYSDATE, 'HH') "COL12"          -- 04
     , TO_CHAR(SYSDATE, 'HH AM') "COL13"       -- 04 ����
     , TO_CHAR(SYSDATE, 'HH PM') "COL14"       -- 04 ����
     , TO_CHAR(SYSDATE, 'MI') "COL15"          -- 20
     , TO_CHAR(SYSDATE, 'SS') "COL16"          -- 46
     , TO_CHAR(SYSDATE, 'SSSSS') "COL17"       -- 58846 // ���� 0��0��0�� ���� ���ݱ��� ��ŭ�� �ʰ� �귶���� 
     , TO_CHAR(SYSDATE, 'Q') "COL18"           -- 1     // �б�
FROM DUAL;


SELECT 7 "COL1"
     , TO_CHAR(7) "COL2"
FROM DUAL;
--==>> 7	7 -- ����Ŭ���� ���ڴ� ��������, ���ڴ� ���� �����̴�.

SELECT '4'
     , TO_NUMBER('4')
FROM DUAL;
--==>> 4	4


SELECT TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) "RESULT"
FROM DUAL;
--==> 2022 (����Ÿ��)

--�� EXTRACT()
SELECT TO_CHAR(SYSDATE, 'YYYY') "COL1"      -- 2022 (������) �� ������ �����Ͽ� ����Ÿ������ ��ȯ
     , TO_CHAR(SYSDATE, 'MM') "COL2"        -- 02   (������) �� ���� �����Ͽ� ����Ÿ������ ��ȯ
     , TO_CHAR(SYSDATE, 'DD') "COL3"        -- 22   (������) �� �ϸ� �����Ͽ� ����Ÿ������ ��ȯ
     , EXTRACT(YEAR FROM SYSDATE) "COL4"    -- 2022 (������) �� ������ �����Ͽ� ����Ÿ������ ��ȯ --CHECK
     , EXTRACT(MONTH FROM SYSDATE) "COL5"   -- 2    (������) �� ���� �����Ͽ� ����Ÿ������ ��ȯ   --CHECK
     , EXTRACT(DAY FROM SYSDATE) "COL6"     -- 22   (������) �� �ϸ� �����Ͽ� ����Ÿ������ ��ȯ   --CHECK
FROM DUAL;
-->> ��, ��, �� �̿��� �ٸ��׸��� �Ұ� ~!!!!!!!


--�� TO_CHAR() Ȱ�� �� ���� ���� ǥ�� ����� ��ȯ
SELECT 60000 "COL1"
     , TO_CHAR(60000, '99,999') "COL2"
     , TO_CHAR(60000, '$99,999') "COL3"
     , TO_CHAR(60000, 'L99,999') "COL4"
FROM DUAL;
--==>>60000	 60,000	 $60,000	        ��60,000


--�� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==> Session��(��) ����Ǿ����ϴ�.

--�� ���� �ð��� �������� 1�� 2�ð� 3�� 4�� �ĸ� ��ȸ�Ѵ�.
SELECT SYSDATE "����ð�"
     , SYSDATE + 1 + (2/24) + (3/(24*60)) + (4/(24*60*60)) "1�� 2�ð� 3�� 4�ʵ�"
FROM DUAL;
--==>>2022-02-22 16:48:31
--    2022-02-23 18:51:35


--�� ���� �ð��� �������� 1�� 2���� 3�� 4�ð� 5�� 6�� �ĸ� ��ȸ�Ѵ�.
-- TO_YMINTERVAL(), TO_DSINTERVAL() 
--   '��-��'        '�� ��'          
SELECT SYSDATE "���� �ð�"
     , SYSDATE + TO_YMINTERVAL('01-02') + TO_DSINTERVAL('003 04:05:06') "���� �ð�" --�Ű����� CHECK!
FROM DUAL;
--==>> 2022-02-22 17:05:02	
--     2023-04-25 21:10:08

--------------------------------------------------------------------------------

--�� CASE ����(���ǹ�, �б⹮)
/*
CASE
WHEN
THEN
ELSE
END
*/

SELECT CASE 5+2 WHEN 4 THEN '5+2 = 4' ELSE '5+2=�����' END 
FROM DUAL;
--==> 5+2=�����


SELECT CASE 5+2 WHEN 7 THEN '5+2=7' ELSE '5+2=6' END
FROM DUAL;
--==>> 5+2=7




SELECT CASE 1+1 WHEN 2 THEN '1+1=2'
                WHEN 3 THEN '1+1=3'
                WHEN 4 THEN '1+1=4'
                WHEN 2 THEN  '����� �ȿ�'
                ELSE '5+2=6' 
                END   "RESULT"
FROM DUAL;
--==>> 1+1=2


SELECT CASE WHEN 5+2=4 THEN '5+2=4'
            WHEN 6-3=2 THEN '6-3=2'
            WHEN 7*1=8 THEN '7*1=8'
            WHEN 6/2=3 THEN '6/2=3'
            ELSE '�𸣰ٴ� '
        END "RESULT"    
FROM DUAL;
--==>> 6/2=3


--�� DECODE()
SELECT DECODE(5-2, 1, '5-2=1', 2, '5-2=2', 3, '5-2=3', '5-3=�����') "RESULT"
FROM DUAL;
--==>> 5-2=3

--�� CASE WHEN THEN ELSE END (���ǹ�, �б⹮) Ȱ��

SELECT CASE WHEN 5<2 THEN '5<2'
            WHEN 5>2 THEN '5>2'
            ELSE '5�� 2�� �� �Ұ�'
        END "RESULT"
FROM DUAL;
--==>> 5>2

SELECT CASE WHEN 5<2 OR 3>1 AND 2=2 THEN '��������'
            WHEN 5>2 OR 2=3 THEN '��������'
            ELSE 'ȣ������'
        END "RESULT"
FROM DUAL;
--==>> ��������

SELECT CASE WHEN 3<1 AND 5<2 OR 3>1 AND 2=2 THEN '��������'
            WHEN 5<2 AND 2=3 THEN '�̻踸��'
            ELSE '��������'
        END "RESULT"
FROM DUAL;
--==>> ��������

SELECT CASE WHEN 3<1 AND (5<2 OR 3>1) AND 2=2 THEN '��������'
            WHEN 5<2 AND 2=3 THEN '�̻踸��'
            ELSE '��������'
        END "RESULT"
FROM DUAL;
--==>> ��������
-------------------------------------------------------------------------------

SELECT *
FROM TBL_SAWON;

--�� TBL_SAWON ���̺��� Ȱ���Ͽ�
--   ������ ���� �׸��� ��ȸ�� �� �յ��� ������ ����
--   �����ȣ, �����, �ֹι�ȣ, ����, �Ի���


SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ"
     , CASE WHEN JUBUN LIKE '______2%' OR JUBUN LIKE '______4%' THEN '����'
            WHEN JUBUN LIKE '______1%' OR JUBUN LIKE '______3%' THEN '����'
            ELSE '���� �̻�' END "����", HIREDATE "�Ի���"
FROM TBL_SAWON;







