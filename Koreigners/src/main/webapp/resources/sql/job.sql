-- 보드 종류
CREATE TABLE T_BOARD_MST (
    BOARD_IDX	NUMBER(10,0) PRIMARY KEY,
    T_BOARD	VARCHAR2(200)
);

INSERT INTO T_BOARD_MST VALUES(1, 'house');
INSERT INTO T_BOARD_MST VALUES(2, 'job');
INSERT INTO T_BOARD_MST VALUES(3, 'resale');
INSERT INTO T_BOARD_MST VALUES(4, 'community');
-- 위시리스트
CREATE TABLE T_WISH_LIST(
    WISH_IDX NUMBER(10,0) PRIMARY KEY,
    MEM_ID VARCHAR2(200),
    BOARD_IDX NUMBER(10,0),
    B_IDX NUMBER(10,0),
    REGDATE DATE,
    
    CONSTRAINTS WISH_BIDX_FK FOREIGN KEY(BOARD_IDX) 
    REFERENCES T_BOARD_MST(BOARD_IDX)
);

--카테고리 마스터
CREATE TABLE T_JOB_CATE_MST(
    CATE_IDX	NUMBER(10,0) PRIMARY KEY,
    CATE_KOR	VARCHAR2(200),
    CATE_PRNT	VARCHAR2(200)
);

CREATE TABLE T_JOB_CATE_CHILD(
    CATE_IDX	NUMBER(10,0),
    CATE_CHILD_KO VARCHAR2(200),
    CATE_CHILD	VARCHAR2(200),
    CONSTRAINTS JOB_CATE_IDX_FK FOREIGN KEY(CATE_IDX) 
    REFERENCES T_JOB_CATE_MST(CATE_IDX)
);

INSERT INTO T_JOB_CATE_CHILD VALUES(1, 'OFFICE WORK');
INSERT INTO T_JOB_CATE_CHILD VALUES(1, 'FINANCE/INSURANCE');
INSERT INTO T_JOB_CATE_CHILD VALUES(2, 'ENGINEERING TECHNOLOGY');
INSERT INTO T_JOB_CATE_CHILD VALUES(2, 'RESEARCH');
INSERT INTO T_JOB_CATE_CHILD VALUES(3, 'LECTURER');
INSERT INTO T_JOB_CATE_CHILD VALUES(3, 'LAW');
INSERT INTO T_JOB_CATE_CHILD VALUES(3, 'SOCIAL WELFARE');
INSERT INTO T_JOB_CATE_CHILD VALUES(3, 'OTHERS');
INSERT INTO T_JOB_CATE_CHILD VALUES(4, 'HEALTH/MEDICAL TREATMENT');
INSERT INTO T_JOB_CATE_CHILD VALUES(5, 'INTERPRETATION/TRANSLATION');
INSERT INTO T_JOB_CATE_CHILD VALUES(5, 'MEDIA');
INSERT INTO T_JOB_CATE_CHILD VALUES(5, 'DESIGN');
INSERT INTO T_JOB_CATE_CHILD VALUES(6, 'BEAUTY');
INSERT INTO T_JOB_CATE_CHILD VALUES(6, 'TRAVEL/ACCOMODATION');
INSERT INTO T_JOB_CATE_CHILD VALUES(6, 'CHEF');
INSERT INTO T_JOB_CATE_CHILD VALUES(6, 'RESTAURANT SERVICE');
INSERT INTO T_JOB_CATE_CHILD VALUES(6, 'CARE');
INSERT INTO T_JOB_CATE_CHILD VALUES(6, 'CLEANING/HOUSE KEEPING');
INSERT INTO T_JOB_CATE_CHILD VALUES(6, 'OTHER SIMPLE SERVICE');
INSERT INTO T_JOB_CATE_CHILD VALUES(7, 'BUSINESS SALES');
INSERT INTO T_JOB_CATE_CHILD VALUES(7, 'TELEMARKETER');
INSERT INTO T_JOB_CATE_CHILD VALUES(7, 'CUSTOMER SALES');
INSERT INTO T_JOB_CATE_CHILD VALUES(7, 'TRANSPORTATION');
INSERT INTO T_JOB_CATE_CHILD VALUES(8, 'CONSTRUCTION');
INSERT INTO T_JOB_CATE_CHILD VALUES(9, 'MACHINE/METAL');
INSERT INTO T_JOB_CATE_CHILD VALUES(9, 'ELECTRICAL/ELECTRONIC');
INSERT INTO T_JOB_CATE_CHILD VALUES(9, 'TEXTILE/FOOD PROCESSING/CHEMISTRY');
INSERT INTO T_JOB_CATE_CHILD VALUES(9, 'PRINTING');
INSERT INTO T_JOB_CATE_CHILD VALUES(9, 'WOOD/FURNITURE');
INSERT INTO T_JOB_CATE_CHILD VALUES(9, 'CRAFT');
INSERT INTO T_JOB_CATE_CHILD VALUES(9, 'OTHER MANUFACTURING');
INSERT INTO T_JOB_CATE_CHILD VALUES(10, 'FARMING');
INSERT INTO T_JOB_CATE_CHILD VALUES(10, 'DAIRY INDUSTRY');
INSERT INTO T_JOB_CATE_CHILD VALUES(10, 'FORESTRY');
INSERT INTO T_JOB_CATE_CHILD VALUES(10, 'FISHERY');
INSERT INTO T_JOB_CATE_CHILD VALUES(10, 'SIMPLE WORKER');


