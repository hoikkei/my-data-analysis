-- 核心指标，从kpi
select 
	date as 日期,
	sum(liulan) as 页面浏览次数, 
	sum(buyer) as 卖家访问次数,
	sum(on_sell) as 平均在售商品数, 
	sum(refund_ratio)/100 as 退款率,
	sum(sales_total) as 销量,
	sum(gmv_total) as 销售额
from amazon_sales_all
group by date
order by date desc
limit 7

-- 分品牌
select update_day as 日期,brand as 品牌,sum(units_count) as 销量,sum(gmv) as 销售额
from amazon_sales_detail
where update_day=(select max(update_day) from amazon_sales_detail)
group by update_day,brand

-- 分品牌，产品矩阵/品牌效应下，这个是对库存优化的考量，展开讲会有很多，在这里我们仅从描述的角度展开


-- 分链接
-- 对于复杂的宽表，我们先拆分，后合并
-- 广告/流量相关
select
		end_day, country, brand, asin, clicks,cost,impressions,gmv_ad,sales_ad,cost/clicks as cpc,clicks/impressions as ctr
from amazon_sales_ad
-- 网页信息
select 
		CASE
        when country='美国' then 'Us'
        when `country` ='日本' then 'Jp'
        when `country` = '加拿大' then 'Ca'
    end as country,
		insert_date,asin,sales_rank rank_big,rank_small,stars,price,reviews,daily_units
	from amazon_sales_url

-- 销售情况
amazon_sales_detail
-- 把具体日期改成 date(now())
select detail.update_day,detail.country,detail.brand,detail.asin,detail.units_count,detail.gmv,t_sales.`最晚售出距今天数`,t_sales.`近7日销量`,t_sales.`近7日平均销量`,t_sales.`日均销量预估`,detail.profit
from amazon_sales_detail detail
left join(
select 
    brand,country,asin,datediff('2019-12-31',max(update_day)) as '最晚售出距今天数',
    sum(case when DATEDIFF('2019-12-31',update_day)<=7 then units_count else 0 end)  as '近7日销量',
    round(sum(case when DATEDIFF('2019-12-31',update_day)<=7 then units_count else 0 end)/7,2) as '近7日平均销量',
    -- 加权平均预测
    round(
            (round(sum(case when DATEDIFF('2019-12-31',update_day)<=7 then units_count else 0 end)/7,2)*0.6 + 
            round(sum(case when DATEDIFF('2019-12-31',update_day)<=15 then units_count else 0 end)/15,2)*0.3+
            round(sum(case when DATEDIFF('2019-12-31',update_day)<=30 then units_count else 0 end)/30,2)*0.1),2) 
    as '日均销量预估'    
	from amazon_sales_detail
	where units_count!=0
	group by brand,country,asin) t_sales
on detail.asin=t_sales.asin and detail.country=t_sales.country and detail.brand=t_sales.brand
where detail.update_day='2019-12-31'
order by country,brand,units_count desc


-- 合并起来
-- 合并起来
select distinct detail.update_day 日期,detail.country 国家, detail.brand 品牌, detail.asin 链接ASIN, detail.units_count+0 销量,detail.gmv+0 销售额,detail.`最晚售出距今天数`+0 最晚售出距今天数,detail.`近7日销量`+0 近7日销量,detail.`近7日平均销量`+0 近7日平均销量,detail.`日均销量预估`+0 日均销量预估,stock.in_stock+0 当前库存,round(stock.in_stock/detail.`日均销量预估`,0) 售完预计天数,ad.clicks+0 点击数,ad.cost+0 广告花费,ad.impressions+0 曝光量,ad.gmv_ad+0 广告带来销售额,ad.sales_ad+0 广告带来销量,ad.cpc+0 按点击收费CPC,ad.ctr+0 转化率CTR,url.rank_big+0 大类排名,url.rank_small+0 小类排名,url.reviews+0 评论数,url.price+0 价格,url.stars+0 星级
from 
(select detail1.update_day,detail1.country,detail1.brand,detail1.asin,detail1.units_count,detail1.gmv,t_sales.`最晚售出距今天数`,t_sales.`近7日销量`,t_sales.`近7日平均销量`,t_sales.`日均销量预估`,detail1.profit
from amazon_sales_detail detail1
left join(
select 
    brand,country,asin,datediff('2019-12-31',max(update_day)) as '最晚售出距今天数',
    sum(case when DATEDIFF('2019-12-31',update_day)<=7 then units_count else 0 end)  as '近7日销量',
    round(sum(case when DATEDIFF('2019-12-31',update_day)<=7 then units_count else 0 end)/7,2) as '近7日平均销量',
    -- 加权平均预测
    round(
            (round(sum(case when DATEDIFF('2019-12-31',update_day)<=7 then units_count else 0 end)/7,2)*0.6 + 
            round(sum(case when DATEDIFF('2019-12-31',update_day)<=15 then units_count else 0 end)/15,2)*0.3+
            round(sum(case when DATEDIFF('2019-12-31',update_day)<=30 then units_count else 0 end)/30,2)*0.1),2) 
    as '日均销量预估'    
	from amazon_sales_detail
	where units_count!=0
	group by brand,country,asin) t_sales
on detail1.asin=t_sales.asin and detail1.country=t_sales.country and detail1.brand=t_sales.brand
where detail1.update_day='2019-12-31') detail
left join 
amazon_sales_stock stock
on detail.update_day=stock.update_day and detail.asin=stock.asin and detail.country=stock.country and detail.brand=stock.brand
left join (
	select
		end_day, country, brand, asin, clicks,cost,impressions,gmv_ad,sales_ad,cost/clicks as cpc,clicks/impressions as ctr
	from amazon_sales_ad
) ad
on ad.end_day=detail.update_day and detail.asin=ad.asin and detail.country=ad.country and detail.brand=ad.brand
left join
(
	select 
		CASE
        when country='美国' then 'Us'
        when `country` ='日本' then 'Jp'
        when `country` = '加拿大' then 'Ca'
    end as country,
		insert_date,asin,sales_rank rank_big,rank_small,stars,price,reviews,daily_units
	from amazon_sales_url
)url
on detail.asin=url.asin and detail.update_day=url.insert_date and detail.country=url.country
where detail.update_day = (select max(update_day) from amazon_sales_detail)



    -- 改了品牌名
update amazon_sales_url set brand1 = 'AA' WHERE brand='CB' 
update amazon_sales_url set brand1 = 'BB' WHERE brand='HW' 
update amazon_sales_url set brand1 = 'CC' WHERE brand='PMK' 
update amazon_sales_url set brand1 = 'DD' WHERE brand='SW' 
update amazon_sales_stock set brand1 = 'EE' WHERE brand='TD' 

-- 删除没用的
delete from amazon_sales_url where asin in ('B07JPK7SXX','B07KF8S5XX','B07WNNFFXX','B07WGS4YXX','B07Y49CBXX','B07W7JDGXX','B07JPK7SXX','B07J4NZ2XX','B07QX4YHXX','B07Y58V2XX','B01N96GWXX')
