#��ʵʱ��ǩ��Ԥ�����ǩ��ͳ�����ǩ����
drop table if exists mall_customer_overall_tag;
create table mall_customer_overall_tag as
select a.*,b.cluster_group,c.alive_tag,d.age_group_tag,d.income_tag,d.spending_tag,d.daypart_preference_tag,d.weekday_preference_tag,d.accompany_preference_tag,d.target_preference_tag,d.history_tag
from mall_customer_realtime_tag a left join 
mall_customers_cluster_tag b on a.userid=b.customerid left join 
mall_customer_alive_tag c on a.userid=c.userid left join 
mall_customer_aggregation_tags d on a.userid=d.customerid;


#�ҳ���������Ǳ�����û�
SELECT count(distinct userid) as customer_base 
FROM `mall_customer_overall_tag`
where income_tag='��������Ⱥ' and spending_tag='��������Ⱥ';

#�ҳ���������Ⱥ�и�������Ⱥ������ƫ��
select count(distinct userid) as customer_base,
target_preference_tag
from mall_customer_overall_tag
where income_tag='��������Ⱥ' and spending_tag='��������Ⱥ'
group by target_preference_tag;

#�鿴����cluster��Ⱥ�ֲ�
select count(distinct userid) as customer_base,cluster_group
from mall_customer_overall_tag
group by cluster_group
order by customer_base desc;

#Ѹ����ȡ��һ�����й����׵���ͨ������Ⱥ
select distinct userid
from mall_customer_overall_tag
where `��һ���»�Ծ��ǩ`='һ���»�Ծ' and spending_tag='��ͨ������Ⱥ';


