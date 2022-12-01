# use databases;
# use 데이터베이스명; 은 어떤 데이터베이스를 실행할지 지정하는 것
# 옆에 데이터베이스 이름이 bold로 변화면서 사용할 수 있음 # 결과창 - 초록색 체크: 성공, 빨간색 액스: 실패, 이유 확인하기
use employees;
use shopdb;

# 현재 어떤 데이터 베이스가 있는지 볼 수 있음 
show databases;

# 현재 들어간 데이터 베이스의 테이블 정보를 보여줌 
show table status;
# 테이블 이름만 보여줌
show tables;

#테이블에 설정한 type 등을 볼 수 있음 - 필드에 대한 정확한 정보
desc titles;
select emp_no, from_date from titles;

select first_name, last_name, gender from employees;

# 쿼리입력하고 ;(세미콜론) 반드시 입력하는 습관 들이기
# create database db이름 # db 생성하기
create database sqldb;
# drop database db이름 # db 삭제하기
drop database sqldb;