--회원 테이블 생성
CREATE TABLE MEMBERS(
            MM_ID VARCHAR2(20) UNIQUE NOT NULL PRIMARY KEY,
            MM_PW NUMBER NOT NULL,
            MM_NAME VARCHAR2(20),
            MM_RRNUM NUMBER UNIQUE NOT NULL,
            MM_PHNUM NUMBER UNIQUE NOT NULL
            );
--회원 테이블 칼럼 작성
INSERT INTO MEMBERS VALUES('abc1', 1234, '떡튀순', 1111111111111, 0101111111);
INSERT INTO MEMBERS VALUES('abc2', 1234, '김떡만', 2222222222222, 0102222222);
INSERT INTO MEMBERS VALUES('abc3', 1234, '칼국수', 3333333333333, 0103333333);
INSERT INTO MEMBERS VALUES('abc4', 1234, '닭강정', 4444444444444, 0104444444);
INSERT INTO MEMBERS VALUES('abc5', 1234, '삼겹살', 5555555555555, 0105555555);
--회원 데이터 확인
SELECT * FROM MEMBERS;
----------------------------------------------------------------------------------------------------
--쿠폰 테이블 생성
CREATE TABLE COUPONS(
            CP_NAME VARCHAR2(20) UNIQUE NOT NULL PRIMARY KEY,
            CP_PERCENT NUMBER NOT NULL
            );
--쿠폰 테이블 칼럼 작성
INSERT INTO COUPONS VALUES('생일', 25);
INSERT INTO COUPONS VALUES('가입', 10);
INSERT INTO COUPONS VALUES('리뷰', 5);
INSERT INTO COUPONS VALUES('댓글', 5);
INSERT INTO COUPONS VALUES('이벤트', 30);
--쿠폰 데이터 확인
SELECT * FROM COUPONS;
----------------------------------------------------------------------------------------------------
--쿠폰 보고나함 테이블 생성
CREATE TABLE CPLIST(
            MM_ID VARCHAR2(20) UNIQUE NOT NULL,
            CP_NAME  VARCHAR2(20) NOT NULL,
            FOREIGN KEY (MM_ID) REFERENCES MEMBERS(MM_ID),
            FOREIGN KEY (CP_NAME) REFERENCES COUPONS(CP_NAME)
            );
--쿠폰 보관함 테이블 칼럼 작성
INSERT INTO CPLIST VALUES('abc1', '생일');
INSERT INTO CPLIST VALUES('abc1', '가입');
INSERT INTO CPLIST VALUES('abc2', '가입');
INSERT INTO CPLIST VALUES('abc2', '리뷰');
INSERT INTO CPLIST VALUES('abc3', '리뷰');
INSERT INTO CPLIST VALUES('abc5', '가입');
--쿠폰 보관함 데이터 확인
SELECT * FROM CPLIST;
----------------------------------------------------------------------------------------------------
--상품 테이블 생성
DROP TABLE PRODUCTS;
CREATE TABLE PRODUCTS(
            PD_NUM NUMBER NOT NULL UNIQUE PRIMARY KEY,
            PD_CTG VARCHAR2(20) NOT NULL,
            PD_NAME VARCHAR2(20) NOT NULL,
            PD_INF VARCHAR2(20) NOT NULL,
            PD_STCK INTEGER NOT NULL,
            PD_PRC INTEGER NOT NULL
            );
--상품 테이블 칼럼 작성
INSERT INTO PRODUCTS VALUES(1, '영양제', '오메가3', '놰애조운', 237, 30000);
INSERT INTO PRODUCTS VALUES(2, '영양제', '루테인', '누내조운', 425, 20000);
--상품 데이터 확인
SELECT * FROM PRODUCTS;
----------------------------------------------------------------------------------------------------
--주문 테이블 생성
CREATE TABLE ORDERS(
            OD_NUM NUMBER UNIQUE NOT NULL PRIMARY KEY,
            MM_ID VARCHAR2(20) NOT NULL,
            OD_ADD VARCHAR2(20) NOT NULL,
            OD_DATE DATE NOT NULL,
            OD_PCH VARCHAR2(20) NOT NULL,
            FOREIGN KEY (MM_ID) REFERENCES MEMBERS(MM_ID)
            );
--주문 테이블 칼럼 작성
INSERT INTO ORDERS VALUES(1, 'abc1', '갈마동', '2022/05/14', '네이버페이');
INSERT INTO ORDERS VALUES(2, 'abc2', '법동', '2022/05/15', '페이코');
INSERT INTO ORDERS VALUES(3, 'abc3', '판암동', '2022/05/16', '무통장 입금');
INSERT INTO ORDERS VALUES(4, 'abc4', '문화동', '2022/05/17', '계좌이체');
INSERT INTO ORDERS VALUES(5, 'abc5', '산성동', '2022/05/17', '무통장 입금');
--주문 데이터 확인
SELECT * FROM ORDERS;
----------------------------------------------------------------------------------------------------
--배송할 상품 목록 생성
CREATE TABLE PRODUCTORDERS(
            OD_NUM NUMBER NOT NULL,
            PD_NUM NUMBER NOT NULL,
            PDOD_AM NUMBER NOT NULL,
            FOREIGN KEY (OD_NUM) REFERENCES ORDERS(OD_NUM),
            FOREIGN KEY (PD_NUM) REFERENCES PRODUCTS(PD_NUM)
            );
--배송할 상품 목록 테이블 작성
INSERT INTO PRODUCTORDERS VALUES(1,1,3);
INSERT INTO PRODUCTORDERS VALUES(1,2,3);
INSERT INTO PRODUCTORDERS VALUES(2,2,1);
INSERT INTO PRODUCTORDERS VALUES(3,1,1);
INSERT INTO PRODUCTORDERS VALUES(3,2,1);
INSERT INTO PRODUCTORDERS VALUES(4,2,1);
INSERT INTO PRODUCTORDERS VALUES(5,1,2);
SELECT * FROM PRODUCTORDERS;
----------------------------------------------------------------------------------------------------
COMMIT;