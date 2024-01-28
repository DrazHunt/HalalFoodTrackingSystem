DROP TABLE JAKIM cascade constraints; 
DROP TABLE CERTIFICATE cascade constraints; 
DROP TABLE PRODUCT cascade constraints; 
DROP TABLE COMPANY cascade constraints;

--Table Creation  
CREATE TABLE JAKIM 
(StaffID       NUMBER(5), 
StaffName      VARCHAR2(30), 
Branch         VARCHAR2(20), 
ChargePerCert  NUMBER(10), 
CONSTRAINT JAKIM_StaffID_PK PRIMARY KEY (StaffID)); 

CREATE TABLE CERTIFICATE  
(CertID           NUMBER(5), 
CertName          VARCHAR2(30), 
StaffID           NUMBER(5), 
IssueDate         DATE, 
ExpiryDate        DATE, 
CONSTRAINT CERTIFICATE_CertID_PK PRIMARY KEY (CertID), 
CONSTRAINT CERTIFICATE_StaffID_FK FOREIGN KEY(StaffID) REFERENCES JAKIM); 

CREATE TABLE PRODUCT 
(ProductID         NUMBER(5), 
ProductName        VARCHAR2(40), 
ProductCategory    VARCHAR2(10), 
CertID             NUMBER(5), 
HalalStatus        VARCHAR2(10), 
BoycottStatus      VARCHAR2(20), 
CONSTRAINT PRODUCT_ProductID_PK PRIMARY KEY (ProductID), 
CONSTRAINT PRODUCT_CertID_FK FOREIGN KEY(CertID) REFERENCES CERTIFICATE); 

CREATE TABLE COMPANY 
(CompanyID     NUMBER(5), 
CompanyName    VARCHAR2(20), 
ProductID      NUMBER(5), 
CompLocation   VARCHAR2(20), 
Balance        NUMBER(10), 
CONSTRAINT COMPANY_CompanyID_PK PRIMARY KEY (CompanyID), 
CONSTRAINT COMPANY_ProductID_FK FOREIGN KEY(ProductID) REFERENCES PRODUCT);

--Table Creation Population
--Table Data For Staff
INSERT INTO JAKIM VALUES (881, 'MUHAMMAD SUMBUL', 'JOHOR', 66); 
INSERT INTO JAKIM VALUES (882, 'ALTAIR IBN LA AHAD', 'SELANGOR', 71); 
INSERT INTO JAKIM VALUES (883, 'ALSIRA SALSA', 'KEDAH', 65); 
INSERT INTO JAKIM VALUES (884, 'NUR HANNA', 'JOHOR', 20); 
INSERT INTO JAKIM VALUES (885, 'SHOMIDA PUTRI', 'JOHOR', 36);
INSERT INTO JAKIM VALUES (886, 'MUHAMMAD GHOZI', 'KELANTAN', 55); 
INSERT INTO JAKIM VALUES (887, 'ILHAM PUTRAJAYA', 'SELANGOR', 32); 
INSERT INTO JAKIM VALUES (888, 'HANI AMIRAH', 'MELAKA', 26); 
INSERT INTO JAKIM VALUES (889, 'HENLY SILALAHI', 'MELAKA', 70); 
INSERT INTO JAKIM VALUES (890, 'ALBIDA PONYO', 'TERENGGANU', 34); 
INSERT INTO JAKIM VALUES (891, 'AURELIA OKTAVIA', 'PERLIS', 60); 
INSERT INTO JAKIM VALUES (892, 'DONI TAMBUNAN', 'PERAK', 39); 