DROP TABLE T_JOB_CATE_CHILD;

INSERT INTO T_JOB_CATE_CHILD VALUES(1, '관리직', 'MANAGEMENT');
INSERT INTO T_JOB_CATE_CHILD VALUES(1, '일반사무', 'OFFICE WORK');
INSERT INTO T_JOB_CATE_CHILD VALUES(1, '금융/보험', 'FINANCE/INSURANCE');
INSERT INTO T_JOB_CATE_CHILD VALUES(2, 'IT연구', 'ENGINEERING TECHNOLOGY');
INSERT INTO T_JOB_CATE_CHILD VALUES(2, '공학기술', 'RESEARCH');
INSERT INTO T_JOB_CATE_CHILD VALUES(3, '강사', 'LECTURER');
INSERT INTO T_JOB_CATE_CHILD VALUES(3, '법률', 'LAW');
INSERT INTO T_JOB_CATE_CHILD VALUES(3, '사회복지', 'SOCIAL WELFARE');
INSERT INTO T_JOB_CATE_CHILD VALUES(3, '기타', 'OTHERS');
INSERT INTO T_JOB_CATE_CHILD VALUES(4, '보건/의료', 'HEALTH/MEDICAL TREATMENT');
INSERT INTO T_JOB_CATE_CHILD VALUES(5, '통/번역', 'INTERPRETATION/TRANSLATION');
INSERT INTO T_JOB_CATE_CHILD VALUES(5, '언론', 'MEDIA');
INSERT INTO T_JOB_CATE_CHILD VALUES(5, '디자인', 'DESIGN');
INSERT INTO T_JOB_CATE_CHILD VALUES(6, '미용', 'BEAUTY');
INSERT INTO T_JOB_CATE_CHILD VALUES(6, '여행/숙박', 'TRAVEL/ACCOMODATION');
INSERT INTO T_JOB_CATE_CHILD VALUES(6, '요리사', 'CHEF');
INSERT INTO T_JOB_CATE_CHILD VALUES(6, '식당서비스', 'RESTAURANT SERVICE');
INSERT INTO T_JOB_CATE_CHILD VALUES(6, '경비', 'SECURITY');
INSERT INTO T_JOB_CATE_CHILD VALUES(6, '돌봄', 'CARE');
INSERT INTO T_JOB_CATE_CHILD VALUES(6, '청소/가사보조', 'CLEANING/HOUSE KEEPING');
INSERT INTO T_JOB_CATE_CHILD VALUES(6, '기타단순서비스', 'OTHER SIMPLE SERVICE');
INSERT INTO T_JOB_CATE_CHILD VALUES(7, '영업', 'BUSINESS SALES');
INSERT INTO T_JOB_CATE_CHILD VALUES(7, '텔레마케터', 'TELEMARKETER');
INSERT INTO T_JOB_CATE_CHILD VALUES(7, '판매', 'CUSTOMER SALES');
INSERT INTO T_JOB_CATE_CHILD VALUES(7, '운송', 'TRANSPORTATION');
INSERT INTO T_JOB_CATE_CHILD VALUES(8, '건설', 'CONSTRUCTION');
INSERT INTO T_JOB_CATE_CHILD VALUES(9, '기계/금속(CNC/MCT/용접)', 'MACHINE/METAL');
INSERT INTO T_JOB_CATE_CHILD VALUES(9, '전기/전자', 'ELECTRICAL/ELECTRONIC');
INSERT INTO T_JOB_CATE_CHILD VALUES(9, '섬유/식품가공/화학', 'TEXTILE/FOOD PROCESSING/CHEMISTRY');
INSERT INTO T_JOB_CATE_CHILD VALUES(9, '인쇄', 'PRINTING');
INSERT INTO T_JOB_CATE_CHILD VALUES(9, '목재/가구', 'WOOD/FURNITURE');
INSERT INTO T_JOB_CATE_CHILD VALUES(9, '공예', 'CRAFT');
INSERT INTO T_JOB_CATE_CHILD VALUES(9, '기타제조', 'OTHER MANUFACTURING');
INSERT INTO T_JOB_CATE_CHILD VALUES(10, '농업', 'FARMING');
INSERT INTO T_JOB_CATE_CHILD VALUES(10, '낙농', 'DAIRY INDUSTRY');
INSERT INTO T_JOB_CATE_CHILD VALUES(10, '임업', 'FORESTRY');
INSERT INTO T_JOB_CATE_CHILD VALUES(10, '어업', 'FISHERY');
INSERT INTO T_JOB_CATE_CHILD VALUES(10, '기타단순노동', 'SIMPLE WORKER');
-----------------------------------------------------------------------



