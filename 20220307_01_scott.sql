SELECT USER 
FROM DUAL;
--==>> SCOTT


--■■■ UPDATE ■■■--

-- 1. 테이블에서 기존 데이터를 수정(변경)하는 구문

-- 2. 형식 및 구조
-- UPDATE 테이블명
-- SET 컬럼명 = 변경할 값[, 컬럼명=변경할값, ...]
-- [WHERE 조건절]

SELECT *
FROM TBL_SAWON;

DESC TBL_SAWON;

--○ TBL_SAWON 테이블에서 사원번호 1004번 사원의
--   주민번호를 『7609172234567』로 수정한다.

UPDATE TBL_SAWON
SET JUBUN = '7609172234567'
WHERE SANO = 1004;
--==>> 1 행 이(가) 업데이트되었습니다.
SELECT *
FROM TBL_SAWON
WHERE SANO = 1004;
--==>> 1004	이연주	7609172234567	2007-10-10	4000

-- 실행 후 COMMIT 또는 ROLLBACK 을 반드시 선택적으로 실행
COMMIT;
--==>> 커밋 완료.

--○ TBL_SAWON 테이블에서 1005번 사원의 입사일과 급여를
--   각각 2020-04-01, 1200 으로 변경한다.

UPDATE TBL_SAWON
SET HIREDATE = TO_DATE('2020-04-01', 'YYYY-MM-DD') , SAL = 1200
WHERE SANO = 1005;
--==>> 1 행 이(가) 업데이트되었습니다.

SELECT *
FROM TBL_SAWON
WHERE SANO = 1005;
--==>> 1005	오이삭	9805161234567	2020-04-01	1200

COMMIT;
--==>> 커밋 완료.


--○ TBL_INSA 테이블 복사(데이터만)
CREATE TABLE TBL_INSABACKUP
AS
SELECT *
FROM TBL_INSA;
--==>> Table TBL_INSABACKUP이(가) 생성되었습니다.


