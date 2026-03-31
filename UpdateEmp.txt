CREATE OR REPLACE PROCEDURE update_salary (
    p_emp_id NUMBER,
    p_salary NUMBER
)
AS
BEGIN
    UPDATE employees
    SET salary = p_salary
    WHERE emp_id = p_emp_id;

    COMMIT;
END;
/