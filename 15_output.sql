CREATE Procedure return_book(roll_no int,Book varchar(20))
    -> BEGIN
    -> DECLARE late int;
    -> SELECT datediff(curdate(),DOI) into late from Borrower where Borrower.Roll_no=roll_no;
    -> select late;
    -> if late > 15 and late <=30
    -> then
    -> insert into Fine values(roll_no,late*5);
    -> elseif late > 30
    -> then
    -> insert into Fine values(roll_no,late*50);
    -> else
    -> insert into Fine values(roll_no,0);
    -> end if;
    -> update Borrower set Borrower.Status="R" where Borrower.Roll_no=roll_no;
    -> SELECT *from Fine where Borrower.Roll_no=Fine.Roll_no;
    -> end
    -> //
