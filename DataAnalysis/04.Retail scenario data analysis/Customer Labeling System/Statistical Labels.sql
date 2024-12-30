#��������ı�ǩ
select customerid,
case when age <=18 then '������' 
when age between 19 and 24 then '����'
when age between 25 and 35 then '������'
when age between 36 and 45 then '����'
when age between 46 and 55 then '������'
else '����' end as age_group_tag
from mall_customers;

#��������
select customerid,
case when Annual_Income>=50 then '��������Ⱥ'
else '��ͨ������Ⱥ' end as income_tag
from mall_customers;

#�������̳��е�����ָ��
select customerid,
case when Spending_Score>= 50 then '��������Ⱥ'
when Spending_Score between 11 and 49 then '��ͨ������Ⱥ'
when Spending_Score=0 then '��������Ⱥ'
else '��������Ⱥ' end as spending_tag
from mall_customers;

#����12�����ڷ��ʴ���
select customerid,
case when visits_p12>= 12 then '��Ƶ�ÿ�'
when visits_p12 between 6 and 11 then '��Ƶ�ÿ�'
else '��Ƶ�ÿ�' end as freq_tag
from mall_customers;

#���ڱ�����ƫ�ñ�ǩ
select customerid,
case when morning_visits_p12/visits_p12> 0.5 then '���ÿ�' 
when afternoon_visit_p12/visits_p12>0.5 then '���ÿ�'
when evening_visits_p12/visits_p12>0.5 then '���ÿ�'
else null end as daypart_preference_tag
from mall_customers;

select customerid,
case when weekday_visits_p12/visits_p12> 0.5 then '���зÿ�' 
when weekend_visits_p12/visits_p12>0.5 then '��ĩ�ÿ�'
else null end as weekday_preference_tag
from mall_customers;

select customerid,
case when with_kids_visits_p12/visits_p12> 0.5 then '���Դ���' 
when with_couple_visits_p12/visits_p12>0.5 then '��������'
else null end as accompany_preference_tag
from mall_customers;

select customerid,
case when clothing_spending_score/Spending_Score> 0.5 then 'ʱ�д���' 
when foodbeverage_spending_score/Spending_Score>0.5 then '��ʳ��Ů'
when entertainment_spending_score/Spending_Score>0.5 then '��������'
when kids_spending_score/Spending_Score>0.5 then '���޿�ħ'
else null end as target_preference_tag
from mall_customers;

#�����û���ʷ
select customerid,
case when first_visit_till_today <=30 then '�¹˿�'
when first_visit_till_today>=180  then '�Ϲ˿�'
else '��ͨ�˿�' end as history_tag
from mall_customers;

#���б�ǩ����
drop table if exists mall_customer_aggregation_tags;
create table mall_customer_aggregation_tags as
select customerid,
case when age <=18 then '������' 
when age between 19 and 24 then '����'
when age between 25 and 35 then '������'
when age between 36 and 45 then '����'
when age between 46 and 55 then '������'
else '����' end as age_group_tag,
case when Annual_Income>=50 then '��������Ⱥ'
else '��ͨ������Ⱥ' end as income_tag,
case when Spending_Score>= 50 then '��������Ⱥ'
when Spending_Score between 11 and 49 then '��ͨ������Ⱥ'
when Spending_Score=0 then '��������Ⱥ'
else '��������Ⱥ' end as spending_tag,
case when morning_visits_p12/visits_p12> 0.5 then '���ÿ�' 
when afternoon_visit_p12/visits_p12>0.5 then '���ÿ�'
when evening_visits_p12/visits_p12>0.5 then '���ÿ�'
else null end as daypart_preference_tag,
case when weekday_visits_p12/visits_p12> 0.5 then '���зÿ�' 
when weekend_visits_p12/visits_p12>0.5 then '��ĩ�ÿ�'
else null end as weekday_preference_tag,
case when with_kids_visits_p12/visits_p12> 0.5 then '���Դ���' 
when with_couple_visits_p12/visits_p12>0.5 then '��������'
else null end as accompany_preference_tag,
case when clothing_spending_score/Spending_Score> 0.5 then 'ʱ�д���' 
when foodbeverage_spending_score/Spending_Score>0.5 then '��ʳ��Ů'
when entertainment_spending_score/Spending_Score>0.5 then '��������'
when kids_spending_score/Spending_Score>0.5 then '���޿�ħ'
else null end as target_preference_tag,
case when first_visit_till_today <=30 then '�¹˿�'
when first_visit_till_today>=180  then '�Ϲ˿�'
else '��ͨ�˿�' end as history_tag
from mall_customers;

