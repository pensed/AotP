SELECT MAX(SALARY) �ִ�,
    MIN(SALARY) �ּڰ�,
    MAX(FIRST_NAME) �ִ빮�ڰ�,
    MIN(FIRST_NAME) �ּҹ��ڰ�
FROM EMPLOYEES;
-------------------------------------
--GROUP BY
SELECT  JOB_ID ����, 
        SUM(SALARY) ������_�ѱ޿�, 
        AVG(SALARY) ������_��ձ޿�
FROM EMPLOYEES
WHERE EMPLOYEE_ID >= 10
GROUP BY JOB_ID
ORDER BY ������_�ѱ޿� DESC, ������_��ձ޿�;
-------------------------------------
SELECT  JOB_ID job_id_��׷�, 
        manager_id manager_id_�߱׷�,
        SUM(SALARY) ������_�ѱ޿�, 
        AVG(SALARY) ������_��ձ޿�
FROM EMPLOYEES
WHERE EMPLOYEE_ID >= 10
GROUP BY JOB_ID, MANAGER_ID
ORDER BY ������_�ѱ޿� DESC, ������_��ձ޿�;
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
SELECT JOB_ID ����,                                  --4
    SUM(SALARY) ������_�ѱ޿�,    
    AVG(SALARY) ������_��ձ޿�   
FROM EMPLOYEES                                      --1
WHERE EMPLOYEE_ID >= 10                             --2
GROUP BY JOB_ID                                     --3
HAVING SUM(SALARY) > 30000 -- GROUP BY�� ������ �ɶ��� --5
-- �ݵ�� HAVING�� ��� �Ѵ�. �������� ������ �־�� �Ѵ�.
ORDER BY ������_�ѱ޿� DESC, ������_��ձ޿�;            --6
-------------------------------------
