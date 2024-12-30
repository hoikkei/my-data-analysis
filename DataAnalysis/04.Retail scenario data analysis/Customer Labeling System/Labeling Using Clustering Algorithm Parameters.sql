--tagging using cluster results
--step 1 calculate distance from each label center
drop table if exists mall_customer_distance;
create table mall_customer_distance as
SELECT customerid,'退休生活_周末陪伴' as cluster,
(case when gender='Female' then 1 else 0 end -0.5)*(case when gender='Female' then 1 else 0 end -0.5)+(age-62)*(age-62)+
(annual_income-65)*(annual_income-65)+(spending_score-48)*(spending_score-48)+(weekday_visits_p12-18)*(weekday_visits_p12-18)+
(weekend_visits_p12-80)*(weekend_visits_p12-80)+(visits_p12-98)*(visits_p12-98)+(weekday_spending_score-11)*(weekday_spending_score-11)+
(weekend_spending_score-37)*(weekend_spending_score-37)+(with_kids_visits_p12-18)*(with_kids_visits_p12-18)+(with_couple_visits_p12-56)*(with_couple_visits_p12-56)+
(clothing_spending_score-29)*(clothing_spending_score-29)+(foodbeverage_spending_score-14)*(foodbeverage_spending_score-14)+
(entertainment_spending_score-1)*(entertainment_spending_score-1)+(kids_spending_score-4)*(kids_spending_score-4) as distance from mall_customers
union all
SELECT customerid,'时尚精致_敢赚敢花' as cluster,
(case when gender='Female' then 1 else 0 end -0.69)*(case when gender='Female' then 1 else 0 end -0.69)+(age-33)*(age-33)+
(annual_income-45)*(annual_income-45)+(spending_score-59)*(spending_score-59)+(weekday_visits_p12-10)*(weekday_visits_p12-10)+
(weekend_visits_p12-9)*(weekend_visits_p12-9)+(visits_p12-19)*(visits_p12-19)+(weekday_spending_score-16)*(weekday_spending_score-16)+
(weekend_spending_score-43)*(weekend_spending_score-43)+(with_kids_visits_p12-6)*(with_kids_visits_p12-6)+(with_couple_visits_p12-8)*(with_couple_visits_p12-8)+
(clothing_spending_score-45)*(clothing_spending_score-45)+(foodbeverage_spending_score-5)*(foodbeverage_spending_score-5)+
(entertainment_spending_score-4)*(entertainment_spending_score-4)+(kids_spending_score-5)*(kids_spending_score-5) as distance FROM mall_customers 
union all
SELECT customerid,'精英白领_价值巅峰' as cluster,
(case when gender='Female' then 1 else 0 end -0.56)*(case when gender='Female' then 1 else 0 end -0.56)+(age-32)*(age-32)+
(annual_income-97)*(annual_income-97)+(spending_score-82)*(spending_score-82)+(weekday_visits_p12-41)*(weekday_visits_p12-41)+
(weekend_visits_p12-39)*(weekend_visits_p12-39)+(visits_p12-80)*(visits_p12-80)+(weekday_spending_score-20)*(weekday_spending_score-20)+
(weekend_spending_score-62)*(weekend_spending_score-62)+(with_kids_visits_p12-72)*(with_kids_visits_p12-72)+(with_couple_visits_p12-2)*(with_couple_visits_p12-2)+
(clothing_spending_score-24)*(clothing_spending_score-24)+(foodbeverage_spending_score-38)*(foodbeverage_spending_score-38)+
(entertainment_spending_score-8)*(entertainment_spending_score-8)+(kids_spending_score-12)*(kids_spending_score-12) as distance FROM mall_customers 
union all
SELECT customerid,'周末血拼_时尚之选' as cluster,
(case when gender='Female' then 1 else 0 end -0.59)*(case when gender='Female' then 1 else 0 end -0.59)+(age-33)*(age-33)+
(annual_income-86)*(annual_income-86)+(spending_score-83)*(spending_score-83)+(weekday_visits_p12-19)*(weekday_visits_p12-19)+
(weekend_visits_p12-17)*(weekend_visits_p12-17)+(visits_p12-36)*(visits_p12-36)+(weekday_spending_score-23)*(weekday_spending_score-23)+
(weekend_spending_score-60)*(weekend_spending_score-60)+(with_kids_visits_p12-17)*(with_kids_visits_p12-17)+(with_couple_visits_p12-12)*(with_couple_visits_p12-12)+
(clothing_spending_score-42)*(clothing_spending_score-42)+(foodbeverage_spending_score-17)*(foodbeverage_spending_score-17)+
(entertainment_spending_score-14)*(entertainment_spending_score-14)+(kids_spending_score-11)*(kids_spending_score-11) as distance FROM mall_customers
union all
SELECT customerid,'周末带娃_全栈生活' as cluster,
(case when gender='Female' then 1 else 0 end -0.62)*(case when gender='Female' then 1 else 0 end -0.62)+(age-39)*(age-39)+
(annual_income-62)*(annual_income-62)+(spending_score-48)*(spending_score-48)+(weekday_visits_p12-22)*(weekday_visits_p12-22)+
(weekend_visits_p12-30)*(weekend_visits_p12-30)+(visits_p12-52)*(visits_p12-52)+(weekday_spending_score-10)*(weekday_spending_score-10)+
(weekend_spending_score-39)*(weekend_spending_score-39)+(with_kids_visits_p12-31)*(with_kids_visits_p12-31)+(with_couple_visits_p12-10)*(with_couple_visits_p12-10)+
(clothing_spending_score-18)*(clothing_spending_score-18)+(foodbeverage_spending_score-10)*(foodbeverage_spending_score-10)+
(entertainment_spending_score-9)*(entertainment_spending_score-9)+(kids_spending_score-11)*(kids_spending_score-11) as distance FROM mall_customers
union all
SELECT customerid,'中年男女_散步之选' as cluster,
(case when gender='Female' then 1 else 0 end -0.57)*(case when gender='Female' then 1 else 0 end -0.57)+(age-44)*(age-44)+
(annual_income-27)*(annual_income-27)+(spending_score-21)*(spending_score-21)+(weekday_visits_p12-7)*(weekday_visits_p12-7)+
(weekend_visits_p12-8)*(weekend_visits_p12-8)+(visits_p12-15)*(visits_p12-15)+(weekday_spending_score-6)*(weekday_spending_score-6)+
(weekend_spending_score-15)*(weekend_spending_score-15)+(with_kids_visits_p12-5)*(with_kids_visits_p12-5)+(with_couple_visits_p12-8)*(with_couple_visits_p12-8)+
(clothing_spending_score-7)*(clothing_spending_score-7)+(foodbeverage_spending_score-8)*(foodbeverage_spending_score-8)+
(entertainment_spending_score-5)*(entertainment_spending_score-5)+(kids_spending_score-1)*(kids_spending_score-1) as distance FROM mall_customers
union all
SELECT customerid,'饮食男女_独善其身' as cluster,
(case when gender='Female' then 1 else 0 end -0.65)*(case when gender='Female' then 1 else 0 end -0.65)+(age-36)*(age-36)+
(annual_income-47)*(annual_income-47)+(spending_score-61)*(spending_score-61)+(weekday_visits_p12-12)*(weekday_visits_p12-12)+
(weekend_visits_p12-7)*(weekend_visits_p12-7)+(visits_p12-19)*(visits_p12-19)+(weekday_spending_score-22)*(weekday_spending_score-22)+
(weekend_spending_score-39)*(weekend_spending_score-39)+(with_kids_visits_p12-11)*(with_kids_visits_p12-11)+(with_couple_visits_p12-5)*(with_couple_visits_p12-5)+
(clothing_spending_score-4)*(clothing_spending_score-4)+(foodbeverage_spending_score-39)*(foodbeverage_spending_score-39)+
(entertainment_spending_score-9)*(entertainment_spending_score-9)+(kids_spending_score-9)*(kids_spending_score-9) as distance FROM mall_customers
union all
SELECT customerid,'颐养天年_共享天伦' as cluster,
(case when gender='Female' then 1 else 0 end -0.43)*(case when gender='Female' then 1 else 0 end -0.43)+(age-60)*(age-60)+
(annual_income-50)*(annual_income-50)+(spending_score-52)*(spending_score-52)+(weekday_visits_p12-77)*(weekday_visits_p12-77)+
(weekend_visits_p12-22)*(weekend_visits_p12-22)+(visits_p12-99)*(visits_p12-99)+(weekday_spending_score-42)*(weekday_spending_score-42)+
(weekend_spending_score-11)*(weekend_spending_score-11)+(with_kids_visits_p12-39)*(with_kids_visits_p12-39)+(with_couple_visits_p12-29)*(with_couple_visits_p12-29)+
(clothing_spending_score-26)*(clothing_spending_score-26)+(foodbeverage_spending_score-19)*(foodbeverage_spending_score-19)+
(entertainment_spending_score-5)*(entertainment_spending_score-5)+(kids_spending_score-3)*(kids_spending_score-3) as distance FROM mall_customers
union all
SELECT customerid,'中年多金_浅尝辄止' as cluster,
(case when gender='Female' then 1 else 0 end -0.54)*(case when gender='Female' then 1 else 0 end -0.54)+(age-40)*(age-40)+
(annual_income-84)*(annual_income-84)+(spending_score-17)*(spending_score-17)+(weekday_visits_p12-12)*(weekday_visits_p12-12)+
(weekend_visits_p12-11)*(weekend_visits_p12-11)+(visits_p12-23)*(visits_p12-23)+(weekday_spending_score-6)*(weekday_spending_score-6)+
(weekend_spending_score-10)*(weekend_spending_score-10)+(with_kids_visits_p12-8)*(with_kids_visits_p12-8)+(with_couple_visits_p12-9)*(with_couple_visits_p12-9)+
(clothing_spending_score-6)*(clothing_spending_score-6)+(foodbeverage_spending_score-4)*(foodbeverage_spending_score-4)+
(entertainment_spending_score-5)*(entertainment_spending_score-5)+(kids_spending_score-2)*(kids_spending_score-2) as distance FROM mall_customers
union all
SELECT customerid,'无敌奶爸_低碳溜娃' as cluster,
(case when gender='Female' then 1 else 0 end -0.18)*(case when gender='Female' then 1 else 0 end -0.18)+(age-43)*(age-43)+
(annual_income-92)*(annual_income-92)+(spending_score-20)*(spending_score-20)+(weekday_visits_p12-31)*(weekday_visits_p12-31)+
(weekend_visits_p12-49)*(weekend_visits_p12-49)+(visits_p12-79)*(visits_p12-79)+(weekday_spending_score-4)*(weekday_spending_score-4)+
(weekend_spending_score-16)*(weekend_spending_score-16)+(with_kids_visits_p12-53)*(with_kids_visits_p12-53)+(with_couple_visits_p12-10)*(with_couple_visits_p12-10)+
(clothing_spending_score-8)*(clothing_spending_score-8)+(foodbeverage_spending_score-8)*(foodbeverage_spending_score-8)+
(entertainment_spending_score-2)*(entertainment_spending_score-2)+(kids_spending_score-1)*(kids_spending_score-1) as distance FROM mall_customers
union all
SELECT customerid,'浪漫情侣_周末之约' as cluster,
(case when gender='Female' then 1 else 0 end -0.4)*(case when gender='Female' then 1 else 0 end -0.4)+(age-39)*(age-39)+
(annual_income-62)*(annual_income-62)+(spending_score-55)*(spending_score-55)+(weekday_visits_p12-31)*(weekday_visits_p12-31)+
(weekend_visits_p12-19)*(weekend_visits_p12-19)+(visits_p12-50)*(visits_p12-50)+(weekday_spending_score-15)*(weekday_spending_score-15)+
(weekend_spending_score-40)*(weekend_spending_score-40)+(with_kids_visits_p12-1)*(with_kids_visits_p12-1)+(with_couple_visits_p12-48)*(with_couple_visits_p12-48)+
(clothing_spending_score-47)*(clothing_spending_score-47)+(foodbeverage_spending_score-6)*(foodbeverage_spending_score-6)+
(entertainment_spending_score-2)*(entertainment_spending_score-2)+(kids_spending_score-0)*(kids_spending_score-0) as distance FROM mall_customers
union all
SELECT customerid,'周中搬砖_周末狂欢' as cluster,
(case when gender='Female' then 1 else 0 end -0.43)*(case when gender='Female' then 1 else 0 end -0.43)+(age-33)*(age-33)+
(annual_income-44)*(annual_income-44)+(spending_score-76)*(spending_score-76)+(weekday_visits_p12-1)*(weekday_visits_p12-1)+
(weekend_visits_p12-2)*(weekend_visits_p12-2)+(visits_p12-4)*(visits_p12-4)+(weekday_spending_score-14)*(weekday_spending_score-14)+
(weekend_spending_score-62)*(weekend_spending_score-62)+(with_kids_visits_p12-0)*(with_kids_visits_p12-0)+(with_couple_visits_p12-3)*(with_couple_visits_p12-3)+
(clothing_spending_score-0)*(clothing_spending_score-0)+(foodbeverage_spending_score-7)*(foodbeverage_spending_score-7)+
(entertainment_spending_score-69)*(entertainment_spending_score-69)+(kids_spending_score-0)*(kids_spending_score-0) as distance FROM mall_customers
order by customerid;


--order by distance and choose the shortest as final clustergroup
drop table if exists mall_customers_cluster_tag;
create table mall_customers_cluster_tag as
select customerid,substring_index(group_concat(cluster order by distance),',',1) as cluster_group
from mall_customer_distance
group by customerid;