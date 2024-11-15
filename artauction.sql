-- First, drop tables that other tables depend on (child tables)
DROP TABLE IF EXISTS `OrderItem`;
DROP TABLE IF EXISTS `Order`;
DROP TABLE IF EXISTS `OrderDetails`;

DROP TABLE IF EXISTS `Bid`;
DROP TABLE IF EXISTS `Auction`;
DROP TABLE IF EXISTS `AuctionDetails`;

DROP TABLE IF EXISTS `Tag`;
DROP TABLE IF EXISTS `Favorite`;

DROP TABLE IF EXISTS `ProfilePicture`;
DROP TABLE IF EXISTS `ArtImage`;
DROP TABLE IF EXISTS `Uploaded`;
DROP TABLE IF EXISTS `Image`;

DROP TABLE IF EXISTS `Artwork`;

DROP TABLE IF EXISTS `Follow`;
DROP TABLE IF EXISTS `Admin`;

-- Finally, drop the User table which many other tables depend on
DROP TABLE IF EXISTS `User`;

CREATE TABLE `User` (
    `ID` INT PRIMARY KEY AUTO_INCREMENT,
    `emailAddress` VARCHAR(100) NOT NULL UNIQUE,
    `password` VARCHAR(255) NOT NULL,
    `name` VARCHAR(100) NOT NULL,
    `displayName` VARCHAR(50),
    `address` TEXT,
    `anonymous` BOOLEAN DEFAULT FALSE
);

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`emailAddress`, `password`, `name`, `displayName`, `address`, `anonymous`)
VALUES
  ('john.doe@email.com', 'hashed_password_1', 'John Doe', 'JohnD', '123 Main St, New York, NY 10001', FALSE),
  ('sarah.smith@email.com', 'hashed_password_2', 'Sarah Smith', 'SarahS', '456 Oak Avenue, Los Angeles, CA 90001', FALSE),
  ('mike.johnson@email.com', 'hashed_password_3', 'Michael Johnson', 'MikeJ', '789 Pine Road, Chicago, IL 60601', FALSE),
  ('emily.brown@email.com', 'hashed_password_4', 'Emily Brown', 'Em_Brown', '321 Maple Lane, Houston, TX 77001', FALSE),
  ('anonymous_user_1@email.com', 'hashed_password_5', 'Anonymous User', 'Anon1', NULL, TRUE),
  ('david.wilson@email.com', 'hashed_password_6', 'David Wilson', 'Dave_W', '741 Beach Blvd, Miami, FL 33101', FALSE),
  ('lisa.garcia@email.com', 'hashed_password_7', 'Lisa Garcia', 'LisaG', '852 Hill Street, Seattle, WA 98101', FALSE),
  ('robert.taylor@email.com', 'hashed_password_8', 'Robert Taylor', 'Rob_T', '963 Valley Road, Boston, MA 02101', FALSE),
  ('anonymous_user_2@email.com', 'hashed_password_9', 'Anonymous User 2', 'Anon2', NULL, TRUE),
  ( 'michelle.lee@email.com', 'hashed_password_10', 'Michelle Lee', 'MichelleL', '159 River Drive, San Francisco, CA 94101', FALSE);

-- Create Admin table
CREATE TABLE `Admin` (
    `userID` INT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL,
    FOREIGN KEY (`userID`) REFERENCES User(`ID`)
);

INSERT INTO `Admin` (`userID`, `name`)
VALUES
    (1, 'John Doe - System Administrator'),
    (9, 'Anonymous Admin - Privacy Administrator');

-- Create Follow table
CREATE TABLE `Follow` (
    `followerID` INT,
    `followingID` INT,
    PRIMARY KEY (`followerID`, `followingID`),
    FOREIGN KEY (`followerID`) REFERENCES User(`ID`),
    FOREIGN KEY (`followingID`) REFERENCES User(`ID`),
    CHECK (`followerID` != `followingID`) -- Prevent self-following
);

-- Insert 10 example records
INSERT INTO `Follow` (`followerID`, followingID)
VALUES
    -- John Doe (1) follows several users
    (1, 2),  -- John Doe follows Sarah Smith
    (1, 3),  -- John Doe follows Michael Johnson

    -- Sarah Smith (2) follows others
    (2, 1),  -- Sarah Smith follows John Doe
    (2, 4),  -- Sarah Smith follows Emily Brown

    -- Emily Brown (4) follows others
    (4, 1),  -- Emily Brown follows John Doe
    (4, 2),  -- Emily Brown follows Sarah Smith

    -- David Wilson (6) follows others
    (6, 1),  -- David Wilson follows John Doe
    (6, 7),  -- David Wilson follows Lisa Garcia

    -- Lisa Garcia (7) follows others
    (7, 6),  -- Lisa Garcia follows David Wilson
    (7, 10); -- Lisa Garcia follows Michelle Lee