---- 회사 회원 계정
--fk : MEM_ID, HR_MANAGER, DO_EN, GU_GUN_EUP_ENG
----------------------------------------------------
CREATE SEQUENCE COMP_SQ;

CREATE TABLE T_COMPANY(
    COMPANY_IDX	NUMBER(10,0) PRIMARY KEY,
    MEM_ID	VARCHAR2(100),
    CEO_NAME	VARCHAR2(100),
    COMPANY_NAME	VARCHAR2(100),
    COMPANY_CATE	VARCHAR2(100),
    HR_MANAGER	VARCHAR(100),
    DO_EN	VARCHAR2(100),
    GU_GUN_EUP_ENG	VARCHAR2(100),
    ADDRESS	VARCHAR(200),
    BUSINESS_NUM	VARCHAR2(200),
    BUSINESS_IMG	VARCHAR2(200),
    EMPLOYEE_NUM	NUMBER(10,0),
    BUSINESS_INFO	CLOB,
    DOMITORY	VARCHAR2(100),
    MEALS	VARCHAR2(100),
    COMPANY_TELEPHONE	VARCHAR2(100),
    REGDATE	DATE,
    IP	VARCHAR2(100),
    MANAGER_EMAIL	VARCHAR2(200)
);



--아이디 fk
--CONSTRAINTS COM_ID_FK FOREIGN KEY(MEM_ID) 
--REFERENCES T_MEMBER(MEM_ID),
--담당자이름 fk
--CONSTRAINTS COMP_HRNAME_PK FOREIGN KEY(HR_MANAGER) 
--REFERENCES T_MEMBER(MEM_NAME),
--행정구역 fk
--CONSTRAINTS COMP_DO_PK FOREIGN KEY(DO_EN) 
--REFERENCES T_ADDRESS_DO(DO_EN),
--시 fk
--CONSTRAINTS COMP_SI_PK FOREIGN KEY(GU_GUN_EUP_ENG) 
--REFERENCES T_KOREA_ADDRESS(GU_GUN_EUP_ENG)
----------------------------------------------------



