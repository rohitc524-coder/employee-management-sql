CREATE OR REPLACE TRIGGER trg_salary_update
AFTER UPDATE OF salary ON employees
FOR EACH ROW
BEGIN
    INSERT INTO emp_salary_audit (
        emp_id,
        old_salary,
        new_salary,
        changed_at
    )
    VALUES (
        :OLD.emp_id,
        :OLD.salary,
        :NEW.salary,
        SYSDATE
    );
END;
/