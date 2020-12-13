select t1.id, t1.age, t1.cn, t1.pow 
from (
    select w.id as id, wp.age as age ,w.coins_needed as cn, w.power as pow,
    row_number() over(partition by wp.age, w.power order by w.coins_needed) as rownum
    from wands w
    inner join wands_property wp
    on w.code = wp.code
    where wp.is_evil=0
    ) t1
where rownum = 1
order by t1.pow desc, t1.age desc
