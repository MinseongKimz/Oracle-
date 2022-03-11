SELECT USER
FROM DUAL;
--==>> SCOTT

DESC TBL_INSA;
/*
�̸�       ��?       ����           
-------- -------- ------------ 
NUM      NOT NULL NUMBER(5)    
NAME     NOT NULL VARCHAR2(20) 
SSN      NOT NULL VARCHAR2(14) 
IBSADATE NOT NULL DATE         
CITY              VARCHAR2(10) 
TEL               VARCHAR2(15) 
BUSEO    NOT NULL VARCHAR2(15) 
JIKWI    NOT NULL VARCHAR2(15) 
BASICPAY NOT NULL NUMBER(10)   
SUDANG   NOT NULL NUMBER(10)   
*/

--�� TBL_INSA ���̺��� ������� �ű� ������ �Է� ���ν����� �ۼ��Ѵ�
--   NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG
--   ���� ������ �÷� �� NUM �� ������
--   NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG 
--   �� ������ �Է½�
--   NUM �÷�(�����ȣ)�� ����
--   ���� �ο��� �����ȣ�� ������ ��ȣ �״��� ��ȣ�� �ڵ����� �Է� ó���� �� �ִ�
--   ���ν����� �����Ѵ�.
--   ���ν��� �� : PRC_INSA_INSERT()
/*
���� ��)
EXEC PRC_INSA_INSERT('������', '9701310-2234567', SYSDATE, '����', '010-8624-4553', '���ߺ�', '�븮', 2000000, 2000000);
���ν��� ȣ��� ó���� ���
1061 ������ 9701310-2234567 SYSDATE ���� 010-8624-4553 ���ߺ� �븮 2000000 2000000
�� �����Ͱ� TBL_INSA ���̺��� �߰��� ��Ȳ.
*/
--   ���� �ο��� �����ȣ�� ������ ��ȣ 
SELECT MAX(NUM)
FROM TBL_INSA;
-- 1060

CREATE OR REPLACE PROCEDURE PRC_INSA_INSERT
( V_NAME        IN TBL_INSA.NAME%TYPE
, V_SSN         IN TBL_INSA.SSN%TYPE
, V_IBSADATE    IN TBL_INSA.IBSADATE%TYPE    
, V_CITY        IN TBL_INSA.CITY%TYPE    
, V_TEL         IN TBL_INSA.TEL%TYPE
, V_BUSEO       IN TBL_INSA.BUSEO%TYPE
, V_JIKWI       IN TBL_INSA.JIKWI%TYPE
, V_BASICPAY    IN TBL_INSA.BASICPAY%TYPE
, V_SUDANG      IN TBL_INSA.SUDANG%TYPE
)
IS
    V_NUM TBL_INSA.NUM%TYPE; 
BEGIN
    SELECT MAX(NVL(NUM,0)) INTO V_NUM -- NULL �� ��������...
    FROM TBL_INSA;
    
    INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
    VALUES((V_NUM + 1), V_NAME, V_SSN, V_IBSADATE, V_CITY
         , V_TEL, V_BUSEO, V_JIKWI, V_BASICPAY, V_SUDANG);
         
    COMMIT;     
END;
--==>> Procedure PRC_INSA_INSERT��(��) �����ϵǾ����ϴ�.

-- ���ν����� ������ �ִ� ������ ��20220311_02_scott.sql�� ���� ���� ����



--�� TBL_��ǰ, TBL_�԰� ���̺��� �������
--   TBL_�԰� ���̺��� ������ �Է� �� (��,  �԰� �̺�Ʈ �߻� ��)
--   TBL_��ǰ ���̺��� ��������� �Բ� ������ �� �ִ� ����� ���� ���ν����� �ۼ��Ѵ�.
--   ��, �� �������� �԰���ȣ�� �ڵ� ���� ó�� (������ ��� X)
--   TBL_�԰� ���̺� ���� �÷�
--   : �԰���ȣ, ��ǰ�ڵ�, �԰�����, �԰�����, �԰��ܰ�
--   ���ν����� : PRC_�԰�_INSERT(��ǰ�ڵ�, �԰�����, �԰��ܰ�)

--  'H001' , 30, 400
--  �� �԰����̺��� ������ �Է�(���ν��� �Ű������� ���޹��� ���� ������ �� �� �ڵ� �Է�)
--  �� ��ǰ���̺��� �ٹ�� ������� 30��
/*
SELECT MAX(NVL(�԰���ȣ,0))
FROM TBL_�԰�;
--==>> NULL
SELECT NVL(MAX(�԰���ȣ),0)
FROM TBL_�԰�;
--==>> 0
*/

