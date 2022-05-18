SELECT ENAME, SAL, JOB
FROM EMP
WHERE JOB IN('SALESMAN', 'ANALYST', 'MANAGER');
-- SALESMAN, ANALIST, MANAGER인 직업을 가져와서 해당 열을 출력하여라
------------------------------
SELECT ENAME, SAL, JOB
FROM EMP
WHERE JOB = 'SALESMAN'
OR JOB = 'ANALYST'
OR JOB = 'MANAGER';
------------------------------
SELECT ENAME, SAL, JOB
FROM EMP
WHERE JOB NOT IN('SALESMAN', 'ANALYST', 'MANAGER');
------------------------------
SELECT ENAME, SAL, JOB
FROM EMP
WHERE NOT JOB = 'SALESMAN'
AND NOT JOB = 'ANALYST'
AND NOT JOB = 'MANAGER';
------------------------------
--직업이 SALESMAN이고 SAL이 1200이상인 ENAME를 출력하시오
SELECT ENAME, SAL, JOB
FROM EMP
WHERE JOB IN 'SALESMAN' AND SAL >= 1200;
------------------------------
--입사일이 1982/01/01부터 1982/12/31인 직원을 출력하시오.
SELECT ENAME, HIREDATE, JOB
FROM EMP
WHERE HIREDATE BETWEEN TO_DATE('1982/01/01', 'YYYY/MM/DD')
                    AND TO_DATE('1982/12/31', 'YYYY/MM/DD')
ORDER BY HIREDATE ASC;
------------------------------
SELECT * FROM EMP;
------------------------------
--고용일부터 오늘 까지 개월 수 출력 하새오
SELECT ENAME, HIREDATE 입사일, TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE),0) 개월차
FROM EMP;
------------------------------
SELECT TO_DATE('2019-06-01', 'YYYY-MM-DD') - TO_DATE('2018-10-01','YYYY-MM-DD') AS 날짜빼기
FROM DUAL;
------------------------------
--NULL값을 0으로 출력하라
SELECT ENAME, SAL, NVL(COMM, 0), NVL(SAL+COMM, 0)
FROM EMP
WHERE JOB IN ('SALESMAN', 'ANALYST');
------------------------------
--NULL값을 0으로 출력하라
SELECT ENAME, SAL,
    DECODE(COMM, NULL, 0, COMM) COMM, 
    DECODE(SAL+COMM, NULL, 0, SAL) SAL_COMM
FROM EMP
WHERE JOB IN ('SALESMAN', 'ANALYST');
------------------------------
--부섭 번호가 10이면 300을 20이면 40을 아니면 0이 나오게 하새오
SELECT DEPTNO, ENAME,
    DECODE(DEPTNO, 10, SAL+300, 20, SAL+40, SAL) SAL
FROM EMP;
------------------------------
--부서가 SALESMAN이면 보너스 5000출력 나머지는 2000출력
SELECT JOB, SAL 급여, DECODE(JOB, 'SALESMAN', SAL+5000, SAL+2000) 조정된급여
FROM EMP;
------------------------------
SELECT ENAME, SAL,JOB,
    DECODE(SAL, 3000, SAL+500,2000, SAL+300, 1000, SAL+200, SAL) 조정된급여 
FROM EMP
WHERE JOB IN ('SALESMAN', 'ANALYST');
------------------------------
SELECT ENAME, JOB, SAL,
    CASE
        WHEN SAL >= 3000 THEN 500
        WHEN SAL >= 2000 THEN 300
        WHEN SAL >= 1000 THEN 200
        ELSE 0 END AS BONUS
FROM EMP
WHERE JOB IN ('SALESMAN', 'ANALYST');
------------------------------
-- JOB가 SALESMAN, ANALYST면 500,
-- JOB이 CLERK, MANAGER이면 400,
-- 상기 조건외 0
--1
SELECT ENAME, JOB, SAL,
    CASE
        WHEN JOB = 'SALESMAN' THEN 500
        WHEN JOB = 'ANALYST' THEN 500
        WHEN JOB = 'MANAGER' THEN 400
        WHEN JOB = 'CLERK' THEN 400
        ELSE 0 END AS BONUS
