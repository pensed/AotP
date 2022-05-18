SELECT ENAME, SAL, JOB
FROM EMP
WHERE JOB IN('SALESMAN', 'ANALYST', 'MANAGER');
-- SALESMAN, ANALIST, MANAGER�� ������ �����ͼ� �ش� ���� ����Ͽ���
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
--������ SALESMAN�̰� SAL�� 1200�̻��� ENAME�� ����Ͻÿ�
SELECT ENAME, SAL, JOB
FROM EMP
WHERE JOB IN 'SALESMAN' AND SAL >= 1200;
------------------------------
--�Ի����� 1982/01/01���� 1982/12/31�� ������ ����Ͻÿ�.
SELECT ENAME, HIREDATE, JOB
FROM EMP
WHERE HIREDATE BETWEEN TO_DATE('1982/01/01', 'YYYY/MM/DD')
                    AND TO_DATE('1982/12/31', 'YYYY/MM/DD')
ORDER BY HIREDATE ASC;
------------------------------
SELECT * FROM EMP;
------------------------------
--����Ϻ��� ���� ���� ���� �� ��� �ϻ���
SELECT ENAME, HIREDATE �Ի���, TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE),0) ������
FROM EMP;
------------------------------
SELECT TO_DATE('2019-06-01', 'YYYY-MM-DD') - TO_DATE('2018-10-01','YYYY-MM-DD') AS ��¥����
FROM DUAL;
------------------------------
--NULL���� 0���� ����϶�
SELECT ENAME, SAL, NVL(COMM, 0), NVL(SAL+COMM, 0)
FROM EMP
WHERE JOB IN ('SALESMAN', 'ANALYST');
------------------------------
--NULL���� 0���� ����϶�
SELECT ENAME, SAL,
    DECODE(COMM, NULL, 0, COMM) COMM, 
    DECODE(SAL+COMM, NULL, 0, SAL) SAL_COMM
FROM EMP
WHERE JOB IN ('SALESMAN', 'ANALYST');
------------------------------
--�μ� ��ȣ�� 10�̸� 300�� 20�̸� 40�� �ƴϸ� 0�� ������ �ϻ���
SELECT DEPTNO, ENAME,
    DECODE(DEPTNO, 10, SAL+300, 20, SAL+40, SAL) SAL
FROM EMP;
------------------------------
--�μ��� SALESMAN�̸� ���ʽ� 5000��� �������� 2000���
SELECT JOB, SAL �޿�, DECODE(JOB, 'SALESMAN', SAL+5000, SAL+2000) �����ȱ޿�
FROM EMP;
------------------------------
SELECT ENAME, SAL,JOB,
    DECODE(SAL, 3000, SAL+500,2000, SAL+300, 1000, SAL+200, SAL) �����ȱ޿� 
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
-- JOB�� SALESMAN, ANALYST�� 500,
-- JOB�� CLERK, MANAGER�̸� 400,
-- ��� ���ǿ� 0
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
--SAL�߿� �ִ밪�� ���Ͻÿ�
SELECT ENAME, SAL,
RANK() OVER(ORDER BY SAL DESC)
FROM EMP;
-------------------------------
--JOB�� SALESMAN
SELECT ENAME, MAX(SAL) AS ������_����, JOB
--,JOB �ϸ� ������ ���� ������?
FROM EMP
WHERE JOB IN ('SALESMAN')
GROUP BY ENAME,JOB, SAL;

SELECT JOB, SAL
FROM EMP
WHERE JOB IN ('SALESMAN');
------------------------------
SELECT MIN(SAL) AS ����_1����, JOB
FROM EMP
GROUP BY JOB
ORDER BY ����_1���� ASC;
------------------------------
SELECT DECODE(MIN(SAL), NULL, 'NULL�̳�', 0), NVL(MIN(SAL),0)
FROM EMP
WHERE 1=2;
----------------------------
--�������� �ּҿ����� ��������� SALESMAN�� �����ϰ� ����Ͻÿ�
SELECT MIN(SAL) AS ����_1����, JOB
FROM EMP
WHERE JOB NOT IN ('SALESMAN')
GROUP BY JOB
ORDER BY ����_1���� ASC;
----------------------------
--ENAME���� SAL�� ��հ��� ���Ͻÿ�.

SELECT TRUNC(NVL(AVG(COMM),0),0) ����, JOB
FROM EMP
GROUP BY JOB
ORDER BY ���� DESC;
----------------------------
SELECT TRUNC(AVG(NVL(COMM,0)),0) ����
FROM EMP;
----------------------------
SELECT SUM(COMM)
FROM EMP;
------------------------------
SELECT SUM(NVL(COMM,0)) --NVL �ʿ� x
FROM EMP;
------------------------------
--JOB�� JOB�� ��Ż ������ ���
SELECT SUM(sal) �����, JOB
FROM EMP
GROUP BY JOB
ORDER BY ����� DESC;
------------------------------
--�׷캰 ���� ������ 4000�� ������ �հ踦 ����Ͻÿ�.
SELECT SUM(sal) ����, JOB
FROM EMP
GROUP BY JOB    --GROUP BY�� �����ڸ� �� ��� HAVING�� ��� �Ѵ�.
HAVING SUM(SAL) >= 4000
ORDER BY ���� DESC;
------------------------------
SELECT COUNT(COMM) AS COUNT--�׷��Լ��� NULL�� �����Ѵ�.
FROM EMP;
SELECT COUNT(NVL(COMM,0))
FROM EMP;
------------------------------
--������ ANALYST�� ENAME, SAL�� SAL�� ������ ����Ͻÿ�
SELECT ENAME, JOB, SAL, RANK() OVER(ORDER BY SAL DESC) AS RANK
FROM EMP;
------------------------------
SELECT ENAME,SAL, JOB,
    RANK () OVER(PARTITION BY JOB ORDER BY SAL DESC)����
FROM EMP;
--GROUP BY : Ư�� ���ϴ� �÷��� ���ؼ� ������ �����ϳ�, ��ü �����Ϳ��� 
--           ���ϴ� ��� ����ϱ� �����.
--PARTITION BY : ��ü �����Ϳ��� �c�� �κ��� ������� ���� �� �� �ִ�.
------------------------------
--�Ի����� 81�� 11�� 17���� ��� ���̺� ��ü ����� �� ���°�� �Ի��� ������ ���
SELECT HIREDATE,DENSE_RANK('81/11/17') OVER(ORDER BY HIREDATE ) ����
FROM EMP; -- ����
SELECT DENSE_RANK('81/11/17') WITHIN GROUP (ORDER BY HIREDATE ASC) ����
FROM EMP;
------------------------------