--Table Data For Certificate
INSERT INTO CERTIFICATE VALUES(111, 'HALAL SELANGOR', 882, TO_DATE('15/09/2010', 'DD/MM/YYYY'), TO_DATE('22/11/2025', 'DD/MM/YYYY')); 
INSERT INTO CERTIFICATE VALUES(112, 'HALAL JOHOR', 885, TO_DATE('11/02/2009', 'DD/MM/YYYY'), TO_DATE('30/12/2025', 'DD/MM/YYYY'));
INSERT INTO CERTIFICATE VALUES(113, 'HALAL SELANGOR', 887, TO_DATE('01/02/2011', 'DD/MM/YYYY'), TO_DATE('21/10/2024', 'DD/MM/YYYY')); 
INSERT INTO CERTIFICATE VALUES(114, 'HALAL MELAKA', 889, TO_DATE('11/02/2010', 'DD/MM/YYYY'), TO_DATE('11/04/2024', 'DD/MM/YYYY')); 
INSERT INTO CERTIFICATE VALUES(115, 'HALAL PERLIS', 891, TO_DATE('09/07/2015', 'DD/MM/YYYY'), TO_DATE('22/07/2024', 'DD/MM/YYYY')); 
INSERT INTO CERTIFICATE VALUES(116, 'HALAL KELANTAN', 886, TO_DATE('31/12/2012', 'DD/MM/YYYY'), TO_DATE('31/12/2025', 'DD/MM/YYYY')); 
INSERT INTO CERTIFICATE VALUES(117, 'HALAL KEDAH', 883, TO_DATE('12/12/2012', 'DD/MM/YYYY'), TO_DATE('24/02/2024', 'DD/MM/YYYY')); 
INSERT INTO CERTIFICATE VALUES(118, 'HALAL JOHOR', 881, TO_DATE('15/12/2009', 'DD/MM/YYYY'), TO_DATE('25/01/2024', 'DD/MM/YYYY')); 
INSERT INTO CERTIFICATE VALUES(119, 'HALAL JOHOR', 885, TO_DATE('11/11/2011', 'DD/MM/YYYY'), TO_DATE('25/05/2025', 'DD/MM/YYYY')); 
INSERT INTO CERTIFICATE VALUES(120, 'HALAL TERENGGANU', 890, TO_DATE('20/10/2020', 'DD/MM/YYYY'), TO_DATE('20/10/2024', 'DD/MM/YYYY')); 
INSERT INTO CERTIFICATE VALUES(121, 'HALAL PERLIS', 891, TO_DATE('04/03/2005', 'DD/MM/YYYY'), TO_DATE('04/03/2025', 'DD/MM/YYYY')); 
INSERT INTO CERTIFICATE VALUES(122, 'HALAL SELANGOR', 882, TO_DATE('11/11/2011', 'DD/MM/YYYY'), TO_DATE('11/11/2025', 'DD/MM/YYYY'));  

--Table Data For Product
INSERT INTO PRODUCT VALUES(211, 'Roka Roka', 'SNACK', 121, 'HALAL' , 'NOT BOYCOTT'); 
INSERT INTO PRODUCT VALUES(212, 'Sour Ribbon', 'CANDY', 112, 'HALAL' , 'NOT BOYCOTT'); 
INSERT INTO PRODUCT VALUES(213, 'Kinder Bueno', 'SNACK', 116, 'HALAL' , 'BOYCOTT' ); 
INSERT INTO PRODUCT VALUES(214, 'Mamee Monster', 'SNACK', 114, 'HALAL' , 'NOT BOYCOTT'); 
INSERT INTO PRODUCT VALUES(215, 'Salted Egg Cornflakes', 'CEREAL', 122, 'HALAL' , 'BOYCOTT' ); 
INSERT INTO PRODUCT VALUES(216, 'Banana Chips', 'SNACK', 117, 'NONHALAL', 'NOT BOYCOTT' ); 
INSERT INTO PRODUCT VALUES(217, 'Mister Potato', 'SNACK', 111, 'HALAL' , 'NOT BOYCOTT'); 
INSERT INTO PRODUCT VALUES(218, 'MMs Almond', 'CANDY', 113, 'HALAL' ,'BOYCOTT' ); 
INSERT INTO PRODUCT VALUES(219, 'Dried Cranberry', 'SNACK', 115, 'NONHALAL', 'NOT BOYCOTT' ); 
INSERT INTO PRODUCT VALUES(220, 'Bacon Jerky', 'SNACK', 121, 'NONHALAL', 'NOT BOYCOTT' ); 
INSERT INTO PRODUCT VALUES(221, 'White Rabbit', 'SNACK', 119, 'NONHALAL' , 'NOT BOYCOTT'); 
INSERT INTO PRODUCT VALUES(222, 'Frey Chocobloc Orange', 'CANDY', 120, 'HALAL', 'NOT BOYCOTT' ); 

