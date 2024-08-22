#Homework2
select distinct c.brand_tag,c.food_type 
from 
(select avg(`Product Price`) as avg_price,food_type,brand_tag 
from ds_indian_restaurants_products_type
group by food_type,brand_tag
order by avg_price desc) c 
join 
(select max(a.avg_price) as max_ap,a.brand_tag
from 
(select avg(`Product Price`) as avg_price,food_type,brand_tag 
from ds_indian_restaurants_products_type
group by food_type,brand_tag
order by avg_price desc) a
group by a.brand_tag) b on c.brand_tag=b.brand_tag
where c.avg_price=b.max_ap

#Homework3
select *,'原味产品' as foodtag
from ds_indian_restaurants_orders
where ItemName like '%Plain%' ;

在表格ds_indian_restaurants_products_type中用SQL语句查询出每家店均价最高的产品类别（food_type)

在表格ds_indian_restaurants_orders中用SQL语句查询出所有名称（Item Name）中包含关键字“Plain”的记录，并添加一列字段将其统称为“原味产品”
