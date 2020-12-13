select h.hacker_id as id, h.name as name, sum(s.score) as tot_score from hackers h
inner join (select hacker_id, challenge_id, max(score) as score from submissions
            group by hacker_id, challenge_id
           ) s
on h.hacker_id = s.hacker_id
group by h.hacker_id, h.name
having sum(s.score) !=0
order by tot_score desc, id
