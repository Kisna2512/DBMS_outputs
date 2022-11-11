12.

create Database DBMS_Lab;
use DBMS_Lab;
Create table Deposit(actno int,cname varchar(20),bname varchar(20),amount int,adate date);
Create table Branch(bname varchar(20),city varchar(20));
create table Customers(cname varchar(20),city varchar(20))
create table Borrow(loanno int,cname varchar(20),bname varchar(20),amount int);

1.for first question insert this info to respective table.
 insert into Customers values("Krishna","Bombay");
 insert into Branch values("Kothrud","Nagpur");

  Ans:SELECT cname from Customers Inner join Branch On Customers.city="Bombay" AND Branch.city="Nagpur";

output:
+---------+
| cname   |
+---------+
| Krishna |
+---------+

2.for second question
insert into Customers values("Darshan","Pune");
insert into Customers values("Kartik","Pimpri");


Ans:SELECT cname from Customers Inner join Branch On Customers.city=Branch.city;


 select *from Customers;
+---------+--------+
| cname   | city   |
+---------+--------+
| Darshan | Pune   |
| Kartik  | Pimpri |
| Krishna | Bombay |
+---------+--------+
3 rows in set (0.00 sec)

mysql> Select *from Branch;
+---------+--------+
| bname   | city   |
+---------+--------+
| Pune    | Pune   |
| Pimpri  | Pimpri |
| Kothrud | Nagpur |
+---------+--------+

3.
 select *from Deposit;
+-------+---------+--------+--------+------------+
| actno | cname   | bname  | amount | adate      |
+-------+---------+--------+--------+------------+
|   100 | Krishna | Pune   |   2500 | 2022-10-11 |
|   101 | Aniket  | Pimpri |   4200 | 2022-10-01 |
|   102 | Sanket  | Pune   |   4200 | 2022-10-01 |
+-------+---------+--------+--------+------------+

 Select *from Customers;
+---------+--------+
| cname   | city   |
+---------+--------+
| Darshan | Pune   |
| Kartik  | Pimpri |
| Krishna | Bombay |
+---------+--------+
Ans:
select Customers.cname from Customers Inner join  Borrow On Borrow.cname=Customers.cname Inner Join Deposit On  Borrow.bname=Deposit.bname;

4.Ans:Select Borrow.cname from Borrow Inner join  Deposit ON  Borrow.bname=Deposit.bname  where Borrow.amount > 2000 AND Deposit.amount > 1000;

5.Ans: Select Customers.cname from Customers Inner join Deposit On Customers.cname=Deposit.cname Inner join Branch On Deposit.bname=Branch.bname AND Deposit.cname="Aniket";
+--------+
| cname  |
+--------+
| Aniket |
+--------+

6.Ans:Create INDEX indx ON Deposit(actno,cname,bname,amount,adate);

