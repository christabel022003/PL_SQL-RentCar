--Projection (SELECT)
--SELECT A, B
--FROM TableA
SELECT customerID, customerName
FROM Customer
--Selection (WHERE)
--SELECT *
--FROM TableA
--WHERE id=1
SELECT * 
FROM Job 
WHERE hourlyRate = 150000
--Projection + Selection
--SELECT A,B
--FROM TableA
--WHERE id=1
SELECT employee_id, employee_phone_number, employee_salary
FROM employees
WHERE employee_name = 'jeni'
--Arithmatic Operator
--SELECT A+1
--FROM tableA
SELECT rentTransactionID,
(c.carPrice * drt.quantityRent) "Rent Total Price"
 FROM RentTransaction rt JOIN DetailRentTransaction drt ON rt.rentTransactionID = drt.rentTransactionID JOIN Car c ON drt.carID = c.CarID
--Alias double quote
--SELECT A "a"
--FROM TableA
SELECT job_title,hourly_rate,hourly_rate*2 "job_twicefee" FROM job
--BETWEEN untuk Tipe data numeric
ELECT employee_ID, employee_name
FROM Employees
WHERE employee_salary BETWEEN 4000000 AND 6000000
--BETWEEN untuk tipe data DATE
SELECT * FROM employees
WHERE employee_bod BETWEEN '01-07-2003' AND '31-12-2003'
--IN
SELECT * FROM Payment p, PaymentType pt
WHERE p.payment_type_id = pt.payment_type_id AND payment_type_name IN ('Card', 'Cash')
--LIKE
SELECT employee_name, employee_salary
FROM employees
WHERE employee_name LIKE '%n'

--LIKE using ESCAPE Character
SELECT carID, carName, carPrice
FROM Car
WHERE carName LIKE '%\_SUV%' ESCAPE '\'
ORDER BY carID;
--number functions
ROUND
Select carID, carName, ROUND(carPrice, 0)
FROM Car

TRUNC
Select jobID, jobTitle, TRUNC(hourlyRate, 3)
From Job

MOD
Select rentTransactionID, MOD(rentTotalPrice, 2)
From RentTransaction
--date functions
SELECT rent_transaction_id, rent_total_price, ROUND(rent_end_date, ‘Month’) “Rent Ended”
 FROM RentTransactions
 WHERE rent_total_price > 200000
--conversion functions
SELECT TO_CHAR(rentStartDate, 'fmDay ddth Mon, YYYY')
FROM RentTransaction
--NULL functions
SELECT*FROM employee WHERE employee_email IS NULL;
SELECT NVL (email,'No email provided') FROM employee;
--conditional expressions
SELECT car_name, car_price
CASE
WHEN car_price < 200000 THEN 'Low-Class'
WHEN car_price < 400000 THEN 'Middle-Class'
WHEN car_price < 600000 THEN 'High-Class'
ELSE 'unknown'
END 
FROM Cars
--1. Buatlah perintah DDL CREATE TABLE (dengan penamaan sesuai standar Oracle) serta dengan constraint:
--a. Primary Key
CREATE TABLE employee(
employee_id CHAR CONSTRAINT emp_idemp_pk PRIMARY KEY,
employee_name VARCHAR2,
employee_email VARCHAR2 ,
CONSTRAINT employee_email_ck CHECK (REGEXP_LIKE(employee_email, '*gmail.com')),
CONSTRAINT employee_email_NN NOT NULL (employee_email),
employee_phone_number CHAR,
employee_gender VARCHAR2 CONSTRAINT employee_gender_ck CHECK (employee_gender IN ('Male', 'Female')),
employee_salary INTEGER, 
employee_dob DATE,
job_id CHAR, CONSTRAINT employee_idemployee_FK FOREIGN KEY (job_id) REFERENCES Job)
--b. Foreign Key (jika ada)
CREATE TABLE RentTransaction(
id_rent_transaction NUMBER CONSTRAINT rent_idrent_PK PRIMARY KEY,
id_customer NUMBER,
CONSTRAINT renttransaction_idrent_FK FOREIGN KEY (id_customer) REFERENCES customer,
rent_start_date DATE,
rent_end_date DATE,
CONSTRAINT check_rentdate CHECK (rent_end_date >= rent_start_date));
--c. Not Null
CREATE TABLE customer ( customer_id NUMBER PRIMARY KEY, nama_cust VARCHAR2 (50) 
CONSTRAINTnama_NN NOT NULL, CHECK (customer_id > 0) );
--d. CHECK (domain) constraint menggunakan IN
CREATE TABLE PaymentType(
id_payment_type VARCHAR2(6) CONSTRAINT id_payment_type PK PRIMARY KEY,
payment_type_name VARCHAR2 CONSTRAINT payment_type_name_ck CHECK(payment_type_name IN('Cash', 'Debit')), 
CONSTRAINT payment_type_name_NN NOT NULL
)
--e. CHECK (domain) constraint menggunakan Regular Expression LIKE
CREATE TABLE customer(
    id_customer CHAR(5) CONSTRAINT cust_idcust_pk PRIMARY KEY,
name VARCHAR2 (50), 
dob DATE,
gender CHAR CONSTRAINT gender_CK CHECK (gender IN('L', 'P')),
identity_num VARCHAR2, 
CONSTRAINT identitynum_NN NOT NULL, 
CONSTRAINT identitynum_unique UNIQUE (identity_num),
address VARCHAR2 (200), 
phone_number VARCHAR2(15),
CONSTRAINT custphonenumber_CK CHECK (REGEXP_LIKE(phone_number, '08*'))
driving_number VARCHAR2(20), 
password VARCHAR(20)
)

