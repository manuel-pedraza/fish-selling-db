INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (1, 'Catfish', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (2, 'Carp', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (3, 'Trout', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (4, 'Pike', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (5, 'Perch', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (6, 'Tilapia', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (7, 'Sturgeon', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (8, 'Guppy', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (9, 'Tetra', NULL)

-- Saltwater Fish
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (10, 'Tuna', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (11, 'Mackerel', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (12, 'Cod', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (13, 'Snapper', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (14, 'Grouper', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (15, 'Halibut', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (16, 'Flounder', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (17, 'Marlin', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (18, 'Swordfish', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (19, 'Barracuda', NULL)

-- Sharks & Rays
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (20, 'Shark', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (21, 'Great White Shark', 20)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (22, 'Tiger Shark', 20)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (23, 'Hammerhead Shark', 20)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (24, 'Bull Shark', 20)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (25, 'Whale Shark', 20)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (26, 'Manta Ray', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (27, 'Stingray', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (28, 'Sawfish', NULL)

-- Coral Reef Fish
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (29, 'Clownfish', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (30, 'Angelfish', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (31, 'Parrotfish', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (32, 'Butterflyfish', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (33, 'Tang', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (34, 'Wrasse', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (35, 'Goby', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (36, 'Mandarinfish', NULL)

-- Ancient & Unique Fish
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (37, 'Coelacanth', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (38, 'Lungfish', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (39, 'Paddlefish', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (40, 'Archerfish', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (41, 'Electric Eel', NULL)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (42, 'Arowana', NULL)

INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (43, 'Channel Catfish', 1)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (44, 'Blue Catfish', 1)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (45, 'Flathead Catfish', 1)

INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (46, 'Common Carp', 2)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (47, 'Mirror Carp', 2)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (48, 'Grass Carp', 2)

INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (49, 'Rainbow Trout', 3)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (50, 'Brown Trout', 3)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (51, 'Brook Trout', 3)

INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (52, 'Northern Pike', 4)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (53, 'Muskellunge', 4)

INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (54, 'Yellow Perch', 5)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (55, 'European Perch', 5)

INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (56, 'Bluefin Tuna', 10)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (57, 'Yellowfin Tuna', 10)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (58, 'Skipjack Tuna', 10)

INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (59, 'Giant Manta Ray', 26)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (60, 'Reef Manta Ray', 26)

INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (61, 'Percula Clownfish', 29)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (62, 'Ocellaris Clownfish', 29)

INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (63, 'Emperor Angelfish', 30)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (64, 'Queen Angelfish', 30)

INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (65, 'Blue Tang', 33)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (66, 'Yellow Tang', 33)

INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (67, 'West Indian Ocean Coelacanth', 37)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (68, 'Indonesian Coelacanth', 37)

-- Subspecies of Subspecies (Parent is a Subspecies)
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (69, 'Albino Channel Catfish', 43);
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (70, 'Leather Carp', 46);
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (71, 'Fully Scaled Mirror Carp', 46);
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (72, 'Golden Rainbow Trout', 49);
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (73, 'Salvelinus fontinalis timagamiensis', 51);
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (74, 'Great Hammerhead', 23);
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (75, 'Scalloped Hammerhead', 23);
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (76, 'Bonnethead Shark', 23);
INSERT INTO [dbo].[Species] (id, [name], parentSpeciesId) VALUES (77, 'Atlantic Manta Ray', 59);

