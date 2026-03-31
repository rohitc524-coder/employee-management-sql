CREATE OR REPLACE PROCEDURE add_employee (
    p_emp_id NUMBER,
    p_name VARCHAR2,
    p_salary NUMBER,
    p_dept NUMBER
)
AS
BEGIN
    INSERT INTO employees(emp_id, emp_name, salary, dept_id)
    VALUES (p_emp_id, p_name, p_salary, p_dept);

    COMMIT;
END;
/