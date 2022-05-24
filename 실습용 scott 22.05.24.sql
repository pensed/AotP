--SELECT의 스칼라 서브쿼리 => 서브쿼리가 SELECT절로 확장 되었다는 의미이다.
--직업이 SALESMAN인 사원들의 이름과 월급을 출력하는데, 직업이 SALESMAN인 
--사원들의 최대, 최소월급도 같이 출력하라.
SELECT E.ENAME, SAL, --3
        (SELECT MAX(SAL) FROM EMP WHERE JOB = 'SALESMAN') AS MAX, --4,6,8,10 
        (SELECT MIN(SAL) FROM EMP WHERE JOB = 'SALESMAN') AS MIN  --5,7,9,11
        --4행 출력 => 1행씩 서브쿠리가 실행된다.
FROM EMP E --1
WHERE JOB = 'SALESMAN'; --2

--DDL
DROP TABLE EMP01;
--테이블 이름은 반드시 대문자로 한다.
--길이는 30자 이하여야 하며 대소문자, 알파벳, 숫자를 섞어서 가능하다.
--특수문자는 '$, _, #'만 가능하다.
CREATE TABLE EMP01 (
                    EMPNO NUMBER(10),
                    ENAME VARCHAR2(10),
                    SAL NUMBER(10,2),
                    HIREDATE DATE
                    );
COMMIT;
SELECT * FROM TAB;

--서브쿼리를 이용한 테이블 복사
CREATE TABLE  EMP_T AS SELECT * FROM EMP;
SELECT * FROM EMP_T;
DROP TABLE EMP_T;
SELECT * FROM TAB;
COMMIT;

--DML
--1. INSERT
--2. UPDATE
--3. DELETE
--4. MERGE : 데이터 입력 수정을 한번에 수행
--5. SELECT

--1. INSERT
INSERT INTO EMP(EMPNO, ENAME, SAL, HIREDATE, JOB)
VALUES(2813, 'JACK', 3500, TO_DATE('2019/06/05','RR/MM/DD'),'ANALYST');
SELECT * FROM EMP WHERE ENAME = 'JACK';
--NULL 값을 입력하는 방법
--1. 암시적으로 입력하는 방법이다.
INSERT INTO EMP(EMPNO, ENAME, SAL) VALUES(2912, 'JAMES', 4500);
SELECT * FROM EMP WHERE ENAME = 'JAMES';

--2. 명시적으로 입려하는 방법이다.
INSERT INTO EMP(EMPNO, ENAME, SAL, HIREDATE)
VALUES(3011, 'JONES', 3500, NULL);
SELECT * FROM EMP WHERE ENAME = 'JONES';

--2. UPDATE
UPDATE EMP SET SAL = 3200 ,COMM=200 WHERE ENAME = 'SCOTT';
SELECT * FROM EMP WHERE ENAME = 'SCOTT';


--3. DELETE
--데이터 삭제, 저장공간은 남김, 저장 구조는 남김, 취소 여부는 가능
DELETE FROM EMP WHERE DEPTNO = (NULL); -- 조건에 맞는 레코드를 삭제
SELECT * FROM EMP;

ROLLBACK;
SELECT * FROM EMP;

--TCL(Transaction Control Language) : COMMIT이전에  수행했던 DML 
--작업들을 데이터베이스에 영구히 반영하는 명령어 들이다.
--COMMIT: 모든 변경 사항들을 저장 
--ROLLBACK: COMMIT이후 까지 롤백한다.
--다만, DDL(CREATE, ALTER, DROP, TRUCATE, ...)문 같은 경우는 암시적으로
--COMMIT이 발생한다.
--SAVEPOINT

--서브 쿼리를 사용한 데이터 입력하기
--테이블 복사
--EMP 테이블의 구조만 가지고 오고싶을 때
CREATE TABLE  EMP2 AS SELECT * FROM EMP WHERE 1=2;
SELECT * FROM EMP2;
DROP TABLE EMP2;

--DEPTNO가 10인 사원들의 EMPNO, ENAME, SAL, JOB, DEPTNO를 입력하시오
CREATE TABLE EMP2 AS SELECT EMPNO, ENAME, SAL, JOB, DEPTNO 
FROM (SELECT * FROM EMP WHERE DEPTNO = 10);
SELECT * FROM EMP2;

--직업이 SALESMAN인 사원들의 월급을 ALLEN의 월급으로 변경하시오.
--UPDATE 문은 UPDATE, SET, WHERE에서 모두 서브 쿼리가 가능하다.
UPDATE (SELECT * FROM EMP WHERE JOB = 'SALESMAN')
SET SAL = (SELECT SAL FROM EMP WHERE ENAME = 'ALLEN');
SELECT * FROM EMP WHERE JOB = 'SALESMAN';

--SCOTT 보다 더 많은 월급을 받는 사원들을 삭제하세요.
DELETE FROM EMP WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME = 'SCOTT'); -- 조건에 맞는 레코드를 삭제
SELECT * FROM EMP;

--SAL을 해당 사원이 속한 DEPTNO의 AVG(SAL)보다 크면 삭제하시오.
DELETE FROM EMP M WHERE SAL > (SELECT AVG(V.SAL) FROM EMP V WHERE M.DEPTNO = V.DEPTNO);
SELECT * FROM EMP ORDER BY DEPTNO DESC;
ROLLBACK;
SELECT AVG(SAL), DEPTNO FROM EMP GROUP BY DEPTNO;