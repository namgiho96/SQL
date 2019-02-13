- Employees ���̺�
--[ employee_id = ��� ] [ first_name = �̸� ] 
--[ last_name = �� ] [ email = �̸��� ] 
--[ phone_number = ��ȭ��ȣ ] [ hire_date = �Ի��� ]
--[ job_id = �����ڵ� ] [ salary = �޿�]
--[ commission_pct = Ŀ�̼Ǻ��� ] [ manager_id = �����̵�]
--[ department_id = �μ��ڵ�]
 
 
-- *******
-- ����001. 
-- HR ��Ű�� ���̺��� ��� ���?
-- *******
select * from tab;
 
-- *******
-- ����002. 
-- HR ��Ű�� ���̺� ���� �?
-- *******
select count(*) from tab;
 
-- *******
-- ����003. 
-- ���, ��, �̸����?
-- *******
 
select employee_id, first_name, last_name 
from Employees;
 
-- *******
-- ����004. 
-- �̸��� s�� ������ ������ �̸� ���?
-- *******
 
select first_name 
from Employees
where first_name like '%s';
 
 
-- *******
-- ����005. 
-- �̸��� s�� �����ϴ� ������ �̸� ���?
-- *******
 
select first_name 
from Employees
where first_name like 'S%';
 
-- *******
-- ����006. 
-- �޿��� ���� ������ �̸�,�μ��ڵ�,�޿� ��ȸ 
-- *******
 
select first_name, department_id, salary
from Employees
order by salary desc;
 
-- *******
-- ����007.
-- �޿��� 12000 �̻��� ���,�̸�,�μ��ڵ�, �޿� ��ȸ 
-- *******
select employee_id, first_name, department_id, salary
from Employees
where salary >= 12000;
 
 
-- *******
-- ����008.
-- �޿��� 1500�̻� 2500���ϸ� �޴� 
-- ������ ���,�̸�,�μ��ڵ�, �޿� ��ȸ (AND ���) 
-- *******
 
select employee_id, first_name, department_id, salary
from Employees
where salary >= 1500 and salary <= 2500;
 
-- *******
-- ����009.
-- �޿��� 1500�̻� 2500���ϸ� �޴� 
-- ������ ���,�̸�,�μ��ڵ�, �޿� ��ȸ (BETWEEN ���) 
-- *******
 
select employee_id, first_name, department_id, salary
from Employees
where salary between 1500 and 2500;
 
-- *******
-- ����010.
-- 2005�⵵�� �Ի��� ������ �̸��� �μ��ڵ�, 
-- �Ի����ڸ� ��ȸ
-- *******
 
select first_name, department_id, hire_date
from Employees
where hire_date between '2005/01/01' and '2005/12/31';


DESC EMPLOYEES;
CREATE VIEW EMP AS 
SELECT EMPLOYEE_ID EID,
    FIRST_NAME FNAME,
    LAST_NAME LNAME,
    EMAIL,
    PHONE_NUMBER PHONE,
    HIRE_DATE HDATE,
    JOB_ID JID,
    SALARY SAL,
    COMMISSION_PCT COMM,
    MANAGER_ID MID,
    DEPARTMENT_ID DID 
FROM EMPLOYEES;
 
DESC JOBS;
CREATE VIEW JOB AS
SELECT 
    JOB_ID JID,
    JOB_TITLE TITLE,
    MIN_SALARY MINSAL, 
    MAX_SALARY MAXSAL
FROM JOBS;
 
SELECT * FROM TAB;
-- *******
-- ����011. 
 
-- Ŀ�̼��� ���� ���ϴ� ������ �̸�,�����ڵ�,�޿�,Ŀ�̼Ǻ����� ��ȸ
-- *******
SELECT FNAME, JID, SAL, COMM 
FROM EMP 
WHERE COMM IS NULL;
 
-- *******
-- ����012. 
-- ����� 110,120,130�� ����� ���, ��, �̸� ��ȸ
-- *******
 
SELECT EID, FNAME, LNAME
FROM EMP
WHERE EID IN ('110','120','130'); 
 
 
-- *******
-- ����013. 
-- �μ��ڵ�� ��������, �޿��� ������������ 
-- �μ��ڵ�, �޿�, ���, �̸�, �� ����
-- �������� 0,1,2 ... �������� 9,8,7...
-- ******
SELECT DID, SAL, EID, FNAME, LNAME
FROM EMP
ORDER BY DID, SAL DESC;
 
 
 
-- *******
-- ����014. 
-- �̸��� am �̶� ���ڰ� ���Ե� ������ ���,�̸�, ��
-- *******
SELECT EID,FNAME,LNAME
FROM EMP
WHERE FNAME LIKE '%am%';
 
-- *******
-- ����015. 
-- �̸��Ͽ� 'GG' �� 'KK'�δܾ� �� �ϳ��� ���ԵǾ ��ȸ
-- ��, ��ҹ��� ������
-- *******
SELECT EMAIL
FROM EMP
WHERE EMAIL LIKE '%GG%'
    OR EMAIL LIKE '%KK%';
 
