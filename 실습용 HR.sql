SELECT MAX(SALARY) 최댓값,
    MIN(SALARY) 최솟값,
    MAX(FIRST_NAME) 최대문자값,
    MIN(FIRST_NAME) 최소문자값
FROM EMPLOYEES;
-------------------------------------
--GROUP BY
SELECT  JOB_ID 직무, 
        SUM(SALARY) 직무별_총급여, 
        AVG(SALARY) 직무별_평균급여
FROM EMPLOYEES
WHERE EMPLOYEE_ID >= 10
GROUP BY JOB_ID
ORDER BY 직무별_총급여 DESC, 직무별_평균급여;
-------------------------------------
SELECT  JOB_ID job_id_대그룹, 
        manager_id manager_id_중그룹,
        SUM(SALARY) 직무별_총급여, 
        AVG(SALARY) 직무별_평균급여
FROM EMPLOYEES
WHERE EMPLOYEE_ID >= 10
GROUP BY JOB_ID, MANAGER_ID
ORDER BY 직무별_총급여 DESC, 직무별_평균급여;
-------------------------------------
SELECT JOB_ID, MANAGER_ID, SALARY
FROM EMPLOYEES;
-------------------------------------
SELECT JOB_ID, SUM(SALARY)
FROM EMPLOYEES
GROUP BY JOB_ID;
-------------------------------------
SELECT JOB_ID, MANAGER_ID, SUM(SALARY)
FROM EMPLOYEES
GROUP BY JOB_ID, MANAGER_ID;
-------------------------------------
--HAVING
SELECT JOB_ID 직무,                                  --4
    SUM(SALARY) 직무별_총급여,    
    AVG(SALARY) 직무별_평균급여   
FROM EMPLOYEES                                      --1
WHERE EMPLOYEE_ID >= 10                             --2
GROUP BY JOB_ID                                     --3
HAVING SUM(SALARY) > 30000 -- GROUP BY에 조건을 걸때는 --5
-- 반드시 HAVING을 써야 한다. 위조건을 가지고 있어야 한다.
ORDER BY 직무별_총급여 DESC, 직무별_평균급여;            --6
-------------------------------------