-- Create Image table
CREATE TABLE `Image` (
    `ID` INT AUTO_INCREMENT,
    `filename` VARCHAR(255) NOT NULL UNIQUE,
    `uploaderID` INT,
    PRIMARY KEY (`ID`),
    FOREIGN KEY (`uploaderID`) REFERENCES User(`ID`)
);

-- Insert 10 example records
INSERT INTO `Image` (`filename`, `uploaderID`)
VALUES
    ('art-0-XbY9lSMj.jpg', 1),
    ('art-1-5NRmIQHz.jpg', 3),
    ('art-2-gn7ZIP02.jpg', 3),
    ('art-3-PjEcbylw.jpg', 5),
    ('art-4-Kcgd4weU.jpg', 5),
    ('art-5-o6dBd600.jpg', 6),
    ('art-6-r2lPywol.jpg', 6),
    ('art-7-F2uWnkV1.jpg', 7),
    ('art-8-evk9wj9J.jpg', 7),
    ('art-9-64ebf4RM.jpg', 8),

    ('profile-pic-0-KspewSnw.jpg', 1),
    ('profile-pic-1-ZeBM90Sw.jpg', 2),
    ('profile-pic-2-LZM2PdOD.jpg', 3),
    ('profile-pic-3-8ilzL4dz.jpg', 4),
    ('profile-pic-4-cYG3BuZ2.jpg', 5),
    ('profile-pic-5-h5mqegh2.jpg', 6),
    ('profile-pic-6-Qjt95p3G.jpg', 7),
    ('profile-pic-7-17KKLjiL.jpg', 8),
    ('profile-pic-8-RYPfQSGn.jpg', 8),
    ('profile-pic-9-mH33ltOO.jpg', 9);

-- Create ProfilePicture table
CREATE TABLE `ProfilePicture` (
    `userID` INT PRIMARY KEY,
    `imageID` INT NOT NULL,
    FOREIGN KEY (`userID`) REFERENCES User(`ID`),
    FOREIGN KEY (`imageID`) REFERENCES Image(`ID`)
);

-- Insert 10 example profile pictures
INSERT INTO `ProfilePicture` (`userID`, `imageID`)
VALUES
    (1, 12),  -- John Doe's profile picture
    (2, 12),  -- Sarah Smith's profile picture
    (3, 15),  -- Michael Johnson's profile picture
    (4, 11),  -- Emily Brown's profile picture
    (5, 13),  -- Anonymous User's profile picture
    (6, 14),  -- David Wilson's profile picture
    (7, 16),  -- Lisa Garcia's profile picture
    (8, 17),  -- Robert Taylor's profile picture
    (9, 18),  -- Anonymous User 2's profile picture
    (10, 19); -- Michelle Lee's profile picture

-- Create ArtImage table
CREATE TABLE `ArtImage` (
    `artworkID` INT PRIMARY KEY,
    `imageID` INT NOT NULL,
    FOREIGN KEY (`imageID`) REFERENCES Image(`ID`)
);

-- Insert 10 example art images
INSERT INTO `ArtImage` (`artworkID`, `imageID`)
VALUES
    (1, 1),  -- Artwork 1 using vacation_beach_2024.jpg
    (2, 3),  -- Artwork 2 using family_reunion_2024.jpeg
    (3, 4),  -- Artwork 3 using sunset_landscape.jpg
    (4, 5),  -- Artwork 4 using product_showcase.png
    (5, 6),  -- Artwork 5 using event_conference_2024.jpg
    (6, 7),  -- Artwork 6 using nature_hiking_trail.jpeg
    (7, 8),  -- Artwork 7 using birthday_celebration.jpg
    (8, 9),  -- Artwork 8 using team_photo_2024.png
    (9, 10), -- Artwork 9 using pet_dog_max.jpg
    (10, 2); -- Artwork 10 using profile_photo_sarah.png

-- 1. Artwork and related tables
CREATE TABLE `Artwork` (
    `ID` INT PRIMARY KEY AUTO_INCREMENT,
    `title` VARCHAR(255) NOT NULL,
    `description` TEXT,
    `artist` VARCHAR(80)
);

