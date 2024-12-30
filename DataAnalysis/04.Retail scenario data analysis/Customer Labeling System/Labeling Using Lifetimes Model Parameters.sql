#先建立lifetimes模型基础表，计算每个会员的frequency，recency，t，real recency
drop table if exists mall_customers_lifetimes_base;
create table mall_customers_lifetimes_base as
select userid,
count(*) - 1 as frequency,
datediff(max(date),min(date)) as recency,
datediff(curdate(),min(date)) as t,
datediff(curdate(),max(date)) as real_recency
from mall_customers_tld_header
group by userid;

#将python中训练好的模型参数添加到数据库中，引用并计算存活概率
drop table if exists mall_customer_lifetime_prob;
create table mall_customer_lifetime_prob as
select distinct userid,
frequency,recency,t,real_recency,coldstart_flag,log_div,
if(coldstart_flag = 1,null,1 / (1 + exp(log_div))) as alive_prob
from
(select distinct a.userid,
a.frequency,a.recency,a.t,a.real_recency,
if(frequency = 0,1,0) as coldstart_flag,
(gamma + frequency) * log((alpha + t) / (alpha + recency)) + log(a / (b + greatest(frequency, 1) - 1)) as log_div
from mall_customers_lifetimes_base a
join mall_customer_lftm_param c)aa
;
#不加on的join就是将关联步骤停止在笛卡尔积这一步，对于只有4列参数的表2来说，就是把4个参数赋值给表1里的每一行

#设置阈值并打上标签
drop table if exists mall_customer_alive_tag;
create table mall_customer_alive_tag as
select *,case when alive_prob>0.5 then 'alive' when alive_prob is null then 'no reference' else 'dead' end as alive_tag
from mall_customer_lifetime_prob;