-- *******
-- ����016. 
-- �̸����ּҰ� A �� �������� �ʴ� �̸��� ����
-- *******
SELECT COUNT(EMAIL)
FROM EMP
WHERE EMAIL NOT LIKE 'A%';
-- *******
-- ����017.
-- ���� �ι�°,����° ���ڰ� ���ÿ� e �� ������ �̸�, ��
-- *******
 
SELECT FNAME, LNAME
FROM EMP
WHERE LNAME LIKE '_ee%';
 
-- *******
-- ����018
 -- �����ӱ��� 10000�� �̻��� ���� �� �� ������ ǥ���Ѵ�
-- *******
SELECT JID, TITLE, MINSAL, MAXSAL
FROM JOB
WHERE MINSAL>10000;
 
 
 
-- *******************
-- [����19]
-- 2002����� 2005����� 
-- ������ ������ �̸��� ���� ���ڸ� ǥ���Ѵ�.
-- *******************
SELECT FNAME,HDATE
FROM EMP
WHERE HDATE BETWEEN '2002/01/01' AND '2005/12/31';
 
-- *******************
-- [����020]
-- IT Programmer �Ǵ� Sales Man�� 
-- ������ �̸�, �Ի���, �����ڵ� ǥ��.
-- *******************
SELECT FNAME �̸�, HDATE �Ի���, JID �����ڵ�
FROM EMP
WHERE JID IN ('IT_PROG', 'SA_MAN');


DESC EMPLOYEES;
CREATE VIEW EMP AS 
SELECT EMPLOYEE_ID EID,
    FIRST_NAME FNAME,
    LAST_NAME LNAME,
    EMAIL,
    PHONE_NUMBER PHONE,
    HIRE_DATE HDATE,
    JOB_ID JID,
    SALARY SAL,
    COMMISSION_PCT COMM,
    MANAGER_ID MID,
    DEPARTMENT_ID DID 
FROM EMPLOYEES;
 
DESC JOBS;
CREATE VIEW JOB AS
SELECT 
    JOB_ID JID,
    JOB_TITLE TITLE,
    MIN_SALARY MINSAL, 
    MAX_SALARY MAXSAL
FROM JOBS;
 
DESC DEPARTMENTS;
CREATE VIEW DEP AS
SELECT
DEPARTMENT_ID DID,
DEPARTMENT_NAME DNAME,
MANAGER_ID MID,
LOCATION_ID LID
FROM DEPARTMENTS;
 
DESC LOCATIONS;
CREATE VIEW LOC AS 
SELECT
    LOCATION_ID LID,
    STREET_ADDRESS ADDR,
    POSTAL_CODE ZIP,
    CITY,
    STATE_PROVINCE PROV,
    COUNTRY_ID CID
FROM LOCATIONS;
SELECT * FROM TAB;
 
DESC JOB_HISTORY;
CREATE VIEW HIS AS
SELECT
 EMPLOYEE_ID EID,
 START_DATE SDATE,
 END_DATE EDATE,
 JOB_ID JID,
 DEPARTMENT_ID DID
FROM JOB_HISTORY;
 
 
-- *******************
-- [����021]
-- JOB_TITLE �� "Programmer" �Ǵ� "Sales Manager"�� 
-- ������ �̸�, �Ի���, ������ ǥ��.
-- ������ �̸��� ������������ �����Ͻÿ�
-- *******************
 
SELECT E.FNAME �̸�, E.HDATE �Ի���, J.TITLE ������
FROM JOB J
    INNER JOIN EMP E 
    ON J.JID LIKE E.JID
WHERE J.TITLE IN('Programmer','Sales Manager')
ORDER BY E.FNAME;
 
 
-- *******************
-- [����022]
-- �μ��� �� �������̸� ǥ��
-- (��, �÷����� ������ [����] �̸� �� �ǵ��� ...)
-- DEPARTMENTS ���� MANAGER_ID �� ������ �ڵ�
-- *******************  
 
SELECT DNAME �μ��� , 
    FNAME "������ �̸�"
FROM DEP D
    INNER JOIN EMP E
    ON D.MID LIKE E.EID;
 
 
-- *******************
-- [����023]
-- ������(Marketing) �μ����� �ٹ��ϴ� ����� 
-- ���, ��å, �̸�, �ټӱⰣ
-- (��, �ټӱⰣ�� JOB_HISTORY ���� END_DATE-START_DATE�� ���� ��)
-- EMPLOYEE_ID ���, JOB_TITLE ��å��
-- *******************  
 
 
SELECT D.DID 
    FROM DEP D
    WHERE D.DNAME LIKE 'Marketing' ;
    -- �� 20
 
SELECT E.EID ���, J.TITLE ��å, E.FNAME �̸�, 
        H.EDATE - H.SDATE �ټ��ϼ� 