--Table Data For Company
INSERT INTO COMPANY VALUES (661, 'ROKA', 211, 'TEXAS', 25000); 
INSERT INTO COMPANY VALUES (662, 'Lot100', 212, 'KEDAH', 15000); 
INSERT INTO COMPANY VALUES (663, 'NESTLE', 213, 'CALIFORNIA', 50000); 
INSERT INTO COMPANY VALUES (664, 'JALAPENO', 215, 'KUALA LUMPUR', 25000); 
INSERT INTO COMPANY VALUES (665, 'KASIH SAYANG IBU', 216, 'PADANG', 25000); 
INSERT INTO COMPANY VALUES (666, 'FRUITS JAM', 219, 'GENTING', 10000); 
INSERT INTO COMPANY VALUES (667, 'SNOW WHITE', 221, 'BANGKOK', 30000); 
INSERT INTO COMPANY VALUES (668, 'SELASA KAMIS', 220, 'MEDAN', 30000); 
INSERT INTO COMPANY VALUES (669, 'MISTER POTATO', 217, 'GOMBAK', 30000); 
INSERT INTO COMPANY VALUES (670, 'CHOCOBLAND', 222, 'SARAWAK', 55000); 

--Query Tests on Table Dataset 
SELECT * FROM JAKIM; 
SELECT * FROM CERTIFICATE; 
SELECT * FROM PRODUCT;
SELECT * FROM COMPANY;

--Modify Data
UPDATE COMPANY SET BALANCE=30000 WHERE COMPANYID=663;
--Specific Search
SELECT * FROM CERTIFICATE WHERE STAFFID=891;
--Delete Data
DELETE FROM COMPANY WHERE COMPANYID=666;
--Add New Data 
INSERT INTO PRODUCT VALUES(223,'CISCO Jelly Beans','CANDY',120, 'HALAL','NOT BOYCOTT'); 
--Join Statements
SELECT PRODUCTNAME,HALALSTATUS,BOYCOTTSTATUS,COMPANYNAME 
FROM PRODUCT, COMPANY  
WHERE PRODUCT.PRODUCTID = COMPANY.PRODUCTID;


set serveroutput on;
--Procedures
--1. Procedure to Add New Product and Company
CREATE OR REPLACE PROCEDURE AddNewProductAndCompany ( 
    p_ProductID PRODUCT.ProductID%TYPE, 
    p_ProductName PRODUCT.ProductName%TYPE, 
    p_ProductCategory PRODUCT.ProductCategory%TYPE, 
    p_CertID CERTIFICATE.CertID%TYPE,
    p_HalalStatus PRODUCT.HalalStatus%TYPE, 
    p_BoycottStatus PRODUCT.BoycottStatus%TYPE, 
    p_CompanyID COMPANY.CompanyID%TYPE, 
    p_CompanyName COMPANY.CompanyName%TYPE, 
    p_CompLocation COMPANY.CompLocation%TYPE, 
    p_Balance COMPANY.Balance%TYPE 
)
IS 
BEGIN 
    -- Insert into PRODUCT table 
    INSERT INTO PRODUCT (ProductID, ProductName, ProductCategory, CertID, HalalStatus, BoycottStatus) 
    VALUES (p_ProductID, p_ProductName, p_ProductCategory, p_CertID, p_HalalStatus, p_BoycottStatus); 
    -- Insert into COMPANY table 
    INSERT INTO COMPANY (CompanyID, CompanyName, ProductID, CompLocation, Balance) 
    VALUES (p_CompanyID, p_CompanyName, p_ProductID, p_CompLocation, p_Balance); 
    COMMIT; 
END; 

--anonymous block for procedure AddNewProductAndCompany
ACCEPT pid CHAR PROMPT 'Enter ProductID: '; 
ACCEPT pname CHAR PROMPT 'Enter ProductName: '; 
ACCEPT pcategory CHAR PROMPT 'Enter ProductCategory: '; 
ACCEPT certid CHAR PROMPT 'Enter CertID: '; 
ACCEPT halalstatus CHAR PROMPT 'Enter HalalStatus: '; 
ACCEPT boycottstatus CHAR PROMPT 'Enter BoycottStatus: '; 
ACCEPT companyid CHAR PROMPT 'Enter CompanyID: '; 
ACCEPT companyname CHAR PROMPT 'Enter CompanyName: '; 
ACCEPT complocation CHAR PROMPT 'Enter CompLocation: '; 
ACCEPT balance CHAR PROMPT 'Enter Balance: '; 
DECLARE 
    v_ProductID PRODUCT.ProductID%TYPE := '&pid'; 
    v_ProductName PRODUCT.ProductName%TYPE := '&pname'; 
    v_ProductCategory PRODUCT.ProductCategory%TYPE := '&pcategory'; 
    v_CertID CERTIFICATE.CertID%TYPE := '&certid'; 
    v_HalalStatus PRODUCT.HalalStatus%TYPE := '&halalstatus'; 
    v_BoycottStatus PRODUCT.BoycottStatus%TYPE := '&boycottstatus'; 
    v_CompanyID COMPANY.CompanyID%TYPE := '&companyid'; 
    v_CompanyName COMPANY.CompanyName%TYPE := '&companyname'; 
    v_CompLocation COMPANY.CompLocation%TYPE := '&complocation'; 
    v_Balance COMPANY.Balance%TYPE := '&balance'; 
