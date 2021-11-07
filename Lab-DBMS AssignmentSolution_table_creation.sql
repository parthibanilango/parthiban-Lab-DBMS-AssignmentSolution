lab solution

-- An E-commerce website manages its data in the form of various tables.

create database if not exists `order-directory` ;

use `order-directory`;

-- 1)	You are required to create tables for supplier,customer,category,product,productDetails,order,rating to store the data for the E-commerce with the schema definition given below.
-- Supplier(SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE)
create table if not exists `supplier`(
	`SUPP_ID` int primary key,
    `SUPP_NAME` varchar(50) ,
	`SUPP_CITY` varchar(50),
	`SUPP_PHONE` varchar(10)
);

-- Customer(CUS__ID,CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER)
create table if not exists `customer` (
	`CUS_ID` int not null,
	`CUS_NAME` varchar(20) null default null,
	`CUS_PHONE` varchar(10),
	`CUS_CITY` varchar(30) ,
	`CUS_GENDER` CHAR,
	primary key (`CUS_ID`)
);

-- Category(CAT_ID,CAT_NAME)
create table if not exists `category` (
	`CAT_ID` int not null,
	`CAT_NAME` varchar(20) null default null,
	primary key (`CAT_ID`)
);

-- Product(PRO_ID,PRO_NAME,PRO_DESC,CAT_ID)
create table if not exists `product` (
	`PRO_ID` int not null,
	`PRO_NAME` varchar(20) null default null,
	`PRO_DESC` varchar(60) null default null,
	`CAT_ID` int not null,
	primary key (`PRO_ID`),
	foreign key (`CAT_ID`) references category(`CAT_ID`)
);

-- ProductDetails(PROD_ID,PRO_ID,SUPP_ID,PRICE)
 create table if not exists `product_details` (
	`PROD_ID` int not null,
	`PRO_ID` int not null,
	`SUPP_ID` int not null,
	`PROD_PRICE` int not null,
	primary key (`PROD_ID`),
	foreign key (`PRO_ID`) references product(`PRO_ID`),
	foreign key (`SUPP_ID`) references supplier(`SUPP_ID`)
);

-- Order(ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PROD_ID)
create table if not exists `order` (
  `ORD_ID` int not null,
  `ORD_AMOUNT` int not null,
  `ORD_DATE` date,
  `CUS_ID` int not null,
  `PROD_ID` int not null,
  primary key (`ORD_ID`),
  foreign key (`CUS_ID`) references customer(`CUS_ID`),
  foreign key (`PROD_ID`) references product_details(`PROD_ID`)
);

-- Rating(RAT_ID,CUS_ID,SUPP_ID,RAT_RATSTARS)
create table if not exists `rating` (
	`RAT_ID` int not null,
	`CUS_ID` int not null,
	`SUPP_ID` int not null,
	`RAT_RATSTARS` int not null,
	primary key (`RAT_ID`),
	foreign key (`SUPP_ID`) references supplier(`SUPP_ID`),
	foreign key (`CUS_ID`) references customer(`CUS_ID`)
  );
  
  insert into `supplier` values(1,"Rajesh Retails","Delhi",'1234567890');
insert into `supplier` values(2,"Appario Ltd.","Mumbai",'2589631470');
insert into `supplier` values(3,"Knome products","Banglore",'9785462315');
insert into `supplier` values(4,"Bansal Retails","Kochi",'8975463285');
insert into `supplier` values(5,"Mittal Ltd.","Lucknow",'7898456532');

select * from supplier;

insert into `CUSTOMER` values(1,"AAKASH",'9999999999',"DELHI",'M');
insert into `CUSTOMER` values(2,"AMAN",'9785463215',"NOIDA",'M');
insert into `CUSTOMER` values(3,"NEHA",'9999999999',"MUMBAI",'F');
insert into `CUSTOMER` values(4,"MEGHA",'9994562399',"KOLKATA",'F');
insert into `CUSTOMER` values(5,"PULKIT",'7895999999',"LUCKNOW",'M');
select * from CUSTOMER;

insert into `CATEGORY` values(1,"BOOKS");
insert into `CATEGORY` values(2,"GAMES");
insert into `CATEGORY` values(3,"GROCERIES");
insert into `CATEGORY` values(4,"ELECTRONICS");
insert into `CATEGORY` values(5,"CLOTHES");

select * from CATEGORY;

insert into `PRODUCT` values(1,"GTA V","DFJDJFDJFDJFDJFJF",2);
insert into `PRODUCT` values(2,"TSHIRT","DFDFJDFJDKFD",5);
insert into `PRODUCT` values(3,"ROG LAPTOP","DFNTTNTNTERND",4);
insert into `PRODUCT` values(4,"OATS","REURENTBTOTH",3);
insert into `PRODUCT` values(5,"HARRY POTTER","NBEMCTHTJTH",1);

insert into `PRODUCT_DETAILS` values(1,1,2,1500);
insert into `PRODUCT_DETAILS` values(2,3,5,30000);
insert into `PRODUCT_DETAILS` values(3,5,1,3000);
insert into `PRODUCT_DETAILS` values(4,2,3,2500);
insert into `PRODUCT_DETAILS` values(5,4,1,1000);

insert into `ORDER` values (50,2000,"2021-10-06",2,1);
insert into `ORDER` values(20,1500,"2021-10-12",3,5);
insert into `ORDER` values(25,30500,"2021-09-16",5,2);
insert into `ORDER` values(26,2000,"2021-10-05",1,1);
insert into `ORDER` values(30,3500,"2021-08-16",4,3);

insert into `RATING` values(1,2,2,4);
insert into `RATING` values(2,3,4,3);
insert into `RATING` values(3,5,1,5);
insert into `RATING` values(4,1,3,2);
insert into `RATING` values(5,4,5,4);