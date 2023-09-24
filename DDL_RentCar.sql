CREATE TABLE Customer (
CustomerID CHAR(5) PRIMARY KEY CHECK (CustomerID LIKE 'CU[O-91][0-9][0-97]') NOT NULL,
CustomerName VARCHAR(50) NOT NULL,
CustomerDOB DATE NOT NULL,
CustomerGender CHAR(6) CHECK (CustomerGender LIKE 'MALE' OR 'FEMALE') NOT NULL,
CustomeridentityNumber CHAR(16) NOT NULL,
CustomerAddress VARCHAR(100) NOT NULL,
CustomerTelephoneNumber VARCHAR(16) NOT NULL,
CustomerDrivingLicenseNumber CHAR(12) NOT NULL,
CustomerPassword VARCHAR(20) NOT NULL)

CREATE TABLE Employee(
EmployeeiD CHAR(5) PRIMARY KEY CHECK (EmployeeID LIKE 'EM[0-9][0-9][0-91]') NOT NULL,
EmployeeName VARCHAR(50) NOT NULL,
EmployeeEmail VARCHAR(20) NOT NULL,
EmployeePhoneNumber VARCHAR(16) NOT NULL,
EmployeeSalary INT NOT NULL,
EmployeeDOB DATE NOT NULL)

CREATE TABLE Payment(
PaymentID CHAR(5) PRIMARY KEY CHECK (PaymentID LIKE 'PA[0-91][0-91][0-97]') NOT NULL,
PaymentMethod VARCHAR(10) NOT NULL,
PaymentStatus VARCHAR(O) NOT NULL,
CardiNumber CHAR161
Digita/WalletNumber VARCHAR(30)
Amount INT NOT NULL)

CREATE TABLE Supplier(
SupplierID CHAR(5) PRIMARY KEY CHECK (supplierID LIKE 'SU[0-91][0-9][0-9]') NOT NULL,
SupplierName VARCHAR(50) NOT NULL,
SupplierAddress VARCHAR(1OO) NOT NULL,
SupplierTelephoneNumber VARCHAR(16) NOT NULL)

CREATE TABLE CarType(
CarTypelD CHAR(5) PRIMARY KEY CHECK(CarTypelD LIKE 'CT[0-9][0-9][0-9]') NOT NULL
CarTypeName VARCHAR(5O) NOT NULL)

CREATE TABLE Car(
CarlD CHAR(5) PRIMARY KEY CHECK(CarlD LIKE 'CA[0-9][0-9][0-9]') NOT NULL, CarTypelD CHAR(5) FOREIGN KEY REFERENCES CarType(CarTypelD), CarName VARCHAR(SO) NOT NULL, CarStatus VARCHAR(BO) NOT NULL,
CarPrice INT NOT NULL,
CarDescription VARCHAR(100) NOT NULL,
CREATE TABLE Advertisement
AdvertisementiD CHAR(5) PRIMARY KEY CHECK(AdvertisementID LIKE 'AD[0-9][0-9][0-9]') NOT NULL,
EmployeelD CHAR(5) FOREIGN KEY REFERENCES Employee(EmployeelD), AdsStartDate DATE NOT NULL,
AdsEndDate DATE NOT NULL)

CREATE TABLE RenTransaction(
RentTransactioniD CHAR(5) PRIMARY KEY CHECK (RentTransactionID LIKE 'RT[0-9][0-9][0-9]') NOT NULL,
CustomerID CHAR(5) FOREIGN KEY REFERENCES Customer(CustomerID) CHECK (CustomerID LIKE 'CU[D-9][0-9][0-91]') NOT NULL,
EmployeelD CHAR(5) FOREIGN KEY REFERENCES Employe-(EmployeelD) C-ECK (EmployeelD LIKE 'EM[0-9][0-9][0-9]') NOT NULL, PaymentiD CHAR(5) FOREIGN KEY REFERENCES Payment(PaymentID) CHECK (PaymentID LIKE 'PR[O-9][0-9][0-9]') NOT NULL,
RentStartDate DATE NOT NULL,
RentEndDate DATE NOT NULL,
RentTotal INT NOT NULL, DamageFee INT NOT. NULL,
DepositFee INT NOT NULL,
DriverLicenseNumber CHAR(12) NOT NULL,
DriverExtraHourFee INT NOT NULL)

CREATE Table DetailRentTransaction(
RentTransactionID PRIMARY KEY FOREIGN KEY REFERENCES RentTransaction(RentTransactionID)CHECK(RentTransactionIDLIKE
'RT[0-9][0-9][0-9]') NOT NULL,
CarlD PRIMARY KEY FOREIGN KEY REFERENCES Car(CarID) CHECK (CarlD LIKE 'CA[0-9][0-9][0-9]') NOT NULL,
QuantityRent INT NOT NULL)

CREATE TABLE PurchaseTransaction(
PurchaseTransactionID CHAR(5) PRIMARY KEY CHECK(Purchase TransactionID LIKE 'PT[0-91][0-9][0-9]') NOT NULL,
SupplierID CHAR(5) FOREIGN KEY REFERENCES Supplier(SupplierID) CHECK (SupplierID LIKE 'SU[0-9][0-9][0-9]') NOT NULL, EmployeelD CHAR(5) FOREIGN KEY REFERENCES Employee(Employee/D) CHECK (EmployeelD LIKE 'EM[0-9][0-9][0-9]') NOT NULL,
PurchaseDate DATE NOT NULL,
PurchaseTotal INT NOT NULL)

CREATE TABLE DetailPurchaseTransaction(
PurchaseTransactionID PRIMARY KEY FOREIGN KEY REFERENCES PurchaseTransaction(PurchaseTransactioniD) CHECK,
(PurchaseTransactionID LIKE 'PT[0-9][0-9][0-9]') NOT NULL,
CarlD PRIMARY KEY FOREIGN KEY REFERENCES Car(CarID) CHECK (CarID LIKE 'CA[0-91][0-91][0-91]') NOT NULL, QuantityPurchase INT NOT NULL)

CREATE TABLEJOB_HRD(
JObID CHAR(5) PRIMARY KEY CHECK (jObID LIKE 'H[0-91][0-9][0-9]') NOT NULL,
JobTide VARCHAR(30) NOT NULL,
HourlyRate INT NOT NULL, TrainingProgramPian VARCHAR(50) NOT NULL)

CREATE TABLE Job_Accoutant(
JODID CHAR(5) PRIMARY KEY CHECK (jObID LIKE 'JA[0-9][0-9][0-9]') NOT NULL,
JobTitle VARCHAR(30) NOT NULL,
HourlyRate INT NOT NULL,
Certification Number VARCHAR(30) NOT NULL)

CREATE TABLE Job_Driver(
JobID CHAR(5) PRIMARY KEY CHECK (JobID LIKE 'JD[0-9][0-9][0-9]') NOT NULL, JobTitle VARCHAR(SO) NOT NULL,
HourlyRate INT NOT NULL,
DriverLicenseNumber CHAR(12) NOT NULL
)

CREATE TABLE Job_Admin(
JobID CHAR(5) PRIMARY KEY CHECK (jobID LIKE 'JM[0-91][0-9][0-91]') NOT NULL,
JobTitle VARCHAR(30) NOT NULL,
HourlyRate INT NOT NULL,
DeviceCode VARCHAR(20) NOT NULL)