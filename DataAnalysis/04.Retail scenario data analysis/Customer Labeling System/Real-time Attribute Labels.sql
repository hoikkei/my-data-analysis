#�������ں�������ʵʱ��ʵ���ǩ
drop table if exists mall_customer_realtime_tag;
create table mall_customer_realtime_tag as 
select a.userid,
case when a.last_visit >= DATE_SUB(curdate(),INTERVAL 30 DAY) then "һ���»�Ծ" else "��һ���²���Ծ" end as "��һ���»�Ծ��ǩ",
case when a.last_visit >= DATE_SUB(curdate(),INTERVAL 90 DAY) then "�������»�Ծ" else "�������²���Ծ" end as "�������»�Ծ��ǩ",
case when a.last_visit >= DATE_SUB(curdate(),INTERVAL 180 DAY) then "�������»�Ծ" else "�������²���Ծ" end as "�������»�Ծ��ǩ",
case when a.last_visit >= DATE_SUB(curdate(),INTERVAL 360 DAY) then "��ʮ�����»�Ծ" else "��ʮ�����²���Ծ" end as "��ʮ�����»�Ծ��ǩ"
from 
(select userid,max(date) as last_visit
from mall_customers_tld_header
group by userid) a
group by userid;
