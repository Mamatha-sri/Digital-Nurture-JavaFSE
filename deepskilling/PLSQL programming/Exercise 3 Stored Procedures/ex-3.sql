SET SERVEROUTPUT ON;

------------------------------------------------------------
-- DROP TABLES (optional if re-running)
------------------------------------------------------------
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Accounts';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Employees';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/

------------------------------------------------------------
-- CREATE TABLES
------------------------------------------------------------
CREATE TABLE Accounts (
    AccountID     NUMBER PRIMARY KEY,
    CustomerName  VARCHAR2(50),
    AccountType   VARCHAR2(20),
    Balance       NUMBER(12,2)
);

CREATE TABLE Employees (
    EmployeeID    NUMBER PRIMARY KEY,
    EmployeeName  VARCHAR2(50),
    Department    VARCHAR2(30),
    Salary        NUMBER(12,2)
);

------------------------------------------------------------
-- INSERT SAMPLE DATA
------------------------------------------------------------
INSERT INTO Accounts VALUES (101, 'Ravi Kumar', 'SAVINGS', 20000);
INSERT INTO Accounts VALUES (102, 'Sita Devi', 'SAVINGS', 15000);
INSERT INTO Accounts VALUES (103, 'Mohan Rao', 'CURRENT', 30000);
INSERT INTO Accounts VALUES (104, 'Anita Sharma', 'SAVINGS', 25000);

INSERT INTO Employees VALUES (1, 'Arjun', 'HR', 40000);
INSERT INTO Employees VALUES (2, 'Meena', 'IT', 50000);
INSERT INTO Employees VALUES (3, 'Kiran', 'IT', 45000);
INSERT INTO Employees VALUES (4, 'Sneha', 'HR', 42000);

COMMIT;

------------------------------------------------------------
-- SHOW ORIGINAL DATA
------------------------------------------------------------
BEGIN
    DBMS_OUTPUT.PUT_LINE('===== ORIGINAL ACCOUNTS DATA =====');
END;
/

SELECT * FROM Accounts;

BEGIN
    DBMS_OUTPUT.PUT_LINE('===== ORIGINAL EMPLOYEES DATA =====');
END;
/

SELECT * FROM Employees;

------------------------------------------------------------
-- SCENARIO 1
-- Stored Procedure: ProcessMonthlyInterest
-- Apply 1% interest to all SAVINGS accounts
------------------------------------------------------------
CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest
IS
BEGIN
    UPDATE Accounts
    SET Balance = Balance + (Balance * 0.01)
    WHERE UPPER(AccountType) = 'SAVINGS';

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Monthly interest processed for all savings accounts.');
END;
/
SHOW ERRORS;

------------------------------------------------------------
-- SCENARIO 2
-- Stored Procedure: UpdateEmployeeBonus
-- Add bonus percentage to employees of a given department
------------------------------------------------------------
CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus(
    p_department IN VARCHAR2,
    p_bonus_pct  IN NUMBER
)
IS
BEGIN
    UPDATE Employees
    SET Salary = Salary + (Salary * p_bonus_pct / 100)
    WHERE UPPER(Department) = UPPER(p_department);

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Bonus updated for department: ' || p_department);
END;
/
SHOW ERRORS;

------------------------------------------------------------
-- SCENARIO 3
-- Stored Procedure: TransferFunds
-- Transfer amount from one account to another
------------------------------------------------------------
CREATE OR REPLACE PROCEDURE TransferFunds(
    p_from_account IN NUMBER,
    p_to_account   IN NUMBER,
    p_amount       IN NUMBER
)
IS
    v_balance NUMBER;
BEGIN
    -- Get source account balance
    SELECT Balance
    INTO v_balance
    FROM Accounts
    WHERE AccountID = p_from_account;

    -- Check sufficient balance
    IF v_balance >= p_amount THEN
        -- Deduct from source account
        UPDATE Accounts
        SET Balance = Balance - p_amount
        WHERE AccountID = p_from_account;

        -- Add to destination account
        UPDATE Accounts
        SET Balance = Balance + p_amount
        WHERE AccountID = p_to_account;

        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Transfer of ' || p_amount || ' completed from Account '
                             || p_from_account || ' to Account ' || p_to_account);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Insufficient balance in source account.');
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Invalid account number.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error during fund transfer: ' || SQLERRM);
END;
/
SHOW ERRORS;

------------------------------------------------------------
-- EXECUTE PROCEDURES
------------------------------------------------------------
BEGIN
    DBMS_OUTPUT.PUT_LINE('===== EXECUTING ProcessMonthlyInterest =====');
    ProcessMonthlyInterest;
END;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE('===== EXECUTING UpdateEmployeeBonus =====');
    UpdateEmployeeBonus('IT', 10);   -- 10% bonus for IT department
END;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE('===== EXECUTING TransferFunds =====');
    TransferFunds(101, 102, 5000);   -- transfer 5000 from 101 to 102
END;
/

------------------------------------------------------------
-- SHOW UPDATED DATA
------------------------------------------------------------
BEGIN
    DBMS_OUTPUT.PUT_LINE('===== UPDATED ACCOUNTS DATA =====');
END;
/

SELECT * FROM Accounts;

BEGIN
    DBMS_OUTPUT.PUT_LINE('===== UPDATED EMPLOYEES DATA =====');
END;
/

SELECT * FROM Employees;