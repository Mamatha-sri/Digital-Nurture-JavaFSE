SET SERVEROUTPUT ON;
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Loans';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Customers';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE Customers (
    CustomerID NUMBER PRIMARY KEY,
    Name       VARCHAR2(50),
    DOB        DATE,
    Balance    NUMBER(12,2),
    IsVIP      VARCHAR2(5)
);

CREATE TABLE Loans (
    LoanID       NUMBER PRIMARY KEY,
    CustomerID   NUMBER,
    InterestRate NUMBER(5,2),
    DueDate      DATE,
    CONSTRAINT fk_customer
        FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Customers VALUES (1, 'Ravi Kumar',  DATE '1955-05-10', 15000, 'FALSE');
INSERT INTO Customers VALUES (2, 'Sita Devi',   DATE '1998-08-15',  8000, 'FALSE');
INSERT INTO Customers VALUES (3, 'Mohan Rao',   DATE '1960-02-20', 12000, 'FALSE');
INSERT INTO Customers VALUES (4, 'Anita Sharma',DATE '1958-11-25',  9500, 'FALSE');
INSERT INTO Customers VALUES (5, 'Kiran',       DATE '1992-07-18', 20000, 'FALSE');

INSERT INTO Loans VALUES (101, 1, 10.50, SYSDATE + 10);
INSERT INTO Loans VALUES (102, 2, 12.00, SYSDATE + 40);
INSERT INTO Loans VALUES (103, 3, 11.00, SYSDATE + 20);
INSERT INTO Loans VALUES (104, 4,  9.50, SYSDATE + 15);
INSERT INTO Loans VALUES (105, 5, 13.00, SYSDATE + 50);

COMMIT;

BEGIN
    DBMS_OUTPUT.PUT_LINE('===== ORIGINAL CUSTOMER DATA =====');
END;
/

SELECT * FROM Customers;

BEGIN
    DBMS_OUTPUT.PUT_LINE('===== ORIGINAL LOAN DATA =====');
END;
/

SELECT * FROM Loans;

DECLARE
    CURSOR cust_cursor IS
        SELECT c.CustomerID, c.DOB, l.LoanID, l.InterestRate
        FROM Customers c
        JOIN Loans l ON c.CustomerID = l.CustomerID;

    v_age NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('===== SCENARIO 1: DISCOUNT FOR SENIOR CUSTOMERS =====');

    FOR rec IN cust_cursor LOOP
        v_age := FLOOR(MONTHS_BETWEEN(SYSDATE, rec.DOB) / 12);

        IF v_age > 60 THEN
            UPDATE Loans
            SET InterestRate = InterestRate - 1
            WHERE LoanID = rec.LoanID;

            DBMS_OUTPUT.PUT_LINE(
                'Discount applied to Customer ID ' || rec.CustomerID ||
                ' (Loan ID: ' || rec.LoanID || ')'
            );
        END IF;
    END LOOP;

    COMMIT;
END;
/
BEGIN
    DBMS_OUTPUT.PUT_LINE('===== SCENARIO 2: VIP STATUS UPDATE =====');

    FOR rec IN (SELECT CustomerID, Balance FROM Customers) LOOP
        IF rec.Balance > 10000 THEN
            UPDATE Customers
            SET IsVIP = 'TRUE'
            WHERE CustomerID = rec.CustomerID;

            DBMS_OUTPUT.PUT_LINE(
                'Customer ID ' || rec.CustomerID || ' marked as VIP'
            );
        END IF;
    END LOOP;

    COMMIT;
END;
/
BEGIN
    DBMS_OUTPUT.PUT_LINE('===== SCENARIO 3: LOAN DUE REMINDERS =====');

    FOR rec IN (
        SELECT c.Name, l.LoanID, l.DueDate
        FROM Customers c
        JOIN Loans l ON c.CustomerID = l.CustomerID
        WHERE l.DueDate BETWEEN SYSDATE AND SYSDATE + 30
    ) LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Reminder: Loan ' || rec.LoanID ||
            ' for customer ' || rec.Name ||
            ' is due on ' || TO_CHAR(rec.DueDate, 'DD-MON-YYYY')
        );
    END LOOP;
END;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE('===== UPDATED CUSTOMER DATA =====');
END;
/

SELECT * FROM Customers;

BEGIN
    DBMS_OUTPUT.PUT_LINE('===== UPDATED LOAN DATA =====');
END;
/

SELECT * FROM Loans;