--회원 이력서 정보
--fk : MEM_ID
--SQ : MEM_RES_SQ

----------------------------------------------------

CREATE SEQUENCE MEM_RES_SQ;

CREATE TABLE T_MEMBER_RESUME (
    RESUME_IDX	NUMBER(10,0) PRIMARY KEY,
    MEM_ID	VARCHAR2(100),
    WISH_DO	VARCHAR2(100),
    WISH_SI	VARCHAR2(100),
    JOB_CATE	VARCHAR2(100),
    JOB_CATE_CHILD	VARCHAR2(100),
    REQ_SALARY_MIN	NUMBER(10,0),
    REQ_SALARY_MAX	NUMBER(10,0),
    SALARY_TYPE	VARCHAR2(100),
    WORK_TIME	VARCHAR2(100),
    DOMITORY	VARCHAR2(100),
    INTRODUCE	VARCHAR2(1000),
    GRADUATE_SCH	VARCHAR2(100),
    DEP	VARCHAR2(100),
    LANG_LEARN	VARCHAR2(100),
    FINAL_A_M	VARCHAR2(100),
    FINAL_A_Y	VARCHAR2(100),
    FINAL_G_M	VARCHAR2(100),
    FINAL_G_Y	VARCHAR2(100),
    FINAL_REGION	VARCHAR2(100),
    FINAL_SCH	VARCHAR2(100),
    FINAL_MAJOR	VARCHAR2(100),
    CAREER_J_M	VARCHAR2(100),
    CAREER_J_Y	VARCHAR2(100),
    CAREER_l_M	VARCHAR2(100),
    CAREER_l_Y	VARCHAR2(100),
    CAREER_REGION	VARCHAR2(100),
    CAREER_CMPY	VARCHAR2(100),
    CAREER_TASK	VARCHAR2(100),
    KO_SPK_ABIL	VARCHAR2(100),
    KO_DOC_ABIL	VARCHAR2(100),
    CH_SPK_ABIL	VARCHAR2(100),
    CH_DOC_ABIL	VARCHAR2(100),
    EN_SPK_ABIL	VARCHAR2(100),
    EN_DOC_ABIL	VARCHAR2(100),
    BT_SPK_ABIL	VARCHAR2(100),
    BT_DOC_ABIL	VARCHAR2(100),
    REGDATE	DATE,
    IP	VARCHAR2(100),
    OTHER_LANG	VARCHAR2(100)
);
--아이디 fk
---CONSTRAINTS MEMRES_ID_FK FOREIGN KEY(MEM_ID) 
---REFERENCES T_MEMBER(MEM_ID)

------------------------------------------------------


--채용게시판
--pk : COMPANY_IDX, MEM_ID, CATEGORY, CATEGORY_CHILD
--SQ : HIRE_SQ

----------------------------------------------------
CREATE SEQUENCE HIRE_SQ;

