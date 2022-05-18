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