CREATE TRIGGER validate_rating_range
BEFORE INSERT ON TripRating
FOR EACH ROW
BEGIN
    IF NEW.Rating NOT IN (1, 2, 3, 4, 5) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Value out of range. Allowed values: 1, 2, 3, 4, 5.';
    END IF;
END;