CREATE TABLE T_HIRE_BOARD (
HIRE_IDX	NUMBER(10,0) PRIMARY KEY,
COMPANY_IDX	NUMBER(10,0),
MEM_ID VARCHAR2(200),
WORK_TYPE	VARCHAR2(100),
TITLE	VARCHAR2(500),
CATEGORY	VARCHAR2(100),
CATEGORY_CHILD	VARCHAR2(100),
DO_EN	VARCHAR2(100),
GU_GUN_EUP_ENG	VARCHAR2(100),
ADDRESS	VARCHAR2(500),
WORK_TIME	VARCHAR2(500),
PAYMENT_DETAIL	VARCHAR2(200),
PAYMENT_CODITION	VARCHAR2(100),
SALARY_MIN	NUMBER(10,0),
SALARY_MAX	NUMBER(10,0),
HIRE_NUMBER	NUMBER(10,0),
HIRE_AGE_MIN	NUMBER(10,0),
HIRE_AGE_MAX	NUMBER(10,0),
EDUCATION	VARCHAR2(100),
EXPERIENCE	VARCHAR2(100),
MAJOR	VARCHAR2(100),
PREFER_SKILLS	VARCHAR2(500),
FOREIGN_LANGUAGE	VARCHAR2(200),
DOMITORY	VARCHAR2(200),
MEALS	VARCHAR2(200),
WORK_DETAIL	VARCHAR2(500),
INSURANCE	VARCHAR2(200),
APPLY_WAY	VARCHAR2(200),
REGDATE	DATE,
IP	VARCHAR2(100),
B_STATUS	NUMBER(1),
PREPARE_DOC	VARCHAR2(200),

--아이디 fk
CONSTRAINTS HIRE_ID_FK FOREIGN KEY(MEM_ID) 
REFERENCES T_MEMBER(MEM_ID),
--회사 일련번호 fk
CONSTRAINTS HIRE_COMIDX_FK FOREIGN KEY(COMPANY_IDX) 
REFERENCES T_COMPANY(COMPANY_IDX)
);

--아이디 fk
--CONSTRAINTS HIRE_ID_FK FOREIGN KEY(MEM_ID) 
--REFERENCES T_MEMBER(MEM_ID),
--회사 일련번호 fk
--CONSTRAINTS HIRE_COMIDX_FK FOREIGN KEY(COMPANY_IDX) 
--REFERENCES T_COMPANY(COMPANY_IDX)
----------------------------------------------------


--직무 카테고리 마스터
--pk : CATE_IDX
----------------------------------------------------
CREATE TABLE T_JOB_CATE_MST(
CATE_IDX	NUMBER(10,0) PRIMARY KEY,
CATE_KOR	VARCHAR2(200),
CATE_PRNT	VARCHAR2(200)

);
----------------------------------------------------
--직무 하위 카테고리

CREATE TABLE T_JOB_CATE_CHILD(
    CATE_IDX	NUMBER(10,0) ,
    CATE_CHILD	VARCHAR2(200)

);
--카테고리 인덱스 fk
--CONSTRAINTS JOB_CATE_IDX FOREIGN KEY(CATE_IDX) 
--REFERENCES T_JOB_CATE_MST(CATE_IDX)
----------------------------------------------------

--지원한 이력서 정보
--fk : MEM_ID
--SQ : AP_RESUME_SQ
----------------------------------------------------
CREATE SEQUENCE AP_RESUME_SQ;

