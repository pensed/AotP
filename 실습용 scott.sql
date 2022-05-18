alter session set nls_date_format='RR/MM/DD';

drop table emp;
drop table dept;

CREATE TABLE DEPT
       (DEPTNO number(10),
        DNAME VARCHAR2(14),
        LOC VARCHAR2(13) );

INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT VALUES (20, 'RESEARCH',   'DALLAS');
INSERT INTO DEPT VALUES (30, 'SALES',      'CHICAGO');
INSERT INTO DEPT VALUES (40, 'OPERATIONS', 'BOSTON');

CREATE TABLE EMP (
 EMPNO               NUMBER(4) NOT NULL,
 ENAME               VARCHAR2(10),
 JOB                 VARCHAR2(9),
 MGR                 NUMBER(4) ,
 HIREDATE            DATE,
 SAL                 NUMBER(7,2),
 COMM                NUMBER(7,2),
 DEPTNO              NUMBER(2) );

INSERT INTO EMP VALUES (7839,'KING','PRESIDENT',NULL,'81-11-17',5000,NULL,10);
INSERT INTO EMP VALUES (7698,'BLAKE','MANAGER',7839,'81-05-01',2850,NULL,30);
INSERT INTO EMP VALUES (7782,'CLARK','MANAGER',7839,'81-05-09',2450,NULL,10);
INSERT INTO EMP VALUES (7566,'JONES','MANAGER',7839,'81-04-01',2975,NULL,20);
INSERT INTO EMP VALUES (7654,'MARTIN','SALESMAN',7698,'81-09-10',1250,1400,30);
INSERT INTO EMP VALUES (7499,'ALLEN','SALESMAN',7698,'81-02-11',1600,300,30);
INSERT INTO EMP VALUES (7844,'TURNER','SALESMAN',7698,'81-08-21',1500,0,30);
INSERT INTO EMP VALUES (7900,'JAMES','CLERK',7698,'81-12-11',950,NULL,30);
INSERT INTO EMP VALUES (7521,'WARD','SALESMAN',7698,'81-02-23',1250,500,30);
INSERT INTO EMP VALUES (7902,'FORD','ANALYST',7566,'81-12-11',3000,NULL,20);
INSERT INTO EMP VALUES (7369,'SMITH','CLERK',7902,'80-12-11',800,NULL,20);
INSERT INTO EMP VALUES (7788,'SCOTT','ANALYST',7566,'82-12-22',3000,NULL,20);
INSERT INTO EMP VALUES (7876,'ADAMS','CLERK',7788,'83-01-15',1100,NULL,20);
INSERT INTO EMP VALUES (7934,'MILLER','CLERK',7782,'82-01-11',1300,NULL,10);

commit;

drop  table  salgrade;

create table salgrade
( grade   number(10),
  losal   number(10),
  hisal   number(10) );

insert into salgrade  values(1,700,1200);
insert into salgrade  values(2,1201,1400);
insert into salgrade  values(3,1401,2000);
insert into salgrade  values(4,2001,3000);
insert into salgrade  values(5,3001,9999);

commit;

select * from tab;
select * from dept;

--문제
select empno,
    ename,
    sal
from emp;
------------------
select *
from emp;
------------------
select EMPNO 사원번호,
    ENAME 사원이름,
    SAL Salay
from emp;
------------------
select ename || sal
from emp;  
------------------
select ename || '의 월급은 ' || sal || ' 입니다.' as 월급정보
from emp;
------------------
select ename || '의 직업은 ' || job || ' 입니다.' as 직업정보
from emp;
------------------
SELECT EMPNO AS 사원번호,
    ENAME AS 사원이름,
    SAL AS "sALARY"
FROM EMP;
-- "  "을 붙혀야 하는 경우
-- 1) 대소 문자를 구분하여 출력할 때
-- 2) 공백 문자를 출력할 때
-- 3) 특수 문자를 출력할 때( $, _, #만 가능)
------------------
SELECT JOB FROM EMP ORDER BY JOB ASC;
------------------
SELECT DISTINCT JOB FROM EMP ORDER BY JOB ASC;
--DISTINCT: 중복 제외
------------------
SELECT * --속성(열), 컬럼을 선택
FROM EMP; --테이블위치를 선택
------------------
SELECT ENAME, SAL FROM EMP ORDER BY SAL DESC;
--SAL 기준으로 오름차순 정렬하시오
--프로그램의 작동순서를 알아야 한다. 
-- (FROM으로 위치를 정하고 SELECT로 출력할 열을 정하고 그뒤에 옵션을 통해 출력방식을 정한다.)
------------------
SELECT RPAD(ENAME,6),
    LPAD(DEPTNO,8),
    SAL
FROM EMP
ORDER BY DEPTNO ASC, SAL DESC;
--DEPTNO먼저 정렬을 한 후에 SAL을 다음으로 정렬한다.
--ORDER BY 3 ASC, 2 DESC;
--3번째 열을 내림차순,2번째 열을 오름차순으로 한다.
------------------
SELECT ENAME 이름,
    SAL 월급
FROM EMP
WHERE SAL >= 3000;--SAL이 3000 이상만 출력한다.
--WHERE 월급 >=3000; FROM -> WHERE -> SELECT므로 
--월급이 처리되지 못한채 월급을찾으려 하여 에러가 발생한다.
--NOT: !=, <>, ^=
------------------
SELECT 1 + '2'
FROM DUAL;
-- ' '문자타입
--2는 문자인데 덧셈 연산이 수행된다. => 자동 형변환
--컴파일러는 2를 숫자로 변환해서 연산하는 이를 묵시적
--형변환 이라고 한다.
------------------
SELECT TO_CHAR(SYSDATE, 'YY'),
    TO_CHAR(SYSDATE, 'YYYY'),
    TO_CHAR(SYSDATE, 'MM'),
    TO_CHAR(SYSDATE, 'MON'),
    TO_CHAR(SYSDATE, 'YYYYMMDD') AS 응용적용1,
    TO_CHAR(TO_DATE('20220516'), 'YYYYMMDD') AS 응용적용2
FROM DUAL;
------------------
SELECT TO_CHAR(SYSDATE, 'HH:MI:SS PM') 시간형식,
    TO_CHAR(SYSDATE, 'YYYY/MM/DD HH:MI:SS PM') 날짜와_시간조합
FROM DUAL;
------------------
SELECT TO_CHAR(SALARY, '99,999.00')
FROM EMP;
------------------
SELECT TO_DATE('20220516','YYMMDD')
FROM DUAL;
------------------
