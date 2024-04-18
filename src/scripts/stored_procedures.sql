create procedure CopyTripItems(in originalTripId int, newTripId int)
begin
    declare done int default false;
    declare newItemId int;
    declare newQuantity int;

    declare cur cursor for 
        select ItemId, Quantity from ItemInstance where ItemInstance.TripId = originalTripId;
    
    declare continue handler for not found set done = true;
    open cur;

    my_loop: loop
        fetch cur into newItemId, newQuantity;

        if done then 
            leave my_loop;
        end if;

        insert into ItemInstance (ItemId, Quantity, TripId) values (newItemId, newQuantity, newTripId);
    end loop;
    close cur;
END;

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

    call CopyTripItems(originalTripId, newTripId);
END;

create procedure CreateNationalPark(in NationalParkName varchar(150), out NewNationalParkId int)
begin
    insert into NationalPark (Name) values (NationalParkName);
    select LAST_INSERT_ID() into NewNationalParkId;
END;


