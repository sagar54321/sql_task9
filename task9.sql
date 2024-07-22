select sum(sales) , sum(profit)  from sales where product_id = 'FUR-CH-10000454'
group by product_id


create or replace function getTotalProfitPercentage(pr_id varchar)
RETURNS double precision AS $$
DECLARE 
	totalSales double precision ;
    totalProfit double precision;
    profitPercentage double precision;

BEGIN
	select sum(sales) as totalSales , sum(profit) as totalProfit into totalSales , totalProfit  from sales where product_id = pr_id;
	profitPercentage := (totalProfit/totalSales) * 100;
	return profitPercentage;
   
END;
$$ LANGUAGE plpgsql;

select gettotalprofitpercentage('OFF-BI-10000756')

select *, gettotalprofitpercentage(product_id) from sales