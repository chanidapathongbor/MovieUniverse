USE mediadb;
-- ============================================================================
-- 1. INSERT NEW UNIVERSES (Starting at universe_id = 4)
-- (Note: Universe 3 'Marvel Cinematic Universe' already exists for Avengers)
-- ============================================================================
INSERT INTO Universe (universe_id, universe_name) VALUES
(4, 'The Godfather Saga'),
(5, 'The Dark Knight Trilogy'),
(6, 'Middle-earth'),
(7, 'Star Wars'),
(8, 'The Matrix'),
(9, 'Terminator'),
(10, 'Back to the Future'),
(11, 'Spider-Verse'),
(12, 'Alien Universe'),
(13, 'Dune Universe'),
(14, 'Toy Story'),
(15, 'Jurassic Park'),
(16, 'Inside Out'),
(17, 'Mad Max'),
(18, 'Blade Runner'),
(19, 'Jaws');

-- ============================================================================
-- 2. INSERT NEW DIRECTORS (Starting at director_id = 21)
-- (Note: James Cameron = 5, Anthony Russo = 11, Christopher Nolan = 17 exist)
-- ============================================================================
INSERT INTO Director (director_id, director_name) VALUES
(21, 'Frank Darabont'),
(22, 'Francis Ford Coppola'),
(23, 'Peter Jackson'),
(24, 'Robert Zemeckis'),
(25, 'David Fincher'),
(26, 'Irvin Kershner'),
(27, 'Lana Wachowski'),
(28, 'George Lucas'),
(29, 'Hayao Miyazaki'),
(30, 'Ridley Scott'),
(31, 'Quentin Tarantino'),
(32, 'Isao Takahata'),
(33, 'Joaquim Dos Santos'),
(34, 'Andrew Stanton'),
(35, 'Denis Villeneuve'),
(36, 'Bob Persichetti'),
(37, 'Billy Wilder'),
(38, 'Lee Unkrich'),
(39, 'John Lasseter'),
(40, 'Makoto Shinkai'),
(41, 'Todd Phillips'),
(42, 'Richard Marquand'),
(43, 'Pete Docter'),
(44, 'Steven Spielberg'),
(45, 'Phil Lord'),
(46, 'Peter Weir'),
(47, 'Brad Bird'),
(48, 'George Miller');