--2.membuat index dan sequnece
--Index
CREATE INDEX cust_custid_IDX ON Customer(id_customer)

--Sequence
CREATE SEQUENCE custID_seq
INCREMET BY 1
START WITH 1
MAXVALUE 1000
NOCHACHE
NOCYCLE
--Index
CREATE INDEX car_carid_Idx ON Car(id_car);

--Sequence
CREATE SEQUENCE carid_seq
INCREMET BY 1
START WITH 1
MAXVALUE 100
NOCHACHE
NOCYCLE;
--Sequence
CREATE SEQUENCE rent_transaction_seq
START WITH 1
INCREMENT BY 1
NOCACHE;

--Index
CREATE INDEX rent_cust_IDX ON rent_transaction(customer_id);
--Index
CREATE INDEX paymenttype_paymenttypeid_idx ON PaymentType(id_payment_ttype)

--Sequence
CREATE SEQUENCE paymenttypeid_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 2
NOCACHE
NOCYCLE
--SEQUENCE 
CREATE SEQUENCE employee_seq
START WITH 1
INCREMENT BY 1
MAX VALUE 2000
NOCACHE
NOCYCLE

--INDEX
CREATE INDEX employee_dob_idx
ON EMPLOYEES (TO_CHAR(employee_dob, 'yyyy'));
--3.Berdasarkan pilihan table pada jawaban soal nomor 1, buatlah perintah DML INSERT untuk menguji semua constraint dan sequence yang didefinisikan pada jawaban soal nomor 1 dan 2
--DML Insert
INSERT INTO Customer (id_customer, name, gender) VALUES (custID_seq.NEXTVAL, 'Amanda', 'P')
INSERT INTO Car (color_car, name, price) VALUES (carColor_seq.NEXTVAL, 'White', 'S', 300000 )
INSERT INTO PaymentType VALUES (paymenttypeid_seq.NEXTVAL, 'Cash')
INSERT INTO Customer (employee_id, employee_name, employee_gender) VALUES (employee_id_seq.NEXTVAL, 'Athaya', 'Female')
INSERT INTO RentTransaction VALUES (rent_transaction_seq.NEXTVAL, '1', '12-Jun-22', '14-Jun-22');
--4.Buatlah sebuah Simple View menggunakan WITH CHECK OPTION constraint
CREATE VIEW v_emp_001
AS SELECT employee_id, employee_name
FROM employees
WHERE employee_id = 'EM001'
WITH CHECK OPTION CONSTRAINT v_emp_001
--5.Dengan menggunakan:
--a. Outer Join (LEFT/ RIGHT JOIN)
SELECT Customer.customerName, COUNT(RentTransaction.rentTransactionID) AS TotalRents
FROM Customer
LEFT JOIN RentTransaction ON Customer.customerID = RentTransaction.customerID
GROUP BY Customer.customerName;
--b. Set Operator (UNION yang punya pasangan dengan yang tidak punya pasangan)
--Buatlah contoh yang menampilkan kolom pada tabel pertama serta group function dari kolom pada tabel kedua (1 to N), dimana akan menampilkan semua baris pada tabel pertama yang punya dan tidak punya pasangan di tabel kedua
SELECT Customer.customerID, COUNT(RentTransaction.rentTransactionID) AS TotalRents
 FROM rentTransaction 
UNION
SELECT customerID, 0
FROM Customer
WHERE customerID NOT IN (
SELECT customerID FROM rentTransaction);
--6.Dengan menggunakan:
--a. Sub Query (NOT IN/ NOT EXISTS)
SELECT * 
From Customer 
WHERE customerID NOT IN 
(SELECT customerID
FROM Customer
WHERE customerGender = 'Female');
--b. Set Operator (MINUS)
--Buatlah contoh yang menampilkan kolom pada tabel pertama serta group function dari kolom pada tabel kedua (1 to N), dimana akan menampilkan baris pada tabel pertama yang tidak punya pasangan di tabel kedua
SELECT customerID
FROM customer
MINUS
SELECT customerID
FROM customer
WHERE customerGender = 'Female'
