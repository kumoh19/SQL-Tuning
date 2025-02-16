CREATE table t
AS
select d.no, e.*
from SCOTT.emp e, 
(
select ROWNUM no from dual CONNECT by level <= 1000
) d; -- test table 생성


select * from t;

-- index 생성
CREATE INDEX t_x01 on t(deptno, no);
CREATE INDEX t_x02 on t(deptno, job, no);

--생성된 index 조회
SELECT INDEX_NAME, TABLE_NAME, UNIQUENESS
FROM USER_INDEXES
WHERE TABLE_NAME = 'T';

SELECT * FROM USER_TABLES WHERE TABLE_NAME = 'T';

--통계정보 수집 명령
exec dbms_stats.gather_table_stats(user, 't');

SELECT *
FROM USER_INDEXES
WHERE INDEX_NAME = 'T_X01';

select * from t
where deptno = 10
and no = 1;
