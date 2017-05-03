SELECT * FROM PEOPLE;
SELECT * FROM MANAGERS;	
SELECT * FROM RETAIL_ASSISTANTS;
SELECT * FROM CUSTOMERS;
SELECT * FROM ORDERS;
SELECT * FROM PAYMENT;
SELECT * FROM INVENTORY;	
SELECT * FROM SALES;
SELECT * FROM PACKAGES;
SELECT * FROM RENTALS;
SELECT * FROM COMISSIONS;
CREATE TABLE People ( 
pID varchar not null,  
firstName text,  
lastName text,  
phoneNumber varchar(12),
primary key (pID)
);

CREATE TABLE Managers(
  mID varchar not null references People(pID),
  address text,
  department text,
  dateOfBirth date,
  primary key (mID)
);

CREATE TABLE Retail_Assistants (
  raID varchar not null references People(pID),
  address text,
  dateOfBirth date,
  isFullTime boolean,
  isPartTime boolean, 
  primary key (raID)
);

CREATE TABLE Customers (
  cID varchar not null references People(pID) ,
  address text,
  heightInches integer,
  weightPounds integer,
  dateOfBirth date,
  skillLevel text,
  primary key (cID)
);


CREATE TABLE Orders (
  orderID varchar not null,
  cID varchar not null references Customers(cID),
  date date,
  totalCostUS money,
  primary key (orderID)
);


CREATE TABLE Payment(
  payID varchar not null unique,
  orderID varchar not null references Orders(orderID),
  cID varchar not null references Customers(cID),
  raID varchar not null references Retail_Assistants(raID),
  paymentType text,
  primary key (payID)
);

CREATE TABLE Inventory (
  itemID varchar not null unique,
  rentalPriceUSD money,
  salePriceUSD money,
  type text,
  name text,
  brand text,
  inStock integer,
  primary key (itemID)
);


CREATE TABLE Sales (
  purchaseID varchar not null unique,
  orderID varchar not null references Orders(orderID),
  itemID varchar not null references Inventory(itemID),
  raID varchar not null references Retail_Assistants(raID),
  cID varchar not null references Customers(cID),
  totalCostUSD money,
  primary key (purchaseID)
);

CREATE TABLE Packages (
  paID varchar not null,
  name text,
  priceUSD money,
  skillLevel text not null,
  hasSnowboard boolean not null,
  hasBindings boolean not null,
  hasBoardBoots boolean not null,
  hasSkiis boolean not null,
  hasPolls boolean not null,
  hasSkiiBoots boolean not null,
  hasHelmet boolean not null,
  itemID varchar not null references Inventory(itemID) ,
  primary key (paID, skillLevel, hasSnowboard, hasBindings, hasBoardBoots, hasSkiis, hasPolls, hasSkiiBoots, hasHelmet, itemID)
);

CREATE TABLE Rentals (
  rentalID varchar not null unique,
  orderID varchar not null references Orders(orderID),
  cID varchar not null references Customers(cID),
  itemID varchar not null references Inventory(itemID),
  startDate date,
  returnDate date,
  totalCostUSD money,
  primary key (rentalID)
);

CREATE TABLE Comissions (
  orderID varchar not null references Orders(orderID),
  raID varchar not null references Retail_Assistants(raID),
  percentageDecimal decimal (4,3),
  primary key (orderID, raID)
);

INSERT INTO People(pID, firstName, lastName, phoneNumber)
VALUES  ('p01','Sarah', 'Jenkins', '203-322-4456'),
	('p02','Angela','Brown','845-234-6796'),
	('p03','Ryan','Lant','845-123-0954'),
	('p04','Kara','Park','860-104-6788'),
	('p05','Rachel','Campbell','914-111-3345'),
	('p06','Erin','Kelly','213-109-0713'),
	('p07','Eric','Diaz','631-657-3956'),
	('p08','Sara','Sanchez','203-100-0234'),
	('p09','Daniela','Hollis','203-520-7420'),
	('p10','Christina','Loya','860-060-2092');

INSERT INTO CUSTOMERS (cID,address,heightInches, weightPounds, dateOfBirth,skillLevel)
VALUES	('p05',	'32 North Rd, Poughkeepsie NY', 64, 130, '1979-07-07','Beginner'),
	('p06',	'21 Hollywood Rd, Los Angeles CA', 66, 150, '1981-04-20','Advanced'),
	('p08',	'1 Whispering Way, Brookfield CT', 62,	120, '1994-03-27','Intermediate'),
	('p09',	'9 Candlewood Rd, New Milford CT', 66,	145, '1996-12-18','Intermediate'),
	('p10',	'7 Milton Rd, Litchfield CT', 60, 120,	'1994-11-19','Beginner');

