-- 1. Function: Number of students in a mess
CREATE OR REPLACE FUNCTION count_students_in_mess(mid IN NUMBER) RETURN NUMBER IS
    total NUMBER;
BEGIN
    SELECT COUNT(*) INTO total FROM STUDENT WHERE Mess_id = mid;
    RETURN total;
END;
/

-- Test
BEGIN
    DBMS_OUTPUT.PUT_LINE('Count: ' || count_students_in_mess(1));
END;
/

-- 2. Procedure: Add Daily Menu Item
CREATE OR REPLACE PROCEDURE AddDailyMenuItem (
    messid IN NUMBER,
    day_name IN VARCHAR2,
    itemid IN NUMBER,
    dish IN VARCHAR2,
    category IN VARCHAR2,
    mealtype IN VARCHAR2
) AS
BEGIN
    INSERT INTO DAILY_MENU (Mess_id, Day, ItemId, DishName, Category, MealType)
    VALUES (messid, day_name, itemid, dish, category, mealtype);
END;
/

-- Call example
BEGIN
    AddDailyMenuItem(1, 'Wednesday', 101, 'Paneer', 'Vegetarian', 'Lunch');
END;
/

-- 3. Trigger: Ensure ratings are within valid range
CREATE OR REPLACE TRIGGER check_rating_before_insert
BEFORE INSERT ON FEEDBACK
FOR EACH ROW
BEGIN
    IF :NEW.Rating < 1 OR :NEW.Rating > 5 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Rating must be between 1 and 5');
    END IF;
END;
/

-- 4. Procedure: Get best-rated mess
CREATE OR REPLACE PROCEDURE GetBestRatedMess IS
BEGIN
    FOR rec IN (
        SELECT M.id, M.Name, ROUND(AVG(F.Rating), 2) AS Avg_Rating
        FROM MESS M JOIN FEEDBACK F ON M.id = F.Mess_id
        GROUP BY M.id, M.Name
        HAVING ROUND(AVG(F.Rating), 2) = (
            SELECT MAX(avg_rating) FROM (
                SELECT ROUND(AVG(Rating), 2) AS avg_rating FROM FEEDBACK GROUP BY Mess_id
            )
        )
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Mess ID: ' || rec.id || ', Name: ' || rec.Name || ', Avg Rating: ' || rec.Avg_Rating);
    END LOOP;
END;
/

-- Call example
BEGIN
    GetBestRatedMess;
END;
/

-- 5. Trigger: Prevent inserting workers without role
CREATE OR REPLACE TRIGGER check_worker_role
BEFORE INSERT ON WORKERS
FOR EACH ROW
BEGIN
    IF :NEW.Role IS NULL OR TRIM(:NEW.Role) = '' THEN
        RAISE_APPLICATION_ERROR(-20002, 'Worker role cannot be empty.');
    END IF;
END;
/

-- 6. Function: vendor-total-earnings
CREATE OR REPLACE FUNCTION vendor_total_earnings(vendor_id IN NUMBER) RETURN NUMBER IS
    total NUMBER := 0;
BEGIN
    SELECT NVL(SUM(p.Amount), 0) INTO total FROM PAYMENT p WHERE p.Vendor_id = vendor_id;
    RETURN total;
END;
/

-- Test
BEGIN
    DBMS_OUTPUT.PUT_LINE('Total earnings: ' || vendor_total_earnings(101));
END;
/

-- 7. Function: last_contract_day
CREATE OR REPLACE FUNCTION get_last_contract_day(mess_id IN NUMBER) RETURN DATE IS
    last_day DATE;
BEGIN
    SELECT DueDate INTO last_day FROM MESS WHERE id = mess_id;
    RETURN last_day;
END;
/

-- Test
BEGIN
    DBMS_OUTPUT.PUT_LINE('Last contract day: ' || get_last_contract_day(2));
END;
/
