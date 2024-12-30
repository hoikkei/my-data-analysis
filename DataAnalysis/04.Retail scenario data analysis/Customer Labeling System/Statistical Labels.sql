#基于年龄的标签
select customerid,
case when age <=18 then '青少年' 
when age between 19 and 24 then '青年'
when age between 25 and 35 then '中青年'
when age between 36 and 45 then '中年'
when age between 46 and 55 then '中老年'
else '老年' end as age_group_tag
from mall_customers;

#基于收入
select customerid,
case when Annual_Income>=50 then '高收入人群'
else '普通收入人群' end as income_tag
from mall_customers;

#基于在商场中的消费指数
select customerid,
case when Spending_Score>= 50 then '高消费人群'
when Spending_Score between 11 and 49 then '普通消费人群'
when Spending_Score=0 then '无消费人群'
else '低消费人群' end as spending_tag
from mall_customers;

#基于12个月内访问次数
select customerid,
case when visits_p12>= 12 then '高频访客'
when visits_p12 between 6 and 11 then '中频访客'
else '低频访客' end as freq_tag
from mall_customers;

#基于比例的偏好标签
select customerid,
case when morning_visits_p12/visits_p12> 0.5 then '早间访客' 
when afternoon_visit_p12/visits_p12>0.5 then '午间访客'
when evening_visits_p12/visits_p12>0.5 then '晚间访客'
else null end as daypart_preference_tag
from mall_customers;

select customerid,
case when weekday_visits_p12/visits_p12> 0.5 then '周中访客' 
when weekend_visits_p12/visits_p12>0.5 then '周末访客'
else null end as weekday_preference_tag
from mall_customers;

select customerid,
case when with_kids_visits_p12/visits_p12> 0.5 then '热衷带娃' 
when with_couple_visits_p12/visits_p12>0.5 then '热衷恋爱'
else null end as accompany_preference_tag
from mall_customers;

select customerid,
case when clothing_spending_score/Spending_Score> 0.5 then '时尚达人' 
when foodbeverage_spending_score/Spending_Score>0.5 then '饮食男女'
when entertainment_spending_score/Spending_Score>0.5 then '娱乐至上'
when kids_spending_score/Spending_Score>0.5 then '鸡娃狂魔'
else null end as target_preference_tag
from mall_customers;

#基于用户历史
select customerid,
case when first_visit_till_today <=30 then '新顾客'
when first_visit_till_today>=180  then '老顾客'
else '普通顾客' end as history_tag
from mall_customers;

#所有标签汇总
drop table if exists mall_customer_aggregation_tags;
create table mall_customer_aggregation_tags as
select customerid,
case when age <=18 then '青少年' 
when age between 19 and 24 then '青年'
when age between 25 and 35 then '中青年'
when age between 36 and 45 then '中年'
when age between 46 and 55 then '中老年'
else '老年' end as age_group_tag,
case when Annual_Income>=50 then '高收入人群'
else '普通收入人群' end as income_tag,
case when Spending_Score>= 50 then '高消费人群'
when Spending_Score between 11 and 49 then '普通消费人群'
when Spending_Score=0 then '无消费人群'
else '低消费人群' end as spending_tag,
case when morning_visits_p12/visits_p12> 0.5 then '早间访客' 
when afternoon_visit_p12/visits_p12>0.5 then '午间访客'
when evening_visits_p12/visits_p12>0.5 then '晚间访客'
else null end as daypart_preference_tag,
case when weekday_visits_p12/visits_p12> 0.5 then '周中访客' 
when weekend_visits_p12/visits_p12>0.5 then '周末访客'
else null end as weekday_preference_tag,
case when with_kids_visits_p12/visits_p12> 0.5 then '热衷带娃' 
when with_couple_visits_p12/visits_p12>0.5 then '热衷恋爱'
else null end as accompany_preference_tag,
case when clothing_spending_score/Spending_Score> 0.5 then '时尚达人' 
when foodbeverage_spending_score/Spending_Score>0.5 then '饮食男女'
when entertainment_spending_score/Spending_Score>0.5 then '娱乐至上'
when kids_spending_score/Spending_Score>0.5 then '鸡娃狂魔'
else null end as target_preference_tag,
case when first_visit_till_today <=30 then '新顾客'
when first_visit_till_today>=180  then '老顾客'
else '普通顾客' end as history_tag
from mall_customers;