INSERT INTO Managers(mID, address, department, dateOfBirth)
VALUES  ('p03','752 Black Bear Rd, Jamaica VT','Snowboarding', '1967-01-03'),
	('p07','876 Lake Road, Dover VT','Skiing','1975-03-21'); 

INSERT INTO Retail_Assistants(raID, address, dateOfBirth, isFullTime, isPartTime)
VALUES  ('p01',	'432 Main Street, Dover VT', '1996-12-19',FALSE ,TRUE),
	('p02', '88 Circle Drive, Jamaica VT', '1988-01-05',TRUE, FALSE),
	('p04',	'90 Circle Drive, Jamaica VT', '1987-01-05', TRUE, FALSE); 

INSERT INTO Orders (orderID, cID, date, totalCostUS)
VALUES  ('o01',	'p05', '2000-11-12', 120.0000),
	('o02',	'p06', '2000-01-23', 100.0000),
	('o03',	'p08', '2002-02-22', 120.0000),
	('o04',	'p09', '2010-03-20', 150.0000),
	('o05',	'p10', '2011-10-12', 160.0000),
	('o06', 'p05', '2000-11-12', 200.0000);

INSERT INTO Inventory (itemID, rentalPriceUSD, salePriceUSD,type,name,brand, inStock)
VALUES	('i0001',10.0000,100.000,'snowboard','black raven','Burton',100),
	('i0002',10.0000,120.0000,'snowboard','fast lion','Burton',100),
	('i0003',10.0000,150.0000,'snowboard','fast lion 2.0','Burton'	,100),
	('i0004',10.0000,200.0000,'snowboard','ZPX','Burton',100),
	('i0005',10.0000,80.0000,'ski',	'Bolt100','Solomon',100),
	('i0006',10.0000,130.0000,'ski','Plowers','Solomon',100),
	('i0007',10.0000,50.0000,'ski','FlyThrough','Solomon',100),
	('i0008',10.0000,210.0000,'helmet','G124','Giro',100),
	('i0009',10.0000,30.0000,'helmet','G098','Giro',100),
	('i0010',10.0000,30.0000,'helmet','G000','Giro',100),
	('i0011',10.0000,30.0000,'helmet','G567','Giro',100),
	('i0012',10.0000,30.0000,'helmet','G037','Giro',100),
	('i0013',10.0000,30.0000,'helmet','G987','Giro',100),
	('i0014',10.0000,20.0000,'boardBoots','BB-X','Burton',100),
	('i0015',10.0000,25.0000,'boardBoots','BB-S','Burton',100),
	('i0016',10.0000,40.0000,'boardBoots','BB-P','Burton',100),
	('i0017',10.0000,15.0000,'skiBoots','SB-5','Solomon',100),
	('i0018',10.0000,25.0000,'skiBoots','SB-6','Solomon',100),
	('i0019',10.0000,30.0000,'skiBoots','SB-0','Solomon',100),
	('i0020',10.0000,40.0000,'Bindings','X12','Burton',100),
	('i0021',10.0000,40.0000,'Bindings','X05','Burton',100),
	('i0022',10.0000,40.0000,'Bindings','X04','Burton',100),
	('i0023',10.0000,30.0000,'poles	','PX453','Solomon',100),
	('i0024',10.0000,30.0000,'poles','PX546','Solomon',100),
	('i0025',10.0000,30.0000,'poles	','PX098','Solomon',100),
	('i0026',10.0000,30.0000,'poles','PX1246','Solomon',100);
	
