use nintendoSales;
go

create schema Nintendo;
go



CREATE TABLE Nintendo.Customer (
    CustomerID INT NOT NULL,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Phone_Number VARCHAR(50),
    Email_Address VARCHAR(50),
    Customer_Address VARCHAR(100),
CONSTRAINT Customer_PK PRIMARY KEY (CustomerID)
    );
    
CREATE TABLE Nintendo.Retailer (
    RetailerID INT NOT NULL,
    Retailer_Name VARCHAR(30),
    Retailer_Capacity INT,
    Retailer_Region VARCHAR(10),
    COGS FLOAT,
CONSTRAINT Retailer_PK PRIMARY KEY (RetailerID)
);

CREATE TABLE Nintendo.Products (
    ProductID INT NOT NULL,
    RetailerID int not null,
    Product_Type VARCHAR (20),
    Serial_Number INT,
    Product_Date DATE,
    Units_Sold INT,
    Product_Price FLOAT,
    Product_Inventory_Amt INT,
CONSTRAINT Products_pk PRIMARY KEY (ProductID),
constraint Products_fk foreign key (RetailerID) references Nintendo.Retailer(RetailerID)
);

CREATE TABLE Nintendo.VideoGame (
ProductID  Int Not Null,
rating VARCHAR(30),
Genre VARCHAR(30),

constraint Product_PK primary key (ProductID),
constraint Product_FK foreign key (ProductID) references Nintendo.Products (ProductID));

CREATE TABLE Nintendo.Console (
ProductID  Int Not Null,
Memory_space VARCHAR(30),
specialEdition VARCHAR(30),

constraint Console_PK primary key (ProductID),
constraint Console_FK foreign key (ProductID) references Nintendo.Products (ProductID));

CREATE TABLE Nintendo.Apparel (
ProductID  Int Not Null,
Material VARCHAR(30),
ApparelSize VARCHAR(30),

constraint Apparel_PK primary key (ProductID),
constraint Apparel_FK foreign key (ProductID) references Nintendo.Products (ProductID));

CREATE TABLE Nintendo.Toy (
ProductID  Int Not Null,
Material VARCHAR(30),

constraint Toy_PK primary key (ProductID),
constraint Toy_FK foreign key (ProductID) references Nintendo.Products (ProductID));


CREATE TABLE Nintendo.Manufacturer (
    ManufacturerID INT NOT NULL,
    ProductID int not null,
    Manufacturer_Name VARCHAR(20),
    Manufacturer_Address VARCHAR(50),
    Overhead_Cost FLOAT,
    Production_Time INT,
    Production_Capactiy INT,
CONSTRAINT Manufacturer_PK PRIMARY KEY (ManufacturerID),
constraint Manufacturer_fk foreign key (ProductID) references Nintendo.Products (ProductID)
);

CREATE TABLE Nintendo.Departments (
    DepartmentID INT NOT NULL,
    ManufacturerID int not null,
    Department_Location VARCHAR(20),
    Department_Manager_Name VARCHAR (20),
    Department_Project VARCHAR(50),
    Number_of_Employees INT,
    Department_Type VARCHAR(20),
CONSTRAINT Department_PK PRIMARY KEY (DepartmentID),
constraint Department_FK foreign key (ManufacturerID) references Nintendo.Manufacturer (ManufacturerID)
);

CREATE TABLE Nintendo.Finance (
Departents VARCHAR(30),

constraint Finance_PK primary key (DepartmentID),
constraint Finance_FK foreign key (DepartmentID) references Nintendo.Departments (DepartmentID));mentID  Int Not Null,
Investm

CREATE TABLE Nintendo.Accounting (
DepartmentID  Int Not Null,
Budgeting VARCHAR(30),
Auditing VARCHAR(30),

constraint Accounting_PK primary key (DepartmentID),
constraint Accounting_FK foreign key (DepartmentID) references Nintendo.Departments (DepartmentID));

CREATE TABLE Nintendo.InfoSystem (
DepartmentID  Int Not Null,
ProjectManagement VARCHAR(30),

constraint InfoSys_PK primary key (DepartmentID),
constraint InfoSys_FK foreign key (DepartmentID) references Nintendo.Departments (DepartmentID));

