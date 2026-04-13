CREATE OR REPLACE PROCEDURE update_salary (
    p_emp_id NUMBER,
    p_salary NUMBER
)
AS
BEGIN
    IF p_salary <= 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Salary must be greater than 0');
    END IF;

    UPDATE employees
    SET salary = p_salary
    WHERE emp_id = p_emp_id;

    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Employee not found');
    END IF;

    COMMIT;
END;
/