INSERT INTO Packages (paID,name,priceUSD,skillLevel,hasSnowboard,hasBindings, hasBoardBoots,hasSkiis,hasPolls, hasSkiiBoots,hasHelmet,itemID)
VALUES  ('pa001','bronzePack',	40.0000	,	'beginner',	TRUE,	TRUE,	TRUE,	FALSE,	FALSE,	FALSE,	TRUE,	'i0001'),
	('pa001','bronzePack',	40.0000	,	'beginner',	TRUE,	TRUE,	TRUE,	FALSE,	FALSE,	FALSE,	TRUE,	'i0008'),
	('pa001','bronzePack',	40.0000	,	'beginner',	TRUE,	TRUE,	TRUE,	FALSE,	FALSE,	FALSE,	TRUE,	'i0014'),
	('pa001','bronzePack',	40.0000	,	'beginner',	TRUE,	TRUE,	TRUE,	FALSE,	FALSE,	FALSE,	TRUE,	'i0020'),
	('pa002','silverPack',	60.0000	,	'intermediate',	TRUE,	TRUE,	TRUE,	FALSE,	FALSE,	FALSE,	TRUE,	'i0002'),
	('pa002','silverPack',	60.0000	,	'intermediate',	TRUE,	TRUE,	TRUE,	FALSE,	FALSE,	FALSE,	TRUE,	'i0009'),
	('pa002','silverPack',	60.0000	,	'intermediate',	TRUE,	TRUE,	TRUE,	FALSE,	FALSE,	FALSE,	TRUE,	'i0015'),
	('pa002','silverPack',	60.0000	,	'intermediate',	TRUE,	TRUE,	TRUE,	FALSE,	FALSE,	FALSE,	TRUE,	'i0021'),
	('pa003','goldPack',	80.0000	,	'advanced',	TRUE,	TRUE,	TRUE,	FALSE,	FALSE,	FALSE,	TRUE,	'i0003'),
	('pa003','goldPack',	80.0000	,	'advanced',	TRUE,	TRUE,	TRUE,	FALSE,	FALSE,	FALSE,	TRUE,	'i0010'),
	('pa003','goldPack',	80.0000	,	'advanced',	TRUE,	TRUE,	TRUE,	FALSE,	FALSE,	FALSE,	TRUE,	'i0016'),
	('pa003','goldPack',	80.0000,	'advanced',	TRUE,	TRUE,	TRUE,	FALSE,	FALSE,	FALSE,	TRUE,	'i0022'),
	('pa004','redPack',	40.0000,	'beginner',	FALSE,	FALSE,	FALSE,	TRUE,	TRUE,	TRUE,	TRUE,	'i0005'),
	('pa004','redPack',	40.0000,	'beginner',	FALSE,	FALSE,	FALSE,	TRUE,	TRUE,	TRUE,	TRUE,	'i0011'),
	('pa004','redPack',	40.0000,	'beginner',	FALSE,	FALSE,	FALSE,	TRUE,	TRUE,	TRUE,	TRUE,	'i0017'),
	('pa004','redPack',	40.0000,	'beginner',	FALSE,	FALSE,	FALSE,	TRUE,	TRUE,	TRUE,	TRUE,	'i0023'),
	('pa005','bluePack',	60.0000,	'intermediate',	FALSE,	FALSE,	FALSE,	TRUE,	TRUE,	TRUE,	TRUE,	'i0006'),
	('pa005','bluePack',	60.0000,	'intermediate',	FALSE,	FALSE,	FALSE,	TRUE,	TRUE,	TRUE,	TRUE,	'i0012'),
	('pa005','bluePack',	60.0000,	'intermediate',	FALSE,	FALSE,	FALSE,	TRUE,	TRUE,	TRUE,	TRUE,	'i0018'),
	('pa005','bluePack',	60.0000,	'intermediate',	FALSE,	FALSE,	FALSE,	TRUE,	TRUE,	TRUE,	TRUE,	'i0024'),
	('pa006','yellowPack',	80.0000,	'advanced',	FALSE,	FALSE,	FALSE,	TRUE,	TRUE,	TRUE,	TRUE,	'i0007'),
	('pa006','yellowPack',	80.0000,	'advanced',	FALSE,	FALSE,	FALSE,	TRUE,	TRUE,	TRUE,	TRUE,	'i0013'),
	('pa006','yellowPack',	80.0000,	'advanced',	FALSE,	FALSE,	FALSE,	TRUE,	TRUE,	TRUE,	TRUE,	'i0019'),
	('pa006','yellowPack',	80.0000,	'advanced',	FALSE,	FALSE,	FALSE,	TRUE,	TRUE,	TRUE,	TRUE,	'i0025');

INSERT INTO Payment(payID,orderID,cID,raID,paymentType)
VALUES	('pt01',	'o01',	'p05',	'p02',	'credit card'),
	('pt02',	'o02',	'p06',	'p02',	'credit card'),
	('pt03',	'o03',	'p08',	'p04',	'credit card'),
	('pt04',	'o04',	'p09',	'p01',	'check'),
	('pt05',	'o05',	'p10',	'p04',	'cash'),
	('pt06',	'o06',	'p05',	'p02',	'debit card');
	
INSERT INTO Sales (purchaseID,orderID,itemID,raID,cID,totalCostUSD)
VALUES	('po001',	'o01',	'i0001',	'p02',	'p05',	100.0000),
	('po002',	'o02',	'i0002',	'p02',	'p06',	120.0000),
	('po003',	'o03',	'i0003',	'p04',	'p08',	150.0000),
	('po004',	'o04',	'i0004',	'p01',	'p09',	200.0000);

INSERT INTO Comissions (orderID,raID,percentageDecimal)
VALUES	('o01',	'p02',	0.03),
	('o02',	'p02',	0.05),
	('o03',	'p04',	0.05),
	('o04',	'p01',	0.05);
	
INSERT INTO Rentals(rentalID, orderID, cID, startDate, returnDate, totalCostUSD)	
VALUES	('r001',	'o05',	'p05',	'2011-10-12',	'2011-10-14',	120.0000),
	('r002',	'o06',	'p10',	'2000-11-12',	'2000-11-15',	160.0000);