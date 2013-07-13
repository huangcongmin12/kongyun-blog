select DATE_FORMAT(create_time,"%Y-%m") ,count(*)
from article 
group by DATE_FORMAT(create_time,"%Y-%m")
order by DATE_FORMAT(create_time,"%Y-%m")  desc


select * 
from article 
where DATE_FORMAT(create_time,"%Y-%m")='2013-01'
order by DATE_FORMAT(create_time,"%Y-%m")  desc