with temp as 
    (
    select h.hacker_id as id, h.name as name, count(c.challenge_id) as cnt from hackers h
    inner join challenges c
    on h.hacker_id=c.hacker_id
    group by h.hacker_id,h.name
    )
select id, name , cnt from temp
where cnt = (select max(cnt) from temp) or
      cnt in (select cnt from temp
              group by cnt
              having count(cnt)=1)
order by cnt desc, id
