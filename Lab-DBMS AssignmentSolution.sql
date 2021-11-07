/*
 3) Display the number of the customer group by their genders who have placed any order
of amount greater than or equal to Rs.3000.
*/

select CUS_GENDER as Gender, count(CUS_GENDER) as 'Number of customers' from Customer as cus
inner join
(select * from `order` where ord_amount >= 3000) as o
on cus.CUS_ID = o.CUS_ID group by cus.CUS_GENDER;

/*
 4) Display all the orders along with the product name ordered by a customer having
Customer_Id=2.
*/

select o.*,prd.pro_name from `order` as o
inner join product_details as p_d on o.prod_id =p_d.prod_id
inner join product as prd on prd.pro_id =p_d.pro_id
where cus_id=2;

/* 
5) Display the Supplier details who can supply more than one product.
*/
select * from supplier where supp_id IN (select supp_id from product_details group by supp_id having count(*) > 1);

/*
6) Find the category of the product whose order amount is minimum
*/

select cat.cat_id,cat.cat_name, prd.pro_id,prd.pro_name from
 `order` as ord
 inner join product_details as p_d on ord.prod_id = p_d.prod_id
 inner join product as prd on prd.pro_id = p_d.pro_id
 inner join category as cat on cat.cat_id = prd.cat_id
where ord_amount = (select min(ord_amount) from `order`);

/*
7) Display the Id and Name of the Product ordered after “2021-10-05”.

*/

select prd.pro_id,prd.pro_name, ord.* from 
	`order` as ord
    inner join product_details as p_d on ord.prod_id = p_d.prod_id
	inner join product as prd on prd.pro_id = p_d.pro_id
    where ord.ord_date > "2021-10-05";

/*
8) Print the top 3 supplier name and id and their rating on the basis of their rating along
with the customer name who has given the rating.
*/

select r.supp_id,s.supp_name,r.rat_ratstars,c.* from rating as r
	inner join customer as c on c.cus_id = r.cus_id
    inner join supplier as s on s.supp_id = r.supp_id
order by rat_ratstars desc limit 1,3;

/*
9) Display customer name and gender whose names start or end with character 'A'
*/
 select * from customer where cus_name like '%A'
 union all 
  select * from customer where cus_name like 'A%';

/*
  10) Display the total order amount of the male customers
*/

select sum(o.ord_amount) as total_order_amount from `order` as o
	inner join customer as c on c.cus_id=o.cus_id
	where  c.cus_gender = 'M';
    
/*
11) Display all the Customers left outer join with the orders.
*/
select * from customer 
left outer join `order` on customer.cus_id = `order`.cus_id;

-- Inserted to differentiate inner join and left join
insert into customer(cus_id, cus_name, cus_phone, cus_city, cus_gender) values(6, 'Pallavi', 1234567890, 'Bangalore', 'F');
select *
from customer left outer join  `order` on customer.cus_id = `order`.cus_id;
select *
from customer inner join  `order` on customer.cus_id = `order`.cus_id;

/* 
12) Create a stored procedure to display the Rating for a Supplier if any along with the
Verdict on that rating if any like if rating >4 then “Genuine Supplier” if rating >2 “Average
Supplier” else “Supplier should not be considered”.

-- solution
Stored procedure categorize_suppliers : 
BEGIN
    select s.supp_id, s.supp_name, r.rat_ratstars,
	case 
		when r.rat_ratstars > 4 then 'Genuine Supplier'
		when r.rat_ratstars > 2 then 'Average Supplier'
		else 'Supplier should not be considered'
	end as verdict
	from supplier as s,rating as r
    where s.supp_id = r.supp_id;
END
*/
call categorize_suppliers();