CREATE TABLE Nintendo.Employees (
		EmployeeID INT NOT NULL,
        DepartmentID int not null,
        Employee_Name VARCHAR(30),
        Employee_Salary INT,
        Employee_Skill VARCHAR(20),
        Employee_Hire_Date DATE,
        Employee_Type VARCHAR(20),
        ManagerID int not null,
CONSTRAINT Employee_PK PRIMARY KEY (EmployeeID),
constraint Employee_fk foreign key (DepartmentID) references Nintendo.Departments (DepartmentID),
constraint manager_FK foreign key (ManagerID) references Nintendo.Employees (EmployeeID)
);

CREATE TABLE Nintendo.PartTime (
EmployeeID  Int Not Null,
part_Time_Hours int,

constraint PartTime_PK primary key (EmployeeID),
constraint PartTime_FK foreign key (EmployeeID) references Nintendo.Employees (EmployeeID));

CREATE TABLE Nintendo.FullTime (
EmployeeID  Int Not Null,
Full_Time_Hours int,

constraint FullTime_PK primary key (EmployeeID),
constraint FullTime_FK foreign key (EmployeeID) references Nintendo.Employees (EmployeeID));

CREATE TABLE Nintendo.Internship (
EmployeeID  Int Not Null,
Intern_Hours int,

constraint InternTime_PK primary key (EmployeeID),
constraint InternTime_FK foreign key (EmployeeID) references Nintendo.Employees (EmployeeID));

CREATE TABLE Nintendo.Contract (
EmployeeID  Int Not Null,
Contract_Hours int,

constraint ContractTime_PK primary key (EmployeeID),
constraint ContractTime_FK foreign key (EmployeeID) references nintendo.Employees (EmployeeID));


-- Any mistakes made in certain fields were dropped and added back to avoid mistakes in inputs
--customer table
alter table Nintendo.Customer
drop column Customer_Address;
alter table Nintendo.Customer
add Customer_Address VARCHAR(200);

-- department table
alter table Nintendo.Departments
drop column Department_Location;
alter table Nintendo.Departments
add Department_Location VARCHAR(200);

--retailer table
alter table Nintendo.Retailer
add Retailer_Address VARCHAR(200);

alter table Nintendo.fulltime
add benefits VARCHAR(50);

--internship
alter table Nintendo.internship
drop column Intern_Hours;
alter table Nintendo.internship
add mentor VARCHAR(50);

--contract
alter table Nintendo.contract
drop column Contract_Hours;
alter table Nintendo.contract
add Contract_End_date date;


CREATE TABLE Nintendo.Sales (
    SalesID INT NOT NULL,
    CustomerID INT NOT NULL,
    RetailerID INT NOT NULL,
CONSTRAINT Sales_PK PRIMARY KEY (SalesID),
CONSTRAINT Sales_FK_1 FOREIGN KEY (CustomerID) REFERENCES Nintendo.Customer(CustomerID),
CONSTRAINT Sales_FK_2 FOREIGN KEY (RetailerID) REFERENCES Nintendo.Retailer(RetailerID));

-- Data inputs
-- Customers
INSERT INTO Nintendo.Customer VALUES (917,'Clifford','Williams','5101699192','CliffordWilliams.gmail.com','838 Austin River West Maria, MI 53982');
INSERT INTO Nintendo.Customer VALUES (359,'Newton','Johnson','5101072992','NewtonJohnson.gmail.com','09843 Jamie Mountains South Susanmouth, ME 39834');
INSERT INTO Nintendo.Customer VALUES (825,'Lynne','Healey','5101185956','LynneHealey.gmail.com','236 Valdez Plain Apt. 412 Danielfort, HI 67054');
INSERT INTO Nintendo.Customer VALUES (548,'Robert','Stutzman','5101348471','RobertStutzman.gmail.com','56975 Moore Skyway Suite 883 South Tamaraberg, GA 39308');
INSERT INTO Nintendo.Customer VALUES (781,'Judy','Hernandez','5101802079','JudyHernandez.gmail.com','73291 Douglas Path Apt. 350 East Jodyborough, ME 57276');

