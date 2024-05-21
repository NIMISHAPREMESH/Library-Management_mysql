-- DATABASE LIBRARY
create DATABASE Library;

USE Library;

-- Branch Table
Create Table  Branch(Branch_no int Primary Key, 
Manager_Id  int not null,
Branch_address  varchar(30) not null,
Contact_no int not null
);
DESC Branch;

-- Employee Table
Create Table  Employee(Emp_id int primary key,
Emp_name varchar(25) not null,
Position varchar (25) not null,
Salary float not null,
Branch_no int not null ,
foreign key (Branch_no) REFERENCES  Branch(Branch_no) 
);
DESC Employee;

-- Books Table
Create Table  Books(ISBN int primary key,
Book_title varchar (40) not null,
Category varchar(25) not null, 
Rental_Price float not null,
Status enum('yes','no') not null,
Author varchar(25) not null,
Publisher Varchar(25) not null
);
DESC Books;

-- Customer Table
Create Table  Customer (Customer_id int primary key,
Customer_name varchar(30) not null,
Customer_address varchar(50) not null,
Reg_date date not null
);
DESC Customer;

-- IssueStatus Table

Create Table  IssueStatus(Issue_id int primary key,
Issued_cust int not null,
foreign key (issued_cust) references Customer (Customer_id),
Issued_book_name varchar(50) not null,
Issue_date date not null, 
Isbn_book int not null ,
foreign key(Isbn_book) references Books(ISBN)
);
DESC IssueStatus;

-- ReturnStatus Table
Create Table  ReturnStatus(Return_id int primary key,
Return_cust int not null,
Return_book_name varchar(50) not null,
Return_date date not null,
Isbn_book2 int not null,
foreign key(Isbn_book2) references Books(ISBN) 
);
DESC ReturnStatus;

-- insert details into Branch Table
insert into Branch(Branch_no,Manager_Id,Branch_address,Contact_no) 
values(1,100,'Kochi',1234560000),
(2,101,'Thrissur',1234560001),
(3,102,'Kozhikode',1234560002),
(4,103,'Kannur',1234560003),
(5,104,'Kollam',1234560004);
SELECT * FROM Branch;

-- insert details into Employee table
insert into Employee(Emp_id,Emp_name ,Position,Salary ,Branch_no )
values(200,'Anu','Manager',70000,1),
(201,'Sam','Librarian',45000,1),
(202,'Anil','Accountant',30000,1),
(203,'Varna','Manager',60000,2),
(204,'Asok','Librarian',40000,2),
(205,'Kishor','Accountant',32000,2),
(206,'Maya','Manager',55000,3),
(207,'Vivek','Librarian',35000,3),
(208,'Hema','Accountant',33000,3),
(209,'Nithya','Librarian',30000,4),
(210,'Vivi','Accountant',33000,4),
(211,'Aami','Librarian',35000,5),
(212,'Hima','Accountant',30000,5),
(213,'Rema','Clerk',20000,1),
(214,'Asha','Assistant Librarian',25000,1),
(215,'Vipi','Assistant Librarian',25000,1);
SELECT * FROM Employee;

-- Insert details into Book Table
insert into Books(ISBN ,Book_title,Category ,Rental_Price,Status,Author ,Publisher )
values(9788126,'Aadujeevitham','Fiction',100,'yes','Benyamin','DC Books'),
(9788127,'Randamoozham','Mythology',125,'yes','M.T. Vasudevan Nair',' DC Books'),
(9788128,'Chemmeen','Fiction',75,'yes','Thakazhi ','Current Books'),
(9788129,'Balyakalasakhi','Fiction',50,'no','Basheer','DC Books'),
(9788172,'My Experiments with Truth','Autobiography',100,'yes','Mahatma Gandhi','Nava PubHouse'),
(9788173,'Wings of Fire: An Autobiography','Autobiography',100,'yes','A.P.J. Abdul Kalam','Univers Press'),
(9780399,'Educated: A Memoir','Non-Fiction',120,'yes','Tara Westover','Random House'),
(9788130,'Naalukettu','Fiction',50,'yes','M. T. Vasudevan Nair','DC Books'),
(9788131,'Naranathu Bhranthan','Poetry',30,'yes','Kunchan Nambiar','DC Books'),
(9788132,'Mayilpeeli','Poetry',30,'no','Vallathol ','Current Books'),
(9788133,'Pathummayude Aadu','Fiction',60,'yes','Basheer','DC Books'),
(9780195,'The Discovery of India','History',100,'no','Jawaharlal Nehru','Oxford University');
SELECT * FROM Books;

