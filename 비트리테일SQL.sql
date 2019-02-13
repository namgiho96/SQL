SELECT ROWNUM  RNUM
FROM CUSTOMERS;

SELECT T2.*
FROM (SELECT  ROWNUM R2,T.* 
			FROM(SELECT ROWNUM RNUM ,C.*  
                             FROM CUSTOMERS C  
                             ORDER BY RNUM desc  ) T ) T2
WHERE RNUM BETWEEN 1 AND 5;


SELECT ROWNUM RNUM ,C.*  
FROM CUSTOMERS C  
ORDER BY RNUM desc;

select  rownum r2 ,t.*
from (SELECT ROWNUM RNUM ,C.*  
FROM CUSTOMERS C  
ORDER BY RNUM desc) t;

select *
from (select  rownum r2 ,t.*
            from (SELECT ROWNUM RNUM ,C.*  
                        FROM CUSTOMERS C  
                        ORDER BY RNUM desc) t)
where r2 between 6 and 10;