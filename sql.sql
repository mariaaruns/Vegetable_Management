-- tbl categoy
drop table tbl_category
(
catid int identity(100,1) not null primary key,
catname varchar(100) not null,
catdescription varchar(150) null
);

select* from  tbl_category


-- tbl products

create table tbl_products
(
prId int identity(100,1) not null primary key,
prName varchar(100) not null,
prCat int not null,
prPrice bigint not null,
prQty  Int not null,
prExpDate date not null,
constraint Fk_tbl_category foreign key(prCat) references tbl_category(catid)
);


-- tbl seller
create table tbl_seller
(
selId int identity(1000,1) not null primary key,
selName varchar(100) not null,
selEmail varchar(100) not null,
selPassword  varchar(100) not null,
selPhone bigint not null,
selAdress varchar(100) not null,
);

--tbl bill
create table tbl_bill(
billId int identity not null primary key,
billDate date not null,
seller int not null,
custName varchar(100) not null,
mobile bigint not null,
city varchar(100) not null,
amount bigint not null,
constraint Fk_tbl_bill foreign key(seller) references tbl_seller(selId)
)



/*sp tbl seller insert*/

create procedure sp_tbl_seller_insert

@selName varchar(100),
@selEmail varchar(100),
@selPassword  varchar(100),
@selPhone bigint,
@selAdress varchar(100)
as begin
insert into tbl_seller values(@selName,@selEmail,@selPassword,@selPhone,@selAdress)
end
exec sp_tbl_seller_insert 'maria','arun@gmail.com','12345',9899898909,'kumbakonam';

select * from tbl_seller

create procedure sp_tbl_seller_update
@selId int,
@selName varchar(100),
@selEmail varchar(100),
@selPassword  varchar(100),
@selPhone bigint,
@selAdress varchar(100)
as begin
update tbl_seller set 
selName= @selName,
selEmail=@selEmail,
selPassword=@selPassword,
selPhone=@selPhone,
selAdress=@selAdress Where selId=@selId
end

create procedure sp_tbl_seller_delete
@selId int
as begin
delete from tbl_seller where selId=@selId
end

create procedure sp_tbl_seller_login
@selEmail varchar(100),
@selPassword varchar (100)
as begin
select * from tbl_seller where selEmail=@selEmail and selPassword=@selPassword
end
exec sp_tbl_seller_login 'bastin@gmail.com','1'




create procedure sp_tbl_category_insert
@catname varchar(100),
@catdescription varchar(100)

as begin
insert into tbl_category values(@catname,@catdescription);
end

create procedure sp_tbl_category_delete
@catid int 
as begin
delete from tbl_category where catid=@catid
end

create procedure sp_tbl_category_update
@catid int,
@catName varchar (100),
@catDescription varchar(100)
as begin
update tbl_category set catname=@catName,catdescription=@catDescription
where catid=@catid
end

select* from tbl_category
create procedure sp_tbl_products_insert
@prName varchar(100),
@prCat Int ,
@prPrice bigint ,
@prQty  Int ,
@prExpDate date 
as begin
insert into tbl_products values(@prName,@prCat,@prPrice,@prQty,@prExpDate)
end

create procedure sp_tbl_products_insert
@prName varchar(100),
@prCat Int ,
@prPrice bigint ,
@prQty  Int ,
@prExpDate date 
as begin
insert into tbl_products values(@prName,@prCat,@prPrice,@prQty,@prExpDate)
end

 


 create procedure sp_tbl_products_update
@prId int,
@prName varchar(100),
@prCat Int ,
@prPrice bigint ,
@prQty  Int ,
@prExpDate date 
as begin
update tbl_products set prName=@prName,
prCat=@prCat,
prPrice=@prPrice,
prQty=@prQty,
prExpDate=@prExpDate
where prId=@prId
end

create procedure sp_tbl_products_delete
@prId int
as begin
delete from tbl_products
where prId=@prId
end


create procedure sp_tbl_products_insert

@prName varchar(100) ,
@prCat int ,
@prPrice bigint ,
@prQty  Int ,
@prExpDate date
as begin
insert into tbl_products values(@prName,@prCat,@prPrice,@prQty,@prExpDate)
end

select * from tbl_products
select prName as ProductName,prCat as Category,prQty as Qty,prPrice as Price from tbl_products

create procedure sp_tbl_product_newstock
@prId int,
@prQty int
as
begin
update tbl_products set prQty=@prQty where prId=@prId
end

ALTER procedure sp_tbl_bill_insert
@billDate date ,
@seller int ,
@custName varchar(100),
@mobile bigint ,
@city varchar(100),
@amount bigint
as begin
insert into tbl_bill values(@billDate,@seller,@custName,@mobile,@city,@amount)
end

select * from tbl_seller
select *from tbl_bill
select sum(amount) from tbl_bill where seller=(select selId from tbl_seller where selName='arun')

select selId ,selName,tbl_bill.amount from tbl_seller
inner join
tbl_bill 
on tbl_seller.selId=tbl_bill.seller



create table tbl_contactus
(
id int identity(1,1) primary key,
c_name  varchar(100) not null,
c_email  varchar (100) not null,
c_phone bigint not null,
c_date date not null,
c_textarea Varchar(150) not null
);

alter procedure  sp_tbl_contactus_insert

@c_name  varchar(100),
@c_email  varchar (100),
@c_phone bigint,
@c_date date,
@c_textarea Varchar(150)
as begin
insert into tbl_contactus values(@c_name,@c_email,@c_phone,@c_date,@c_textarea)
end

create procedure sp_tbl_contact_fetch
as begin
select top(10) c_name[Name],c_email[Email],c_phone[Phone],c_date[Date],c_textarea[Messages] from  tbl_contactus order by c_date desc
end
select * from tbl_bill

insert into tbl_contactus values('Bastin','bastin@gmail.com',8989898989,'2023-08-13','hello')


select * from tbl_seller
select * from tbl_bill
select * from tbl_cust_records


select * from tbl_bill

select* from tbl_cust_records

SELECT SUM(amount) FROM tbl_bill WHERE seller = (SELECT selId FROM tbl_seller WHERE selName = 'arun')