-- ============================================================================
-- 3. INSERT NEW MEDIA (Starting at id = 34)
-- (Note: Avengers: Infinity War [21] and Avengers: Endgame [22] already exist)
-- ============================================================================
INSERT INTO Media (id, title, publish_date, age_rating, status, synopsis, category, country, rating, universe_id, director_id, main_genre_id) VALUES
(34, 'The Shawshank Redemption', '1994-10-14', 'R', 'Completed', 'Over the course of several years, two convicts form a friendship, seeking consolation and, eventually, redemption through basic compassion.', 'Live action', 'USA', 9.3, NULL, 21, 5),
(35, 'The Godfather', '1972-03-24', 'R', 'Completed', 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.', 'Live action', 'USA', 9.2, 4, 22, 11),
(36, 'The Dark Knight', '2008-07-18', 'PG-13', 'Completed', 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests.', 'Live action', 'USA', 9.0, 5, 17, 4),
(37, 'The Godfather Part II', '1974-12-20', 'R', 'Completed', 'The early life and career of Vito Corleone in 1920s New York City is portrayed, while his son, Michael, expands and tightens his grip on the family crime syndicate.', 'Live action', 'USA', 9.0, 4, 22, 11),
(38, 'The Lord of the Rings: The Return of the King', '2003-12-17', 'PG-13', 'Completed', 'Gandalf and Aragorn lead the World of Men against Sauron''s army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.', 'Live action', 'New Zealand', 9.0, 6, 23, 1),
(39, 'The Lord of the Rings: The Fellowship of the Ring', '2001-12-19', 'PG-13', 'Completed', 'A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle-earth from the Dark Lord Sauron.', 'Live action', 'New Zealand', 8.9, 6, 23, 1),
(40, 'The Lord of the Rings: The Two Towers', '2002-12-18', 'PG-13', 'Completed', 'While Frodo and Sam edge closer to Mordor with the help of the shifty Gollum, the divided fellowship makes a stand against Sauron''s new ally, Saruman.', 'Live action', 'New Zealand', 8.8, 6, 23, 1),
(41, 'Forrest Gump', '1994-07-06', 'PG-13', 'Completed', 'The history of the United States from the 1950s to the ''70s unfolds from the perspective of an Alabama man with an IQ of 75, who yearns to be reunited with his childhood sweetheart.', 'Live action', 'USA', 8.8, NULL, 24, 5),
(42, 'Inception', '2010-07-16', 'PG-13', 'Completed', 'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.', 'Live action', 'USA', 8.8, NULL, 17, 3),
(43, 'Fight Club', '1999-10-15', 'R', 'Completed', 'An insomniac office worker and a devil-may-care soap maker form an underground fight club that evolves into much more.', 'Live action', 'USA', 8.8, NULL, 25, 5),
(44, 'Star Wars: Episode V - The Empire Strikes Back', '1980-06-20', 'PG', 'Completed', 'After the Rebels are overpowered by the Empire, Luke Skywalker begins his Jedi training with Yoda, while his friends are pursued across the galaxy by Darth Vader.', 'Live action', 'USA', 8.7, 7, 26, 3),
(45, 'The Matrix', '1999-03-31', 'R', 'Completed', 'When a beautiful stranger leads computer hacker Neo to a forbidding underworld, he discovers the shocking truth--the life he knows is the elaborate deception of an evil cyber-intelligence.', 'Live action', 'USA', 8.7, 8, 27, 3),
(46, 'Interstellar', '2014-11-07', 'PG-13', 'Completed', 'When Earth becomes uninhabitable in the future, a farmer and ex-NASA pilot, Joseph Cooper, is tasked to pilot a spacecraft, along with a team of researchers, to find a new planet for humans.', 'Live action', 'USA', 8.7, NULL, 17, 3),
(47, 'Terminator 2: Judgment Day', '1991-07-03', 'R', 'Completed', 'A cyborg, identical to the one who failed to kill Sarah Connor, must now protect her ten-year-old son John from an even more advanced and powerful cyborg.', 'Live action', 'USA', 8.6, 9, 5, 3),
(48, 'Back to the Future', '1985-07-03', 'PG', 'Completed', 'Marty McFly, a 17-year-old high school student, is accidentally sent 30 years into the past in a time-traveling DeLorean invented by his close friend, the maverick scientist Doc Brown.', 'Live action', 'USA', 8.5, 10, 24, 3),
(49, 'Star Wars: Episode IV - A New Hope', '1977-05-25', 'PG', 'Completed', 'Luke Skywalker joins forces with a Jedi Knight, a cocky pilot, a Wookiee and two droids to save the galaxy from the Empire''s world-destroying battle station.', 'Live action', 'USA', 8.6, 7, 28, 3),
(50, 'Spirited Away', '2001-07-20', 'PG', 'Completed', 'During her family''s move to the suburbs, a sullen 10-year-old girl wanders into a world ruled by gods, witches and spirits, and where humans are changed into beasts.', 'Animation 2D', 'Japan', 8.6, NULL, 29, 1),
(51, 'Gladiator', '2000-05-05', 'R', 'Completed', 'A former Roman General sets out to exact vengeance against the corrupt emperor who murdered his family and sent him into slavery.', 'Live action', 'USA', 8.5, NULL, 30, 4),
(52, 'Kill Bill: The Whole Bloody Affair', '2025-12-05', 'R', 'Completed', 'The Bride wakes from a four-year coma after her jealous ex-lover Bill attempts to murder her on her wedding day, fueling a relentless global quest for vengeance.', 'Live action', 'USA', 8.8, NULL, 31, 4),
(53, 'Grave of the Fireflies', '1988-04-16', 'PG-13', 'Completed', 'A young boy and his little sister struggle to survive in Japan during World War II.', 'Animation 2D', 'Japan', 8.5, NULL, 32, 5),
(54, 'Spider-Man: Across the Spider-Verse', '2023-06-02', 'PG', 'Completed', 'Miles Morales catapults across the Multiverse, where he encounters a team of Spider-People charged with protecting its very existence.', 'Animation 3D', 'USA', 8.5, 11, 33, 4),
(55, 'Alien', '1979-06-22', 'R', 'Completed', 'The crew of a commercial spacecraft encounters a deadly lifeform after investigating a mysterious transmission of unknown origin.', 'Live action', 'USA', 8.5, 12, 30, 10),
(56, 'WALL·E', '2008-06-27', 'G', 'Completed', 'In the distant future, a small waste-collecting robot inadvertently embarks on a space journey that will ultimately decide the fate of mankind.', 'Animation 3D', 'USA', 8.4, NULL, 34, 3),
(57, 'Dune: Part Two', '2024-03-01', 'PG-13', 'Completed', 'Paul Atreides unites with Chani and the Fremen while on a warpath of revenge against the conspirators who destroyed his family.', 'Live action', 'USA', 8.5, 13, 35, 3),
(58, 'Spider-Man: Into the Spider-Verse', '2018-12-14', 'PG', 'Completed', 'Teen Miles Morales becomes the Spider-Man of his universe and must join with five spider-powered individuals from other dimensions to stop a threat for all realities.', 'Animation 3D', 'USA', 8.4, 11, 36, 4),
(59, 'The Odyssey', '2026-07-17', 'PG-13', 'Completed', 'After the fall of Troy, Greek hero Odysseus embarks on a perilous ten-year voyage across mythical seas to return home to Ithaca and his wife Penelope.', 'Live action', 'USA', 8.4, NULL, 17, 8),
(60, 'Sunset Boulevard', '1950-08-10', 'PG-13', 'Completed', 'A screenwriter develops a dangerous relationship with a faded film star determined to make a triumphant return.', 'Live action', 'USA', 8.4, NULL, 37, 5),
(61, 'Coco', '2017-11-22', 'PG', 'Completed', 'Aspiring musician Miguel, confronted with his family''s ancestral ban on music, enters the Land of the Dead to find his great-great-grandfather, a legendary singer.', 'Animation 3D', 'USA', 8.4, NULL, 38, 14),
(62, 'Toy Story', '1995-11-22', 'G', 'Completed', 'A cowboy doll is profoundly threatened and jealous when a new spaceman action figure supplants him as top toy in a boy''s bedroom.', 'Animation 3D', 'USA', 8.3, 14, 39, 14),
(63, 'Your Name.', '2016-08-26', 'PG', 'Completed', 'Two teenagers share a profound, magical connection upon discovering they are swapping bodies, and things become even more complicated when they decide to meet in person.', 'Animation 2D', 'Japan', 8.4, NULL, 40, 2),
(64, 'Princess Mononoke', '1997-07-12', 'PG-13', 'Completed', 'On a journey to find the cure for a Tatarigami''s curse, Ashitaka finds himself in the middle of a war between the forest gods and Tatara, a mining colony.', 'Animation 2D', 'Japan', 8.3, NULL, 29, 1),
(65, 'Joker', '2019-10-04', 'R', 'Completed', 'During the 1980s, a failed stand-up comedian is driven insane and turns to a life of crime and chaos in Gotham City while becoming an infamous psychopathic crime figure.', 'Live action', 'USA', 8.4, NULL, 41, 11),
(66, 'Toy Story 3', '2010-06-18', 'G', 'Completed', 'The toys are mistakenly delivered to a day-care center instead of the attic right before Andy leaves for college, and it''s up to Woody to convince the other toys to return home.', 'Animation 3D', 'USA', 8.3, 14, 38, 14),
(67, 'Star Wars: Episode VI - Return of the Jedi', '1983-05-25', 'PG', 'Completed', 'After rescuing Han Solo from Jabba the Hutt, the Rebels attempt to destroy the second Death Star, while Luke struggles to help Darth Vader back from the dark side.', 'Live action', 'USA', 8.3, 7, 42, 3),
(68, 'Up', '2009-05-29', 'PG', 'Completed', '78-year-old Carl Fredricksen travels to Paradise Falls in his house equipped with balloons, inadvertently taking a young stowaway.', 'Animation 3D', 'USA', 8.3, NULL, 43, 14),
(69, 'Jurassic Park', '1993-06-11', 'PG-13', 'Completed', 'A pragmatic paleontologist touring an almost complete theme park on an island in Central America is tasked with protecting a couple of kids after a power failure causes the park''s cloned dinosaurs to run loose.', 'Live action', 'USA', 8.2, 15, 44, 3),
(70, 'Howl''s Moving Castle', '2004-11-20', 'PG', 'Completed', 'When an unconfident young woman is cursed with an old body by a spiteful witch, her only chance of breaking the spell lies with a self-indulgent yet insecure young wizard and his companions in his legged, walking castle.', 'Animation 2D', 'Japan', 8.2, NULL, 29, 1),
(71, 'Project Hail Mary', '2026-03-20', 'PG-13', 'Completed', 'A lone astronaut wakes up on a spacecraft light-years from Earth with amnesia and must piece together his past to save humanity from an extinction-level event.', 'Live action', 'USA', 8.2, NULL, 45, 3),
(72, 'Catch Me If You Can', '2002-12-25', 'PG-13', 'Completed', 'Barely 21 yet, Frank is a skilled forger who has passed as a doctor, lawyer and pilot. FBI agent Carl becomes obsessed with tracking down the con man, who only revels in the pursuit.', 'Live action', 'USA', 8.1, NULL, 44, 16),
(73, 'Inside Out', '2015-06-19', 'PG', 'Completed', 'After young Riley is uprooted from her Midwest life and moved to San Francisco, her emotions - Joy, Fear, Anger, Disgust and Sadness - conflict on how best to navigate a new city, house, and school.', 'Animation 3D', 'USA', 8.1, 16, 43, 14),
(74, 'Dead Poets Society', '1989-06-09', 'PG', 'Completed', 'Maverick teacher John Keating returns in 1959 to the prestigious New England boys'' boarding school where he was once a star student, using poetry to embolden his pupils to new heights of self-expression.', 'Live action', 'USA', 8.1, NULL, 46, 5),
(75, 'Ratatouille', '2007-06-29', 'G', 'Completed', 'A rat who can cook makes an unusual alliance with a young kitchen worker at a famous Paris restaurant.', 'Animation 3D', 'USA', 8.1, NULL, 47, 14),
(76, 'Mad Max: Fury Road', '2015-05-15', 'R', 'Completed', 'In a post-apocalyptic wasteland, a woman rebels against a tyrannical ruler in search for her homeland with the aid of a group of female prisoners, a psychotic worshiper and a drifter named Max.', 'Live action', 'Australia', 8.1, 17, 48, 4),
(77, 'Blade Runner', '1982-06-25', 'R', 'Completed', 'A blade runner must pursue and terminate four replicants who stole a ship in space and have returned to Earth to find their creator.', 'Live action', 'USA', 8.1, 18, 30, 3),
(78, 'Jaws', '1975-06-20', 'PG', 'Completed', 'When a killer shark unleashes chaos on a beach community off Cape Cod, it''s up to a local sheriff, a marine biologist, and anold seafarer to hunt the beast down.', 'Live action', 'USA', 8.1, 19, 44, 6);

-- ============================================================================
-- 4. UPDATE SEQUEL RELATIONSHIPS (Among the newly added media)
-- ============================================================================
-- The Godfather Part II (37) is sequel to The Godfather (35)
UPDATE Media SET sequel_parent_id = 35 WHERE id = 37;

-- LOTR: The Two Towers (40) is sequel to Fellowship (39); Return of the King (38) is sequel to Two Towers (40)
UPDATE Media SET sequel_parent_id = 39 WHERE id = 40;
UPDATE Media SET sequel_parent_id = 40 WHERE id = 38;

-- Star Wars Original Trilogy: Empire Strikes Back (44) -> A New Hope (49); Return of the Jedi (67) -> Empire Strikes Back (44)
UPDATE Media SET sequel_parent_id = 49 WHERE id = 44;
UPDATE Media SET sequel_parent_id = 44 WHERE id = 67;

-- Spider-Man: Across the Spider-Verse (54) is sequel to Into the Spider-Verse (58)
UPDATE Media SET sequel_parent_id = 58 WHERE id = 54;

-- Toy Story 3 (66) follows Toy Story (62) in this subset
UPDATE Media SET sequel_parent_id = 62 WHERE id = 66;

-- ============================================================================
-- 5. INSERT INTO MOVIES SUB-ENTITY (Duration in minutes)
-- ============================================================================
INSERT INTO Movies (id, duration) VALUES
(34, 142.00), (35, 175.00), (36, 152.00), (37, 202.00), (38, 201.00),
(39, 178.00), (40, 179.00), (41, 142.00), (42, 148.00), (43, 139.00),
(44, 124.00), (45, 136.00), (46, 169.00), (47, 137.00), (48, 116.00),
(49, 121.00), (50, 125.00), (51, 155.00), (52, 247.00), (53, 89.00),
(54, 140.00), (55, 117.00), (56, 98.00),  (57, 166.00), (58, 117.00),
(59, 172.00), (60, 110.00), (61, 105.00), (62, 81.00),  (63, 106.00),
(64, 134.00), (65, 122.00), (66, 103.00), (67, 131.00), (68, 96.00),
(69, 127.00), (70, 119.00), (71, 157.00), (72, 141.00), (73, 95.00),
(74, 128.00), (75, 111.00), (76, 120.00), (77, 117.00), (78, 124.00);

-- ============================================================================
-- 6. INSERT SUBGENRES FOR NEW MEDIA
-- ============================================================================
INSERT INTO Subgenre (id, genre_id) VALUES
(34, 11),
(35, 5),
(36, 11), (36, 5), (36, 6),
(37, 5),
(38, 4), (38, 8), (38, 5),
(39, 4), (39, 8), (39, 5),
(40, 4), (40, 8), (40, 5),
(41, 2), (41, 7),
(42, 4), (42, 8), (42, 6),
(43, 6), (43, 11),
(44, 4), (44, 8), (44, 1),
(45, 4),
(46, 8), (46, 5),
(47, 4), (47, 6),
(48, 8), (48, 7),
(49, 4), (49, 8), (49, 1),
(50, 8), (50, 14), (50, 13),
(51, 8), (51, 5), (51, 12),
(52, 11), (52, 6),
(53, 12),
(54, 8), (54, 3), (54, 1),
(55, 3), (55, 6),
(56, 8), (56, 14), (56, 2),
(57, 4), (57, 8), (57, 5),
(58, 8), (58, 3), (58, 7),
(59, 4), (59, 5), (59, 1),
(60, 11), (60, 9),
(61, 8), (61, 1), (61, 7),
(62, 8), (62, 7), (62, 1),
(63, 1), (63, 5), (63, 13),
(64, 4), (64, 8),
(65, 5), (65, 6),
(66, 8), (66, 7), (66, 1),
(67, 4), (67, 8), (67, 1),
(68, 8), (68, 7), (68, 5),
(69, 4), (69, 8), (69, 6),
(70, 8), (70, 2),
(71, 8), (71, 5),
(72, 11), (72, 5), (72, 7),
(73, 8), (73, 7), (73, 5),
(74, 7),
(75, 8), (75, 7), (75, 1),
(76, 8), (76, 3), (76, 6),
(77, 5), (77, 6), (77, 9),
(78, 8), (78, 5);

-- ============================================================================
-- 7. INSERT NEW ACTORS (Starting at actor_id = 77)
-- (Existing Reused Actors: 14=Leonardo DiCaprio, 29=Robert Downey Jr., 
--  34=Chris Evans, 35=Chris Hemsworth, 36=Scarlett Johansson, 37=Mark Ruffalo,
--  38=Jeremy Renner, 40=Josh Brolin, 42=Tom Holland, 43=Zendaya, 
--  51=James Earl Jones, 62=Cillian Murphy, 64=Florence Pugh, 65=Matt Damon, 
--  71=Ryan Gosling)
-- ============================================================================
INSERT INTO Actor (actor_id, actor_name) VALUES
(77, 'Tim Robbins'),
(78, 'Morgan Freeman'),
(79, 'Bob Gunton'),
(80, 'Marlon Brando'),
(81, 'Al Pacino'),
(82, 'James Caan'),
(83, 'Robert Duvall'),
(84, 'Diane Keaton'),
(85, 'Robert De Niro'),
(86, 'Christian Bale'),
(87, 'Heath Ledger'),
(88, 'Aaron Eckhart'),
(89, 'Michael Caine'),
(90, 'Gary Oldman'),
(91, 'Elijah Wood'),
(92, 'Ian McKellen'),
(93, 'Viggo Mortensen'),
(94, 'Sean Astin'),
(95, 'Orlando Bloom'),
(96, 'Cate Blanchett'),
(97, 'Andy Serkis'),
(98, 'Tom Hanks'),
(99, 'Robin Wright'),
(100, 'Gary Sinise'),
(101, 'Joseph Gordon-Levitt'),
(102, 'Elliot Page'),
(103, 'Tom Hardy'),
(104, 'Brad Pitt'),
(105, 'Edward Norton'),
(106, 'Helena Bonham Carter'),
(107, 'Mark Hamill'),
(108, 'Harrison Ford'),
(109, 'Carrie Fisher'),
(110, 'Billy Dee Williams'),
(111, 'Alec Guinness'),
(112, 'Keanu Reeves'),
(113, 'Laurence Fishburne'),
(114, 'Carrie-Anne Moss'),
(115, 'Hugo Weaving'),
(116, 'Matthew McConaughey'),
(117, 'Anne Hathaway'),
(118, 'Jessica Chastain'),
(119, 'Arnold Schwarzenegger'),
(120, 'Linda Hamilton'),
(121, 'Edward Furlong'),
(122, 'Robert Patrick'),
(123, 'Michael J. Fox'),
(124, 'Christopher Lloyd'),
(125, 'Lea Thompson'),
(126, 'Crispin Glover'),
(127, 'Rumi Hiiragi'),
(128, 'Miyu Irino'),
(129, 'Mari Natsuki'),
(130, 'Russell Crowe'),
(131, 'Joaquin Phoenix'),
(132, 'Connie Nielsen'),
(133, 'Uma Thurman'),
(134, 'David Carradine'),
(135, 'Lucy Liu'),
(136, 'Vivica A. Fox'),
(137, 'Michael Madsen'),
(138, 'Daryl Hannah'),
(139, 'Tsutomu Tatsumi'),
(140, 'Ayano Shiraishi'),
(141, 'Shameik Moore'),
(142, 'Hailee Steinfeld'),
(143, 'Oscar Isaac'),
(144, 'Jake Johnson'),
(145, 'Mahershala Ali'),
(146, 'Nicolas Cage'),
(147, 'Sigourney Weaver'),
(148, 'Tom Skerritt'),
(149, 'John Hurt'),
(150, 'Ian Holm'),
(151, 'Ben Burtt'),
(152, 'Elissa Knight'),
(153, 'Jeff Garlin'),
(154, 'Timothée Chalamet'),
(155, 'Rebecca Ferguson'),
(156, 'Javier Bardem'),
(157, 'Austin Butler'),
(158, 'Robert Pattinson'),
(159, 'Lupita Nyong''o'),
(160, 'Charlize Theron'),
(161, 'William Holden'),
(162, 'Gloria Swanson'),
(163, 'Erich von Stroheim'),
(164, 'Anthony Gonzalez'),
(165, 'Gael García Bernal'),
(166, 'Benjamin Bratt'),
(167, 'Tim Allen'),
(168, 'Don Rickles'),
(169, 'Joan Cusack'),
(170, 'Ned Beatty'),
(171, 'Ryunosuke Kamiki'),
(172, 'Mone Kamishiraishi'),
(173, 'Yoji Matsuda'),
(174, 'Yuriko Ishida'),
(175, 'Yuko Tanaka'),
(176, 'Zazie Beetz'),
(177, 'Frances Conroy'),
(178, 'Ed Asner'),
(179, 'Jordan Nagai'),
(180, 'Christopher Plummer'),
(181, 'Sam Neill'),
(182, 'Laura Dern'),
(183, 'Jeff Goldblum'),
(184, 'Richard Attenborough'),
(185, 'Chieko Baisho'),
(186, 'Takuya Kimura'),
(187, 'Akihiro Miwa'),
(188, 'Sandra Hüller'),
(189, 'Milana Vayntrub'),
(190, 'Christopher Walken'),
(191, 'Amy Adams'),
(192, 'Amy Poehler'),
(193, 'Phyllis Smith'),
(194, 'Bill Hader'),
(195, 'Mindy Kaling'),
(196, 'Robin Williams'),
(197, 'Robert Sean Leonard'),
(198, 'Ethan Hawke'),
(199, 'Patton Oswalt'),
(200, 'Ian Holm'),
(201, 'Lou Romano'),
(202, 'Peter O''Toole'),
(203, 'Nicholas Hoult'),
(204, 'Hugh Keays-Byrne'),
(205, 'Rutger Hauer'),
(206, 'Sean Young'),
(207, 'Edward James Olmos'),
(208, 'Roy Scheider'),
(209, 'Robert Shaw'),
(210, 'Richard Dreyfuss');

-- Note: Ian Holm is listed at 150, removing duplicate 200 and shifting 201-210 in mapping:
-- Let's keep a clean, duplicate-free Actor table by replacing 200 with Brad Garrett (from Ratatouille):
UPDATE Actor SET actor_name = 'Brad Garrett' WHERE actor_id = 200;

-- ============================================================================
-- 8. INSERT MEDIA_ACTOR RELATIONSHIPS (For Media IDs 34 to 78)
-- ============================================================================
INSERT INTO Media_Actor (id, actor_id) VALUES
-- 34: The Shawshank Redemption
(34, 77), (34, 78), (34, 79),
-- 35: The Godfather
(35, 80), (35, 81), (35, 82), (35, 83), (35, 84),
-- 36: The Dark Knight
(36, 86), (36, 87), (36, 88), (36, 89), (36, 90), (36, 78), (36, 62),
-- 37: The Godfather Part II
(37, 81), (37, 85), (37, 83), (37, 84),
-- 38: The Lord of the Rings: The Return of the King
(38, 91), (38, 92), (38, 93), (38, 94), (38, 95), (38, 96), (38, 97),
-- 39: The Lord of the Rings: The Fellowship of the Ring
(39, 91), (39, 92), (39, 93), (39, 94), (39, 95), (39, 96), (39, 150),
-- 40: The Lord of the Rings: The Two Towers
(40, 91), (40, 92), (40, 93), (40, 94), (40, 95), (40, 96), (40, 97),
-- 41: Forrest Gump
(41, 98), (41, 99), (41, 100),
-- 42: Inception
(42, 14), (42, 101), (42, 102), (42, 103), (42, 62), (42, 89),
-- 43: Fight Club
(43, 104), (43, 105), (43, 106),
-- 44: Star Wars: Episode V - The Empire Strikes Back
(44, 107), (44, 108), (44, 109), (44, 110), (44, 51),
-- 45: The Matrix
(45, 112), (45, 113), (45, 114), (45, 115),
-- 46: Interstellar
(46, 116), (46, 117), (46, 118), (46, 89), (46, 65),
-- 47: Terminator 2: Judgment Day
(47, 119), (47, 120), (47, 121), (47, 122),
-- 48: Back to the Future
(48, 123), (48, 124), (48, 125), (48, 126),
-- 49: Star Wars: Episode IV - A New Hope
(49, 107), (49, 108), (49, 109), (49, 111), (49, 51),
-- 50: Spirited Away
(50, 127), (50, 128), (50, 129),
-- 51: Gladiator
(51, 130), (51, 131), (51, 132),
-- 52: Kill Bill: The Whole Bloody Affair
(52, 133), (52, 134), (52, 135), (52, 136), (52, 137), (52, 138),
-- 53: Grave of the Fireflies
(53, 139), (53, 140),
-- 54: Spider-Man: Across the Spider-Verse
(54, 141), (54, 142), (54, 143), (54, 144), (54, 145),
-- 55: Alien
(55, 147), (55, 148), (55, 149), (55, 150),
-- 56: WALL·E
(56, 151), (56, 152), (56, 153), (56, 147),
-- 57: Dune: Part Two
(57, 154), (57, 43), (57, 155), (57, 156), (57, 157), (57, 64), (57, 40),
-- 58: Spider-Man: Into the Spider-Verse
(58, 141), (58, 144), (58, 142), (58, 145), (58, 146),
-- 59: The Odyssey
(59, 65), (59, 42), (59, 117), (59, 43), (59, 158), (59, 159), (59, 160),
-- 60: Sunset Boulevard
(60, 161), (60, 162), (60, 163),
-- 61: Coco
(61, 164), (61, 165), (61, 166),
-- 62: Toy Story
(62, 98), (62, 167), (62, 168),
-- 63: Your Name.
(63, 171), (63, 172),
-- 64: Princess Mononoke
(64, 173), (64, 174), (64, 175),
-- 65: Joker
(65, 131), (65, 85), (65, 176), (65, 177),
-- 66: Toy Story 3
(66, 98), (66, 167), (66, 169), (66, 170), (66, 168), (66, 45),
-- 67: Star Wars: Episode VI - Return of the Jedi
(67, 107), (67, 108), (67, 109), (67, 110), (67, 51),
-- 68: Up
(68, 178), (68, 179), (68, 180),
-- 69: Jurassic Park
(69, 181), (69, 182), (69, 183), (69, 184),
-- 70: Howl's Moving Castle
(70, 185), (70, 186), (70, 187),
-- 71: Project Hail Mary
(71, 71), (71, 188), (71, 189),
-- 72: Catch Me If You Can
(72, 14), (72, 98), (72, 190), (72, 191),
-- 73: Inside Out
(73, 192), (73, 193), (73, 194), (73, 195),
-- 74: Dead Poets Society
(74, 196), (74, 197), (74, 198),
-- 75: Ratatouille
(75, 199), (75, 150), (75, 201), (75, 200), (75, 202),
-- 76: Mad Max: Fury Road
(76, 103), (76, 160), (76, 203), (76, 204),
-- 77: Blade Runner
(77, 108), (77, 205), (77, 206), (77, 207),
-- 78: Jaws
(78, 208), (78, 209), (78, 210);

-- ============================================================================
-- 1. INSERT NEW AUTHORS (Starting at author_id = 13)
-- (Note: Brian Michael Bendis already exists at author_id = 8)
-- ============================================================================
INSERT INTO Author (author_id, author_name) VALUES
(13, 'Stephen King'),
(14, 'Mario Puzo'),
(15, 'J.R.R. Tolkien'),
(16, 'Winston Groom'),
(17, 'Chuck Palahniuk'),
(18, 'Akiyuki Nosaka'),
(19, 'Frank Herbert'),
(20, 'Homer'),
(21, 'Michael Crichton'),
(22, 'Diana Wynne Jones'),
(23, 'Andy Weir'),
(24, 'Frank Abagnale Jr.'),
(25, 'Philip K. Dick'),
(26, 'Peter Benchley');

-- ============================================================================
-- 2. INSERT NEW PUBLISHERS (Starting at publisher_id = 7)
-- (Note: Marvel Comics = 5, Vintage = 6 already exist)
-- ============================================================================
INSERT INTO Publisher (publisher_id, publisher_name) VALUES
(7, 'Viking Press'),
(8, 'G.P. Putnam''s Sons'),
(9, 'George Allen & Unwin'),
(10, 'Doubleday'),
(11, 'W.W. Norton & Company'),
(12, 'Bungeishunju'),
(13, 'Chilton Books'),
(14, 'Penguin Classics'),
(15, 'Alfred A. Knopf'),
(16, 'Greenwillow Books'),
(17, 'Ballantine Books'),
(18, 'Grosset & Dunlap');

-- ============================================================================
-- 3. INSERT BOOKS (With real ISBN-13s and original publication dates)
-- ============================================================================
INSERT INTO Book (ISBN, book_title, volume, book_type, publish_date, publisher_id, author_id) VALUES
-- 34: The Shawshank Redemption
('9780670289030', 'Rita Hayworth and Shawshank Redemption', 1, 'Novella', '1982-08-27', 7, 13),

-- 35 & 37: The Godfather & The Godfather Part II
('9780399103421', 'The Godfather', 1, 'Novel', '1969-03-10', 8, 14),

-- 39, 40, 38: The Lord of the Rings Trilogy
('9780261102354', 'The Fellowship of the Ring', 1, 'Novel', '1954-07-29', 9, 15),
('9780261102361', 'The Two Towers', 2, 'Novel', '1954-11-11', 9, 15),
('9780261102378', 'The Return of the King', 3, 'Novel', '1955-10-20', 9, 15),

-- 41: Forrest Gump
('9780385231343', 'Forrest Gump', 1, 'Novel', '1986-03-01', 10, 16),

-- 43: Fight Club
('9780393039764', 'Fight Club', 1, 'Novel', '1996-08-17', 11, 17),

-- 53: Grave of the Fireflies
('9784167112011', 'Grave of the Fireflies', 1, 'Short Story', '1967-10-01', 12, 18),

-- 54 & 58: Spider-Man: Into / Across the Spider-Verse (Reusing Publisher 5 & Author 8)
('9780785157137', 'Ultimate Comics Spider-Man: Who Is Miles Morales?', 1, 'Comic', '2012-03-07', 5, 8),

-- 57: Dune: Part Two
('9780441172719', 'Dune', 1, 'Novel', '1965-08-01', 13, 19),

-- 59: The Odyssey (1946 E.V. Rieu Penguin Classics edition)
('9780140449112', 'The Odyssey', 1, 'Epic Poem', '1946-01-01', 14, 20),

-- 69: Jurassic Park
('9780394588162', 'Jurassic Park', 1, 'Novel', '1990-11-20', 15, 21),

-- 70: Howl's Moving Castle
('9780688062330', 'Howl''s Moving Castle', 1, 'Novel', '1986-04-01', 16, 22),

-- 71: Project Hail Mary
('9780593135204', 'Project Hail Mary', 1, 'Novel', '2021-05-04', 17, 23),

-- 72: Catch Me If You Can
('9780448165387', 'Catch Me If You Can', 1, 'Biography', '1980-01-01', 18, 24),

-- 77: Blade Runner
('9780385046947', 'Do Androids Dream of Electric Sheep?', 1, 'Novel', '1968-03-01', 10, 25),

-- 78: Jaws
('9780385047715', 'Jaws', 1, 'Novel', '1974-02-01', 10, 26);

-- ============================================================================
-- 4. INSERT MEDIA_BOOK MAPPINGS
-- ============================================================================
INSERT INTO Media_Book (id, ISBN) VALUES
-- The Shawshank Redemption
(34, '9780670289030'),

-- The Godfather & The Godfather Part II (Both adapt Mario Puzo's novel)
(35, '9780399103421'),
(37, '9780399103421'),

-- The Lord of the Rings Trilogy
(39, '9780261102354'), -- Fellowship of the Ring (Vol 1)
(40, '9780261102361'), -- The Two Towers (Vol 2)
(38, '9780261102378'), -- The Return of the King (Vol 3)

-- Forrest Gump
(41, '9780385231343'),

-- Fight Club
(43, '9780393039764'),

-- Grave of the Fireflies
(53, '9784167112011'),

-- Spider-Man: Across the Spider-Verse & Into the Spider-Verse
(54, '9780785157137'),
(58, '9780785157137'),

-- Dune: Part Two
(57, '9780441172719'),

-- The Odyssey
(59, '9780140449112'),

-- Jurassic Park
(69, '9780394588162'),

-- Howl's Moving Castle
(70, '9780688062330'),

-- Project Hail Mary
(71, '9780593135204'),

-- Catch Me If You Can
(72, '9780448165387'),

-- Blade Runner
(77, '9780385046947'),

-- Jaws
(78, '9780385047715');