SELECT *
FROM TBL_INSA;
/*
1001	홍길동	771212-1022432	1998-10-11	서울	011-2356-4528	기획부	부장	2610000	200000
1002	이순신	801007-1544236	2000-11-29	경기	010-4758-6532	총무부	사원	1320000	200000
1003	이순애	770922-2312547	1999-02-25	인천	010-4231-1236	개발부	부장	2550000	160000
1004	김정훈	790304-1788896	2000-10-01	전북	019-5236-4221	영업부	대리	1954200	170000
1005	한석봉	811112-1566789	2004-08-13	서울	018-5211-3542	총무부	사원	1420000	160000
1006	이기자	780505-2978541	2002-02-11	인천	010-3214-5357	개발부	과장	2265000	150000
1007	장인철	780506-1625148	1998-03-16	제주	011-2345-2525	개발부	대리	1250000	150000
1008	김영년	821011-2362514	2002-04-30	서울	016-2222-4444	홍보부	사원	950000	145000
1009	나윤균	810810-1552147	2003-10-10	경기	019-1111-2222	인사부	사원	840000	220400
1010	김종서	751010-1122233	1997-08-08	부산	011-3214-5555	영업부	부장	2540000	130000
1011	유관순	801010-2987897	2000-07-07	서울	010-8888-4422	영업부	사원	1020000	140000
1012	정한국	760909-1333333	1999-10-16	강원	018-2222-4242	홍보부	사원	880000	114000
1013	조미숙	790102-2777777	1998-06-07	경기	019-6666-4444	홍보부	대리	1601000	103000
1014	황진이	810707-2574812	2002-02-15	인천	010-3214-5467	개발부	사원	1100000	130000
1015	이현숙	800606-2954687	1999-07-26	경기	016-2548-3365	총무부	사원	1050000	104000
1016	이상헌	781010-1666678	2001-11-29	경기	010-4526-1234	개발부	과장	2350000	150000
1017	엄용수	820507-1452365	2000-08-28	인천	010-3254-2542	개발부	사원	950000	210000
1018	이성길	801028-1849534	2004-08-08	전북	018-1333-3333	개발부	사원	880000	123000
1019	박문수	780710-1985632	1999-12-10	서울	017-4747-4848	인사부	과장	2300000	165000
1020	유영희	800304-2741258	2003-10-10	전남	011-9595-8585	자재부	사원	880000	140000
1021	홍길남	801010-1111111	2001-09-07	경기	011-9999-7575	개발부	사원	875000	120000
1022	이영숙	800501-2312456	2003-02-25	전남	017-5214-5282	기획부	대리	1960000	180000
1023	김인수	731211-1214576	1995-02-23	서울		            영업부	부장	2500000	170000
1024	김말자	830225-2633334	1999-08-28	서울	011-5248-7789	기획부	대리	1900000	170000
1025	우재옥	801103-1654442	2000-10-01	서울	010-4563-2587	영업부	사원	1100000	160000
1026	김숙남	810907-2015457	2002-08-28	경기	010-2112-5225	영업부	사원	1050000	150000
1027	김영길	801216-1898752	2000-10-18	서울	019-8523-1478	총무부	과장	2340000	170000
1028	이남신	810101-1010101	2001-09-07	제주	016-1818-4848	인사부	사원	892000	110000
1029	김말숙	800301-2020202	2000-09-08	서울	016-3535-3636	총무부	사원	920000	124000
1030	정정해	790210-2101010	1999-10-17	부산	019-6564-6752	총무부	과장	2304000	124000
1031	지재환	771115-1687988	2001-01-21	서울	019-5552-7511	기획부	부장	2450000	160000
1032	심심해	810206-2222222	2000-05-05	전북	016-8888-7474	자재부	사원	880000	108000
1033	김미나	780505-2999999	1998-06-07	서울	011-2444-4444	영업부	사원	1020000	104000
1034	이정석	820505-1325468	2005-09-26	경기	011-3697-7412	기획부	사원	1100000	160000
1035	정영희	831010-2153252	2002-05-16	인천		            개발부	사원	1050000	140000
1036	이재영	701126-2852147	2003-08-10	서울	011-9999-9999	자재부	사원	960400	190000
1037	최석규	770129-1456987	1998-10-15	인천	011-7777-7777	홍보부	과장	2350000	187000
1038	손인수	791009-2321456	1999-11-15	부산	010-6542-7412	영업부	대리	2000000	150000
1039	고순정	800504-2000032	2003-12-28	경기	010-2587-7895	영업부	대리	2010000	160000
1040	박세열	790509-1635214	2000-09-10	경북	016-4444-7777	인사부	대리	2100000	130000
1041	문길수	721217-1951357	2001-12-10	충남	016-4444-5555	자재부	과장	2300000	150000
1042	채정희	810709-2000054	2003-10-17	경기	011-5125-5511	개발부	사원	1020000	200000
1043	양미옥	830504-2471523	2003-09-24	서울	016-8548-6547	영업부	사원	1100000	210000
1044	지수환	820305-1475286	2004-01-21	서울	011-5555-7548	영업부	사원	1060000	220000
1045	홍원신	690906-1985214	2003-03-16	전북	011-7777-7777	영업부	사원	960000	152000
1046	허경운	760105-1458752	1999-05-04	경남	017-3333-3333	총무부	부장	2650000	150000
1047	산마루	780505-1234567	2001-07-15	서울	018-0505-0505	영업부	대리	2100000	112000
1048	이기상	790604-1415141	2001-06-07	전남		            개발부	대리	2050000	106000
1049	이미성	830908-2456548	2000-04-07	인천	010-6654-8854	개발부	사원	1300000	130000
1050	이미인	810403-2828287	2003-06-07	경기	011-8585-5252	홍보부	대리	1950000	103000
1051	권영미	790303-2155554	2000-06-04	서울	011-5555-7548	영업부	과장	2260000	104000
1052	권옥경	820406-2000456	2000-10-10	경기	010-3644-5577	기획부	사원	1020000	105000
1053	김싱식	800715-1313131	1999-12-12	전북	011-7585-7474	자재부	사원	960000	108000
1054	정상호	810705-1212141	1999-10-16	강원	016-1919-4242	홍보부	사원	980000	114000
1055	정한나	820506-2425153	2004-06-07	서울	016-2424-4242	영업부	사원	1000000	104000
1056	전용재	800605-1456987	2004-08-13	인천	010-7549-8654	영업부	대리	1950000	200000
1057	이미경	780406-2003214	1998-02-11	경기	016-6542-7546	자재부	부장	2520000	160000
1058	김신제	800709-1321456	2003-08-08	인천	010-2415-5444	기획부	대리	1950000	180000
1059	임수봉	810809-2121244	2001-10-10	서울	011-4151-4154	개발부	사원	890000	102000
1060	김신애	810809-2111111	2001-10-10	서울	011-4151-4444	개발부	사원	900000	102000
*/

