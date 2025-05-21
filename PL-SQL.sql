-- 1. FUNCTION for No. of students in a mess
DELIMITER //

CREATE FUNCTION count_students_in_mess(mid INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total
    FROM STUDENT
    WHERE Mess_id = mid;
    RETURN total;
END;
//

DELIMITER ;
SELECT count_students_in_mess(1);

-- 2. Procedure: Add Daily Menu Item
DELIMITER //

CREATE PROCEDURE AddDailyMenuItem (
    IN messid INT,
    IN day_name VARCHAR(10),
    IN itemid INT,
    IN dish VARCHAR(50),
    IN category VARCHAR(30),
    IN mealtype VARCHAR(30)
)
BEGIN
    INSERT INTO DAILY_MENU (Mess_id, Day, ItemId, DishName, Category, MealType)
    VALUES (messid, day_name, itemid, dish, category, mealtype);
END;
//

DELIMITER ;
CALL AddDailyMenuItem(1, 'Wednesday', 101, 'Paneer', 'Vegetarian', 'Lunch');
select * from daily_menu;

-- 3. Trigger: Ensure ratings are within valid range
DELIMITER //

CREATE TRIGGER check_rating_before_insert
BEFORE INSERT ON FEEDBACK
FOR EACH ROW
BEGIN
    IF NEW.Rating < 1 OR NEW.Rating > 5 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Rating must be between 1 and 5';
    END IF;
END;
//

DELIMITER ;
INSERT INTO FEEDBACK VALUES (6,"23CSB0B01", 1, 6, 'Too salty');

-- 4. Procedure: Get best-rated mess
DELIMITER //

CREATE PROCEDURE GetBestRatedMess()
BEGIN
    SELECT M.id, M.Name, ROUND(AVG(F.Rating), 2) AS Avg_Rating
    FROM MESS M
    JOIN FEEDBACK F ON M.id = F.Mess_id
    GROUP BY M.id, M.Name
    HAVING Avg_Rating = (
        SELECT MAX(avg_rating)
        FROM (
            SELECT AVG(Rating) AS avg_rating
            FROM FEEDBACK
            GROUP BY Mess_id
        ) AS subquery
    );
END;
//

DELIMITER ;
CALL GetBestRatedMess();

-- 5. Trigger: Prevent inserting workers without rule
DELIMITER //

CREATE TRIGGER check_worker_role
BEFORE INSERT ON WORKERS
FOR EACH ROW
BEGIN
    IF NEW.Role IS NULL OR TRIM(NEW.Role) = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Worker role cannot be empty.';
    END IF;
END;
//

DELIMITER ;
INSERT INTO WORKERS VALUES (18, 'Naveen', '','123400000','123400000', 3);

-- 6. Procedure: vendor-total-earnings
DELIMITER //

CREATE FUNCTION vendor_total_earnings(vendor_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);
    
    SELECT IFNULL(SUM(p.Amount), 0)
    INTO total
    FROM PAYMENT p
    WHERE p.Vendor_id = vendor_id;
    
    RETURN total;
END;
//

DELIMITER ;
SELECT vendor_total_earnings(101); 

-- 7. Procedure - last_contract_day
DELIMITER //

CREATE FUNCTION get_last_contract_day(mess_id INT)
RETURNS DATE
DETERMINISTIC
BEGIN
    DECLARE last_day DATE;

    SELECT DueDate
    INTO last_day
    FROM MESS
    WHERE id = mess_id;

    RETURN last_day;
END;
//

DELIMITER ;
SELECT get_last_contract_day(2);