CREATE OR REPLACE PROCEDURE PRC_�԰�_INSERT
( V_��ǰ�ڵ� IN TBL_��ǰ.��ǰ�ڵ�%TYPE   -- ������ �θ����̺��� ����
, V_�԰����� IN TBL_�԰�.�԰�����%TYPE
, V_�԰��ܰ� IN TBL_�԰�.�԰��ܰ�%TYPE
)
IS
   --�԰���ȣ�� �ڵ� ���� ó�� (������ ��� X)
   V_�԰���ȣ TBL_�԰�.�԰���ȣ%TYPE;
BEGIN
     -- �԰� 
     SELECT NVL(MAX(�԰���ȣ),0) + 1 INTO V_�԰���ȣ
     FROM TBL_�԰�;
     INSERT INTO TBL_�԰�(�԰���ȣ, ��ǰ�ڵ�, �԰�����, �԰��ܰ�)
     VALUES (V_�԰���ȣ, V_��ǰ�ڵ�, V_�԰�����, V_�԰��ܰ�); 
     
     -- ��ǰ���̺� ������Ʈ
     UPDATE TBL_��ǰ
     SET ������� = ������� + V_�԰�����  
     WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
     
     
     -- ����ó��
     EXCEPTION
        WHEN OTHERS THEN ROLLBACK;
     
     COMMIT;   

END;
--==>> Procedure PRC_�԰�_INSERT��(��) �����ϵǾ����ϴ�.

-- ���ν����� ������ �ִ� ������ ��20220311_02_scott.sql�� ���� ���� ����

--------------------------------------------------------------------------------

--���� ���ν��� �������� ����ó�� ����--

--�� TBL_MEMBER ���̺��� �����͸� �Է��ϴ� ���ν����� �ۼ�
--   ��, �� ���ν����� ���� �����͸� �Է��ϴ� ���
--   CITY(����) �׸� '����', '���', '����' �Է��� �����ϵ��� �����Ѵ�.
--   �� ���� ���� �ٸ� ������ ���ν��� ȣ���� ���� �Է��ϰ��� �ϴ� ���
--   (��, �Է��� �õ��ϴ� ���)
--   ���ܿ� ���� ó���� �Ϸ��� �Ѵ�.
--   ���ν����� : PRC_MEMBER_INSERT()

/*
���� ��)
EXEC PRC_MEMBER_INSERT('�Ӽҹ�', '010-1111-1111', '����');
--==>> ������ �Է� ����

EXEC PRC_MEMBER_INSERT('�̿���', '010-2222-2222', '�λ�');
--==>> ������ �Է� X
*/

CREATE OR REPLACE PROCEDURE PRC_MEMBER_INSERT
( V_NAME    IN TBL_MEMBER.NAME%TYPE 
, V_TEL     IN TBL_MEMBER.TEL%TYPE
, V_CITY    IN TBL_MEMBER.CITY%TYPE
)
IS
-- �����(�ֿ� ���� ����)

    -- ���� ������ ������ ������ ���� �ʿ��� ���� ����
    V_NUM  TBL_MEMBER.NUM%TYPE;
--  ������    ������Ÿ��;
 
    -- ����� ���� ���ܿ� ���� ���� ���� CHECK~!!   
    USER_DEFINE_ERROR  EXCEPTION;
    -- ���ܵ� ������~!(����Ŭ����)
    
BEGIN
    -- ���ν����� ���� �Է� ó���� ���������� �����ؾ� �� ���������� �ƴ����� ���θ�
    -- ���� ���� Ȯ�� �� �� �ִ� �ڵ� ����
    IF  (V_CITY NOT IN ('����', '���', '����'))
        -- ���ܹ߻� CHECK~!!
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- ������ ������ �� ��Ƴ���
    SELECT NVL(MAX(NUM), 0) INTO V_NUM
    FROM TBL_MEMBER;

    -- ������ ���� �� INSERT
    INSERT INTO TBL_MEMBER(NUM, NAME, TEL, CITY)
    VALUES((V_NUM + 1), V_NAME, V_TEL, V_CITY);
    
    -- ���� ó�� ����
    EXCEPTION 
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20001, '����, ���, ������ �Է°����մϴ�.'); -- 20000 ���� ũ�� ����.
                 ROLLBACK;
        WHEN OTHERS 
            THEN ROLLBACK;
            
    -- Ŀ��
    COMMIT;
END;
--==>> Procedure PRC_MEMBER_INSERT��(��) �����ϵǾ����ϴ�.



