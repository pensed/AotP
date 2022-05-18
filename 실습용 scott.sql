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

--����
select empno,
    ename,
    sal
from emp;
------------------
select *
from emp;
------------------
select EMPNO �����ȣ,
    ENAME ����̸�,
    SAL Salay
from emp;
------------------
select ename || sal
from emp;  
------------------
select ename || '�� ������ ' || sal || ' �Դϴ�.' as ��������
from emp;
------------------
select ename || '�� ������ ' || job || ' �Դϴ�.' as ��������
from emp;
------------------
SELECT EMPNO AS �����ȣ,
    ENAME AS ����̸�,
    SAL AS "sALARY"
FROM EMP;
-- "  "�� ������ �ϴ� ���
-- 1) ��� ���ڸ� �����Ͽ� ����� ��
-- 2) ���� ���ڸ� ����� ��
-- 3) Ư�� ���ڸ� ����� ��( $, _, #�� ����)
------------------
SELECT JOB FROM EMP ORDER BY JOB ASC;
------------------
SELECT DISTINCT JOB FROM EMP ORDER BY JOB ASC;
--DISTINCT: �ߺ� ����
------------------
SELECT * --�Ӽ�(��), �÷��� ����
FROM EMP; --���̺���ġ�� ����
------------------
SELECT ENAME, SAL FROM EMP ORDER BY SAL DESC;
--SAL �������� �������� �����Ͻÿ�
--���α׷��� �۵������� �˾ƾ� �Ѵ�. 
-- (FROM���� ��ġ�� ���ϰ� SELECT�� ����� ���� ���ϰ� �׵ڿ� �ɼ��� ���� ��¹���� ���Ѵ�.)
------------------
SELECT RPAD(ENAME,6),
    LPAD(DEPTNO,8),
    SAL
FROM EMP
ORDER BY DEPTNO ASC, SAL DESC;
--DEPTNO���� ������ �� �Ŀ� SAL�� �������� �����Ѵ�.
--ORDER BY 3 ASC, 2 DESC;
--3��° ���� ��������,2��° ���� ������������ �Ѵ�.
------------------
SELECT ENAME �̸�,
    SAL ����
FROM EMP
WHERE SAL >= 3000;--SAL�� 3000 �̻� ����Ѵ�.
--WHERE ���� >=3000; FROM -> WHERE -> SELECT�Ƿ� 
--������ ó������ ����ä ������ã���� �Ͽ� ������ �߻��Ѵ�.
--NOT: !=, <>, ^=
------------------
SELECT 1 + '2'
FROM DUAL;
-- ' '����Ÿ��
--2�� �����ε� ���� ������ ����ȴ�. => �ڵ� ����ȯ
--�����Ϸ��� 2�� ���ڷ� ��ȯ�ؼ� �����ϴ� �̸� ������
--����ȯ �̶�� �Ѵ�.
------------------
SELECT TO_CHAR(SYSDATE, 'YY'),
    TO_CHAR(SYSDATE, 'YYYY'),
    TO_CHAR(SYSDATE, 'MM'),
    TO_CHAR(SYSDATE, 'MON'),
    TO_CHAR(SYSDATE, 'YYYYMMDD') AS ��������1,
    TO_CHAR(TO_DATE('20220516'), 'YYYYMMDD') AS ��������2
FROM DUAL;
------------------
SELECT TO_CHAR(SYSDATE, 'HH:MI:SS PM') �ð�����,
    TO_CHAR(SYSDATE, 'YYYY/MM/DD HH:MI:SS PM') ��¥��_�ð�����
FROM DUAL;
------------------
SELECT TO_CHAR(SALARY, '99,999.00')
FROM EMP;
------------------
SELECT TO_DATE('20220516','YYMMDD')
FROM DUAL;
------------------