INSERT INTO `Artwork` (title, description, artist) VALUES
    ('Dancing in the Rain',
     'An impressionistic piece capturing the joy of dancing in a summer rain shower. Created using oil paints with vibrant blues and purples.',
     'Emily Chen'),

    ('Urban Solitude',
     'A contemporary urban landscape showing a quiet city street at dawn. Painted in muted tones with watercolor and ink.',
     'Marcus Rodriguez'),

    ('Wildflower Dreams',
     'Abstract representation of a wildflower meadow in spring. Mixed media piece combining acrylics and pressed flowers.',
     'Sarah O''Connor'),

    ('Digital Dystopia',
     'Digital art piece exploring themes of technology and isolation in modern society. Created using 3D modeling and digital painting.',
     'Alex Kim'),

    ('Mountain Whispers',
     'Traditional landscape painting of the Rocky Mountains at sunset. Oil on canvas with detailed foreground elements.',
     'James Morrison'),

    ('Fragments of Memory',
     'Abstract collage combining photography and paint to explore themes of memory and time. Mixed media on canvas.',
     'Lisa Wong'),

    ('Ocean''s Symphony',
     'Large-scale seascape capturing the power and movement of ocean waves. Created with oil paints in various shades of blue.',
     'David Thompson'),

    ('Neon Dreams',
     'Contemporary piece featuring bright neon colors and geometric patterns. Acrylic and spray paint on canvas.',
     'Maria Garcia'),

    ('Silent Forest',
     'Minimalist representation of a winter forest scene. Created using charcoal and white chalk on toned paper.',
     'Thomas Wright'),

    ( 'Cultural Fusion',
     'Mixed media artwork combining traditional Eastern patterns with Western abstract expressionism. Incorporates gold leaf and acrylics.',
     'Yuki Tanaka');

-- 2. Favorite table
CREATE TABLE `Favorite` (
    `userID` INT,
    `artworkID` INT,
    PRIMARY KEY (`userID`, `artworkID`),
    FOREIGN KEY (`userID`) REFERENCES User(`ID`),
    FOREIGN KEY (`artworkID`) REFERENCES Artwork(`ID`)
);

INSERT INTO `Favorite` (`userID`, `artworkID`) VALUES
    (1, 2), (1, 3), (2, 1), (3, 4), (4, 5),
    (5, 6), (6, 7), (7, 8), (8, 9), (9, 10);

-- 3. Tag table
CREATE TABLE `Tag` (
    `artworkID` INT,
    `name` VARCHAR(50),
    PRIMARY KEY (`artworkID`, `name`),
    FOREIGN KEY (`artworkID`) REFERENCES Artwork(`ID`)
);

INSERT INTO `Tag` (`artworkID`, `name`) VALUES
    (1, 'landscape'), (1, 'sunset'), (2, 'abstract'),
    (3, 'nature'), (4, 'urban'), (5, 'nature'),
    (6, 'seascape'), (7, 'digital'), (8, 'flowers'),
    (9, 'space');

-- 4. Auction related tables
CREATE TABLE `AuctionDetails` (
    `ID` INT PRIMARY KEY AUTO_INCREMENT,
    `startTimestamp` TIMESTAMP NOT NULL,
    `endTimestamp` TIMESTAMP NOT NULL,
    `amount` DECIMAL(10,2),
    `startingPrice` DECIMAL(10,2) NOT NULL,
    `reserve` DECIMAL(10,2),
    `result` VARCHAR(20)
);

INSERT INTO `AuctionDetails` (`startTimestamp`, `endTimestamp`, `amount`, `startingPrice`, `reserve`, `result`) VALUES
    ( '2024-11-01 10:00:00', '2024-11-07 10:00:00', 1500.00, 1000.00, 1200.00, 'SOLD'),
    ( '2024-11-02 10:00:00', '2024-11-08 10:00:00', 2000.00, 1500.00, 1800.00, 'SOLD'),
    ( '2024-11-03 10:00:00', '2024-11-09 10:00:00', NULL, 2000.00, 2500.00, 'UNSOLD'),
    ( '2024-11-04 10:00:00', '2024-11-10 10:00:00', NULL, 1800.00, 2000.00, 'UNSOLD'),
    ( '2024-11-05 10:00:00', '2024-11-11 10:00:00', 3000.00, 2500.00, 2800.00, 'SOLD'),
    ( '2024-11-06 10:00:00', '2024-11-12 10:00:00', NULL, 1200.00, 1500.00, 'ACTIVE'),
    ( '2024-11-07 10:00:00', '2024-11-13 10:00:00', NULL, 2200.00, 2500.00, 'ACTIVE'),
    ( '2024-11-08 10:00:00', '2024-11-14 10:00:00', 2800.00, 2000.00, 2500.00, 'SOLD'),
    ( '2024-11-09 10:00:00', '2024-11-15 10:00:00', NULL, 1500.00, 1800.00, 'ACTIVE'),
    ( '2024-11-10 10:00:00', '2024-11-16 10:00:00', NULL, 1700.00, 2000.00, 'ACTIVE');

