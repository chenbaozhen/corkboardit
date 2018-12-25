-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 25, 2018 at 08:39 PM
-- Server version: 5.7.23
-- PHP Version: 7.1.22

CREATE USER IF NOT EXISTS gatechUser@localhost IDENTIFIED BY 'gatech123';

DROP DATABASE IF EXISTS `cs6400_fa18_team058`;
SET default_storage_engine=InnoDB;
SET NAMES utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE DATABASE IF NOT EXISTS cs6400_fa18_team058
    DEFAULT CHARACTER SET utf8mb4
    DEFAULT COLLATE utf8mb4_unicode_ci;
USE cs6400_fa18_team058;

GRANT SELECT, INSERT, UPDATE, DELETE, FILE ON *.* TO 'gatechUser'@'localhost';
GRANT ALL PRIVILEGES ON `gatechuser`.* TO 'gatechUser'@'localhost';
GRANT ALL PRIVILEGES ON `cs6400_fa18_team058`.* TO 'gatechUser'@'localhost';
FLUSH PRIVILEGES;

-- SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
-- SET AUTOCOMMIT = 0;
-- START TRANSACTION;
-- SET time_zone = "+00:00";


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
('cat'),
('dog'),
('Home & Garden'),
('human'),
('movie'),
('paint'),
('scene'),
('unknown');

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
('cai@gmail.com', '2018-10-25 22:13:20', '2018-10-25 22:12:53', 'what a cute kitty!', '2018-10-23 13:44:42', 'cai@gmail.com'),
('cai@gmail.com', '2018-10-24 02:41:07', '2018-10-24 01:30:55', 'Good snow', '2018-10-24 01:27:55', 'cai@gmail.com'),
('chen@gmail.com', '2018-10-24 02:42:46', '2018-10-24 01:30:55', 'I agreed!', '2018-10-24 01:27:55', 'cai@gmail.com'),
('chen@gmail.com', '2018-10-24 00:29:14', '2018-10-23 17:35:05', 'what a cute kitty!', '2018-10-11 06:14:13', 'chen@gmail.com'),
('chen@gmail.com', '2018-10-24 00:30:31', '2018-10-23 17:35:05', 'This is cutest kitty i have seen', '2018-10-11 06:14:13', 'chen@gmail.com'),
('chen@gmail.com', '2018-10-24 00:30:54', '2018-10-23 17:35:05', 'I like this kitty!', '2018-10-11 06:14:13', 'chen@gmail.com'),
('chen@gmail.com', '2018-10-24 00:31:28', '2018-10-23 17:35:05', 'kitty', '2018-10-11 06:14:13', 'chen@gmail.com'),
('chen@gmail.com', '2018-10-24 17:51:36', '2018-10-24 12:56:55', 'This is cutest kitty i have seen!!!!', '2018-10-22 21:43:22', 'chen@gmail.com'),
('chen@gmail.com', '2018-10-24 21:33:59', '2018-10-24 03:18:24', 'Good dog!', '2018-10-24 03:16:49', 'fan@gmail.com'),
('fan@gmail.com', '2018-10-24 03:20:13', '2018-10-24 03:19:52', 'Cute,Cute,Cute', '2018-10-24 03:16:49', 'fan@gmail.com'),
('cai@gmail.com', '2018-10-25 22:14:54', '2018-10-24 03:19:52', 'cute black dog', '2018-10-24 03:16:49', 'fan@gmail.com');

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
('cai@gmail.com', 'cb_cai1', 'dog', '2018-10-10 05:13:12'),
('cai@gmail.com', 'cb_cai2', 'dog', '2018-10-10 05:13:13'),
('cai@gmail.com', 'cb_cai1', 'dog', '2018-10-10 05:31:18'),
('cai@gmail.com', 'cb_cai3', 'cat', '2018-10-22 21:51:24'),
('cai@gmail.com', 'cb_cai4', 'cat', '2018-10-23 13:44:42'),
('cai@gmail.com', 'cb_cai5', 'human', '2018-10-24 01:27:55'),
('cai@gmail.com', 'test3', 'cat', '2018-10-25 22:20:52'),
('chen@gmail.com', 'cb_chen1', 'cat', '2018-10-10 05:13:12'),
('chen@gmail.com', 'cb_chen2', 'cat', '2018-10-10 05:13:13'),
('chen@gmail.com', 'cb_chen3', 'cat', '2018-10-10 05:14:13'),
('chen@gmail.com', 'cb_chen4', 'cat', '2018-10-11 06:14:13'),
('chen@gmail.com', 'cb_chen5', 'dog', '2018-10-11 06:14:23'),
('chen@gmail.com', 'cb_chen6', 'cat', '2018-10-22 21:43:22'),
('chen@gmail.com', 'cb_chen10', 'cat', '2018-10-23 20:37:58'),
('chen@gmail.com', 'vacation', 'cat', '2018-10-24 21:35:08'),
('chen@gmail.com', 'University', 'human', '2018-10-24 21:39:15'),
('chen@gmail.com', 'nation park', 'unknown', '2018-10-25 21:28:21'),
('chen@gmail.com', 'yello park', 'unknown', '2018-10-25 21:29:34'),
('chen@gmail.com', 'test1', 'unknown', '2018-10-25 21:32:11'),
('chen@gmail.com', 'test2', 'unknown', '2018-10-25 21:33:29'),
('chen@gmail.com', 'beautiful nation park', 'Home & Garden', '2018-10-25 23:27:26'),
('fan@gmail.com', 'cb_fan1', 'cat', '2018-10-10 05:13:12'),
('fan@gmail.com', 'cb_fan2', 'cat', '2018-10-10 05:13:13'),
('fan@gmail.com', 'cb_fan3', 'cat', '2018-10-10 05:14:13'),
('fan@gmail.com', 'fan4', 'dog', '2018-10-24 03:16:49'),
('guo@gmail.com', 'cb_guo2', 'dog', '2018-10-10 05:13:17');

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
('cai@gmail.com', 'fan@gmail.com'),
('chen@gmail.com', 'cai@gmail.com');

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
('chen@gmail.com', '2018-10-11 06:14:13', '2018-10-23 00:00:00', 'cai@gmail.com'),
('cai@gmail.com', '2018-10-24 01:27:55', '2018-10-24 01:30:55', 'chen@gmail.com'),
('fan@gmail.com', '2018-10-24 03:16:49', '2018-10-24 03:18:24', 'cai@gmail.com'),
('fan@gmail.com', '2018-10-24 03:16:49', '2018-10-24 03:19:52', 'chen@gmail.com');

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
('cai@gmail.com', '2018-10-10 05:31:18', '1234'),
('cai@gmail.com', '2018-10-25 22:20:52', '1234'),
('chen@gmail.com', '2018-10-22 21:43:22', '2345'),
('chen@gmail.com', '2018-10-24 21:39:15', '1234'),
('guo@gmail.com', '2018-10-10 05:13:17', '1234');

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
('cai@gmail.com', '2018-10-10 05:13:12'),
('chen@gmail.com', '2018-10-10 05:13:12'),
('fan@gmail.com', '2018-10-10 05:13:12'),
('cai@gmail.com', '2018-10-10 05:13:13'),
('chen@gmail.com', '2018-10-10 05:13:13'),
('fan@gmail.com', '2018-10-10 05:13:13'),
('chen@gmail.com', '2018-10-10 05:14:13'),
('fan@gmail.com', '2018-10-10 05:14:13'),
('chen@gmail.com', '2018-10-11 06:14:13'),
('chen@gmail.com', '2018-10-11 06:14:23'),
('cai@gmail.com', '2018-10-22 21:51:24'),
('cai@gmail.com', '2018-10-23 13:44:42'),
('chen@gmail.com', '2018-10-23 20:37:58'),
('cai@gmail.com', '2018-10-24 01:27:55'),
('fan@gmail.com', '2018-10-24 03:16:49'),
('chen@gmail.com', '2018-10-24 21:35:08'),
('chen@gmail.com', '2018-10-25 21:28:21'),
('chen@gmail.com', '2018-10-25 21:29:34'),
('chen@gmail.com', '2018-10-25 21:32:11'),
('chen@gmail.com', '2018-10-25 21:33:29'),
('chen@gmail.com', '2018-10-25 23:27:26');

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
('cai@gmail.com', '2018-10-10 05:13:13', '2018-10-11 07:13:19', 'https://image.foxnews.com/document/d/189Z4v01GAf1mb4b6BuN1Dw', 'deshd1'),
('cai@gmail.com', '2018-10-10 05:31:18', '2018-10-11 07:13:29', 'https://image.yahoo.com/document/d/189Z4v1mb4b6BuN1Dw', 'deshd1'),
('cai@gmail.com', '2018-10-23 13:44:42', '2018-10-24 16:39:44', 'https://static1.bigstockphoto.com/3/3/2/large1500/233591413.jpg', 'Surprised Cat'),
('cai@gmail.com', '2018-10-23 13:44:42', '2018-10-25 22:12:53', 'https://images.pexels.com/photos/104827/cat-pet-animal-domestic-104827.jpeg', 'white cat'),
('cai@gmail.com', '2018-10-24 01:27:55', '2018-10-24 01:30:55', 'https://s3.amazonaws.com/images.gearjunkie.com/uploads/2017/03/7-mantras-for-climbing-big-mountains-holly-budge-1-700x467.jpg', 'climb mountain'),
('cai@gmail.com', '2018-10-24 01:27:55', '2018-10-24 01:36:33', 'https://s3.amazonaws.com/images.gearjunkie.com/uploads/2017/03/7-mantras-for-climbing-big-mountains-holly-budge-700x467.jpg', 'dfhdah'),
('cai@gmail.com', '2018-10-24 01:27:55', '2018-10-24 01:40:13', 'https://s3.amazonaws.com/images.gearjunkie.com/uploads/2017/03/7-mantras-for-climbing-big-mountains-holly-budge-3-700x467.jpg', 'brave people'),
('cai@gmail.com', '2018-10-24 01:27:55', '2018-10-24 01:45:31', 'http://aac-publications.s3.amazonaws.com/aaj-13201213956-1481817052.jpg', 'brave ppl'),
('cai@gmail.com', '2018-10-24 01:27:55', '2018-10-24 01:58:35', 'http://aac-publications.s3.amazonaws.com/aaj-13201213956-1481816799.jpg', 'brave people'),
('chen@gmail.com', '2018-10-10 05:13:12', '2018-10-11 07:13:06', 'https://docs.google.com/document/d/189Z4v01GAf1mb4b6BuN1Dw', 'des1'),
('chen@gmail.com', '2018-10-10 05:13:12', '2018-10-11 07:13:07', 'https://image.google.com/document/d/189Z4v01GAf1mb4b6BuN1Dw', 'des1'),
('chen@gmail.com', '2018-10-10 05:13:12', '2018-10-11 07:13:08', 'https://image.gatech.edu/document/d/189Z4v01GAf1mb4b6BuN1Dw', 'des1'),
('chen@gmail.com', '2018-10-10 05:13:13', '2018-10-11 07:13:09', 'https://image.facebook.com/document/d/189Zv01GAf1mb4b6BuN1Dw', 'desda1'),
('chen@gmail.com', '2018-10-10 05:14:13', '2018-10-11 07:13:19', 'https://image.yahoo.com/document/d/189Z4v01GAf1mb4b6BuN1Dw', 'deshd1'),
('chen@gmail.com', '2018-10-11 06:14:13', '2018-10-23 00:00:00', 'https://www.freegreatpicture.com/files/152/14663-widescreen-cat-photo.jpg', 'Good Pushpin for cb_chen4'),
('chen@gmail.com', '2018-10-11 06:14:13', '2018-10-23 17:35:05', 'https://i.stack.imgur.com/8CNWw.jpg', 'Another Good Cat Picture'),
('chen@gmail.com', '2018-10-22 21:43:22', '2018-10-24 12:56:55', 'https://cdn-images-1.medium.com/max/2000/1*lnpyBFxUrOrlYiAZNXxQyw.jpeg', 'three cat'),
('chen@gmail.com', '2018-10-23 20:37:58', '2018-10-23 20:39:11', 'https://cdn-images-1.medium.com/max/1600/1*mONNI1lG9VuiqovpnYqicA.jpeg', 'Good white cat'),
('chen@gmail.com', '2018-10-24 21:35:08', '2018-10-24 21:36:52', 'https://image.shutterstock.com/image-photo/tranquil-beach-scene-exotic-tropical-450w-644740495.jpg', 'Beach vacation'),
('chen@gmail.com', '2018-10-24 21:35:08', '2018-10-24 21:37:37', 'https://image.shutterstock.com/image-photo/beautiful-beach-chairs-on-sandy-450w-633002651.jpg', 'Beach vacation'),
('chen@gmail.com', '2018-10-24 21:39:15', '2018-10-24 21:40:56', 'https://www.oxforduniversityimages.com/wmpix/pad/002/pad002011-01-The%20River%20Cherwell%20in%20Christ%20Church%20Meadow.jpg', 'Oxford campus'),
('chen@gmail.com', '2018-10-24 21:39:15', '2018-10-24 21:41:46', 'https://www.georgetown.edu/sites/www/files/homepage-hero-image-sky.jpg', 'Georgetown University'),
('chen@gmail.com', '2018-10-25 23:27:26', '2018-10-25 23:29:21', 'https://www.roughguides.com/wp-content/uploads/2012/09/128148234-1680x1050.jpg', 'beautiful view'),
('chen@gmail.com', '2018-10-25 23:27:26', '2018-10-25 23:30:53', 'http://4.bp.blogspot.com/-FU13Kqje2Xs/TbkReqRwIjI/AAAAAAAAAO8/l9reLeMzoeI/s1600/fiordland1.jpg', 'beautiful view'),
('fan@gmail.com', '2018-10-24 03:16:49', '2018-10-24 03:18:24', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbvx4H9VUNRT9c8b0Ez8spebrtUMGjE44QlrPBXERQ1SHN6iwt8Q', 'cute dog'),
('fan@gmail.com', '2018-10-24 03:16:49', '2018-10-24 03:19:52', 'https://www.nationalgeographic.com/content/dam/animals/pictures/mammals/d/domestic-dog/domestic-dog.adapt.676.1.jpg', 'cute black dog'),
('guo@gmail.com', '2018-10-10 05:13:17', '2018-10-11 07:13:19', 'https://image.fox.com/document/d/189Z4v01GAf1mb4b6BuN1Dw', 'deshdd');

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
('chen@gmail.com', '2018-10-10 05:13:12', '2018-10-11 07:13:06', 'pretty'),
('chen@gmail.com', '2018-10-10 05:13:12', '2018-10-11 07:13:07', 'pretty'),
('chen@gmail.com', '2018-10-10 05:13:12', '2018-10-11 07:13:08', 'ugly'),
('cai@gmail.com', '2018-10-10 05:13:13', '2018-10-11 07:13:19', 'happy'),
('cai@gmail.com', '2018-10-10 05:13:13', '2018-10-11 07:13:19', 'red'),
('cai@gmail.com', '2018-10-10 05:13:13', '2018-10-11 07:13:19', 'sad'),
('chen@gmail.com', '2018-10-10 05:13:13', '2018-10-11 07:13:09', 'blue'),
('chen@gmail.com', '2018-10-10 05:13:13', '2018-10-11 07:13:09', 'pretty'),
('chen@gmail.com', '2018-10-10 05:13:13', '2018-10-11 07:13:09', 'ugly'),
('guo@gmail.com', '2018-10-10 05:13:17', '2018-10-11 07:13:19', 'red'),
('chen@gmail.com', '2018-10-10 05:14:13', '2018-10-11 07:13:19', 'happy'),
('chen@gmail.com', '2018-10-10 05:14:13', '2018-10-11 07:13:19', 'red'),
('cai@gmail.com', '2018-10-10 05:31:18', '2018-10-11 07:13:29', 'happy'),
('cai@gmail.com', '2018-10-10 05:31:18', '2018-10-11 07:13:29', 'sad'),
('chen@gmail.com', '2018-10-11 06:14:13', '2018-10-23 00:00:00', 'taga'),
('chen@gmail.com', '2018-10-11 06:14:13', '2018-10-23 00:00:00', 'tagb'),
('chen@gmail.com', '2018-10-11 06:14:13', '2018-10-23 17:35:05', 'tagc'),
('chen@gmail.com', '2018-10-11 06:14:13', '2018-10-23 17:35:05', 'tagd'),
('chen@gmail.com', '2018-10-22 21:43:22', '2018-10-24 12:56:55', 'cat'),
('cai@gmail.com', '2018-10-23 13:44:42', '2018-10-24 16:39:44', 'cat'),
('cai@gmail.com', '2018-10-23 13:44:42', '2018-10-25 22:12:53', 'cat'),
('chen@gmail.com', '2018-10-23 20:37:58', '2018-10-23 20:39:11', 'tage'),
('chen@gmail.com', '2018-10-23 20:37:58', '2018-10-23 20:39:11', 'tagf'),
('cai@gmail.com', '2018-10-24 01:27:55', '2018-10-24 01:30:55', 'mountain'),
('cai@gmail.com', '2018-10-24 01:27:55', '2018-10-24 01:30:55', 'snow'),
('cai@gmail.com', '2018-10-24 01:27:55', '2018-10-24 01:36:33', 'ashg'),
('cai@gmail.com', '2018-10-24 01:27:55', '2018-10-24 01:40:13', 'snow'),
('cai@gmail.com', '2018-10-24 01:27:55', '2018-10-24 01:45:31', 'mountain'),
('cai@gmail.com', '2018-10-24 01:27:55', '2018-10-24 01:58:35', 'mountain'),
('fan@gmail.com', '2018-10-24 03:16:49', '2018-10-24 03:18:24', 'dog'),
('fan@gmail.com', '2018-10-24 03:16:49', '2018-10-24 03:18:24', 'white'),
('fan@gmail.com', '2018-10-24 03:16:49', '2018-10-24 03:19:52', 'black'),
('fan@gmail.com', '2018-10-24 03:16:49', '2018-10-24 03:19:52', 'dog'),
('chen@gmail.com', '2018-10-24 21:35:08', '2018-10-24 21:36:52', 'beach'),
('chen@gmail.com', '2018-10-24 21:35:08', '2018-10-24 21:37:37', 'beach'),
('chen@gmail.com', '2018-10-24 21:39:15', '2018-10-24 21:40:56', 'campus'),
('chen@gmail.com', '2018-10-24 21:39:15', '2018-10-24 21:40:56', 'university'),
('chen@gmail.com', '2018-10-24 21:39:15', '2018-10-24 21:41:46', 'university'),
('chen@gmail.com', '2018-10-25 23:27:26', '2018-10-25 23:29:21', 'beauty'),
('chen@gmail.com', '2018-10-25 23:27:26', '2018-10-25 23:29:21', 'view'),
('chen@gmail.com', '2018-10-25 23:27:26', '2018-10-25 23:30:53', 'mountain');

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
('cai@gmail.com', 'Cai Cai', '1234'),
('cai1@gmail.com', 'Cai1 Cai', '1234'),
('chen@gmail.com', 'Chen Chen', '1234'),
('chen1@gmail.com', 'Chen1 Chen', '1234'),
('fan@gmail.com', 'Fan Fan', '1234'),
('fan1@gmail.com', 'Fan1 Fan', '1234'),
('guo@gmail.com', 'Guo Guo', '1234'),
('guo1@gmail.com', 'Guo1 Guo', '1234');

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
('chen@gmail.com', '2018-10-10 05:13:12', 'fan@gmail.com'),
('chen@gmail.com', '2018-10-22 21:51:24', 'cai@gmail.com'),
('chen@gmail.com', '2018-10-23 13:44:42', 'cai@gmail.com'),
('chen@gmail.com', '2018-10-24 01:27:55', 'cai@gmail.com'),
('chen@gmail.com', '2018-10-24 03:16:49', 'fan@gmail.com');

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
