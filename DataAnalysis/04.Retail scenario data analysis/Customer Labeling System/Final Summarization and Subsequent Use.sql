#将实时标签，预测类标签，统计类标签汇总
drop table if exists mall_customer_overall_tag;
create table mall_customer_overall_tag as
select a.*,b.cluster_group,c.alive_tag,d.age_group_tag,d.income_tag,d.spending_tag,d.daypart_preference_tag,d.weekday_preference_tag,d.accompany_preference_tag,d.target_preference_tag,d.history_tag
from mall_customer_realtime_tag a left join 
mall_customers_cluster_tag b on a.userid=b.customerid left join 
mall_customer_alive_tag c on a.userid=c.userid left join 
mall_customer_aggregation_tags d on a.userid=d.customerid;


#找出最有消费潜力的用户
SELECT count(distinct userid) as customer_base 
FROM `mall_customer_overall_tag`
where income_tag='高收入人群' and spending_tag='低消费人群';

#找出高收入人群中高消费人群的消费偏好
select count(distinct userid) as customer_base,
target_preference_tag
from mall_customer_overall_tag
where income_tag='高收入人群' and spending_tag='高消费人群'
group by target_preference_tag;

#查看各个cluster人群分布
select count(distinct userid) as customer_base,cluster_group
from mall_customer_overall_tag
group by cluster_group
order by customer_base desc;

#迅速提取近一个月有过交易的普通消费人群
select distinct userid
from mall_customer_overall_tag
where `近一个月活跃标签`='一个月活跃' and spending_tag='普通消费人群';


