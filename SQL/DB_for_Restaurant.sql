--https://replit.com/@zkiddy/home-work-SQL-DB-for-restaurant#main.sql

CREATE TABLE Restaurant (
    Name varchar(255),
    Addr varchar(255),
    Phone varchar(10)
); insert into Restaurant values
    ('Kiddy Shop', '99/9 Bangkok (TH)', '0881122334');
CREATE TABLE Orders (
    OrderNum int,
    OrderDate date,
    ItemCode int,
    CusCode int,
    EmpCode int,
    Total int
); insert into Orders values
    (00001, '2022-01-2022', 004, 01, 03, 200),
    (00002, '2022-03-2022', 001, 01, 02, 350),
    (00003, '2022-03-2022', 002, 01, 02, 350),
    (00004, '2022-03-2022', 004, 01, 02, 350),
    (00005, '2022-03-2022', 003, 02, 02, 150),
    (00006, '2022-04-2022', 002, 03, 02, 100),
    (00007, '2022-07-2022', 001, 02, 01, 150),
    (00008, '2022-07-2022', 002, 02, 01, 150);
CREATE TABLE Item (
    ItemCode int,
    Dsc varchar(255),
    Price int
); insert into Item values
    (001, 'Rice', 50),
    (002, 'Chicken', 100),
    (003, 'Pork', 150),
    (004, 'Beef', 200);
CREATE TABLE Stock (
    ItemCode int,
    Qty int
); insert into Stock values
    (001, 20),
    (002, 40),
    (003, 100),
    (004, 50);
CREATE TABLE Customer (
    Code int,
    Name varchar(255)
); insert into Customer values
    (01, 'Sarah'),
    (02, 'Emily'),
    (03, 'Jessica');
CREATE TABLE Employee (
    Code int,
    Name varchar(255)
); insert into Employee values
    (01, 'Tony'),
    (02, 'Mika'),
    (03, 'David');
with Company as (
  select * from Restaurant
) ---- use with and subquery / using inner and left join
select Company.Name
  ,A.OrderDate
  ,C.Name 'CusName'
  ,B.Dsc
  ,B.Qty 'StockOnHand'
  ,A.Total 'OrderTotal'
  ,D.Name 'Sale'
  from Orders A
  left join (select A.Itemcode,A.Dsc,B.Qty
             from Item A
             join Stock B on A.ItemCode = B.ItemCode
            ) B on A.ItemCode = B.ItemCode
  left join Customer C on A.CusCode = C.Code
  left join Employee D on A.EmpCode = D.Code
  , Company ;
-------------------------------------------------------------
---- Check net total order between 01-05 month
select sum(Total) 'Net'
  from Orders 
  where OrderDate between '2022-01-2022' and '2022-05-2022' ;
---- Check Employee of the highest sales
select sum(A.Total),B.name
from Orders A
left join Employee B on A.EmpCode = B.Code
group by B.Name
Order by 1 desc ;
---- Check item for highest balance 1 item
select B.Dsc,A.Qty
from Stock A
left join Item B on A.ItemCode = B.ItemCode
order by 2 desc
LIMIT 1 ;
-------------------------------------------------------------
-------------------------------------------------------------
