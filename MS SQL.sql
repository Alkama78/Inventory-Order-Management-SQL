
--creating the Table Supplier

CREATE TABLE Supplier (
    SID CHAR(5) PRIMARY KEY NOT NULL,
    SName VARCHAR(50) NOT NULL,
    SAdd VARCHAR(100) NOT NULL,
    SCity VARCHAR(50) DEFAULT 'Delhi',
    SPhone CHAR(15) NOT NULL UNIQUE,
    SEmail VARCHAR(50) NOT NULL
);

--creating the Table Product

create table Product(
PID char(5) primary key not null ,
PDesc varchar(100) not null,
Price decimal check(Price>0) not null,
Category char(2) check(Category in ('IT','HA','HC')) ,
SID char(5) References Supplier (SID)
);


--creating the Table Stock

create table Stock(
PID char(5) References Product (PID),
SQty int check(SQty>0),
ROL int check(ROL>0),
MOQ int check(MOQ>0)
);


--creating the Table Customer

create table Customer(
CID char(5) primary key not null ,
CName varchar(50) not null,
CAdd varchar(100) not null,
CCity varchar(50) not null,
CPhone char(15) not null unique,
CEmail varchar(50) not null,
CDOB date check(CDOB<'2024-01-01')
);


--creating the Table Orders
create table Orders(
OID char(5) primary key not null ,
ODate date,
PID char(5) References Product (PID),
CID char(5) References Customer (CID),
OQty int check(OQty>=1)
);

create sequence s1
as int
start with 1
increment by 1;

select dbo.CID('p',10708);

create procedure InSup @N as varchar(30), @A as varchar(30), @C as varchar(30), @P as char(15),@EM as varchar(30)
AS
begin 
	DECLARE @ID as char(5);
    DECLARE @I as int;
    
    set @I = (next value for s1);
    set @ID = dbo.CID('S',@I);
    
    INSERT into Supplier
    VALUES(@ID, @N, @A, @C, @P, @EM);
    
    SELECT * from Supplier
    WHERE SID = @ID;
    
END;

InSup 'Anmol Enterprises', 'B298 Karol Bagh', 'Delhi' , '+91 9078778767','Anmol.Enterprises@gmail.com' 


create sequence s3
as INT
start with 1
increment by 1;


create procedure InProd @PD as varchar(100), @P as int, @C as char(2), @SID as char(5)
AS
BEGIN
	DECLARE @ID as char(5);
    DECLARE @I as int;
    
    set @I = (next VALUE for s3);
    SET @ID = dbo.CID('P',@I);
   
    INSERT into Product 
    VALUES (@ID, @PD, @P, @C, @SID);
    
    SELECT * from Product;

END;



create sequence s2
as int
start with 1
increment by 1;

drop procedure InStock;
create procedure InStock @PID as char(5), @S as int, @R as int, @M as int 
AS
begin
	
    INSERT into Stock
    values (@PID, @S, @R, @M)
    
    select * from Stock

END;

create sequence s4
as INT
start with 1
increment by 1;

create procedure InCust @N as varchar(50), @A as varchar(100), @C as varchar(50), @P as varchar(100), @EM as varchar(50), @DOB as varchar(100)
as 
BEGIN
	
    DECLARE @ID as char(5);
    DECLARE @I as int;
    
    set @I = next value for s4;
    set @ID = dbo.CID('C',@I);
    
    INSERT into Customer
    values (@ID, @N, @A, @C, @P, @EM, @DOB)
	
    select * from Customer;

END;

create sequence s5
as INT
start with 1
increment by 1;

create procedure InOrd @PID as char(5), @CID as char(5), @Q as INT
as 
BEGIN
    DECLARE @ID as char(5);
    DECLARE @I as int;
    
    set @I = next value for s5;
    set @ID = dbo.CID('O',@I);
    
    INSERT into Orders
    values(@ID, GETDATE(), @PID, @CID, @Q);
    
    SELECT * from Orders;

END;


SELECT * from Supplier;
SELECT * from Product;
SELECT * from Stock;
SELECT * from Customer;
SELECT * from Orders;


