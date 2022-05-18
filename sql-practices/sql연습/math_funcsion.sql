-- 함수 : math

-- abs
select abs(-1), abs(1);

-- mod 나머지
select mod(10,3);

-- ceil 올림
select ceil(3.14), ceiling(3.14);

-- floor 내림
select floor(3.14);

-- round(x) : x에 가장 근접한 정수
-- round(x,d) : x값 중에 소수점 d자리에 가장 근접한 실수 
select round(1.498), round(1.498, 1), round(1.498, 0);

-- power(x, y), pow(x, y) : x의 y승 x^y
select power(2,10), pow(2, 10);

-- sign(x) 양수면 1 음수면 -1 
select sign(20), sign(-100);

-- greatest(x,y ,.,.,.,)중에 최댓값, least(x,y,z,.....) 중에 최솟값을 구해준다
select greatest(100, 20, 10,1), least(100, 20, 10,1);
select greatest('b', 'A','C'), greatest('Hello', 'hello','hellp'), least('b','A','C');