CREATE TABLE `Auction` (
    `userID` INT,
    `artworkAndDetailsID` INT,
    PRIMARY KEY (`userID`, `artworkAndDetailsID`),
    FOREIGN KEY (`userID`) REFERENCES User(`ID`)
);

INSERT INTO `Auction` (`userID`, `artworkAndDetailsID`) VALUES
    (1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
    (6, 6), (7, 7), (8, 8), (9, 9), (10, 10);

CREATE TABLE `Bid` (
    userID INT,
    auctionDetailsID INT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dollarAmount DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (`userID`, `auctionDetailsID`, `timestamp`),
    FOREIGN KEY (`userID`) REFERENCES User(ID),
    FOREIGN KEY (`auctionDetailsID`) REFERENCES AuctionDetails(`ID`)
);

INSERT INTO `Bid` (`userID`, `auctionDetailsID`, `timestamp`, `dollarAmount`) VALUES
    (1, 1, '2024-11-01 12:00:00', 1100.00),
    (2, 1, '2024-11-01 13:00:00', 1200.00),
    (3, 1, '2024-11-01 14:00:00', 1500.00),
    (4, 2, '2024-11-02 12:00:00', 1600.00),
    (5, 2, '2024-11-02 13:00:00', 1800.00),
    (6, 2, '2024-11-02 14:00:00', 2000.00),
    (7, 5, '2024-11-05 12:00:00', 2600.00),
    (8, 5, '2024-11-05 13:00:00', 2800.00),
    (9, 5, '2024-11-05 14:00:00', 3000.00),
    (10, 8, '2024-11-08 12:00:00', 2800.00);

-- 5. Order related tables
CREATE TABLE `OrderDetails` (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    trackingNumber VARCHAR(50),
    status VARCHAR(20),
    totalPaid DECIMAL(10,2)
);

INSERT INTO `OrderDetails` (`timestamp`, `trackingNumber`, `status`, `totalPaid`) VALUES
    ('2024-11-01 15:00:00', 'TRK123456', 'DELIVERED', 1500.00),
    ('2024-11-02 15:00:00', 'TRK123457', 'SHIPPED', 2000.00),
    ('2024-11-03 15:00:00', 'TRK123458', 'PROCESSING', 2500.00),
    ('2024-11-04 15:00:00', 'TRK123459', 'DELIVERED', 1800.00),
    ('2024-11-05 15:00:00', 'TRK123460', 'SHIPPED', 3000.00),
    ('2024-11-06 15:00:00', 'TRK123461', 'PROCESSING', 1200.00),
    ('2024-11-07 15:00:00', 'TRK123462', 'DELIVERED', 2200.00),
    ('2024-11-08 15:00:00', 'TRK123463', 'SHIPPED', 2800.00),
    ('2024-11-09 15:00:00', 'TRK123464', 'PROCESSING', 1500.00),
    ( '2024-11-10 15:00:00', 'TRK123465', 'DELIVERED', 1700.00);

CREATE TABLE `Order` (
    `userID` INT,
    `orderDetailsID` INT,
    PRIMARY KEY (`userID`, `orderDetailsID`),
    FOREIGN KEY (`userID`) REFERENCES User(`ID`),
    FOREIGN KEY (`orderDetailsID`) REFERENCES OrderDetails(`ID`)
);

INSERT INTO `Order` (`userID`, `orderDetailsID`) VALUES
    (1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
    (6, 6), (7, 7), (8, 8), (9, 9), (10, 10);

CREATE TABLE `OrderItem` (
    `orderDetailsID` INT,
    `artworkID` INT,
    PRIMARY KEY (`orderDetailsID`, `artworkID`),
    FOREIGN KEY (`orderDetailsID`) REFERENCES OrderDetails(`ID`),
    FOREIGN KEY (`artworkID`) REFERENCES Artwork(`ID`)
);

INSERT INTO `OrderItem` (`orderDetailsID`, `artworkID`) VALUES
    (1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
    (6, 6), (7, 7), (8, 8), (9, 9), (10, 10);
