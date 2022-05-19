------------------------------------------------------------
--서브쿼리
SELECT * --MAIN QUERY -- 6
FROM EMPLOYEES E -- 4
WHERE E.SALARY = ( -- 5     SUBQUERY
                    SELECT SALARY -- 3
                    FROM EMPLOYEES -- 1
                    WHERE LAST_NAME = 'De Haan' -- 2
                    );
------------------------------------------------------------
--다중행 서브쿼리
SELECT * -- 6
FROM EMPLOYEES E -- 4
WHERE E.SALARY IN ( -- 5
                    SELECT MIN(SALARY) 최저급여 -- 3
                    FROM EMPLOYEES -- 1
                    GROUP BY DEPARTMENT_ID -- 2
                    )
ORDER BY E.SALARY DESC; -- 7 ORDER BY는 마지막
------------------------------------------------------------
SELECT * -- 6
FROM EMPLOYEES E -- 4
WHERE (E.JOB_ID, E.SALARY) IN ( -- 5
                                SELECT JOB_ID, MIN(SALARY) 그룹별급여 -- 3
                                FROM EMPLOYEES -- 1
                                GROUP BY JOB_ID -- 2
                                )
ORDER BY E.SALARY DESC; -- 7
------------------------------------------------------------
--서브쿼리 : 인라인 뷰
--뷰(가상의 테이블)
SELECT * -- 6
FROM EMPLOYEES E, --4
                    (SELECT DEPARTMENT_ID -- 3
                    FROM DEPARTMENTS -- 1
                    WHERE DEPARTMENT_NAME = 'IT' ) EE -- 2
WHERE E.DEPARTMENT_ID = EE.DEPARTMENT_ID; -- 5
------------------------------------------------------------
-- 8장 DML : 데이터의 삽입/갱신/삭제
--INSERT INTO VALUES
SELECT DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_ID = 271;

COMMIT;    -- 저장한다.

INSERT INTO DEPARTMENTS -- *는 생략한다.
VALUES
(272, 'Sample_Dept', 201, 1700);

SELECT *
FROM DEPARTMENTS
WHERE DEPARTMENT_ID IN 271;
------------------------------------------------------------
--UPDATE : 행 갱신하기
UPDATE DEPARTMENTS
SET MANAGER_ID = 201,
    LOCATION_ID = 1800
WHERE DEPARTMENT_NAME = 'Sample_Dept';

SELECT *
FROM DEPARTMENTS
WHERE DEPARTMENT_ID = 271;

UPDATE DEPARTMENTS
SET (MANAGER_ID, LOCATION_ID) = (SELECT MANAGER_ID, LOCATION_ID
                                 FROM DEPARTMENTS
                                 WHERE DEPARTMENT_ID = 40)
WHERE DEPARTMENT_NAME = 'Sample_Dept';

SELECT *
FROM DEPARTMENTS
WHERE DEPARTMENT_ID = 271;
------------------------------------------------------------
--DELETE: 행 삭제하기
DELETE FROM DEPARTMENTS
WHERE DEPARTMENT_ID = 271;

SELECT * FROM DEPARTMENTS WHERE DEPARTMENT_ID = 271;

DELETE FROM DEPARTMENTS
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME = 'Sample_Dept');
------------------------------------------------------------
--DDL : 테이블과 열 조작하기
CREATE TABLE sample_product -- 테이블 명은 대소문자를 구분한다.
             (PRODUCT_ID NUMBER,
             PRODUCT_NAME VARCHAR2(30),
             MANU_DATE DATE
             );
SELECT * FROM TAB;
SELECT * FROM SAMPLE_PRODUCT;

INSERT INTO SAMPLE_PRODUCT VALUES (1, 'television', to_date('140101','YYMMDD'));
INSERT INTO SAMPLE_PRODUCT VALUES (2, 'washer', to_date('150101','YYMMDD'));
INSERT INTO SAMPLE_PRODUCT VALUES (3, 'cleaner', to_date('160101','YYMMDD'));
COMMIT;
SELECT * FROM SAMPLE_PRODUCT;
------------------------------------------------------------
-- ALTER : 테이블 수정하기(ADD, MODIFY, RENAME COLUMN A TO B, DROPCOLUMN)
ALTER TABLE SAMPLE_PRODUCT ADD (FACTORY VARCHAR(10)); -- 10BYTE
SELECT * FROM SAMPLE_PRODUCT;
-- 열 타입 수정
ALTER TABLE SAMPLE_PRODUCT MODIFY (FACTORY CHAR(10));
-- 열 이름 수정
ALTER TABLE SAMPLE_PRODUCT RENAME COLUMN factory TO factory_name;
SELECT * FROM SAMPLE_PRODUCT;
-- 열 삭제
ALTER TABLE SAMPLE_PRODUCT DROP COLUMN FACTORY_NAME;
-- TRUNCATE : 테이블 내용 삭제
TRUNCATE TABLE SAMPLE_PRODUCT;
-- DROP : 테이블 삭제하기
DROP TABLE SAMPLE_PRODUCT;
COMMIT;
------------------------------------------------------------
-- 뷰
SELECT E.EMPLOYEE_ID, E.HIRE_DATE, EE.DEPARTMENT_NAME, EE.JOB_TITLE
FROM EMPLOYEES E, EMP_DETAILS_VIEW EE
WHERE E.EMPLOYEE_ID = EE.EMPLOYEE_ID
AND E.EMPLOYEE_ID = 100;
------------------------------------------------------------
--인덱스 : 빠른 검색을 위한 데이터 주소록
