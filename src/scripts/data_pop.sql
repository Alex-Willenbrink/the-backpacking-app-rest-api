
-- users
insert into User (Email) values ('awillenbrink@gmail.com');
insert into User (Email) values ('ewillenbrink@gmail.com');
insert into User (Email) values ('crazybackpacker@gmail.com');


-- trip difficulty
insert into TripDifficulty (Difficulty, Description) values (
    'easy',
    'Trek Length: Typically short to moderate distances, ranging from 1 to 3 days.
Fitness Level: Suitable for beginners or those with basic fitness levels. Trails are relatively flat or gently rolling.
Gear: Minimal gear required, such as a lightweight tent or hammock, sleeping bag, basic cooking equipment, and essentials like water, food, and clothing layers.
Example: Overnight trips to established campsites with accessible trails and amenities.'
);

insert into TripDifficulty (Difficulty, Description) values (
    'medium',
    'Trek Length: Moderate to long distances, lasting 3 to 7 days, covering varied terrain with moderate elevation gains.
Fitness Level: Requires moderate fitness levels with some endurance for longer hikes and varied terrain.
Gear: More gear than an easy trip, including a sturdy tent, sleeping pad, cooking stove, backpacking meals, water filtration, appropriate clothing layers, and possibly trekking poles.
Example: Multi-day hikes through diverse landscapes like forests, hills, and moderate mountain terrain.'
);

insert into TripDifficulty (Difficulty, Description) values (
    'hard',
    'Trek Length: Long and challenging routes, spanning over 7 days, with steep ascents, descents, and rugged terrain.
Fitness Level: Advanced fitness required with excellent endurance, strength, and stamina for sustained hiking over difficult terrain and extended periods.
Gear: Extensive gear including a durable tent for harsh weather, high-performance sleeping bag and pad, lightweight yet substantial cooking equipment, ample food and water supplies, navigation tools, emergency gear, and specialized clothing for extreme conditions.
Example: Wilderness expeditions, thru-hiking long-distance trails, or summiting challenging peaks with demanding routes.'
);

-- national park
insert into NationalPark (Name) values ('Yosemite National Park');
insert into NationalPark (Name) values ('Yellowstone National Park');
insert into NationalPark (Name) values ('Grand Canyon National Park');
insert into NationalPark (Name) values ('Zion National Park');
insert into NationalPark (Name) values ('Rocky Mountain National Park');


-- trips
insert into Trip (Name, TripDifficultyId, NationalParkId, StartDate, EndDate, IsPublished)
values ('Operation Bearbait 1', 1, 4, TIMESTAMP('2016-08-03'), TIMESTAMP('2016-08-08'), false)

--items
INSERT INTO Item (Name, Description)
VALUES
('Backpack', 'An object used to carry your stuff during the trip'),
('Tent', 'Shelter for sleeping outdoors'),
('Sleeping Bag', 'Keeps you warm during sleep'),
('Sleeping Pad', 'Provides cushioning and insulation'),
('Stove', 'For cooking meals while camping'),
('Cookware Set', 'Pots, pans, and utensils for cooking'),
('Water Filter', 'Purifies water for drinking'),
('Hiking Boots', 'Protects your feet during hikes'),
('Hiking Poles', 'Provides stability and support while hiking'),
('Water Bottles', 'For staying hydrated on the trail'),
('Headlamp', 'Hands-free lighting for nighttime activities'),
('First Aid Kit', 'Essential for treating injuries'),
('Map & Compass', 'Navigation tools for finding your way'),
('Sunscreen', 'Protects against sunburn'),
('Insect Repellent', 'Keeps bugs away during outdoor activities'),
('Rain Jacket', 'Waterproof outer layer for rainy conditions'),
('Warm Clothing Layers', 'Insulating layers for cold weather'),
('Hat', 'Protects your head from sun and rain'),
('Gloves', 'Keeps your hands warm in cold weather'),
('Sunglasses', 'Protects your eyes from UV rays'),
('Portable Charger', 'Keeps electronic devices powered'),
('Trekking Pants', 'Comfortable and durable pants for hiking'),
('Hiking Shirt', 'Breathable shirt for outdoor activities'),
('Dry Bags', 'Keeps gear dry in wet conditions'),
('Fire Starter', 'For building a campfire'),
('Emergency Whistle', 'Signals for help in emergencies'),
('Trekking Socks', 'Comfortable socks for long hikes'),
('Camp Towel', 'Quick-drying towel for personal hygiene'),
('Bear Spray', 'Deters bears and other wildlife'),
('Trash Bags', 'For packing out trash and keeping campsites clean'),
('Multitool', 'Versatile tool for various tasks'),
('Navigation App', 'GPS app for smartphones'),
('Emergency Shelter', 'Provides shelter in unexpected situations'),
('Waterproof Matches', 'For starting fires in damp conditions'),
('Cooking Fuel', 'Fuel for camp stoves'),
('Backpacking Pillow', 'Compact pillow for comfortable sleep'),
('Camp Chair', 'Portable chair for relaxation at camp'),
('Tarp', 'Versatile for creating shelter or covering gear'),
('Bug Net', 'Protects against mosquitoes and insects'),
('Waterproof Backpack Cover', 'Keeps backpack dry in rain'),
('Bear-Resistant Food Container', 'Prevents bears from accessing food'),
('Portable Water Container', 'For carrying extra water'),
('Insulated Mug', 'Keeps beverages hot or cold'),
('Collapsible Water Bottle', 'Space-saving water container'),
('Hand Sanitizer', 'Maintains hygiene in outdoor settings'),
('Trekking Gaiters', 'Protects lower legs from debris and moisture'),
('Portable Hammock', 'For relaxing and sleeping outdoors'),
('Waterproof Storage Bags', 'Protects gear from water damage'),
('Emergency Blanket', 'Provides warmth in emergency situations'),
('Fishing Gear', 'For fishing opportunities during the trip');


insert into ItemInstance (TripId, ItemId, Quantity) values (1, 103, 1);
insert into ItemInstance (TripId, ItemId, Quantity) values (1, 104, 1);


insert into Tag (Name, Description)
values
('Mountainous', 'Terrain includes many mountains and possibly higher altitude levels.'),
('Scenic', 'Offers breathtaking views and picturesque landscapes.'),
('Remote', 'Located far away from populated areas, providing a secluded experience.'),
('Forest', 'Trail passes through dense forests with diverse flora and fauna.'),
('River Crossing', 'Involves crossing rivers or streams during the trek.'),
('Alpine', 'Characterized by high altitudes, rocky terrain, and alpine vegetation.'),
('Historic', 'Trail includes historical sites or landmarks along the route.'),
('Wildlife', 'Opportunity to observe diverse wildlife species in their natural habitat.'),
('Adventure', 'Challenging terrain and activities that require physical endurance.'),
('Camping', 'Involves overnight stays in tents or shelters along the trail.');

insert into TripTag (TripId, TagId)
values (1, 1),
       (1, 3);

insert into TripFavorite (UserId, TripId)
values (3, 1),
       (4, 1);

insert into TripRating (UserId, TripId, Rating)
values (3, 1, 5),
       (4, 1, 3);

insert into TripComment (UserId, TripId, Comment)
values (3, 1, 'This seems like a respectable list of items for a trip such as this. Maybe youd want to carry less stuff though'),
       (4, 1, 'I agree. This seems like a good set of items but possibly a bit too much for a shorter trip such as this');