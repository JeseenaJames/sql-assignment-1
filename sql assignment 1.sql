Create database warehouseineuron
 use warehouseineuron database
With Warehouse_Size = 'Small' Warehouse_Type = 'Standard' Auto_Suspend = 300 Auto_Resume = True;


Fsda Assignment Ftask 1

Create Database Ag_Fsda_Task_1;
Use Ag_Fsda_Task_1;

Create Table Shopping_History (
Product Varchar(30) Not Null,
Quantity Integer Not Null,
Unit_Price Integer Not Null);

Insert Into Shopping_History(Product,Quantity,Unit_Price) Values ('Milk',3,10),
('bread',7,3),
('bread',5,2);

Select * From Shopping_History

Solution of Task 1

Select Product,Sum(Quantity * Unit_Price) As Aggregate_Sales From Shopping_History Group By Product;

			End Of Task 1
            
            
            Fsda Assignment 1-----Task 2
Create Database Ag_Fsda_Task_2;

Use Ag_Fsda_Task_2;

Create Table Phones(
`Name` Varchar(15) Not Null Unique,
Phone_Number Integer Not Null Unique);

Create Table Calls (
    Id Integer Not Null,
    Caller Integer Not Null,
    Callee Integer Not Null,
    Duration Integer Not Null,
    Unique (Id));
    
    Insert Into Phones(`Name`,Phone_Number) Values ('Jack',1234),
('Lena',3333),
('Mark',9999),
('Anna',7582);


Insert Into Calls(Id,Caller,Callee,Duration) Values (25,1234,7582,8),
(7,9999,7582,1),
(18,9999,3333,4),
(2,7582,3333,3),
(3,3333,1234,1),
(21,3333,1234,1);

Select * From Phones;
Select * From Calls;

Solution Of Task 2

Select `Name` From
(Select P.`Name`, Sum(C.Duration) As Total_Duration From Phones P
Inner Join 
Calls C On P.Phone_Number = C.Caller
Group By `Name`
Union All
Select P.`Name`, Sum(C.Duration) As Total_Duration From Phones P
Inner Join 
Calls C On P.Phone_Number = C.Callee
Group By `Name`) 

As Final_Duration
Group By `Name`Having Sum(Total_Duration) >= 10 Order By `Name`;

Truncate Table To Remove Only The Values From The Table Without Dropping The Whole Table To Perform The Second Case


Truncate Table Phones;
Truncate Table Calls;
Select * From Phones;
Select * From Calls;)



Insert Into Phones(`Name`,Phone_Number) Values ('John',6356),
('Addison',4315),
('Kate',8003),
('Ginny',9831);

Insert Into Calls(Id,Caller,Callee,Duration) Values  (65,8003,9831,7),
(100,9831,8003,3),
(145,4315,9831,18);

Select * From Phones;
Select * From Calls;

Select`Name` From
(Select P.`Name`, Sum(C.Duration) As Total_Duration From Phones P
Inner Join 
Calls C On P.Phone_Number = C.Caller
Group By `Name`
Union All
Select P.`Name`, Sum(C.Duration) As Total_Duration From Phones P
Inner Join 
Calls C On P.Phone_Number = C.Callee
Group By `Name`)

 As Final_Duration Group By `Name`Having Sum(Total_Duration) >= 10 Order By `Name`;

End Of Task 2

Fsda Assigment 1 Task 3
Create Database Ag_Fsda_Task_3;

Use Ag_Fsda_Task_3;


Create Table Transactions(
    Amount Integer Not Null,
    `Date` Date Not Null);
    
    Insert Into Transactions (Amount,`Date`) Values (1000,'2020-01-06'),
(-10,'2020-01-14'),
(-75,'2020-01-20'),
(-5,'2020-01-25'),
(-4,'2020-01-29'),
(2000,'2020-03-10'),
(-75,'2020-03-12'),
(-20,'2020-03-15'),
(40,'2020-03-15'),
(-50,'2020-03-17'),
(200,'2020-10-10'),
(-200,'2020-10-10');

Select * From Transactions;

Total_Balance Without Credit Fees 

Select Sum(Amount) As Balance From Transactions;

Solution Of Task 3

With Final_Result 

As (Select Sum(Amount) As Sum_Transaction, Count(Amount) As Count_Of_Transaction
From Transactions
Where Amount<0
Group By Year(`Date`), Month(`Date`)
Having Sum_Transaction<=-100 And Count_Of_Transaction>=3)

Select Sum(Amount)-(12-(Select Distinct(Count(*)) From Final_Result)) * (5) As Balance From Transactions;

Again Truncate The Table For Second Task

  Truncate  Table Transactions;
  
    Insert Into Transactions (Amount,`Date`) Values (1,'2020-06-29'),
(35,'2020-02-20'),
(-50,'2020-02-03'),
(-1,'2020-02-26'),
(-200,'2020-08-01'),
(-44,'2020-02-07'),
(-5,'2020-02-25'),
(1,'2020-06-29'),
(1,'2020-06-29'),
(-100,'2020-12-29'),
(-100,'2020-12-30'),
(-100,'2020-12-31');

Select * From Transactions;

Total Balance Without Credit Fees 

Select Sum(Amount) As Balance From Transactions;

Solution Of The Second Task

With Final_Result

(Select Sum(Amount) As Sum_Transaction, Count(Amount) As Count_Of_Transaction
From Transactions
Where Amount<0
Group By Year(`Date`), Month(`Date`)
Having Sum_Transaction<=-100 And Count_Of_Transaction>=3)

Select Sum(Amount)-(12-(Select Distinct(Count(*)) From Final_Result)) * (5) As Balance From Transactions;

Again Truncate The Table For Third Task

Truncate  Table Transactions;

Insert Into Transactions (Amount,`Date`) Values (6000,'2020-04-03'),
(5000,'2020-04-02'),
(4000,'2020-04-01'),
(3000,'2020-03-01'),
(2000,'2020-02-01'),
(1000,'2020-01-01');

Select * From Transactions;

Total Balance Without Credit Fees 

Select Sum(Amount) As Balance From Transactions;

Solution Of The Third Task


With Final_Result As
 (Select Sum(Amount) As Sum_Transaction, Count(Amount) As Count_Of_Transaction
From Transactions
Where Amount<0
Group By Year(`Date`), Month(`Date`)
Having Sum_Transaction<=-100 And Count_Of_Transaction>=3)

Select Sum(Amount)-(12-(Select Distinct(Count(*)) From Final_Result)) * (5) As Balance From Transactions;


End Of Task 3

















