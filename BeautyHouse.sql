create database BeautyHouse

USE BeautyHouse
GO
create table ProductType(
tid nvarchar(3) not null primary key,
tname nvarchar(20) not null
)
go
CREATE TABLE Brand(
	id NVARCHAR(20) NOT NULL PRIMARY KEY,
	name NVARCHAR(20) NOT NULL 
)
create table Products(
pid nvarchar(6) NOT NULL primary key,
pname nvarchar(100) not null,
typeid nvarchar(3) not null  references ProductType(tid),
brand nvarchar(20) not NULL REFERENCES dbo.Brand(id),
image nvarchar(100),
price float not null,
stock int
)
go
insert into ProductType
values ('eye','Eye Makeup'),
('fac','Face Makeup'),
('lip','LipStick'),
('lot','Lotion')

INSERT INTO dbo.Brand
        ( id, name )
VALUES  ('Lime','Lime'),
('Etude House','Etude House'),
('Organic','Organic'),
('Innisfree','Innisfree'),
('Scret Key','Scret Key'),
('Peripera','Peripera'),
('Tony Moly','Tony Moly'),
('Missha','Missha'),
('Romand','Romand'),
('The Face Shop','The Face Shop'),
('Black Rouge','Black Rouge'),
('Im Meme','Im Meme'),
('MAC','MAC'),
('Bellca','Bellca'),
('Enesti','Enesti'),
('Harana','Harana'),
('Jm Solution','Jm Solution')
--Eye Makeup
insert into Products
values ('eye001','Lime Brush Basic Eye Makeup Brush"','eye','Lime','product/EyeMakeup/eye1.jpg',5,100), 
('eye002','Makeup Combo 20 - 10 Beautiful Shimmering','eye','Etude House','product/EyeMakeup/eye2.jpg',33,50),
('eye003','Ivory Pearl Eye Combo (4 Items)','eye','Organic','product/EyeMakeup/eye3.jpg',20,30),
('eye004','Anti-Slip Mascara Lime Glam Fit Lashes 7ml','eye','Lime','product/EyeMakeup/eye4.jpg',12,80),
('eye005','Lime Color & Mood Single Shadow Eye Shadow 1.4g','eye','Lime','product/EyeMakeup/eye5.jpg',21,110),
('eye006','Innisfree The Green Tea Seed Eye Cream 30ml','eye','Innisfree','product/EyeMakeup/eye6.jpg',24,200),
('eye007','Secret Key Starting Treatment Eye Cream 30g','eye','Scret Key','product/EyeMakeup/eye7.jpg',16,50),
('eye008','Peripera Ink Color Cara Thick And Curved Mascara','eye','Peripera','product/EyeMakeup/eye8.jpg',23,60),
('eye009','Tonymoly Backstage Eyeliner Gel','eye','Tony Moly','product/EyeMakeup/eye9.jpg',18,120)
--

--Face Makeup
insert into Products
values ('fac001','Missha Dual Mate Blusher 7.8g','fac','Missha','product/FaceMakeup/fac1.jpg',23,90),
('fac002','Makeup Combo 20/10 - Radiant with Golden Sun','fac','Missha','product/FaceMakeup/fac2.jpg',23,120),
('fac003','Makeup Combo 20/10 - Fall Standard (5 items)','fac','Etude House','product/FaceMakeup/fac3.jpg',23,0),
('fac004','Peripera Ink Corrector Concealer','fac','Peripera','product/FaceMakeup/fac4.jpg',38,50),
('fac005','TonyMoly Double Cover Tip Concealer / SPF38 + PA +++','fac','Tony Moly','product/FaceMakeup/fac5.jpg',38,100),
('fac006','Missha M Magic Cushion Cover Lasting SPF50 + PA +++ ','fac','Missha','product/FaceMakeup/fac6.jpg',38,120),
('fac007','Lime Real Cover Pink Cushion Powder SPF50','fac','Lime','product/FaceMakeup/fac7.jpg',39,40),
('fac008','Romand Zero Cushion Ultra Thin Light And High Coverage','fac','Romand','product/FaceMakeup/fac8.jpg',35,90),
('fac009','Yehwadam Hwansaenggo BB Cream Special Set 45ml','fac','The Face Shop','product/FaceMakeup/fac9.jpg',35,30)
--