update Nintendo.Customer set Customer_address = '838 Austin River West Maria, MI 53982' where customerID = 917;
update Nintendo.customer set Customer_address = '09843 Jamie Mountains South Susanmouth, ME 39834' where customerID = 359;
update Nintendo.customer set Customer_address = '236 Valdez Plain Apt. 412 Danielfort, HI 67054' where customerID = 825;

-- Retailers
INSERT INTO Nintendo.Retailer VALUES (100, ' Walmart', 7500, 'west',5500,'1159 W A St, Hayward, CA 94541');
INSERT INTO Nintendo.Retailer VALUES (200, ' Target', 6300, 'East',5300,'2187 Shattuck Ave, Berkeley, CA 94704');
INSERT INTO Nintendo.Retailer VALUES (300, ' Gamestop', 2000, 'west',1000, '40580 Albrae St, Fremont, CA 94538');
INSERT INTO Nintendo.Retailer VALUES (400, 'Gamestop', 5000, 'East',4000,'2425 Claribel Rd, Riverbank, CA 95367');
INSERT INTO Nintendo.Retailer VALUES (500, ' Best Buy', 8000, 'west',5900, '1717 Harrison St, San Francisco, CA 94103');

-- sales
insert into Nintendo.sales values (01, 917, 300);
insert into Nintendo.sales values (02, 359, 100);
insert into Nintendo.sales values(03, 825, 200);
insert into Nintendo.sales values(04, 548, 400);
insert into Nintendo.sales values(05, 781, 500);
-- product 
INSERT INTO Nintendo.Products VALUES (846,100,'Video Game',977,'11/02/2019',624,59.99,159);
INSERT INTO Nintendo.Products VALUES (900,200,'Console',857,'12/31/2018',998,300.0,394);
INSERT INTO Nintendo.Products VALUES (226,300,'Apparel',751,'6/15/2016',977,20.0,512);
INSERT INTO Nintendo.Products VALUES (830,400,'Toy',185,'4/01/2015',223,15.0,577);
INSERT INTO Nintendo.Products VALUES (978,500,'Video Game',258,'01/25/2020',335,59.99,664);

-- fix date errors
update Nintendo.products set Product_date = '2019-11-02' where productID = 846;
update Nintendo.products set Product_date = '2018-12-31' where productID = 900;
update Nintendo.products set Product_date = '2016-06-15' where productID = 226;
update Nintendo.products set Product_date = '2015-04-01' where productID = 830;
update Nintendo.products set Product_date = '2020-01-25' where productID = 978;

-- video game type
INSERT INTO Nintendo.videogame VALUES (846, 'Everyone', 'Strategy');
INSERT INTO Nintendo.videogame VALUES (978, 'Teen', 'Action');

-- Console type
INSERT INTO Nintendo.console VALUES (900, '1TB', 'Mario Kart');

-- Apparel type
INSERT INTO Nintendo.apparel VALUES (226, 'Cotton', 'Medium');

-- Toy type
INSERT INTO Nintendo.toy VALUES (830, 'plastic lego');

-- manufacturer
INSERT INTO Nintendo.Manufacturer VALUES (1001, 846, '1-Up Studio', 'Japan', 10000, 60, 20000);
INSERT INTO Nintendo.Manufacturer VALUES (1002,900, 'iQue', 'China', 10000, 60, 20000);
INSERT INTO Nintendo.Manufacturer VALUES (1003, 226, 'Monolith Soft', 'India', 10000, 60, 20000);
INSERT INTO Nintendo.Manufacturer VALUES (1004, 830, 'NDcube', 'Cambodia', 10000, 60, 20000);
INSERT INTO Nintendo.Manufacturer VALUES (1005, 978, 'Retro Studios', 'Vietnam', 10000, 60, 20000);

-- department
INSERT INTO Nintendo.departments VALUES (2501,1003,'Daniel Hopkins', 'video games', 40, 'Accounting','1201 Fillmore St, San Francisco, CA 94115');
INSERT INTO Nintendo.departments VALUES (2502,1002,'Randy Mendez', 'Advertisement', 30, 'Finance','735 Battery St, San Francisco, CA 94111');
INSERT INTO Nintendo.departments VALUES (2503,1001,'Walter Winston', 'Advertisement', 40, 'Accounting','999 Van Ness Ave, San Francisco, CA 94109');
INSERT INTO Nintendo.departments VALUES (2504,1005,'Annabelle Fang', 'IT security', 20, 'Information Systems','450 10th St, San Francisco, CA 94103');
INSERT INTO Nintendo.departments VALUES (2505,1004,'Maria Rolts', 'IT security', 20, 'Information Systems','4400 Shellmound St, Emeryville, CA 94608');

