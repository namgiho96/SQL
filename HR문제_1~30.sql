- Employees 테이블
--[ employee_id = 사번 ] [ first_name = 이름 ] 
--[ last_name = 성 ] [ email = 이메일 ] 
--[ phone_number = 전화번호 ] [ hire_date = 입사일 ]
--[ job_id = 업무코드 ] [ salary = 급여]
--[ commission_pct = 커미션비율 ] [ manager_id = 상사아이디]
--[ department_id = 부서코드]
 
 
-- *******
-- 문제001. 
-- HR 스키마 테이블을 모두 출력?
-- *******
select * from tab;
 
-- *******
-- 문제002. 
-- HR 스키마 테이블 수는 몇개?
-- *******
select count(*) from tab;
 
-- *******
-- 문제003. 
-- 사번, 성, 이름출력?
-- *******
 
select employee_id, first_name, last_name 
from Employees;
 
-- *******
-- 문제004. 
-- 이름이 s로 끝나는 직원의 이름 출력?
-- *******
 
select first_name 
from Employees
where first_name like '%s';
 
 
-- *******
-- 문제005. 
-- 이름이 s로 시작하는 직원의 이름 출력?
-- *******
 
select first_name 
from Employees
where first_name like 'S%';
 
-- *******
-- 문제006. 
-- 급여가 많은 순으로 이름,부서코드,급여 조회 
-- *******
 
select first_name, department_id, salary
from Employees
order by salary desc;
 
-- *******
-- 문제007.
-- 급여가 12000 이상인 사번,이름,부서코드, 급여 조회 
-- *******
select employee_id, first_name, department_id, salary
from Employees
where salary >= 12000;
 
 
-- *******
-- 문제008.
-- 급여가 1500이상 2500이하를 받는 
-- 직원의 사번,이름,부서코드, 급여 조회 (AND 사용) 
-- *******
 
select employee_id, first_name, department_id, salary
from Employees
where salary >= 1500 and salary <= 2500;
 
-- *******
-- 문제009.
-- 급여가 1500이상 2500이하를 받는 
-- 직원의 사번,이름,부서코드, 급여 조회 (BETWEEN 사용) 
-- *******
 
select employee_id, first_name, department_id, salary
from Employees
where salary between 1500 and 2500;
 
-- *******
-- 문제010.
-- 2005년도에 입사한 직원의 이름과 부서코드, 
-- 입사일자를 조회
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
-- 문제011. 
 
-- 커미션을 받지 못하는 직원의 이름,업무코드,급여,커미션비율을 조회
-- *******
SELECT FNAME, JID, SAL, COMM 
FROM EMP 
WHERE COMM IS NULL;
 
-- *******
-- 문제012. 
-- 사번이 110,120,130인 사원의 사번, 성, 이름 조회
-- *******
 
SELECT EID, FNAME, LNAME
FROM EMP
WHERE EID IN ('110','120','130'); 
 
 
-- *******
-- 문제013. 
-- 부서코드는 오름차순, 급여는 내림차순으로 
-- 부서코드, 급여, 사번, 이름, 성 정렬
-- 오름차순 0,1,2 ... 내림차순 9,8,7...
-- ******
SELECT DID, SAL, EID, FNAME, LNAME
FROM EMP
ORDER BY DID, SAL DESC;
 
 
 
-- *******
-- 문제014. 
-- 이름에 am 이란 글자가 포함된 직원의 사번,이름, 성
-- *******
SELECT EID,FNAME,LNAME
FROM EMP
WHERE FNAME LIKE '%am%';
 
-- *******
-- 문제015. 
-- 이메일에 'GG' 와 'KK'두단어 중 하나만 포함되어도 조회
-- 단, 대소문자 구분함
-- *******
SELECT EMAIL
FROM EMP
WHERE EMAIL LIKE '%GG%'
    OR EMAIL LIKE '%KK%';
 
-- *******
-- 문제016. 
-- 이메일주소가 A 로 시작하지 않는 이메일 갯수
-- *******
SELECT COUNT(EMAIL)
FROM EMP
WHERE EMAIL NOT LIKE 'A%';
-- *******
-- 문제017.
-- 성의 두번째,세번째 글자가 동시에 e 인 직원의 이름, 성
-- *******
 
SELECT FNAME, LNAME
FROM EMP
WHERE LNAME LIKE '_ee%';
 
-- *******
-- 문제018
 -- 최저임금이 10000불 이상인 업무 의 상세 내역을 표시한다
-- *******
SELECT JID, TITLE, MINSAL, MAXSAL
FROM JOB
WHERE MINSAL>10000;
 
 
 
-- *******************
-- [문제19]
-- 2002년부터 2005년까지 
-- 가입한 직원의 이름과 가입 일자를 표시한다.
-- *******************
SELECT FNAME,HDATE
FROM EMP
WHERE HDATE BETWEEN '2002/01/01' AND '2005/12/31';
 
-- *******************
-- [문제020]
-- IT Programmer 또는 Sales Man인 
-- 직원의 이름, 입사일, 업무코드 표시.
-- *******************
SELECT FNAME 이름, HDATE 입사일, JID 업무코드
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
-- [문제021]
-- JOB_TITLE 가 "Programmer" 또는 "Sales Manager"인 
-- 직원의 이름, 입사일, 업무명 표시.
-- 직원의 이름을 오름차순으로 정렬하시오
-- *******************
 
SELECT E.FNAME 이름, E.HDATE 입사일, J.TITLE 업무명
FROM JOB J
    INNER JOIN EMP E 
    ON J.JID LIKE E.JID
