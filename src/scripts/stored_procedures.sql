-- copy trip to someone elses

-- create trip
-- create item instances

create procedure CopyTrip(in originalTripId int, in newUserId int)
begin
    declare tripName varchar(200);
    declare tripDifficultyIdNew int;
    declare tripNationalParkId int;
    declare tripStartDate datetime;
    declare tripEndDate datetime;
    declare newTripId int;

    select
        Name,
        TripDifficultyId,
        NationalParkId,
        StartDate,
        EndDate
    into
        tripName,
        tripDifficultyIdNew,
        tripNationalParkId,
        tripStartDate,
        tripEndDate
    from Trip
    where Id = originalTripId;

    set tripName = concat(tripName, ' Copy');

    insert into Trip (Name, TripDifficultyId, NationalParkId, StartDate, EndDate)
    values (tripName, tripDifficultyIdNew, tripNationalParkId, tripStartDate, tripEndDate);

    select LAST_INSERT_ID() into newTripId;
    insert into UserTrip (UserId, TripId) values (newUserId, newTripId);

    -- copy all items from old trip to new one

END;


-- Make an item instance copier
-- Make a stupid insertion function or whatever

create procedure CreateNationalPark(in NationalParkName varchar(150), out NewNationalParkId int)
begin
    insert into NationalPark (Name) values (NationalParkName);
    select LAST_INSERT_ID() into NewNationalParkId;
END;