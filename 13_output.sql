13->Ans:
 
 Create table PUBLISHER(PID int,PNAME varchar(20),ADDRESS varchar(20),STATE varchar(20),PHONE varchar(20),EMAILID varchar(20));
Query OK, 0 rows affected (0.03 sec)

mysql> Create table BOOK(ISBN int,BOOK_TITLE varchar(20),CATEGORY varchar(20),PRICE int,COPYRIGHT_DATE date,YEAR varchar(20),PAGE_COUNT int,PID int);
Query OK, 0 rows affected (0.01 sec)

mysql> Create table AUTHOR(AID int,ANAME varchar(20),STATE varchar(20),CITY varchar(20),ZIP int,PHONE BIGINT,URL varchar(20));
Query OK, 0 rows affected (0.02 sec)

mysql> Create table AUTHOR_BOOK(AID int,ISBN int);
Query OK, 0 rows affected (0.02 sec)

mysql> Create table REVIEW (RID int,ISBN int,RATING int);
Query OK, 0 rows affected (0.02 sec)

mysql> insert into AUTHOR values(1,"CHETAN BHAGAT","DELHI","DELHI",411,9833928209,"www.chetan.com");
Query OK, 1 row affected (0.01 sec)


mysql> 1.Ans: Select CITY,PHONE,URL from AUTHOR WHERE ANAME="CHETAN BHAGAT";
+-------+------------+----------------+
| CITY  | PHONE      | URL            |
+-------+------------+----------------+
| DELHI | 9833928209 | www.chetan.com |
+-------+------------+----------------+
1 row in set (0.00 sec)

2.Select BOOK.BOOK_TITLE,REVIEW.RID from BOOK INNER JOIN REVIEW ON BOOK.ISBN=REVIEW.ISBN;
+------------+------+
| BOOK_TITLE | RID  |
+------------+------+
| DSA        |   13 |
+------------+------+

3.SELECT BOOK.BOOK_TITLE,BOOK.PRICE,AUTHOR.ANAME,AUTHOR.URL FROM BOOK INNER JOIN PUBLISHER On AUTHOR.STATE=PUBLISHER.STATE;

4.UPDATE PUBLISHER SET PHONE=123456 WHERE PNAME="MEHTA";

5.1.SELECT avg(BOOK.PRICE) from BOOK INNER JOIN PUBLISHER ON PUBLISHER.PID=BOOK.PID;
+-----------------+
| avg(BOOK.PRICE) |
+-----------------+
|        450.0000 |
+-----------------+
 
 2. SELECT MAX(BOOK.PRICE) from BOOK INNER JOIN PUBLISHER ON PUBLISHER.PID=BOOK.PID;
+-----------------+
| MAX(BOOK.PRICE) |
+-----------------+
|             500 |
+-----------------+

3.SELECT MIN(BOOK.PRICE) from BOOK INNER JOIN PUBLISHER ON PUBLISHER.PID=BOOK.PID;
+-----------------+
| MIN(BOOK.PRICE) |
+-----------------+
|             400 |
+-----------------+



6.DELETE FROM BOOK WHERE PAGE_COUNT < 100;

7. SELECT *from AUTHOR WHERE CITY="PUNE" AND ANAME LIKE "C%";
+------+--------+-------+------+-------+-------+------------+
| AID  | ANAME  | STATE | CITY | ZIP   | PHONE | URL        |
+------+--------+-------+------+-------+-------+------------+
|   10 | Chaman | MH    | PUNE | 41101 |  1733 | www.sql.in |
+------+--------+-------+------+-------+-------+------------+

8.SELECT *from AUTHOR WHERE CITY="Kurth";

9. 

Ans:
CREATE PROCEDURE updatePage(ISBN int)
    -> BEGIN
    -> UPDATE BOOK SET PAGE_COUNT=100;
    -> end
    -> //



insert into BOOK values(12,"DSA","SPECIAL",123,"2022-02-23",2022,23,89);
    -> //
Query OK, 1 row affected (0.00 sec)

mysql> call updatePage(12);
    -> //
Query OK, 1 row affected (0.01 sec)

mysql> select *from BOOK;
    -> //
+------+------------+----------+-------+----------------+------+------------+------+
| ISBN | BOOK_TITLE | CATEGORY | PRICE | COPYRIGHT_DATE | YEAR | PAGE_COUNT | PID  |
+------+------------+----------+-------+----------------+------+------------+------+
|   12 | DSA        | SPECIAL  |   123 | 2022-02-23     | 2022 |        100 |   89 |
+------+------------+----------+-------+----------------+------+------------+------+

10 CREATE FUNCTION retrievePrice(ISBN int)
    -> BEGIN
    -> DECLARE
    -> pg_cnt int;
    -> select pg_cnt into PRICE from BOOK where BOOK.ISBN=ISBN;
    -> RETURN pg_cnt;
    -> end
    -> //
