#利用日期函数打上实时事实类标签
drop table if exists mall_customer_realtime_tag;
create table mall_customer_realtime_tag as 
select a.userid,
case when a.last_visit >= DATE_SUB(curdate(),INTERVAL 30 DAY) then "一个月活跃" else "近一个月不活跃" end as "近一个月活跃标签",
case when a.last_visit >= DATE_SUB(curdate(),INTERVAL 90 DAY) then "近三个月活跃" else "近三个月不活跃" end as "近三个月活跃标签",
case when a.last_visit >= DATE_SUB(curdate(),INTERVAL 180 DAY) then "近六个月活跃" else "近六个月不活跃" end as "近六个月活跃标签",
case when a.last_visit >= DATE_SUB(curdate(),INTERVAL 360 DAY) then "近十二个月活跃" else "近十二个月不活跃" end as "近十二个月活跃标签"
from 
(select userid,max(date) as last_visit
from mall_customers_tld_header
group by userid) a
group by userid;
