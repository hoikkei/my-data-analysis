#�Ƚ���lifetimesģ�ͻ���������ÿ����Ա��frequency��recency��t��real recency
drop table if exists mall_customers_lifetimes_base;
create table mall_customers_lifetimes_base as
select userid,
count(*) - 1 as frequency,
datediff(max(date),min(date)) as recency,
datediff(curdate(),min(date)) as t,
datediff(curdate(),max(date)) as real_recency
from mall_customers_tld_header
group by userid;

#��python��ѵ���õ�ģ�Ͳ�����ӵ����ݿ��У����ò����������
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
#����on��join���ǽ���������ֹͣ�ڵѿ�������һ��������ֻ��4�в����ı�2��˵�����ǰ�4��������ֵ����1���ÿһ��

#������ֵ�����ϱ�ǩ
drop table if exists mall_customer_alive_tag;
create table mall_customer_alive_tag as
select *,case when alive_prob>0.5 then 'alive' when alive_prob is null then 'no reference' else 'dead' end as alive_tag
from mall_customer_lifetime_prob;