InSup 'Suresh & sons Enterprises', 'B1890 Rajouri Garden', 'Delhi','+91 9878675678', 'sureshsons.enterprises@outlook.com'
InSup 'Khushi Trading Company', 'B1/890 Tagore Garden', 'Delhi','+91 9789709678', 'Khushi.Tradingcompany@outlook.com'
InSup 'Almarai Enterprise', 'C18/910 Netaji Subhash Palace', 'Delhi','+91 8975647798', 'enterprises.almarai@outlook.com'

UPDATE Product
SET category = 'IT'
WHERE pid = 'P0002';


InProd 'Mouse',500,'IT','S0005'
InProd 'Mouse',500,'IT','S0003'
InProd 'Keyboard',1500,'IT','S0005'
InProd 'Speaker',2500,'IT','S0004'
InProd 'Fan',1500,'HA','S0004'
InProd 'Fridge',1500,'HA','S0004'
InProd 'Cooler',7500,'HA','S0005'
InProd 'Washing Machine',11500,'HA','S0005'
InProd 'Air Conditioner',55000,'HA','S0003'
InProd 'Table Fan',2000,'HA','S0003'
InProd 'Cup',100,'HA','S0003'
InProd 'Shelf',500,'HA','S0004'
InProd 'Thermameter',1000,'HC','S0005'
InProd 'Microscope',5500,'HC','S0004'
InProd 'Stethoscope',85000,'HC','S0003'
InProd 'Tub',150,'HA','S0004'
InProd 'Mouse',500,'IT','S0004'

DELETE FROM Stock
where pid = 'P0002';

InStock 'P0002',100,10,50
InStock 'P0004',150,20,50
InStock 'P0005',130,20,50
InStock 'P0006',120,20,50
InStock 'P0007',50,10,20
InStock 'P0008',70,10,50
InStock 'P0009',100,10,50
InStock 'P0010',150,10,50
InStock 'P0011',240,10,50
InStock 'P0012',120,10,50
InStock 'P0013',340,10,50
InStock 'P0014',450,10,50
InStock 'P0015',900,10,50
InStock 'P0016',120,10,50
InStock 'P0017',100,10,50
InStock 'P0018',200,10,50
InStock 'P0019',300,10,50
InStock 'P0020',400,10,50
InStock 'P0021',350,10,50

InCust 'Sachin Kumar', 'A545 Patel Nagar', 'Delhi', '+91 8767564356', 'Sachin.kumar98@gmail.com','1999-09-15'
InCust 'Ravi Kumar', 'A45 New Patel Nagar', 'Delhi', '+91 7867980998', 'Ravi.kumar@gmail.com','1994-01-05'
InCust 'Rehan Khan', 'B5/45 Old Patel Nagar', 'Delhi', '+91 8764387877', 'Rehankhan76@gmail.com','1999-09-15'
InCust 'Sunil Dutt', 'C4/5 Rajendar Nagar', 'Delhi', '+91 7867584909', 'Sunil.dutt82@gmail.com','1999-09-15'
InCust 'Harmohan Singh', 'D-9/4 Patel Nagar', 'Delhi', '+91 8765132456', 'Harmohan87Singh@gmail.com','1999-09-15'

create TRIGGER TR_InOrd
on Orders
for INSERT
AS
BEGIN
	set nocount on;
	DECLARE @QR as INT;
    DECLARE @QS as INT;
    
    set @QR = (SELECT oqty from Inserted);
    set @QS = (SELECT sqty from Stock where pid = (SELECT Pid from inserted));
    
    If @QS >= @QR
    	BEGIN
          UPDATE Stock set sqty = sqty - (SELECT oqty from Inserted)
          where PID = (SELECT PID from inserted);
          commit;
          print('Order Accepted');
        END;
     else
     	BEGIN
        	rollback;
            print('Insufficient Quantity, Order Rejected')
        END;
END;


InOrd 'P0007','C0003',15;
InOrd 'P0002','C0001',50;