WHERE J.TITLE IN('Programmer','Sales Manager')
ORDER BY E.FNAME;
 
 
-- *******************
-- [문제022]
-- 부서명 및 관리자이름 표시
-- (단, 컬럼명은 관리자 [공백] 이름 이 되도록 ...)
-- DEPARTMENTS 에서 MANAGER_ID 가 관리자 코드
-- *******************  
 
SELECT DNAME 부서명 , 
    FNAME "관리자 이름"
FROM DEP D
    INNER JOIN EMP E
    ON D.MID LIKE E.EID;
 
 
-- *******************
-- [문제023]
-- 마케팅(Marketing) 부서에서 근무하는 사원의 
-- 사번, 직책, 이름, 근속기간
-- (단, 근속기간은 JOB_HISTORY 에서 END_DATE-START_DATE로 구할 것)
-- EMPLOYEE_ID 사번, JOB_TITLE 직책임
-- *******************  
 
 
SELECT D.DID 
    FROM DEP D
    WHERE D.DNAME LIKE 'Marketing' ;
    -- 답 20
 
SELECT E.EID 사번, J.TITLE 직책, E.FNAME 이름, 
        H.EDATE - H.SDATE 근속일수 
FROM HIS H
    JOIN JOB J 
        ON H.JID LIKE J.JID
    JOIN EMP E
        ON E.EID LIKE H.EID
WHERE E.DID LIKE 20;
 
SELECT E.EID 사번, J.TITLE 직책, E.FNAME 이름, 
        H.EDATE - H.SDATE 근속일수 
FROM HIS H
    JOIN JOB J 
        ON H.JID LIKE J.JID
    JOIN EMP E
        ON E.EID LIKE H.EID
WHERE E.DID LIKE (SELECT D.DID 
                  FROM DEP D
                  WHERE D.DNAME LIKE 'Marketing');
 
-- *******************
-- [문제024]
--  직책이 "Programmer"인 사원의 정보를 출력 
-- DEPARTMENT_NAME 부서명, 이름(FIRST_NAME + [공백] + LAST_NAME)까지 출력
-- 이름은 중복되어서 출력됨. 즉 한명이 여러부서에서 업무를 수행함
-- *******************  
 
SELECT 
    DNAME 부서명, FNAME || ' ' || LNAME 이름
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
-- [문제025]
-- 부서명, 관리자 이름, 부서위치 도시 표시
-- 부서명 오름차순
-- *******************    
SELECT 
    D.DNAME 부서명, 
    E.FNAME ||' '|| E.LNAME "관리자 이름", 
    L.CITY "부서위치 도시"
FROM DEP D
    JOIN EMP E 
        ON D.MID LIKE E.EID
    JOIN LOC L
        USING(LID)
ORDER BY DNAME;
 
 
 
-- *******************
-- [문제026]
--  부서명, "부서별 평균 급여" 를 출력하시오
-- *******************    
SELECT 
    D.DNAME 부서명,
    ROUND(AVG(E.SAL),2) "부서별 평균 급여"
FROM EMP E
    JOIN DEP D 
        ON E.DID LIKE D.DID
GROUP BY E.DID, D.DNAME
;
 
 
 
 
-- *******************
-- [문제027]
-- 부서별 평균 급여가 10000 이 넘는
--  부서명, "부서별 평균 급여" 를 출력하시오
-- *******************  
 
SELECT 
    D.DNAME 부서명,
    ROUND(AVG(E.SAL),2) "부서별 평균 급여"
FROM EMP E
    JOIN DEP D 
        ON E.DID LIKE D.DID
GROUP BY E.DID, D.DNAME
HAVING ROUND(AVG(E.SAL),2) >= 10000
;
 
-- *******************
-- [문제028]
-- 올해 연봉에서 10% 인상된 급액이 내년 연봉으로
-- 책정되었습니다. 내년 전사원의 내년급여를
-- 출력하세요.
-- 단, 연봉 = 급여 * 12 입니다
-- *********************
 
SELECT
 EID 사번,
 FNAME||' '||LNAME 이름,
 SAL 올해급여,
 (SAL*12 + (SAL*12)*0.1) /12 내년급여
FROM EMP;
 
-- *******************
-- [문제029]
-- 부서별로 담당하는 관리자와 업무를 
-- 한번씩만 출력하시오 (20행)
-- *********************
 
SELECT * FROM EMP;
SELECT * FROM DEP;
SELECT * FROM JOB;
 
SELECT
    DISTINCT D.DNAME 부서,
    E.FNAME 관리자,
    J.TITLE 업무
FROM EMP E
    JOIN DEP D
        ON E.EID LIKE D.MID
    JOIN JOB J
        ON E.JID LIKE J.JID
   
;
 
SELECT * FROM DEP;
-- *******************
-- [문제030]
-- 이번 분기에 IT부서(부서명: IT)에서는 신규 프로그램을 개발하고 
-- 보급하여 회사에 공헌하였다. 
-- 이에 해당 부서의 사원 급여를 12.3% 인상하여 지급합니다.
-- 정수만(반올림) 표시하여 보고서를 작성하시오. 
-- 보고서는 사원번호, 성과 이름(이름), 
-- 급여, 내년 순으로 출력하시오
-- 급액은 천원단위임
-- *********************
 
SELECT
    E.EID 사번,
    E.FNAME||' '||E.LNAME 이름,    
    TO_CHAR(ROUND(E.SAL+(E.SAL * (12.3/100))),
        'l9,999,999'
        ) "인상된 급여"
FROM EMP E
WHERE E.DID LIKE (
                SELECT D.DID
                FROM DEP D
                WHERE D.DNAME LIKE 'IT'
                )
 
 
;

