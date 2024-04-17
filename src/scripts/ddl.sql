create table User (
    Id int not null AUTO_INCREMENT,
    Email varchar(150) not null unique,
    CreatedOn datetime not null default CURRENT_TIMESTAMP,
    primary key (Id)
);

create table TripDifficulty (
    Id int not null AUTO_INCREMENT,
    Difficulty varchar(150) not null unique,
    Description varchar(1000) not null,
    CreatedOn datetime not null default CURRENT_TIMESTAMP,
    primary key (Id)
);

create table NationalPark (
    Id int not null AUTO_INCREMENT,
    Name varchar(150) not null unique,
    CreatedOn datetime not null default CURRENT_TIMESTAMP,
    primary key (Id)
);

create table Trip (
    Id int not null AUTO_INCREMENT,
    Name varchar(200) not null,
    TripDifficultyId int not null,
    NationalParkId int not null,
    StartDate datetime not null,
    EndDate datetime not null,
    IsPublished bool not null default false,
    FavoriteCount int not null = 0,
    CreatedOn datetime not null default CURRENT_TIMESTAMP,
    primary key (Id),
    foreign key (TripDifficultyId) references TripDifficulty(Id),
    foreign key (NationalParkId) references NationalPark(Id)
);

create table UserTrip (
    Id int not null AUTO_INCREMENT,
    UserId int not null,
    TripId int not null,
    CreatedOn datetime not null default CURRENT_TIMESTAMP,
    primary key (Id),
    foreign key (UserId) references User(Id),
    foreign key (TripId) references Trip(Id),
    unique (UserId, TripId)
);

create table Item (
    Id int not null AUTO_INCREMENT,
    Name varchar(300) unique not null,
    Description text,
    CreatedOn datetime not null default CURRENT_TIMESTAMP,
    primary key (Id)
);

create table ItemInstance (
    Id int not null AUTO_INCREMENT,
    TripId int not null,
    ItemId int not null,
    Quantity int not null,
    CreatedOn datetime not null default CURRENT_TIMESTAMP,
    primary key (Id),
    foreign key (TripId) references Trip(Id),
    foreign key (ItemId) references Item(Id),
    unique (TripId, ItemId)
);


create table Tag (
    Id int not null AUTO_INCREMENT,
    Name varchar(300) unique not null,
    Description text,
    CreatedOn datetime not null default CURRENT_TIMESTAMP,
    primary key (Id),
);

create table Tag (
    Id int not null AUTO_INCREMENT,
    Name varchar(300) unique not null,
    Description text,
    CreatedOn datetime not null default CURRENT_TIMESTAMP,
    primary key (Id),
);

create table TripTag (
    Id int not null AUTO_INCREMENT,
    TripId int not null,
    TagId int not null,
    CreatedOn datetime not null default CURRENT_TIMESTAMP,
    primary key (Id),
    foreign key (TripId) references Trip(Id),
    foreign key (TagId) references Tag(Id),
    unique (TripId, TagId)
);

create table TripTag (
    Id int not null AUTO_INCREMENT,
    TripId int not null,
    TagId int not null,
    CreatedOn datetime not null default CURRENT_TIMESTAMP,
    primary key (Id),
    foreign key (TripId) references Trip(Id),
    foreign key (TagId) references Tag(Id),
    unique (TripId, TagId)
);

create table TripFavorite (
    Id int not null AUTO_INCREMENT,
    TripId int not null,
    UserId int not null,
    CreatedOn datetime not null default CURRENT_TIMESTAMP,
    primary key (Id),
    foreign key (TripId) references Trip(Id),
    foreign key (UserId) references User(Id),
    unique (TripId, UserId)
);

create table TripRating (
    Id int not null AUTO_INCREMENT,
    TripId int not null,
    UserId int not null,
    CreatedOn datetime not null default CURRENT_TIMESTAMP,
    primary key (Id),
    foreign key (TripId) references Trip(Id),
    foreign key (UserId) references User(Id),
    unique (TripId, UserId)
);

create table TripComment (
    Id int not null AUTO_INCREMENT,
    TripId int not null,
    UserId int not null,
    Comment text not null,
    CreatedOn datetime not null default CURRENT_TIMESTAMP,
    primary key (Id),
    foreign key (TripId) references Trip(Id),
    foreign key (UserId) references User(Id),
    unique (TripId, UserId)
);