--○ TBL_INSABACKUP 테이블에서
--   직위가 과장과 부장만 수당 10% 인상해라...

DESC TBL_INSABACKUP;

UPDATE TBL_INSABACKUP
SET SUDANG = SUDANG * 1.1
WHERE JIKWI IN ('과장', '부장');

SELECT *
FROM TBL_INSABACKUP
WHERE JIKWI IN ('과장', '부장');
/*
1001	홍길동	771212-1022432	1998-10-11	서울	011-2356-4528	기획부	부장	2610000	220000
1003	이순애	770922-2312547	1999-02-25	인천	010-4231-1236	개발부	부장	2550000	176000
1006	이기자	780505-2978541	2002-02-11	인천	010-3214-5357	개발부	과장	2265000	165000
1010	김종서	751010-1122233	1997-08-08	부산	011-3214-5555	영업부	부장	2540000	143000
1016	이상헌	781010-1666678	2001-11-29	경기	010-4526-1234	개발부	과장	2350000	165000
1019	박문수	780710-1985632	1999-12-10	서울	017-4747-4848	인사부	과장	2300000	181500
1023	김인수	731211-1214576	1995-02-23	서울		            영업부	부장	2500000	187000
1027	김영길	801216-1898752	2000-10-18	서울	019-8523-1478	총무부	과장	2340000	187000
1030	정정해	790210-2101010	1999-10-17	부산	019-6564-6752	총무부	과장	2304000	136400
1031	지재환	771115-1687988	2001-01-21	서울	019-5552-7511	기획부	부장	2450000	176000
1037	최석규	770129-1456987	1998-10-15	인천	011-7777-7777	홍보부	과장	2350000	205700
1041	문길수	721217-1951357	2001-12-10	충남	016-4444-5555	자재부	과장	2300000	165000
1046	허경운	760105-1458752	1999-05-04	경남	017-3333-3333	총무부	부장	2650000	165000
1051	권영미	790303-2155554	2000-06-04	서울	011-5555-7548	영업부	과장	2260000	114400
1057	이미경	780406-2003214	1998-02-11	경기	016-6542-7546	자재부	부장	2520000	176000
*/


COMMIT;
--==>> 커밋 완료

--○ TBL_INSABACKUP 테이블에서
--   전화번호가 016, 017, 018, 019 로 시작하는 전화번호 인 경우
--   이를 모두 010으로 변경하는 쿼리문을 구성한다.


SELECT NAME, TEL
FROM TBL_INSABACKUP
WHERE SUBSTR(TEL, 1,3) IN('016', '017', '018', '019');


UPDATE TBL_INSABACKUP
SET TEL = '010'||SUBSTR(TEL,4)
WHERE SUBSTR(TEL, 1,3) IN('016', '017', '018', '019');


SELECT NAME, TEL
FROM TBL_INSABACKUP;

SELECT NAME, TEL
FROM TBL_INSA;

COMMIT;
--==>> 커밋 완료.



