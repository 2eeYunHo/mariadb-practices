-- ##함수 : 날짜 함수
-- curdate(), current_date;
select curdate(), current_date();

-- curtime(), current_time;
select curtime(), current_time();

-- now() vs sysdate() :별
select now(), sysdate();
select now(), sleep(6), now(),sysdate();
select sysdate(), sleep(6), sysdate();

-- date_format
-- 2022년 05월 13일 11:39분 50초
select date_format(now(), '%Y년 %m월 %d일 %h시 %i분 %s초');
select date_format(now(), '%y년 %c월 %d일 %h시 %I분 %S초');

-- period_diff
-- YYMM, YYYYMM 
-- ex) 근무개월 수 (이날짜와(), 이날짜의 차이) 
select period_diff(date_format(curdate(),'%Y%m'), date_format(hire_date,'%Y%m')) as month
from employees
order by  month desc;
-- order by period_diff(date_format(curdate(),'%Y%m'), date_format(hire_date,'%Y%m')) desc;를 상단처럼 month로 줄이는게 가능alter

-- date_add(=adddate), date_sub(=subdate)
-- 날짜를 date에 type(day, month, year) 형식의 표현식을 더하거나 뺀다.
-- ex) 각 사원들의 근무년 수가(근속5년은) 5년이 되는 날은 언제인가?
select first_name, hire_date, date_add(hire_date, interval(5) year )
   from employees;
   
-- cast
select '12345' + '10',cast('12345' as int)+10, concat('1234','10');
select date_format('22-10-10','%Y년 %m월 %d일'), date_format(cast('2022-10-10' as date), '%Y년 %m월 %d일');
select cast(cast(1-2 as unsigned) as signed);
-- mysql typep // 아래 두개는 다름varchar는 공간이 남으면 남는공간을 줄여줌 효율적이나 대신에 속도가 떨어짐 
-- varchar(10), char(10), text, CLOB(character Large Object)
-- signed (unsigned), int(integer), medium int, big int, int(11)
-- float, double
-- time, date, datetime, now, sysdate,cur(시리즈)
-- Lob의 종류 : CLOB, BLOB(BinaryLarge Object)
