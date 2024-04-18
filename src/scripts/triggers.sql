CREATE TRIGGER validate_rating_range
BEFORE INSERT ON TripRating
FOR EACH ROW
BEGIN
    IF NEW.Rating NOT IN (1, 2, 3, 4, 5) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Value out of range. Allowed values: 1, 2, 3, 4, 5.';
    END IF;
END;


create trigger increment_favorites_count_trigger
after insert on TripFavorite
for each row
begin
    update Trip
    set Trip.FavoriteCount = Trip.FavoriteCount + 1
    where Trip.Id = NEW.TripId;
end;

create trigger email_user_trip_comment_added
after insert on TripComment
for each row
begin
    declare tripUserId int;

    select UserTrip.UserId into tripUserId
    from TripComment
    join UserTrip on UserTrip.TripId = TripComment.TripId
    where TripComment.Id = LAST_INSERT_ID()
    limit 1;

    insert into email_table (timestamp, action, userId) values (Now(), 'comment_added', tripUserId)
end;

