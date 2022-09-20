create database [sqltask2]
use [sqltask2]
-- kateqoriyalar ucun cedvel yaratmaq
create table [Category] (
 id int identity primary key,
nameof nvarchar(70)
)

insert into [Category](nameof) values (N'Audio,video'),(N'Kompüter və ofis avadanlığı')
    ,(N'Planşetlər')
    ,(N'Telefonlar, Saatlar və Nömrələr');
select * from [Category]
--mehsullar ucun cedvel yaratmaq
create table [Products](
[Name] varchar(100),
[Description] text,
[CategoryID] int,
[CreatedDate] DATETIME NOT NULL DEFAULT GETDATE(),
foreign key (CategoryID) references Category(id)
)
drop table Products
INSERT [dbo].[Products] ([Name], [Description], [CategoryId], [CreatedDate])
    VALUES (N'Wonlex GW100 Pink', NULL, 4, '2019-09-15')
    ,(N'Wonlex Q50 Charisma BLACK', NULL, 4, '2019-09-15')
    ,(N'Samsung Galaxy S10 Dual (SM-G973) White', NULL, 4, '2019-09-15')
    ,(N'Xiaomi Mi A3 4/128GB White', NULL, 4, '2019-09-15')
    ,(N'Blackview BV1000 yellow', NULL, 4, '2019-09-15')
    ,(N'Huawei Y9 2019 4/64GB Red', NULL, 4, '2019-09-15')
    ,(N'FLY TS114 BLACK', NULL, 4, '2019-09-15')
    ,(N'Blackview BV5500 Pro yellow', NULL, 4, '2019-09-15')
    ,(N'Lenovo TB 7104I/3G -Wi-Fi/7 BLACK', NULL, 3, '2019-09-15')
    ,(N'Samsung Galaxy Tab A 8.0 (SM-T295) Black', NULL, 3, '2019-09-15')
    ,(N'Lenovo TAB E10 TB-X104F/10.1 BLACK', NULL, 3, '2019-09-15')
    ,(N'Lenovo TAB 4 10 LTE (TB-X304L) black', NULL, 3, '2019-09-15')
    ,(N'Samsung Galaxy Tab A (SM-T385) GOLD', NULL, 3, '2019-09-15')
    ,(N'Huawei M5 Lite 3+32 Space Grey', NULL, 3, '2019-09-15')
    ,(N'Apple MacBook Air 13″ MVFK2', NULL, 2, '2019-09-15')
    ,(N'Apple MacBook Air 13″ MVFH2', NULL, 2, '2019-09-15')
    ,(N'Monoblok HP ENVY 27-B170ur i7/16/nv4/1tb128/win10', NULL, 2, '2019-09-15')
    ,(N'Noutbuk Asus Tuf Gaming FX505DD BQ121 ', NULL, 2, '2019-09-15')
    ,(N'Noutbuk Acer Predator Helios 300 PH315-52-718G ', NULL, 2, '2019-09-15')
    ,(N'Musiqi merkezi SONY MHC-V82D', NULL, 1, '2019-09-15')
    ,(N'Speaker Sony SRS-XB21 Wireless', NULL, 1, '2019-09-15')
    ,(N'JBL Pulse 3 Black', NULL, 1, '2019-09-15');

select * from Products



--- view yarat
CREATE VIEW [showList] AS
SELECT [name],[nameof],[createddate]
FROM Products
full outer JOIN Category
ON Products.CategoryID = Category.id;
select * from showList





--create procedure addition
create procedure addition(
@name varchar(100),
@description text,
@categoryName nvarchar(70)


) as
begin
	insert into [Products]([Name],[Description]) values (@name,@description)
	insert into Category([nameof]) values (@categoryName)
	


end

-- silmek ucun 
--create procedure deletion()

--update ucun
-- create procedure update()