FROM EMP;
-------------------------------
--2
SELECT ENAME, JOB, SAL,
    CASE
        WHEN JOB IN ('SALESMAN','ANALYST') THEN 500
        WHEN JOB IN ('MANAGER','CLERK') THEN 400
        ELSE 0 END AS BONUS
FROM EMP;
-------------------------------
--SAL중에 최대값을 구하시오
SELECT ENAME, SAL,
RANK() OVER(ORDER BY SAL DESC)
FROM EMP;
-------------------------------
--JOB가 SALESMAN
SELECT ENAME, MAX(SAL) AS 영업직_정점, JOB
--,JOB 하면 에러가 나는 이유는?
FROM EMP
WHERE JOB IN ('SALESMAN')
GROUP BY ENAME,JOB, SAL;

SELECT JOB, SAL
FROM EMP
WHERE JOB IN ('SALESMAN');
------------------------------
SELECT MIN(SAL) AS 하위_1프로, JOB
FROM EMP
GROUP BY JOB
ORDER BY 하위_1프로 ASC;
------------------------------
SELECT DECODE(MIN(SAL), NULL, 'NULL이네', 0), NVL(MIN(SAL),0)
FROM EMP
WHERE 1=2;
----------------------------
--직업별로 최소월급을 출력하지만 SALESMAN은 제외하고 출력하시오
SELECT MIN(SAL) AS 하위_1프로, JOB
FROM EMP
WHERE JOB NOT IN ('SALESMAN')
GROUP BY JOB
ORDER BY 하위_1프로 ASC;
----------------------------
--ENAME들의 SAL의 평균값을 구하시오.

SELECT TRUNC(NVL(AVG(COMM),0),0) 수듄, JOB
FROM EMP
GROUP BY JOB
ORDER BY 수듄 DESC;
----------------------------
SELECT TRUNC(AVG(NVL(COMM,0)),0) 수듄
FROM EMP;
----------------------------
SELECT SUM(COMM)
FROM EMP;
------------------------------
SELECT SUM(NVL(COMM,0)) --NVL 필요 x
FROM EMP;
------------------------------
--JOB과 JOB별 토탈 월급을 출력
SELECT SUM(sal) 원기옥, JOB
FROM EMP
GROUP BY JOB
ORDER BY 원기옥 DESC;
------------------------------
--그룹별 월급 총합이 4000인 직업과 합계를 출력하시오.
SELECT SUM(sal) 수듄, JOB
FROM EMP
GROUP BY JOB    --GROUP BY에 조건자를 줄 경우 HAVING을 써야 한다.
HAVING SUM(SAL) >= 4000
ORDER BY 수듄 DESC;
------------------------------
SELECT COUNT(COMM) AS COUNT--그룹함수는 NULL을 제외한다.
FROM EMP;
SELECT COUNT(NVL(COMM,0))
FROM EMP;
------------------------------
--직업이 ANALYST인 ENAME, SAL을 SAL의 순위로 출력하시오
SELECT ENAME, JOB, SAL, RANK() OVER(ORDER BY SAL DESC) AS RANK
FROM EMP;
------------------------------
SELECT ENAME,SAL, JOB,
    RANK () OVER(PARTITION BY JOB ORDER BY SAL DESC)순위
FROM EMP;
--GROUP BY : 특정 원하는 컬럼에 대해서 추출이 가능하나, 전체 데이터에서 
--           원하는 결과 출력하기 힘들다.
--PARTITION BY : 전체 데이터에서 웒는 부분의 결과값을 보여 줄 수 있다.
------------------------------
--입사일이 81년 11월 17일인 사원 테이블 전체 사원들 중 몇번째로 입사한 것인지 출력
SELECT HIREDATE,DENSE_RANK('81/11/17') OVER(ORDER BY HIREDATE ) 순위
FROM EMP; -- 오류
SELECT DENSE_RANK('81/11/17') WITHIN GROUP (ORDER BY HIREDATE ASC) 순위
FROM EMP;
------------------------------
