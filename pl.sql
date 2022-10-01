SET SERVEROUTPUT ON;

DECLARE
	v_name VARCHAR(25);
	add VARCHAR(40);
BEGIN
	add := 'gulshan banani abar jigay';
	SELECT name
	INTO v_name
	FROM customer_info
	WHERE customer_id = '2020001';
	DBMS_OUTPUT.PUT_LINE('Customer name is : '|| v_name);
	DBMS_OUTPUT.PUT_LINE('Address is : '|| add);
END;
/


DECLARE
	v_name EMPLOYEE_INFO.NAME%TYPE;
	v_man_sal EMPLOYEE_INFO.NAME%TYPE;
	v_salary NUMBER(8);

BEGIN
	v_man_sal := q'[Manager's avarage salary:]';
	SELECT NAME
	INTO v_name
	FROM EMPLOYEE_INFO
	WHERE ROLE = 'EMPLOYEE';

	SELECT AVG(SALARY+200)
	INTO v_salary
	FROM EMPLOYEE_INFO
	WHERE ROLE = 'MANAGER';


	DBMS_OUTPUT.PUT_LINE('Name of worker : '|| v_name);
	DBMS_OUTPUT.PUT_LINE(v_man_sal || v_salary);

END;
/

--function
CREATE FUNCTION discount_cal(original_price NUMBER , discount NUMBER)

	RETURN NUMBER IS
		BEGIN
			RETURN original_price - (original_price * discount /100);
END;
/


SELECT discount_cal(1000, 50)
FROM DUAL;

SELECT discount_cal(a.PRICE, 50) as Discount_products_list
FROM PRODUCTS_INFO a


--else if condition
--function used

DECLARE
	v_discount_amount NUMBER := 20;
	v_result NUMBER;
	v_category PRODUCTS_INFO.CATEGORY%TYPE;
	v_stock NUMBER;

BEGIN

	SELECT discount_cal(PRICE, v_discount_amount)
	INTO v_result
	FROM PRODUCTS_INFO
	WHERE PRODUCT_ID = 'A202001';
	DBMS_OUTPUT.PUT_LINE('After discount: ' || v_result);

	SELECT CATEGORY, STOCK_COUNT
	INTO v_category , v_stock
	FROM PRODUCTS_INFO
	WHERE PRODUCT_NAME = 'V9';


	IF v_category = 'MOTHERBOARD' THEN
		DBMS_OUTPUT.PUT_LINE('PRODUCT IS MOTHERBOARD AND STOCT NUMBER : '|| v_stock);

	ELSIF v_category = 'RAM' THEN
		DBMS_OUTPUT.PUT_LINE('PRODUCT IS RAM AND STOCT NUMBER : '|| v_stock);

	ELSIF v_category = 'CASING' THEN
		DBMS_OUTPUT.PUT_LINE('PRODUCT IS CASING AND STOCT NUMBER : '|| v_stock);

	ELSE
		DBMS_OUTPUT.PUT_LINE('PRODUCT IS NOT ANY CATEGORY AND STOCT NUMBER ');

	END IF;
END;
/

--LOOP

DECLARE
	i NUMBER := 0;	

BEGIN
	LOOP
		i := i +1;
		DBMS_OUTPUT.PUT_LINE(i);
		EXIT WHEN i >= 5;
	END LOOP;

END;
/


DECLARE
	i NUMBER := 0;
	v_count NUMBER;
	v_CUS_ID VARCHAR(30);
	v_CUS_NAME VARCHAR(30);
BEGIN

	LOOP
		i := i+1;
		EXIT WHEN i > 11;
		v_CUS_ID := '2020000'+i;

		SELECT COUNT(PAY.PRODUCT)
		INTO v_count
		FROM PAYMENT_INFO PAY
		WHERE PAY.CUSTOMER_ID = '2020000' + i;
		DBMS_OUTPUT.PUT_LINE(v_CUS_ID ||' : ' ||v_count);

	END LOOP;

END;
/