--�� TBL_��� ���̺��� ������ �Է� ��(��, ��� �̺�Ʈ �߻� ��)
--   TBL_��ǰ ���̺��� ��� ������ �����Ǵ� ���ν����� �ۼ��Ѵ�.
--   ��, ��� ��ȣ�� �԰� ��ȣ�� ���������� �ڵ� ����.
--   ����, ��������� ����������� ������ 
--   ��� �׼��� ����� �� �ֵ��� ó���Ѵ�. (����� ���� �ʵ��� �� ����ó�� Ȱ��)
--   ���ν��� �� : PRC_���_INSERT()
/*
���� ��)
EXEC PRC_���_INSERT('H001', 10, 600);


-- ���� ��ǰ ���̺��� ��� ��������� 50�� 
EXEC PRC_���_INSERT('H001', 60, 600);
--==> �����߻�
    (�������) 
*/

CREATE OR REPLACE PROCEDURE PRC_���_INSERT
( V_��ǰ�ڵ�    IN TBL_���.��ǰ�ڵ�%TYPE
, V_�������    IN TBL_���.�������%TYPE
, V_����ܰ�    IN TBL_���.����ܰ�%TYPE
)
IS
    -- 1. �����ȣ �ʿ�.
    V_�����ȣ TBL_���.�����ȣ%TYPE;
    -- 2. ����� ���� ���� ����
    USER_DEFINE_ERROR  EXCEPTION;
    -- 3. ������� �񱳿� ���� (IF ���ȿ��� �������� �Ϸ��� ����)
    V_������� TBL_��ǰ.�������%TYPE;

BEGIN        
        SELECT ������� INTO V_�������
        FROM TBL_��ǰ
        WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;

        -- ���� �߻� �κ� (������� > �������)
        IF  (V_������� > V_�������)
            THEN RAISE USER_DEFINE_ERROR;
        END IF;
        
        SELECT NVL(MAX(�����ȣ),0) INTO V_�����ȣ
        FROM TBL_���; 
        -- �� ������ ��� �˻��� �Ŀ� �۵��ص� ���� �ʴ�. 
        -- ����  ���� �ȴٸ� ���ҽ� ���� �� �� �ִ�.
        
        -- ��� ���̺� INSERT
        INSERT INTO TBL_���(�����ȣ, ��ǰ�ڵ�, �������, ����ܰ�)
        VALUES(V_�����ȣ + 1, V_��ǰ�ڵ�, V_�������, V_����ܰ�);
        
        -- ��ǰ ���̺� UPDATE
        UPDATE TBL_��ǰ
        SET ������� = ������� - V_�������  
        WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
        
        -- ���� ó�� ����
        EXCEPTION 
            WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002, '�������'); -- 20000 ���� ũ�� ����.
                 ROLLBACK;
            WHEN OTHERS 
            THEN ROLLBACK;
            
        COMMIT;    
END;
--==>> Procedure PRC_���_INSERT��(��) �����ϵǾ����ϴ�.





--�� TBL_��� ���̺����� ��� ������ ����(����)�ϴ� ���ν��� �ۼ�
--   ���ν��� �� : PRC_���_UPDATE()
/*
���� ��)
EXEC PRC_���_UPDATE(�����ȣ, �����Ҽ���);
*/

CREATE OR REPLACE PROCEDURE PRC_���_UPDATE
( V_�����ȣ  IN TBL_���.�����ȣ%TYPE
, V_�������  IN TBL_��ǰ.�������%TYPE
)
IS
    V_����������� TBL_���.�������%TYPE;
    V_����������� TBL_��ǰ.�������%TYPE;
    -- ��������� �˷��� ��ǰ �ڵ� �˾ƾ���
    V_��ǰ�ڵ� TBL_��ǰ.��ǰ�ڵ�%TYPE;
    
    USER_DEFINE_ERROR  EXCEPTION;
    
BEGIN
    -- ��ǰ�ڵ� ��������
    SELECT ��ǰ�ڵ� INTO V_��ǰ�ڵ�
    FROM TBL_���
    WHERE �����ȣ = V_�����ȣ;

    -- ����������� ��������
    SELECT  ������� INTO V_�����������
    FROM TBL_��ǰ
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    -- ����������� ��������
    SELECT ������� INTO V_�����������
    FROM TBL_���
    WHERE �����ȣ = V_�����ȣ;

    -- ����������� > ����������� + ����������� .. ERROR 
    IF (V_������� > V_����������� + V_�����������)
       THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- ��� ������Ʈ ����
    UPDATE TBL_���
    SET ������� = V_�������
    WHERE �����ȣ = V_�����ȣ;
    
    -- ��ǰ ������Ʈ ����
    UPDATE TBL_��ǰ
    SET ������� = ������� + V_����������� - V_������� 
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    -- ���� ������� ���� ��������� �ٽ� �����ϰ� �״㿡 ������� ����
    
    --����ó��
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20003, '�������');
            ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
        
    -- Ŀ��
    COMMIT;

END;
--==>> Procedure PRC_���_UPDATE��(��) �����ϵǾ����ϴ�.




















