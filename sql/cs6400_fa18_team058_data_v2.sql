-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 18, 2018 at 11:00 PM
-- Server version: 5.7.24
-- PHP Version: 7.1.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cs6400_fa18_team058`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `Name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`Name`) VALUES
('Animal'),
('Architecture '),
('Art'),
('Education'),
('Food & Drink'),
('Home & Garden'),
('Human'),
('Movie'),
('Nature'),
('Other'),
('People'),
('Pets'),
('Photography'),
('Sports'),
('Technology'),
('Travel');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `CommenterEmail` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Com_DateTime` datetime NOT NULL,
  `PP_DateTime` datetime NOT NULL,
  `Text` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CB_DateTime` datetime NOT NULL,
  `OwnerEmail` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`CommenterEmail`, `Com_DateTime`, `PP_DateTime`, `Text`, `CB_DateTime`, `OwnerEmail`) VALUES
('cai@gmail.com', '2018-11-19 01:14:33', '2018-11-19 01:14:18', 'I like this dog', '2018-11-19 01:13:38', 'cai@gmail.com'),
('fan@gmail.com', '2018-11-19 01:43:36', '2018-11-19 01:14:18', 'So cuuuuute!', '2018-11-19 01:13:38', 'cai@gmail.com'),
('fan@gmail.com', '2018-11-19 01:39:30', '2018-11-19 01:34:39', 'Cool!', '2018-11-19 01:34:04', 'cai@gmail.com'),
('chen@gmail.com', '2018-11-19 01:58:48', '2018-11-19 01:34:39', 'I like his movies', '2018-11-19 01:34:04', 'cai@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `corkboard`
--

CREATE TABLE `corkboard` (
  `OwnerEmail` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Cate_Name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CB_DateTime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `corkboard`
--

INSERT INTO `corkboard` (`OwnerEmail`, `Title`, `Cate_Name`, `CB_DateTime`) VALUES
('cai@gmail.com', 'Cute Cat', 'Animal', '2018-11-19 01:08:31'),
('cai@gmail.com', 'Dogs', 'Animal', '2018-11-19 01:13:38'),
('cai@gmail.com', 'Movie Stars', 'Human', '2018-11-19 01:34:04'),
('chen@gmail.com', 'Ducks', 'Animal', '2018-11-19 01:16:05'),
('chen@gmail.com', 'Yellowstone national park', 'Nature', '2018-11-19 01:36:33'),
('fan@gmail.com', 'Harry Potter', 'Movie', '2018-11-19 01:23:20'),
('guo@gmail.com', 'My Garden', 'Home & Garden', '2018-11-19 01:18:28');

-- --------------------------------------------------------

--
-- Table structure for table `follows`
--

CREATE TABLE `follows` (
  `FollowerEmail` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FolloweeEmail` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `follows`
--

INSERT INTO `follows` (`FollowerEmail`, `FolloweeEmail`) VALUES
('fan@gmail.com', 'cai@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `OwnerEmail` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CB_DateTime` datetime NOT NULL,
  `PP_DateTime` datetime NOT NULL,
  `LikerEmail` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`OwnerEmail`, `CB_DateTime`, `PP_DateTime`, `LikerEmail`) VALUES
('cai@gmail.com', '2018-11-19 01:34:04', '2018-11-19 01:34:39', 'chen@gmail.com'),
('cai@gmail.com', '2018-11-19 01:34:04', '2018-11-19 01:34:39', 'fan@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `private_corkboard`
--

CREATE TABLE `private_corkboard` (
  `OwnerEmail` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CB_DateTime` datetime NOT NULL,
  `Password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `private_corkboard`
--

INSERT INTO `private_corkboard` (`OwnerEmail`, `CB_DateTime`, `Password`) VALUES
('cai@gmail.com', '2018-11-19 01:13:38', '1234'),
('chen@gmail.com', '2018-11-19 01:36:33', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `public_corkboard`
--

CREATE TABLE `public_corkboard` (
  `OwnerEmail` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CB_DateTime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `public_corkboard`
--

INSERT INTO `public_corkboard` (`OwnerEmail`, `CB_DateTime`) VALUES
('cai@gmail.com', '2018-11-19 01:08:31'),
('chen@gmail.com', '2018-11-19 01:16:05'),
('guo@gmail.com', '2018-11-19 01:18:28'),
('fan@gmail.com', '2018-11-19 01:23:20'),
('cai@gmail.com', '2018-11-19 01:34:04');

-- --------------------------------------------------------

--
-- Table structure for table `pushpin`
--

CREATE TABLE `pushpin` (
  `OwnerEmail` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CB_DateTime` datetime NOT NULL,
  `PP_DateTime` datetime NOT NULL,
  `Link` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Description` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pushpin`
--

INSERT INTO `pushpin` (`OwnerEmail`, `CB_DateTime`, `PP_DateTime`, `Link`, `Description`) VALUES
('cai@gmail.com', '2018-11-19 01:08:31', '2018-11-19 01:09:23', 'https://images.pexels.com/photos/104827/cat-pet-animal-domestic-104827.jpeg', 'White cat'),
('cai@gmail.com', '2018-11-19 01:08:31', '2018-11-19 01:11:36', 'https://d3pz1jifuab5zg.cloudfront.net/1970/01/26071523/kitty-551555_1280.jpg', 'Another Cat'),
('cai@gmail.com', '2018-11-19 01:13:38', '2018-11-19 01:14:18', 'https://images.pexels.com/photos/356378/pexels-photo-356378.jpeg', 'White dog'),
('cai@gmail.com', '2018-11-19 01:34:04', '2018-11-19 01:34:39', 'https://i.kinja-img.com/gawker-media/image/upload/s--z_ixzRks--/c_scale,f_auto,fl_progressive,q_80,w_800/ycaueu8wlamze4xshosv.jpg', 'Leonardo Dicaprio'),
('chen@gmail.com', '2018-11-19 01:16:05', '2018-11-19 01:17:33', 'https://images.pexels.com/photos/162140/duckling-birds-yellow-fluffy-162140.jpeg', 'Yellow duckling'),
('chen@gmail.com', '2018-11-19 01:16:05', '2018-11-19 01:31:11', 'https://cdn-images-1.medium.com/max/1200/1*eFjpoz8lhNKyd8XcSWv2OA.jpeg', 'Adding a new duck'),
('chen@gmail.com', '2018-11-19 01:36:33', '2018-11-19 01:38:36', 'https://www.yellowstonepark.com/.image/t_share/MTU0ODMzMDA2MjMyNjEwODAx/ys-grand-prismatic_tamtroyhendrickson_700.jpg', 'yellowstone'),
('fan@gmail.com', '2018-11-19 01:23:20', '2018-11-19 01:24:46', 'https://vignette.wikia.nocookie.net/harrypotter/images/7/70/Harry_Potter_and_the_Order_of_the_Phoenix.jpg', 'The order of the phoenix'),
('fan@gmail.com', '2018-11-19 01:23:20', '2018-11-19 01:27:03', 'https://artfiles.alphacoders.com/986/98641.jpg', 'The chamber of secrets'),
('guo@gmail.com', '2018-11-19 01:18:28', '2018-11-19 01:19:12', 'http://img.timeinc.net/time/2010/portland_tavel/portland_rose_garden.jpg', 'My dream garden'),
('guo@gmail.com', '2018-11-19 01:18:28', '2018-11-19 01:20:18', 'https://www.highclerecastle.co.uk/sites/default/files/montage-secret-garden.jpg', 'Another garden'),
('guo@gmail.com', '2018-11-19 01:18:28', '2018-11-19 01:21:30', 'https://www.rhs.org.uk/getmedia/e972b1f8-c1d5-474d-a967-3256b7da2abf/extoic-garden.jpg', 'Spring');

-- --------------------------------------------------------

--
-- Table structure for table `pushpin_tag`
--

CREATE TABLE `pushpin_tag` (
  `OwnerEmail` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CB_DateTime` datetime NOT NULL,
  `PP_DateTime` datetime NOT NULL,
  `Tag` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pushpin_tag`
--

INSERT INTO `pushpin_tag` (`OwnerEmail`, `CB_DateTime`, `PP_DateTime`, `Tag`) VALUES
('cai@gmail.com', '2018-11-19 01:08:31', '2018-11-19 01:09:23', 'cat'),
('cai@gmail.com', '2018-11-19 01:08:31', '2018-11-19 01:11:36', 'cat'),
('cai@gmail.com', '2018-11-19 01:13:38', '2018-11-19 01:14:18', 'dog'),
('chen@gmail.com', '2018-11-19 01:16:05', '2018-11-19 01:17:33', 'duck'),
('chen@gmail.com', '2018-11-19 01:16:05', '2018-11-19 01:31:11', 'duck'),
('guo@gmail.com', '2018-11-19 01:18:28', '2018-11-19 01:19:12', ' green'),
('guo@gmail.com', '2018-11-19 01:18:28', '2018-11-19 01:19:12', 'gardens'),
('guo@gmail.com', '2018-11-19 01:18:28', '2018-11-19 01:20:18', 'green'),
('guo@gmail.com', '2018-11-19 01:18:28', '2018-11-19 01:21:30', 'water spring'),
('fan@gmail.com', '2018-11-19 01:23:20', '2018-11-19 01:24:46', 'phoenix'),
('fan@gmail.com', '2018-11-19 01:23:20', '2018-11-19 01:27:03', 'secrets'),
('cai@gmail.com', '2018-11-19 01:34:04', '2018-11-19 01:34:39', 'leonardo'),
('chen@gmail.com', '2018-11-19 01:36:33', '2018-11-19 01:38:36', 'yellowstone');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `Email` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FullName` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PIN` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`Email`, `FullName`, `PIN`) VALUES
('cai@gmail.com', 'Zhiyuan Cai', '1234'),
('chen@gmail.com', 'Baozhen Chen', '1234'),
('fan@gmail.com', 'Fan Fei', '1234'),
('guo@gmail.com', 'Jolin Guo', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `watches`
--

CREATE TABLE `watches` (
  `WatcherEmail` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CB_DateTime` datetime NOT NULL,
  `OwnerEmail` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `watches`
--

INSERT INTO `watches` (`WatcherEmail`, `CB_DateTime`, `OwnerEmail`) VALUES
('fan@gmail.com', '2018-11-19 01:16:05', 'chen@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`Name`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`OwnerEmail`,`CB_DateTime`,`PP_DateTime`,`Com_DateTime`),
  ADD KEY `OwnerEmail` (`OwnerEmail`),
  ADD KEY `CB_DateTime` (`CB_DateTime`),
  ADD KEY `PP_DateTime` (`PP_DateTime`),
  ADD KEY `Com_DateTime` (`Com_DateTime`),
  ADD KEY `fk_COMMENT_COMMENTER_Email_User_Email` (`CommenterEmail`);

--
-- Indexes for table `corkboard`
--
ALTER TABLE `corkboard`
  ADD PRIMARY KEY (`OwnerEmail`,`CB_DateTime`),
  ADD KEY `OwnerEmail` (`OwnerEmail`),
  ADD KEY `CB_DateTime` (`CB_DateTime`),
  ADD KEY `fk_CORKBOARD_Cate_name_Category_name` (`Cate_Name`);

--
-- Indexes for table `follows`
--
ALTER TABLE `follows`
  ADD PRIMARY KEY (`FollowerEmail`,`FolloweeEmail`),
  ADD KEY `FollowerEmail` (`FollowerEmail`),
  ADD KEY `FolloweeEmail` (`FolloweeEmail`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`OwnerEmail`,`CB_DateTime`,`PP_DateTime`,`LikerEmail`),
  ADD KEY `OwnerEmail` (`OwnerEmail`),
  ADD KEY `CB_DateTime` (`CB_DateTime`),
  ADD KEY `PP_DateTime` (`PP_DateTime`),
  ADD KEY `LikerEmail` (`LikerEmail`);

--
-- Indexes for table `private_corkboard`
--
ALTER TABLE `private_corkboard`
  ADD PRIMARY KEY (`OwnerEmail`,`CB_DateTime`),
  ADD KEY `OwnerEmail` (`OwnerEmail`),
  ADD KEY `CB_DateTime` (`CB_DateTime`);

--
-- Indexes for table `public_corkboard`
--
ALTER TABLE `public_corkboard`
  ADD PRIMARY KEY (`OwnerEmail`,`CB_DateTime`),
  ADD KEY `OwnerEmail` (`OwnerEmail`),
  ADD KEY `CB_DateTime` (`CB_DateTime`);

--
-- Indexes for table `pushpin`
--
ALTER TABLE `pushpin`
  ADD PRIMARY KEY (`OwnerEmail`,`CB_DateTime`,`PP_DateTime`),
  ADD KEY `OwnerEmail` (`OwnerEmail`),
  ADD KEY `CB_DateTime` (`CB_DateTime`),
  ADD KEY `PP_DateTime` (`PP_DateTime`);

--
-- Indexes for table `pushpin_tag`
--
ALTER TABLE `pushpin_tag`
  ADD PRIMARY KEY (`OwnerEmail`,`CB_DateTime`,`PP_DateTime`,`Tag`),
  ADD KEY `OwnerEmail` (`OwnerEmail`),
  ADD KEY `CB_DateTime` (`CB_DateTime`),
  ADD KEY `PP_DateTime` (`PP_DateTime`),
  ADD KEY `Tag` (`Tag`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Email`),
  ADD UNIQUE KEY `email` (`Email`);

--
-- Indexes for table `watches`
--
ALTER TABLE `watches`
  ADD PRIMARY KEY (`WatcherEmail`,`OwnerEmail`,`CB_DateTime`),
  ADD KEY `WatcherEmail` (`WatcherEmail`),
  ADD KEY `OwnerEmail` (`OwnerEmail`),
  ADD KEY `CB_DateTime` (`CB_DateTime`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `fk_COMMENT_CB_DateTime_CB_DateTime` FOREIGN KEY (`CB_DateTime`) REFERENCES `pushpin` (`CB_DateTime`),
  ADD CONSTRAINT `fk_COMMENT_COMMENTER_Email_User_Email` FOREIGN KEY (`CommenterEmail`) REFERENCES `user` (`Email`),
  ADD CONSTRAINT `fk_COMMENT_OWNER_Email_User_Email` FOREIGN KEY (`OwnerEmail`) REFERENCES `pushpin` (`OwnerEmail`),
  ADD CONSTRAINT `fk_COMMENT_PP_DateTime_PP_DateTime` FOREIGN KEY (`PP_DateTime`) REFERENCES `pushpin` (`PP_DateTime`);

--
-- Constraints for table `corkboard`
--
ALTER TABLE `corkboard`
  ADD CONSTRAINT `fk_CORKBOARD_Cate_name_Category_name` FOREIGN KEY (`Cate_Name`) REFERENCES `category` (`Name`),
  ADD CONSTRAINT `fk_CORKBOARD_Email_User_Email` FOREIGN KEY (`OwnerEmail`) REFERENCES `user` (`Email`);

--
-- Constraints for table `follows`
--
ALTER TABLE `follows`
  ADD CONSTRAINT `fk_FOLLOWS_FOLLOWEE_Email_CORKBOARD_Email` FOREIGN KEY (`FolloweeEmail`) REFERENCES `corkboard` (`OwnerEmail`),
  ADD CONSTRAINT `fk_FOLLOWS_FOLLOWER_Email_User_Email` FOREIGN KEY (`FollowerEmail`) REFERENCES `user` (`Email`);

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `fk_like_CB_DateTime_PUSHPIN_CB_DateTime` FOREIGN KEY (`CB_DateTime`) REFERENCES `pushpin` (`CB_DateTime`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_like_Email_User_Email` FOREIGN KEY (`LikerEmail`) REFERENCES `user` (`Email`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_like_Owner_Email_PUSHPIN_Email` FOREIGN KEY (`OwnerEmail`) REFERENCES `pushpin` (`OwnerEmail`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_like_PP_DateTime_PUSHPIN_PP_DateTime` FOREIGN KEY (`PP_DateTime`) REFERENCES `pushpin` (`PP_DateTime`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `private_corkboard`
--
ALTER TABLE `private_corkboard`
  ADD CONSTRAINT `fk_PRIVATE_DateTime_CB_DateTime` FOREIGN KEY (`CB_DateTime`) REFERENCES `corkboard` (`CB_DateTime`),
  ADD CONSTRAINT `fk_PRIVATE_Email_User_Email` FOREIGN KEY (`OwnerEmail`) REFERENCES `corkboard` (`OwnerEmail`);

--
-- Constraints for table `public_corkboard`
--
ALTER TABLE `public_corkboard`
  ADD CONSTRAINT `fk_PUBLIC_DateTime_CB_DateTime` FOREIGN KEY (`CB_DateTime`) REFERENCES `corkboard` (`CB_DateTime`),
  ADD CONSTRAINT `fk_PUBLIC_Email_User_Email` FOREIGN KEY (`OwnerEmail`) REFERENCES `corkboard` (`OwnerEmail`);

--
-- Constraints for table `pushpin`
--
ALTER TABLE `pushpin`
  ADD CONSTRAINT `fk_PUSHPIN_DateTime_CB_DateTime` FOREIGN KEY (`CB_DateTime`) REFERENCES `corkboard` (`CB_DateTime`),
  ADD CONSTRAINT `fk_PUSHPIN_Email_User_Email` FOREIGN KEY (`OwnerEmail`) REFERENCES `corkboard` (`OwnerEmail`);

--
-- Constraints for table `pushpin_tag`
--
ALTER TABLE `pushpin_tag`
  ADD CONSTRAINT `fk_tag_CB_DateTime_PUSHPIN_CB_DateTime` FOREIGN KEY (`CB_DateTime`) REFERENCES `pushpin` (`CB_DateTime`),
  ADD CONSTRAINT `fk_tag_Owner_Email_PUSHPIN_Email` FOREIGN KEY (`OwnerEmail`) REFERENCES `pushpin` (`OwnerEmail`),
  ADD CONSTRAINT `fk_tag_PP_DateTime_PUSHPIN_PP_DateTime` FOREIGN KEY (`PP_DateTime`) REFERENCES `pushpin` (`PP_DateTime`);

--
-- Constraints for table `watches`
--
ALTER TABLE `watches`
  ADD CONSTRAINT `fk_watch_CB_DateTime_CORKBOARD_CB_DateTime` FOREIGN KEY (`CB_DateTime`) REFERENCES `corkboard` (`CB_DateTime`),
  ADD CONSTRAINT `fk_watch_Owner_Email_CORKBOARD_Email` FOREIGN KEY (`OwnerEmail`) REFERENCES `corkboard` (`OwnerEmail`),
  ADD CONSTRAINT `fk_watch_Watcher_Email_User_Email` FOREIGN KEY (`WatcherEmail`) REFERENCES `user` (`Email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