FROM HIS H
    JOIN JOB J 
        ON H.JID LIKE J.JID
    JOIN EMP E
        ON E.EID LIKE H.EID
WHERE E.DID LIKE 20;
 
SELECT E.EID ���, J.TITLE ��å, E.FNAME �̸�, 
        H.EDATE - H.SDATE �ټ��ϼ� 
FROM HIS H
    JOIN JOB J 
        ON H.JID LIKE J.JID
    JOIN EMP E
        ON E.EID LIKE H.EID
WHERE E.DID LIKE (SELECT D.DID 
                  FROM DEP D
                  WHERE D.DNAME LIKE 'Marketing');
 
-- *******************
-- [����024]
--  ��å�� "Programmer"�� ����� ������ ��� 
-- DEPARTMENT_NAME �μ���, �̸�(FIRST_NAME + [����] + LAST_NAME)���� ���
-- �̸��� �ߺ��Ǿ ��µ�. �� �Ѹ��� �����μ����� ������ ������
-- *******************  
 
SELECT 
    DNAME �μ���, FNAME || ' ' || LNAME �̸�
FROM EMP E 
    JOIN JOB J
        ON E.JID LIKE J.JID
    JOIN DEP D
        ON E.DID LIKE D.DID
WHERE J.JID LIKE (SELECT JID 
                  FROM JOB 
                  WHERE TITLE LIKE 'Programmer')
;
    
 
    
-- *******************
-- [����025]
-- �μ���, ������ �̸�, �μ���ġ ���� ǥ��
-- �μ��� ��������
-- *******************    
SELECT 
    D.DNAME �μ���, 
    E.FNAME ||' '|| E.LNAME "������ �̸�", 
    L.CITY "�μ���ġ ����"
FROM DEP D
    JOIN EMP E 
        ON D.MID LIKE E.EID
    JOIN LOC L
        USING(LID)
ORDER BY DNAME;
 
 
 
-- *******************
-- [����026]
--  �μ���, "�μ��� ��� �޿�" �� ����Ͻÿ�
-- *******************    
SELECT 
    D.DNAME �μ���,
    ROUND(AVG(E.SAL),2) "�μ��� ��� �޿�"
FROM EMP E
    JOIN DEP D 
        ON E.DID LIKE D.DID
GROUP BY E.DID, D.DNAME
;
 
 
 
 
-- *******************
-- [����027]
-- �μ��� ��� �޿��� 10000 �� �Ѵ�
--  �μ���, "�μ��� ��� �޿�" �� ����Ͻÿ�
-- *******************  
 
SELECT 
    D.DNAME �μ���,
    ROUND(AVG(E.SAL),2) "�μ��� ��� �޿�"
FROM EMP E
    JOIN DEP D 
        ON E.DID LIKE D.DID
GROUP BY E.DID, D.DNAME
HAVING ROUND(AVG(E.SAL),2) >= 10000
;
 
-- *******************
-- [����028]
-- ���� �������� 10% �λ�� �޾��� ���� ��������
-- å���Ǿ����ϴ�. ���� ������� ����޿���
-- ����ϼ���.
-- ��, ���� = �޿� * 12 �Դϴ�
-- *********************
 
SELECT
 EID ���,
 FNAME||' '||LNAME �̸�,
 SAL ���ر޿�,
 (SAL*12 + (SAL*12)*0.1) /12 ����޿�
FROM EMP;
 
-- *******************
-- [����029]
-- �μ����� ����ϴ� �����ڿ� ������ 
-- �ѹ����� ����Ͻÿ� (20��)
-- *********************
 
SELECT * FROM EMP;
SELECT * FROM DEP;
SELECT * FROM JOB;
 
SELECT
    DISTINCT D.DNAME �μ�,
    E.FNAME ������,
    J.TITLE ����
FROM EMP E
    JOIN DEP D
        ON E.EID LIKE D.MID
    JOIN JOB J
        ON E.JID LIKE J.JID
   
;
 
SELECT * FROM DEP;
-- *******************
-- [����030]
-- �̹� �б⿡ IT�μ�(�μ���: IT)������ �ű� ���α׷��� �����ϰ� 
-- �����Ͽ� ȸ�翡 �����Ͽ���. 
-- �̿� �ش� �μ��� ��� �޿��� 12.3% �λ��Ͽ� �����մϴ�.
-- ������(�ݿø�) ǥ���Ͽ� ������ �ۼ��Ͻÿ�. 
-- ������ �����ȣ, ���� �̸�(�̸�), 
-- �޿�, ���� ������ ����Ͻÿ�
-- �޾��� õ��������
-- *********************
 
SELECT
    E.EID ���,
    E.FNAME||' '||E.LNAME �̸�,    
    TO_CHAR(ROUND(E.SAL+(E.SAL * (12.3/100))),
        'l9,999,999'
        ) "�λ�� �޿�"
FROM EMP E
WHERE E.DID LIKE (
                SELECT D.DID
                FROM DEP D
                WHERE D.DNAME LIKE 'IT'
                )
 
 
;

