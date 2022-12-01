# SELECT 필드이름 FROM 테이블이름 WHERE 조건식;
select * from usertbl where name = '김경호';
select userID, name, addr from usertbl where name = '김경호';
select userID, name, birthYear from usertbl where birthYear > 1975;
select userID, addr from usertbl where addr = '경기';
select userID, addr from usertbl where addr = '서울';
select userID, addr from usertbl where userID LIKE "L%";
select userID, name, addr as address from usertbl where addr ='서울';

select num, userID, prodName, price, amount from buytbl where userID = 'KBS';
select num, userID, prodName, price, amount from buytbl where userID = 'BBK';

# 문제 1970년 이후에 태어나고 신장이 182cm 이상인 사람의 userid와 name을 출력하시오
select userID, name from usertbl where birthYear > 1970;
select userID, name from usertbl where height >= 182;
select userID, name from usertbl where birthYear >= 1970 and height >= 182;

# 문제 1960년 이후에 태어났거나 신장이 175cm 이상인 사람의 userid와 name을 출력하시오
select userID, name from usertbl where birthYear >= 1960 or height >= 175;

# 1980년대 이상 태어나고 키가 175 이상인 사람의 userID, name
select userID, name from usertbl where birthYear >= 1980 and height >= 175;

# 키가 180이상 183 미만인 사람 userID, name
select userID, name from usertbl where height >= 180 and height < 183;
select userID, name from usertbl where  height  between 180 and 183;

# 지역이 경남이나 전남이나 경북인 사람의 이름과 주소
select name, addr from usertbl where addr ='전남' or addr ='전북' or addr='경북';
select name, addr from usertbl where addr in('전남','전북','경북'); 

# like '김%'; 김으로 시작하는 사람을 다 뽑는다.
select userID, name from usertbl where name like '김%' or name like '이%'; 
select userID, name from usertbl where name like '김범_';
select userID, name from usertbl where name like '김_'; 
select userID, name from usertbl where name like '김_수';  # 김과 수 사이에 한 글자만 가능
select userID, name from usertbl where name like '김%수';  #시작과 끝이 김,수 
 
# like 지역
select userID, name, addr from usertbl where addr like '전%'; 
select userID, name, addr from usertbl where addr like '_남';  
 
# 서브 쿼리 - 김경호보다 키가 큰 사람
select name, height
from usertbl
where height > (select height from usertbl where name='김경호');
  
select num, userID, prodName
from buytbl
where userID in (select userID from usertbl where name like '김범수');
  

# 서브쿼리의 여러개 값을 이용하기    
select name, height
from usertbl
where height >= (select height from usertbl where addr='경남'); # 에러 발생 - 서브쿼리에서 여러 값을 반환하지 못함.
 
select height from usertbl where addr='경남';

# any와 all의 차이, 퀴즈
select name, height
from usertbl
where height >= ANY(select height from usertbl where addr='경남'); # or의 개념 - 170보다 크거나 173보다 크면 된다 - OR

select name, height
from usertbl
where height >= ALL(select height from usertbl where addr='경남'); # or의 개념 - 170보다 크고 173보다 크면 된다 - AND

#in 사용하기
select *
from usertbl
where height in (select height from usertbl where addr='경남'); # 가져온 키와 같은 사람을 출력

# 정렬하기
select *
from usertbl
order by name asc; -- asc는 오름차순

select *
from usertbl
order by name; -- asc는 생략해도 기본값

select *
from usertbl
order by name desc;

select name, height
from usertbl
order by height DESC, name ASC;  #키로 내림차순 - 같은 값이 있으면 이름으로 오름차순

select name, height
from usertbl
order by height DESC, name DESC;  #키로 내림차순 - 같은 값이 있으면 이름으로 내림차순

select name, height
from usertbl
order by height DESC, name;  #키로 내림차순 - 같은 값이 있으면 이름으로 오름차순


# 중복된 것은 하나만 남기는 DISTINCT
select addr from usertbl;
select addr from usertbl order by addr;
select DISTINCT addr from usertbl; # 중복된 값을 허용하지 않는다

#db 옮기기
use employees;
select emp_no, hire_date from employees
order by hire_Date asc;  -- hire_date를 오름차순으로 정렬, 30만개

select emp_no, hire_date from employees
order by hire_Date asc limit 5;  -- 최대 출력 갯수 제한

#테이블 복사
use sqldb;
create table buytbl2 (select * from buytbl); # 서브쿼리를 이용해 새로 만든 테이블에 넣음. new table에 old table 모든 내용 옮김, 원래있던 테이블도 그대로 유지

# 일부만 생성
create table buytbl3 (select userID, prodName from buytbl); # 서브쿼리를 이용해 새로 만든 테이블에 넣음
select * from buytbl3;

# group by와 sum 함수 이용
select userID, amount   -- 에러발생
from buytbl 
group by userID;

select userID, SUM(amount) # 그룹으로 묶으면서 같은 id를 가진사람의 총액을 구할 수 있다.
from buytbl 
group by userID;

select userID, avg(amount) # 그룹으로 묶으면서 같은 id를 가진사람의 가격 평균을 구할 수 있다.
from buytbl 
group by userID;

select userID, count(amount)  # 그룹으로 묶으면서 같은 id를 가진사람이 시킨 액수의 개수 = 물건의 개수을 구할 수 있다.
from buytbl 
group by userID;
select addr from usertbl group by addr;

#as로 애칭 붙이기
select userID as '사용자 아이디', 
SUM(amount) as '총 구매 개수' 
from buytbl 
group by userID;

select userID as '사용자 아이디', SUM(price*amount) as '총 구매 액' 
from buytbl 
group by userID; -- 데이터의 중복성 최소화, 계산 값을 저장하기보다 그때그때 게산하는 것이 더 효율적일 수 있다.

select addr, count(userID) as '지역에 사는 사람 수' 
from usertbl 
group by addr;

# 집계함수
use sqldb;
select userID, avg(amount) as '평균 구매 개수' 
from buytbl
group by userID;

select name,max(height),min(height)  # 오류 발생
from buytbl
group by userID;

select name, height from usertbl
where height =(select max(height) from usertbl) or height = (select min(height) from usertbl);

select count(mobile1) as '핸드폰이 있는 사용자'  # null 제외
from usertbl;

select count(*) as '모든 사용자' from usertbl;

# group by를 사용하면 having
select userID as '사용자', 
sum(price*amount) AS '총 구매액'
from buytbl
where sum(price*amount) > 1000 #group by는 where이 아닌 group by를 사용
group by userID;

select userID as '사용자', 
sum(price*amount) AS '총 구매액'
from buytbl
group by userID
having sum(price*amount) > 1000; #group by한 결과 중에 조건절을 걸고 싶을때

select userID as '사용자', 
sum(price*amount) AS '총 구매액'
from buytbl
group by userID
having sum(price*amount) > 1000
order by sum(price*amount); # group by, having, order by를 여러개 같이 사용할 수 있다.

select userID as '사용자', 
sum(price*amount) AS '총 구매액'
from buytbl
group by userID
having sum(price*amount) > 1000
order by sum(price*amount) desc; # 집계 함수로도 order by를 할 수 있다.

# roll up - 중간 합계
select num, groupName,sum(price*amount) AS '비용'
from buytbl
group by groupName, num
with rollup;

select groupName,sum(price*amount) AS '비용'
from buytbl
group by groupName
with rollup; # groupname을 이용