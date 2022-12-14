CREATE TABLE CUSTOMER_INFO(
	CUSTOMER_ID VARCHAR(10) PRIMARY KEY,
	NAME VARCHAR(25),
	PHONE_NUMBER VARCHAR(11) NOT NULL,
	ADDRESS VARCHAR(40)
);

CREATE TABLE PRODUCTS_INFO(
	PRODUCT_ID VARCHAR(7) PRIMARY KEY,
	CATEGORY VARCHAR(15),
	PRODUCT_NAME VARCHAR(20) UNIQUE,
	BRAND_NAME VARCHAR(15),
	STOCK VARCHAR(8),
	STOCK_COUNT INTEGER,
	PRICE DECIMAL(6,2)
);

CREATE TABLE BRANCH_INFO(
	BRANCH_ID VARCHAR(5) PRIMARY KEY,
	BRANCH_NAME VARCHAR(15),
	BRANCH_CONTACT VARCHAR(11) NOT NULL,
	ADDRESS VARCHAR(40),
	MANAGER_ID VARCHAR(5),
	MANAGER_NAME VARCHAR(25),
	NUMBER_OF_EMPLOYEE INTEGER
	--FOREIGN KEY(MANAGER_ID) REFERENCES EMPLOYEE_INFO(EMPLOYEE_ID)
);

CREATE TABLE EMPLOYEE_INFO(
	EMPLOYEE_ID VARCHAR(5) PRIMARY KEY,
	NAME VARCHAR (25),
	ROLE VARCHAR(15),
	PHONE_NUMBER VARCHAR(11) NOT NULL,
	ADDRESS VARCHAR(40),
	BIRTH_OF_DATE DATE,
	BRANCH_ID VARCHAR(5),
	SALARY INTEGER,
	FOREIGN KEY(BRANCH_ID) REFERENCES BRANCH_INFO(BRANCH_ID)
);


CREATE TABLE PAYMENT_INFO(
	PAYMENT_ID VARCHAR(7) PRIMARY KEY,
	PAYMENT_COUNTER INTEGER CHECK(PAYMENT_COUNTER > 0 AND PAYMENT_COUNTER <= 3),
	SALESMAN_ID VARCHAR(5),
	CUSTOMER_ID VARCHAR(10),
	PRODUCT VARCHAR(7),
	BRANCH VARCHAR(5),
	PAYMENT_TYPE VARCHAR(7),
	TOTAL_AMOUNT DECIMAL(7,2),
	PAYMENT_DATE DATE,
	FOREIGN KEY(CUSTOMER_ID) REFERENCES CUSTOMER_INFO(CUSTOMER_ID),
	FOREIGN KEY(PRODUCT) REFERENCES PRODUCTS_INFO(PRODUCT_ID),
	FOREIGN KEY(SALESMAN_ID) REFERENCES EMPLOYEE_INFO(EMPLOYEE_ID),
	FOREIGN KEY(BRANCH) REFERENCES BRANCH_INFO(BRANCH_ID)
);

--ALTER TABLE BRANCH_INFO ADD FOREIGN KEY(MANAGER_ID) REFERENCES EMPLOYEE_INFO(EMPLOYEE_ID);