-- Accounting type
INSERT INTO Nintendo.accounting VALUES (2501, '250000', '????????');
INSERT INTO Nintendo.accounting VALUES (2503, '400000', '???????');

-- Finance type
INSERT INTO Nintendo.finance VALUES (2502, 'third party company');

-- Info system type
INSERT INTO Nintendo.infosystem VALUES (2504, 'IT security');
INSERT INTO Nintendo.infosystem VALUES (2505, 'IT security');

-- Employee
INSERT INTO Nintendo.Employees VALUES (2001, 2501, 'Jeff Hoeffrey', 101365, 'programmer', '5/12/17', 'Full Time', 2001);
INSERT INTO Nintendo.Employees VALUES (2002, 2503, 'Mandy Cortez', 87655, 'Consultant', '3/15/18', 'Full Time', 2002);
INSERT INTO Nintendo.Employees VALUES (2003, 2502, 'Johnathan Trumes', 55374, 'Consultant', '1/26/19', 'Part Time', 2002);
INSERT INTO Nintendo.Employees VALUES (2004, 2504, 'Andrea Rudio', 86164, 'Analyst', '8/5/18', 'Contract', 2005);
INSERT INTO Nintendo.Employees VALUES (2005, 2505, 'Winnie Dapuh', 75194, 'Architect', '12/26/19', 'Intership', 2005);


-- fix date errors
update Nintendo.employees set Employee_Hire_date = '2017-05-12' where EmployeeID = 2001;
update Nintendo.employees set Employee_Hire_date = '2018-03-15' where EmployeeID = 2002;
update Nintendo.employees set Employee_Hire_date = '2019-01-26' where EmployeeID = 2003;
update Nintendo.employees set Employee_Hire_date = '2018-12-26' where EmployeeID = 2004;
update Nintendo.employees set Employee_Hire_date = '2019-12-26' where EmployeeID = 2005;
--  part time
insert into Nintendo.parttime values (2003, 24);

-- Full time
insert into Nintendo.fulltime values (2001, 40, 'yes');
insert into Nintendo.fulltime values (2002, 40, 'yes');

-- Intern
insert into Nintendo.internship values (2005, 'Bob builder');

-- Contract
insert into Nintendo.contract values (2004, '12/24/2020');

-- fix date errors
update Nintendo.contract set Contract_End_Date = '2020-12-24' where EmployeeID = 2004;

--- Please note, the queries are based on MYSQL workbench layout. Although the table can be joined like this, a Join will also be smiliar to the pathing.
-- THE QUERIES
-- Query 1
select RetailerID, retailer_Name, COGS
from Nintendo.retailer
where (COGS >= 3500 and COGS <= 5400);

-- Query 2
select products.productID, Units_sold, product_Type, genre
from Nintendo.products, Nintendo.videogame
where product_Type = 'video game' and Products.ProductID = videogame.ProductID;

-- Query 3 
select customer.customerID, First_Name, SalesID, Retailer.RetailerID, Retailer_Name
from Nintendo.customer, Nintendo.sales, Nintendo.retailer
where customer.customerID = sales.CustomerID 
and sales.RetailerID = retailer.RetailerID
and retailer_Name like '%Gamestop';

-- Query 4
select salesID, Retailer.RetailerID, Retailer_region, product_Inventory_Amt, Units_Sold
from Nintendo.sales, Nintendo.retailer, Nintendo.products
where sales.retailerID = retailer.retailerID
and retailer.retailerID = products.retailerID
and Retailer_Region like '%west';

-- Query 5
select manufacturer.ManufacturerID, Manufacturer_Name, department_Manager_Name, Department_type, projectmanagement
from Nintendo.manufacturer, Nintendo.departments, Nintendo.infosystem
where manufacturer.ManufacturerID = departments.ManufacturerID
and departments.DepartmentID = infosystem.DepartmentID
and department_Type like '%Information Systems';

select * from nintendo.contract;