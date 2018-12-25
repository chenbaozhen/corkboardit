-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 24, 2018 at 11:52 PM
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
('Architecture '),
('Art'),
('Education'),
('Food & Drink'),
('Home & Garden'),
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
('cai@gmail.com', 'People CB', 'People', '2018-11-25 01:13:40'),
('cai@gmail.com', 'Travel CB', 'Travel', '2018-11-25 01:38:31'),
('chen@gmail.com', 'Food & Drink CB', 'Food & Drink', '2018-11-25 01:33:57'),
('chen@gmail.com', 'Pets CB', 'Pets', '2018-11-25 01:41:05'),
('fan@gmail.com', 'Education CB', 'Education', '2018-11-25 01:09:38'),
('guo@gmail.com', 'Technology CB', 'Technology', '2018-11-25 01:35:55'),
('rice@gmail.com', 'Sports CB', 'Sports', '2018-11-25 01:22:00'),
('smith@gmail.com', 'Architecture CB', 'Architecture ', '2018-11-25 01:17:25');

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
('cai@gmail.com', 'rice@gmail.com'),
('cai@gmail.com', 'smith@gmail.com'),
('chen@gmail.com', 'cai@gmail.com'),
('chen@gmail.com', 'guo@gmail.com'),
('fan@gmail.com', 'guo@gmail.com'),
('fan@gmail.com', 'rice@gmail.com'),
('guo@gmail.com', 'fan@gmail.com'),
('guo@gmail.com', 'smith@gmail.com'),
('rice@gmail.com', 'cai@gmail.com'),
('rice@gmail.com', 'fan@gmail.com'),
('smith@gmail.com', 'cai@gmail.com'),
('smith@gmail.com', 'chen@gmail.com');

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
('cai@gmail.com', '2018-11-25 01:13:40', '1234'),
('chen@gmail.com', '2018-11-25 01:41:05', '1234');

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
('fan@gmail.com', '2018-11-25 01:09:38'),
('smith@gmail.com', '2018-11-25 01:17:25'),
('rice@gmail.com', '2018-11-25 01:22:00'),
('chen@gmail.com', '2018-11-25 01:33:57'),
('guo@gmail.com', '2018-11-25 01:35:55'),
('cai@gmail.com', '2018-11-25 01:38:31');

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
('cai@gmail.com', '2018-11-25 01:13:40', '2018-11-25 01:14:06', 'http://www.me.gatech.edu/sites/default/files/styles/180_240/public/gpburdell.jpg ', 'the struggle is real!'),
('cai@gmail.com', '2018-11-25 01:13:40', '2018-11-25 01:14:39', 'https://www.cc.gatech.edu/projects/XMLApe/people/imgs/leo.jpg ', 'Leo Mark, CS 6400 professor'),
('cai@gmail.com', '2018-11-25 01:13:40', '2018-11-25 01:16:01', 'https://www.cc.gatech.edu/sites/default/files/images/27126038747_06d417015b_z.jpg ', 'fearless leader of OMSCS'),
('cai@gmail.com', '2018-11-25 01:38:31', '2018-11-25 01:38:49', 'https://pbs.twimg.com/media/DZzi7dyU8AAUSJe.jpg ', 'Georgia Tech Transette'),
('cai@gmail.com', '2018-11-25 01:38:31', '2018-11-25 01:39:16', 'https://www.calendar.gatech.edu/sites/default/files/events/related-images/mini_500_0_0.jpg ', 'Mini 500'),
('cai@gmail.com', '2018-11-25 01:38:31', '2018-11-25 01:39:49', 'https://www.gatech.edu/sites/default/files/uploads/images/superblock_images/tech-trolly.png ', 'Tech Trolley'),
('chen@gmail.com', '2018-11-25 01:33:57', '2018-11-25 01:34:15', 'http://www.livinghistory.gatech.edu/s/1481/images/content_images/thevarsity1_636215546286483906.jpg ', 'The Varsity'),
('chen@gmail.com', '2018-11-25 01:33:57', '2018-11-25 01:34:41', 'http://blogs.iac.gatech.edu/food14/files/2014/09/wafflefries2.jpg ', 'Chick-fil-a Waffle Fries'),
('chen@gmail.com', '2018-11-25 01:41:05', '2018-11-25 01:41:30', 'https://hr.gatech.edu/sites/default/files/uploads/images/superblock_images/nee-buzz.jpg ', 'Buzz'),
('chen@gmail.com', '2018-11-25 01:41:05', '2018-11-25 01:41:55', 'https://georgiadogs.com/images/2018/4/6/18_Uga_VIII.jpg ', 'Uga the “dog\"'),
('chen@gmail.com', '2018-11-25 01:41:05', '2018-11-25 01:42:31', 'https://www.news.gatech.edu/sites/default/files/pictures/feature_images/running%20sideways.jpg ', 'Sideways the dog'),
('fan@gmail.com', '2018-11-25 01:09:38', '2018-11-25 01:10:09', 'https://www.cc.gatech.edu/sites/default/files/images/mercury/oms-cs-web-rotator_2_0_3.jpeg ', 'OMSCS program logo'),
('fan@gmail.com', '2018-11-25 01:09:38', '2018-11-25 01:10:46', 'http://www.buzzcard.gatech.edu/sites/default/files/uploads/images/superblock_images/img_2171.jpg ', 'student ID for Georgia Tech'),
('fan@gmail.com', '2018-11-25 01:09:38', '2018-11-25 01:11:14', 'https://www.news.gatech.edu/sites/default/files/uploads/mercury_images/piazza-icon.png ', 'logo for Piazza'),
('fan@gmail.com', '2018-11-25 01:09:38', '2018-11-25 01:11:46', 'http://www.comm.gatech.edu/sites/default/files/images/brand-graphics/gt-seal.png', 'official seal of Georgia Tech'),
('guo@gmail.com', '2018-11-25 01:35:55', '2018-11-25 01:36:20', 'http://it.studentlife.gatech.edu/sites/default/files/uploads/images/superblock_images/it_imac.png ', 'iMac'),
('guo@gmail.com', '2018-11-25 01:35:55', '2018-11-25 01:36:46', 'https://pe.gatech.edu/sites/pe.gatech.edu/files/component_assets/Computer_Lab_Tech_750_x_500.jpg ', 'Computer lab'),
('guo@gmail.com', '2018-11-25 01:35:55', '2018-11-25 01:37:23', 'https://www.scs.gatech.edu/sites/scs.gatech.edu/files/files/cs-research-databases.jpg ', 'Database server'),
('rice@gmail.com', '2018-11-25 01:22:00', '2018-11-25 01:22:44', 'http://traditions.gatech.edu/images/mantle-reck3.jpg ', 'Ramblin’ wreck today'),
('rice@gmail.com', '2018-11-25 01:22:00', '2018-11-25 01:24:35', 'http://www.swag.gatech.edu/sites/default/files/buzz-android-tablet.jpg ', 'Driving the mini wreck'),
('rice@gmail.com', '2018-11-25 01:22:00', '2018-11-25 01:25:01', 'http://www.livinghistory.gatech.edu/s/1481/images/content_images/ramblinwreck1_636215542678295357.jpg ', 'Ramblin’ Wreck of the past'),
('rice@gmail.com', '2018-11-25 01:22:00', '2018-11-25 01:26:13', 'https://www.news.gatech.edu/sites/default/files/uploads/mercury_images/screen_shot_2016-08-11_at_12.45.48_pm_10.png', 'Bobby Dodd stadium'),
('smith@gmail.com', '2018-11-25 01:17:25', '2018-11-25 01:17:48', 'http://daily.gatech.edu/sites/default/files/styles/1170_x_x/public/hgt-tower-crop.jpg ', 'Tech Tower interior photo'),
('smith@gmail.com', '2018-11-25 01:17:25', '2018-11-25 01:18:23', 'http://www.livinghistory.gatech.edu/s/1481/images/content_images/techtower1_636215523842964533.jpg ', 'Tech Tower exterior photo'),
('smith@gmail.com', '2018-11-25 01:17:25', '2018-11-25 01:18:44', 'https://www.ece.gatech.edu/sites/default/files/styles/1500_x_scale/public/images/mercury/kessler2.0442077-p16-49.jpg ', 'Kessler Campanile at Georgia Tech'),
('smith@gmail.com', '2018-11-25 01:17:25', '2018-11-25 01:19:05', 'https://www.scs.gatech.edu/sites/scs.gatech.edu/files/files/klaus-building.jpg ', 'Klaus building'),
('smith@gmail.com', '2018-11-25 01:17:25', '2018-11-25 01:19:28', 'https://www.news.gatech.edu/sites/default/files/styles/740_x_scale/public/uploads/mercury_images/Tech_Tower_WebFeature_1.jpg', 'Tech tower sign');

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
('fan@gmail.com', '2018-11-25 01:09:38', '2018-11-25 01:10:09', 'omscs'),
('fan@gmail.com', '2018-11-25 01:09:38', '2018-11-25 01:10:46', 'buzzcard'),
('fan@gmail.com', '2018-11-25 01:09:38', '2018-11-25 01:11:14', 'piazza'),
('fan@gmail.com', '2018-11-25 01:09:38', '2018-11-25 01:11:46', 'georgia tech seal'),
('fan@gmail.com', '2018-11-25 01:09:38', '2018-11-25 01:11:46', 'great seal'),
('fan@gmail.com', '2018-11-25 01:09:38', '2018-11-25 01:11:46', 'official'),
('cai@gmail.com', '2018-11-25 01:13:40', '2018-11-25 01:14:06', 'burdell'),
('cai@gmail.com', '2018-11-25 01:13:40', '2018-11-25 01:14:06', 'george p burdell'),
('cai@gmail.com', '2018-11-25 01:13:40', '2018-11-25 01:14:06', 'student'),
('cai@gmail.com', '2018-11-25 01:13:40', '2018-11-25 01:14:39', 'computing'),
('cai@gmail.com', '2018-11-25 01:13:40', '2018-11-25 01:14:39', 'database faculty'),
('cai@gmail.com', '2018-11-25 01:13:40', '2018-11-25 01:14:39', 'gtcomputing'),
('cai@gmail.com', '2018-11-25 01:13:40', '2018-11-25 01:16:01', 'computer science'),
('cai@gmail.com', '2018-11-25 01:13:40', '2018-11-25 01:16:01', 'computing'),
('cai@gmail.com', '2018-11-25 01:13:40', '2018-11-25 01:16:01', 'dean'),
('cai@gmail.com', '2018-11-25 01:13:40', '2018-11-25 01:16:01', 'gtcomputing'),
('cai@gmail.com', '2018-11-25 01:13:40', '2018-11-25 01:16:01', 'zvi'),
('smith@gmail.com', '2018-11-25 01:17:25', '2018-11-25 01:17:48', 'administration'),
('smith@gmail.com', '2018-11-25 01:17:25', '2018-11-25 01:17:48', 'facilities'),
('smith@gmail.com', '2018-11-25 01:17:25', '2018-11-25 01:18:23', 'administration'),
('smith@gmail.com', '2018-11-25 01:17:25', '2018-11-25 01:18:23', 'facilities'),
('smith@gmail.com', '2018-11-25 01:17:25', '2018-11-25 01:19:05', 'computing'),
('smith@gmail.com', '2018-11-25 01:17:25', '2018-11-25 01:19:05', 'gtcomputing'),
('smith@gmail.com', '2018-11-25 01:17:25', '2018-11-25 01:19:05', 'student facilities'),
('rice@gmail.com', '2018-11-25 01:22:00', '2018-11-25 01:22:44', 'decked out'),
('rice@gmail.com', '2018-11-25 01:22:00', '2018-11-25 01:22:44', 'parade'),
('rice@gmail.com', '2018-11-25 01:22:00', '2018-11-25 01:22:44', 'tohellwithgeorgia'),
('rice@gmail.com', '2018-11-25 01:22:00', '2018-11-25 01:24:35', 'buzz'),
('rice@gmail.com', '2018-11-25 01:22:00', '2018-11-25 01:24:35', 'mascot'),
('rice@gmail.com', '2018-11-25 01:22:00', '2018-11-25 01:24:35', 'parade'),
('rice@gmail.com', '2018-11-25 01:22:00', '2018-11-25 01:24:35', 'ramblin wreck'),
('rice@gmail.com', '2018-11-25 01:22:00', '2018-11-25 01:25:01', 'football game'),
('rice@gmail.com', '2018-11-25 01:22:00', '2018-11-25 01:25:01', 'parade'),
('rice@gmail.com', '2018-11-25 01:22:00', '2018-11-25 01:26:13', 'football'),
('rice@gmail.com', '2018-11-25 01:22:00', '2018-11-25 01:26:13', 'game day'),
('rice@gmail.com', '2018-11-25 01:22:00', '2018-11-25 01:26:13', 'tohellwithgeorgia'),
('chen@gmail.com', '2018-11-25 01:33:57', '2018-11-25 01:34:15', 'traditions'),
('chen@gmail.com', '2018-11-25 01:33:57', '2018-11-25 01:34:41', 'delicious'),
('guo@gmail.com', '2018-11-25 01:35:55', '2018-11-25 01:36:20', 'computer'),
('guo@gmail.com', '2018-11-25 01:35:55', '2018-11-25 01:36:20', 'macintosh'),
('guo@gmail.com', '2018-11-25 01:35:55', '2018-11-25 01:36:20', 'macos'),
('guo@gmail.com', '2018-11-25 01:35:55', '2018-11-25 01:36:46', 'gtcomputing'),
('guo@gmail.com', '2018-11-25 01:35:55', '2018-11-25 01:36:46', 'pcs'),
('guo@gmail.com', '2018-11-25 01:35:55', '2018-11-25 01:36:46', 'student facilities'),
('guo@gmail.com', '2018-11-25 01:35:55', '2018-11-25 01:37:23', 'blades'),
('guo@gmail.com', '2018-11-25 01:35:55', '2018-11-25 01:37:23', 'computing'),
('cai@gmail.com', '2018-11-25 01:38:31', '2018-11-25 01:38:49', 'historical oddity'),
('cai@gmail.com', '2018-11-25 01:38:31', '2018-11-25 01:38:49', 'rapid transit'),
('cai@gmail.com', '2018-11-25 01:38:31', '2018-11-25 01:39:16', 'race'),
('cai@gmail.com', '2018-11-25 01:38:31', '2018-11-25 01:39:16', 'traditions'),
('cai@gmail.com', '2018-11-25 01:38:31', '2018-11-25 01:39:16', 'tricycle'),
('cai@gmail.com', '2018-11-25 01:38:31', '2018-11-25 01:39:49', 'connections'),
('cai@gmail.com', '2018-11-25 01:38:31', '2018-11-25 01:39:49', 'free'),
('cai@gmail.com', '2018-11-25 01:38:31', '2018-11-25 01:39:49', 'transit'),
('chen@gmail.com', '2018-11-25 01:41:05', '2018-11-25 01:41:30', 'mascot'),
('chen@gmail.com', '2018-11-25 01:41:05', '2018-11-25 01:41:55', 'dawgs'),
('chen@gmail.com', '2018-11-25 01:41:05', '2018-11-25 01:41:55', 'not our mascot'),
('chen@gmail.com', '2018-11-25 01:41:05', '2018-11-25 01:41:55', 'tohellwithgeorgia'),
('chen@gmail.com', '2018-11-25 01:41:05', '2018-11-25 01:42:31', 'mascot'),
('chen@gmail.com', '2018-11-25 01:41:05', '2018-11-25 01:42:31', 'traditions');

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
('guo@gmail.com', 'Jolin Guo', '1234'),
('rice@gmail.com', 'Michael Rice', '1234'),
('smith@gmail.com', 'John Smith', '1234');

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