--LipStick
insert into Products
values ('lip001','Black Rouge Air Fit Velvet Tint 4.5g','lip','Black Rouge','product/LipStick/lip1.jpg',29,10),
('lip002','Etude Dear My Blooming Lips Talk Chiffon','lip','Etude House','product/LipStick/lip2.jpg',35,13),
('lip003','Peripera Ink Matte Blur Tint 3.8g','lip','Peripera','product/LipStick/lip3.jpg',38,2),
('lip004','Etude House Mini Two Matching Lip Color','lip','Etude House','product/LipStick/lip4.jpg',29,23),
('lip005','Im Meme Tic Toc Tint Lip Cashmere 2.5g','lip','Im Meme','product/LipStick/lip5.jpg',29,4),
('lip006','Mac Matte Lipstick','lip','MAC','product/LipStick/lip6.jpg',29,12),
('lip007','Romand Zero Gram Matte Lipstick 4.5g','lip','Romand','product/LipStick/lip7.jpg',30,0),
('lip008','Secret Key Sweet Glam Tint Glow','lip','Scret Key','product/LipStick/lip8.jpg',29,28),
('lip009','Tint Tonymoly Delight Tony Tint','lip','Tony Moly','product/LipStick/lip9.jpg',30,1)

--Lotion
insert into products
values ('lot001','Bellca Yello’ Vita Aloe Gel 300ml','lot','Bellca','product/Lotion/lot1.jpg',26,80),
('lot002','Innisfree Brightening Pore Set (4 Items)','lot','Innisfree','product/Lotion/lot2.jpg',70,110),
('lot003','Chia Seed Advanced Skincare Set (4 Items)','lot','The Face Shop','product/Lotion/lot3.jpg',35,121),
('lot004','Enesti Lemon Multi Care Mask 27g','lot','Enesti','product/Lotion/lot4.jpg',35,190),
('lot005','Innisfree Green Tea Balancing Skin Care Set EX','lot','Innisfree','product/Lotion/lot5.jpg',35,0),
('lot006','Harana Tone Up White Cream 70ml','lot','Harana','product/Lotion/lot6.jpg',31,90),
('lot007','Jm Solution Marine Luminous Pearl Sun Spray SPF 50+/PA +++','lot','Jm Solution','product/Lotion/lot7.jpg',35,9),
('lot008','Enesti DaytoDay Lemon And Green Tea Cleansing Foam 160ml','lot','Enesti','product/Lotion/lot8.jpg',28,19),
('lot009','Yehwadam Heaven Grade Ginseng Rejuvenating Skincare Special Set','lot','The Face Shop','product/Lotion/lot9.jpg',31,29)
--

CREATE TABLE Users(
username varchar(10) not null primary key,
password varchar(10) not null,
email varchar(50)
)
create table Orders(
orderId int not null identity(1,1) primary key,
cusAccount varchar(10) not null references Users(username),
pid nvarchar(6) NOT NULL references Products(pid),
quantity int not null,
totalMoney float,
dateOrder date,
)

CREATE TABLE Admins(
username varchar(10) not null primary key,
password varchar(6) not null
)

insert into Admins
values ('sa','123456'),
('ThaoPhuong','beauty')
GO

INSERT INTO dbo.Users
        ( username, password, email )
VALUES  ( 'Thao510', -- username - varchar(10)
          'PhuongThao', -- password - varchar(10)
          'thaohp510@gmail.com'  -- email - varchar(50)
          )
Select count(*) from Products


SELECT * FROM dbo.Products
SELECT COUNT(*) FROM dbo.Products p inner join ProductType pt on pt.tid = p.typeid
                    where typeid =  'eye'

WITH r AS (SELECT ROW_NUMBER() OVER(ORDER BY pid) AS rownum, * FROM Products p inner join 
ProductType pt on pt.tid = p.typeid
where tname = 'Eye Makeup' ) 
SELECT * FROM r WHERE rownum >= (1 - 1) * 3 + 1 AND rownum <= 1 * 3

SELECT * FROM dbo.Users
select* from Brand
INSERT INTO dbo.Products
        ( pid ,pname ,typeid ,brand ,image ,price ,stock)
VALUES  ( )

SELECT * FROM dbo.Products WHERE brand = 'Innisfree' AND price >= 0 AND price <= 300