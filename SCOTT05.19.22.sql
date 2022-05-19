SELECT * FROM TAB; -- TABLE 확인
SELECT * FROM CHILD_T;
------------------------------------------------------------
CREATE TABLE PARENT_T (
        P_ID VARCHAR2(4) NOT NULL
        );
-- ALTER TABLE 넣어질테이블명 ADD CONSTRAINT 키명 PRIMARY KEY(속성);
------------------------------------------------------------
ALTER TABLE PARENT_T ADD CONSTRAINT P_PK PRIMARY KEY(P_ID); -- 프라이머리키 생성
DROP TABLE PARENT_T; --TABLE 제거
------------------------------------------------------------
CREATE TABLE CHILD_T (  --자식 테이블
    C_ID VARCHAR2(4) NOT NULL,
    P_ID VARCHAR2(4)
    );
ALTER TABLE CHILD_T ADD CONSTRAINT P_PK FOREIGN KEY(P_ID) REFERENCES PARENT_T(P_ID);
