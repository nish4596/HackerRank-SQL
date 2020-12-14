select name+'('+left(occupation,1)+')' from occupations
order by name;
Select 'There are a total of '  + cast(count(name) as nvarchar)+' '+ lower(Occupation)+'s.' from occupations
group by Occupation
order by count(name), occupation
