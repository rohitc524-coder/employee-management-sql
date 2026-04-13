CREATE OR REPLACE PROCEDURE delete_employee (
    p_emp_id NUMBER
)
AS
BEGIN
    DELETE FROM employees
    WHERE emp_id = p_emp_id;

    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20003, 'Employee not found');
    END IF;

    COMMIT;
END;
/