BEGIN 
    -- Call the procedure 
    AddNewProductAndCompany( 
        p_ProductID => v_ProductID, 
        p_ProductName => v_ProductName, 
        p_ProductCategory => v_ProductCategory, 
        p_CertID => v_CertID, 
        p_HalalStatus => v_HalalStatus, 
        p_BoycottStatus => v_BoycottStatus, 
        p_CompanyID => v_CompanyID, 
        p_CompanyName => v_CompanyName, 
        p_CompLocation => v_CompLocation, 
        p_Balance => v_Balance 
    ); 
END;

--2. Procedure to Retrieve Product Details by Product ID
CREATE OR REPLACE PROCEDURE GetProductDetails ( 
        p_ProductID IN NUMBER, 
        p_ProductName OUT VARCHAR2, 
    	p_ProductCategory OUT VARCHAR2, 
    	p_HalalStatus OUT VARCHAR2, 
    	p_BoycottStatus OUT VARCHAR2, 
    	p_CompanyName OUT VARCHAR2, 
    	p_CompLocation OUT VARCHAR2, 
    	p_Balance OUT NUMBER, 
    	p_CertName OUT VARCHAR2 
)IS 
  	v_CertID NUMBER; 
  	v_CertName VARCHAR2(30);
    
    CURSOR product_cursor IS 
  	SELECT ProductName,ProductCategory,CertID,HalalStatus,BoycottStatus 
    FROM PRODUCT 
    WHERE ProductID = p_ProductID;
    
    CURSOR company_cursor IS 
    SELECT CompanyName, CompLocation, Balance 
    FROM COMPANY 
    WHERE ProductID = p_ProductID; 

BEGIN  
    	FOR product_rec IN product_cursor LOOP 
        	p_ProductName := product_rec.ProductName; 
        	p_ProductCategory := product_rec.ProductCategory; 
        	v_CertID := product_rec.CertID; 
        	p_HalalStatus := product_rec.HalalStatus; 
        	p_BoycottStatus := product_rec.BoycottStatus; 
    	END LOOP; 
    	FOR company_rec IN company_cursor LOOP 
        	p_CompanyName := company_rec.CompanyName; 
        	p_CompLocation := company_rec.CompLocation; 
        	p_Balance := company_rec.Balance; 
    	END LOOP; 

    -- Get certification details 
    	SELECT CertName INTO v_CertName FROM CERTIFICATE  
        WHERE CertID = v_CertID; 
    -- Assign CertName to the OUT parameter 
    	p_CertName := v_CertName; 
END; 

--anonymous block for Procedure GetProductDetails
ACCEPT user_input CHAR PROMPT 'Enter ProductID for Product Details: '; 
DECLARE 
    v_ProductID NUMBER:= '&user_input'; 
    v_ProductName VARCHAR2(40); 
    v_ProductCategory VARCHAR2(10); 
    v_HalalStatus VARCHAR2(10); 
    v_BoycottStatus VARCHAR2(20); 
    v_CompanyName VARCHAR2(20); 
    v_CompLocation VARCHAR2(20); 
    v_Balance NUMBER; 
    v_CertName VARCHAR2(30); 
BEGIN 
    -- Call the procedure 
    GetProductDetails( 
        p_ProductID => v_ProductID, 
        p_ProductName => v_ProductName, 
        p_ProductCategory => v_ProductCategory, 
        p_HalalStatus => v_HalalStatus, 
        p_BoycottStatus => v_BoycottStatus, 
        p_CompanyName => v_CompanyName, 
        p_CompLocation => v_CompLocation, 
        p_Balance => v_Balance, 
        p_CertName => v_CertName 
    );

    -- Display the retrieved details 
    DBMS_OUTPUT.PUT_LINE('ProductID: ' || v_ProductID); 
    DBMS_OUTPUT.PUT_LINE('ProductName: ' || v_ProductName); 
    DBMS_OUTPUT.PUT_LINE('ProductCategory: ' || v_ProductCategory); 
    DBMS_OUTPUT.PUT_LINE('CompanyName: ' || v_CompanyName); 
    DBMS_OUTPUT.PUT_LINE('CompLocation: ' || v_CompLocation); 
    DBMS_OUTPUT.PUT_LINE('HalalStatus: ' || v_HalalStatus); 
    DBMS_OUTPUT.PUT_LINE('CertName: ' || v_CertName); 
    DBMS_OUTPUT.PUT_LINE('BoycottStatus: ' || v_BoycottStatus); 
