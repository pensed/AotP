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