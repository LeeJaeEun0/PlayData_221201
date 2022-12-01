# 퀴즈의 정답
# any와 all의 차이all
select name, height
from usertbl
where height >= ANY(select height from usertbl where addr='경남'); # or의 개념 - 170보다 크거나 173보다 크면 된다 - OR

select name, height
from usertbl
where height >= ALL(select height from usertbl where addr='경남'); # or의 개념 - 170보다 크고 173보다 크면 된다 - AND

select name, height
from usertbl
where height = ANY(select height from usertbl where addr='경남'); # or의 개념 - 170보다 크거나 173보다 크면 된다 == 같은 결과만 나와라

select name, height
from usertbl
where height = ALL(select height from usertbl where addr='경남'); # and의 개념 - 170과 같고 173과 같은 사람은 없다!!!!