END;

--Functions
--1. Function to return boycott status of a company 
CREATE OR REPLACE FUNCTION boycottStatus(p_compid IN company.companyid%type) RETURN VARCHAR2 IS 
    v_status VARCHAR2(20); 

BEGIN 
    SELECT boycottstatus 
    INTO v_status 
    FROM product 
    JOIN company ON product.productid = company.productid 
    WHERE company.companyid = p_compid; 
    return (v_status); 
END; 

--anonymous block for function boycottStatus
ACCEPT compid PROMPT 'Enter the company ID to check for boycott status: '; 
DECLARE 
    p_compid VARCHAR2(20); 
    v_compname company.companyname%type; 
    v_prodname product.productname%type; 
    v_boycott VARCHAR2(20); 
BEGIN 
    p_compid := &compid; 
    v_boycott := boycottStatus(p_compid); 

    SELECT c.companyname, p.productname 
    INTO v_compname, v_prodname 
    FROM company c 
    JOIN product p ON c.productid = p.productid 
    WHERE c.companyid = p_compid; 

    DBMS_OUTPUT.PUT_LINE('Company '||v_compname||' (selling product '||v_prodname||') current boycott status is: '||v_boycott); 
END; 

--2. Function to return remaining days of a certificate before its expiry date 
CREATE OR REPLACE FUNCTION certRemainingDays(p_certid IN certificate.certid%type)RETURN NUMBER IS 
    v_expiryDate DATE; 
    v_todayDate DATE; 
    v_remainingDays NUMBER; 
BEGIN 

    SELECT expirydate 
    INTO v_expiryDate 
    FROM certificate 
    WHERE certid = p_certid; 

    v_todayDate := SYSDATE; 
    v_remainingDays := v_expiryDate - v_todayDate; 
    RETURN ROUND(v_remainingDays); 
END; 

--anonymous block for function certRemainingDays
ACCEPT v_certid PROMPT 'Enter the certificate ID to see its remaining days before expiry: '; 
DECLARE 
    p_certid certificate.certid%type; 
    v_alert VARCHAR2(100) := 'Please note that a halal certificate takes around 30 days to be approved and processed.'; 
    v_renewDate certificate.expirydate%type; 
    v_prodid product.productid%type; 
    v_daysleft NUMBER; 

BEGIN 
    p_certid := &v_certid; 
     
    SELECT c.expirydate, p.productid 
    INTO v_renewDate, v_prodid 
    FROM certificate c 
    JOIN product p ON c.certid = p.certid 
    WHERE c.certid = p_certid; 

    v_renewDate := v_renewDate - 30; 
    v_daysleft := certRemainingDays(p_certid); 

    DBMS_OUTPUT.PUT_LINE('The remaining days left before expiry for certificate with ID '||p_certid||' is '||v_daysleft||' days'); 
    DBMS_OUTPUT.PUT_LINE(v_alert); 
    DBMS_OUTPUT.PUT_LINE('The latest date for product with ID '||v_prodid||' to renew its certificate is '||to_char(v_renewDate, 'DD-MM-YYYY')); 
END;

--3. Function to see the list of companies and their boycott compliance status
CREATE OR REPLACE FUNCTION is_company_compliant(company_id NUMBER) RETURN VARCHAR2 IS 
  boycott_product_count NUMBER; 
BEGIN 
  SELECT COUNT(*) 
  INTO boycott_product_count 
  FROM company 
  JOIN product ON company.productid = product.productid 
  WHERE company.companyid = company_id AND product.boycottstatus = 'BOYCOTT'; 

  IF boycott_product_count > 0 THEN RETURN 'Boycott'; 
  ELSE RETURN 'Not Boycott'; 
  END IF; 
END; 

--anonymous block for function is_company_compliant
SELECT CompanyName, is_company_compliant(CompanyID) AS ComplianceStatus 
FROM company; 