-- Insert details into Customer Table
insert into  Customer(Customer_id ,Customer_name ,Customer_address ,Reg_date )
values(1000,'Vimal','Vimal House North street Eranakulam','2000-05-12'),
(1001,'Anu','Anu Villa Kannur','2000-05-13'),
(1002,'Hrishika','Hrishika Nivas Kozhikode','2000-06-17'),
(1003,'Dhwani','Dhani Villa Malappuram','2001-08-20'),
(1004,'Sidh','Sidh Thrissur','2002-03-04'),
(1005,'Amar','Amar Villa Kollam','2002-04-25'),
(1006,'Hima','Hima Villa Wayanad','2001-10-10'),
(1007,'Varsha','Varsham Thrissur','2003-08-01'),
(1008,'Greeshma','Greeshmam Eranakulam','2004-09-20'),
(1009,'Hemanth','Hemantham Palakkad','2004-02-15');
SELECT * FROM Customer;

-- Insert details into IssueStatus Table
insert into IssueStatus(Issue_id,Issued_cust ,Issued_book_name ,Issue_date , Isbn_book)
values(300,1000,'Aadujeevitham','2023-01-15',9788126),
(301,1001,'Naranathu Bhranthan','2023-06-16',9788131),
(302,1005,'Chemmeen','2023-06-20',9788128),
(303,1009,'My Experiments with Truth','2023-12-18',9788172),
(304,1008,'Randamoozham','2024-01-20',9788127);
SELECT * FROM IssueStatus;

-- Insert details into ReturnStatus table
insert into ReturnStatus(Return_id ,Return_cust ,Return_book_name ,Return_date ,Isbn_book2 )
values(500,1001,'Naranathu Bhranthan','2023-06-25',9788131),
(501,1005,'Chemmeen','2023-07-29',9788128),
(502,1000,'Aadujeevitham','2023-02-10',9788126);
SELECT * FROM ReturnStatus;

-- 1. Retrieve the book title, category, and rental price of all available books.
select Book_title,Category ,Rental_Price from Books where status='yes';

-- 2. List the employee names and their respective salaries in descending order of salary.
select Emp_name ,Salary from Employee order by Salary desc;

-- 3. Retrieve the book titles and the corresponding customers who have issued those books.
select C.Customer_name, I.Issued_book_name from Customer C right join IssueStatus I on C.Customer_id = I.Issued_cust;

-- 4. Display the total count of books in each category.
select Category, COUNT(ISBN) FROM Books  group by Category;

-- 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
select Emp_name,Position from Employee where salary>50000;

-- 6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
select C.Customer_name  from customer C left join  IssueStatus I on C.Customer_id= I.issued_cust where Reg_date<'2022-01-01' and issued_cust is null ;

-- 7. Display the branch numbers and the total count of employees in each branch.
select  B.Branch_no,B.Branch_address,count(E.Emp_id) from  Branch B left join Employee E on B.Branch_no=E.Branch_no group by Branch_no;

-- 8. Display the names of customers who have issued books in the month of June 2023.
select C.Customer_name from customer C left join  IssueStatus I on C.Customer_id= I.issued_cust where month(I.Issue_date)='06' and year(I.Issue_date)='2023';

-- 9. Retrieve book_title from book table containing history.
select Book_title from Books where Category='history';

-- 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees
select B.Branch_no,count(E.Emp_id) from Branch B left join Employee E on B.Branch_no=E.Branch_no Group by Branch_no having count(E.Emp_id)>5;
