create database [sqltask2]
use [sqltask2]
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
productID int primary key identity,
[Name] varchar(100) unique,
[Description] text,
[CategoryID] int,
[CreatedDate] DATETIME NOT NULL DEFAULT GETDATE(),
foreign key (CategoryID) references Category(id)
)
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

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------daxil et
create PROCEDURE [addition] 
	@name nvarchar(70),
	@description nvarchar(70),
	@categoryName nvarchar(70)
AS
BEGIN
	set xact_abort on;
	SET NOCOUNT ON;
	if not exists (select * from [Products]
	where  [Name]=@name)
	begin 
	declare @categoryId int
	select @categoryId=[id] from [Category] where [Nameof]=@categoryName
	if @categoryId is null
	begin
	  insert [Category]([Nameof])
	  values (@categoryName)
	  set @categoryId=SCOPE_IDENTITY()
    end
	INSERT INTO [Products]
           ([Name]
           ,[Description]
           ,[CategoryId]
           )
     VALUES
           (@name,
		   @description,
		   @categoryId)
		   
END
end
----------------------------------
create PROCEDURE [update] 
	@name nvarchar(70),
	@description nvarchar(70),
	@categoryName nvarchar(70)
AS
BEGIN
	set xact_abort on;
	SET NOCOUNT ON;
	declare @productId int
	select @productId=[productID] from [Products] where [Name]=@name
	declare @categoryId int
	select @categoryId=[id] from [Category] where [Nameof]=@categoryName
	if @categoryId is null
	begin
	  insert [Category]([Nameof])
	  values (@categoryName)
	  set @categoryId=SCOPE_IDENTITY()
    end
	if @productId is null
	begin
	  insert [Products]([Name],[Description],[CategoryId])
	  values (@name,@description,@categoryId)
	  set @productId=SCOPE_IDENTITY()
    end
	else
	begin
    Update [Products]
	set [Name]=@name ,[Description]=@description,[CategoryId]=@categoryId
	where [productid]=@productId
	end
END
---------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE deletedata
@productId int
AS
BEGIN
	set xact_abort on;
	SET NOCOUNT ON;
	begin try
	begin transaction delete_product
	insert into [myArchive]
	select [Name]
		   ,getdate()
           ,[Description]
           ,[CategoryId]
           ,[CreatedDate]
		   from [Products] where [productid]=@productId
   delete from [Products] where [productid]=@productId
   commit
   end try
   begin catch
   rollback
   end catch
END