CREATE TABLE T_APPLIED_RESUME(

    AP_RESUME_IDX	NUMBER(10,0),
    MEM_ID	VARCHAR2(100),
    ADDRESS	VARCHAR2(500),
    WORK_LOC_SI	VARCHAR2(100),
    WORK_LOC_DO	VARCHAR2(100),
    JOB_CATE	VARCHAR2(100),
    JOB_CATE_CHILD	VARCHAR2(100),
    REQ_SALARY_MIN	NUMBER(10,0),
    REQ_SALARY_MAX	NUMBER(10,0),
    SALARY_TYPE	VARCHAR2(100),
    WORK_TIME	VARCHAR2(100),
    DOMITORY	VARCHAR2(100),
    INTRODUCE	VARCHAR2(1000),
    GRADUATE_SCH	VARCHAR2(100),
    DEPLOMA	VARCHAR2(100),
    LANG_LEARN	VARCHAR2(100),
    FINAL_A_M	VARCHAR2(100),
    FINAL_A_Y	VARCHAR2(100),
    FINAL_G_M	VARCHAR2(100),
    FINAL_G_Y	VARCHAR2(100),
    FINAL_REGION	VARCHAR2(100),
    FINAL_SCH	VARCHAR2(100),
    FINAL_MAJOR	VARCHAR2(100),
    CAREER_J_M	VARCHAR2(100),
    CAREER_J_Y	VARCHAR2(100),
    CAREER_l_M	VARCHAR2(100),
    CAREER_l_Y	VARCHAR2(100),
    CAREER_REGION	VARCHAR2(100),
    CAREER_CMPY	VARCHAR2(100),
    CAREER_TASK	VARCHAR2(100),
    KO_SPK_ABIL	VARCHAR2(100),
    KO_DOC_ABIL	VARCHAR2(100),
    CH_SPK_ABIL	VARCHAR2(100),
    CH_DOC_ABIL	VARCHAR2(100),
    EN_SPK_ABIL	VARCHAR2(100),
    EN_DOC_ABIL	VARCHAR2(100),
    BT_SPK_ABIL	VARCHAR2(100),
    REGDATE	DATE,
    IP	VARCHAR2(100),
    BT_DOC_ABIL	VARCHAR2(100),
    OTHER_LANG	VARCHAR2(100)


);
--지원 이력서 아이디 fk
CONSTRAINTS T_AP_RES_ID FOREIGN KEY(COMPANY_ID) 
REFERENCES T_MEMBER(MEM_ID)
----------------------------------------------------


--회원 이력서 정보
--fk - mem_id
--SQ : MEM_RES_SQ

----------------------------------------------------
CREATE SEQUENCE MEM_RES_SQ;

CREATE TABLE T_MEMBER_RESUME(
RESUME_IDX	NUMBER(10,0) PRIMARY KEY,
MEM_ID	VARCHAR2(100),
WISH_DO	VARCHAR2(100),
WISH_SI	VARCHAR2(100),
JOB_CATE	VARCHAR2(100),
JOB_CATE_CHILD	VARCHAR2(100),
REQ_SALARY_MIN	NUMBER(10,0),
REQ_SALARY_MAX	NUMBER(10,0),
SALARY_TYPE	VARCHAR2(100),
WORK_TIME	VARCHAR2(100),
DOMITORY	VARCHAR2(100),
INTRODUCE	VARCHAR2(1000),
GRADUATE_SCH	VARCHAR2(100),
DEP	VARCHAR2(100),
LANG_LEARN	VARCHAR2(100),
FINAL_A_M	VARCHAR2(100),
FINAL_A_Y	VARCHAR2(100),
FINAL_G_M	VARCHAR2(100),
FINAL_G_Y	VARCHAR2(100),
FINAL_REGION	VARCHAR2(100),
FINAL_SCH	VARCHAR2(100),
FINAL_MAJOR	VARCHAR2(100),
CAREER_J_M	VARCHAR2(100),
CAREER_J_Y	VARCHAR2(100),
CAREER_l_M	VARCHAR2(100),
CAREER_l_Y	VARCHAR2(100),
CAREER_REGION	VARCHAR2(100),
CAREER_CMPY	VARCHAR2(100),
CAREER_TASK	VARCHAR2(100),
KO_SPK_ABIL	VARCHAR2(100),
KO_DOC_ABIL	VARCHAR2(100),
CH_SPK_ABIL	VARCHAR2(100),
CH_DOC_ABIL	VARCHAR2(100),
EN_SPK_ABIL	VARCHAR2(100),
EN_DOC_ABIL	VARCHAR2(100),
BT_SPK_ABIL	VARCHAR2(100),
BT_DOC_ABIL	VARCHAR2(100),
REGDATE	DATE,
IP	VARCHAR2(100),
OTHER_LANG	VARCHAR2(100),


CONSTRAINTS MEMRES_ID_FK FOREIGN KEY(MEM_ID) 
REFERENCES T_MEMBER(MEM_ID)
);
----------------------------------------------------



