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



-- Tables
CREATE TABLE IF NOT EXISTS `USER` (
  Email varchar(250) NOT NULL,
  FullName varchar(200) NOT NULL,
  PIN varchar(4) NOT NULL,
  PRIMARY KEY (email),
  UNIQUE KEY email (email)
);


CREATE TABLE IF NOT EXISTS Category (
  Name varchar(60) NOT NULL,
  PRIMARY KEY (Name)  
);

CREATE TABLE IF NOT EXISTS CORKBOARD (
  OwnerEmail varchar(250) NOT NULL,
  Title varchar(200) NOT NULL,
  Cate_Name varchar(60) NOT NULL,
  CB_DateTime datetime NOT NULL,
  PRIMARY KEY (OwnerEmail,CB_DateTime),
  KEY OwnerEmail(OwnerEmail),
  KEY CB_DateTime (CB_DateTime)
);


CREATE TABLE IF NOT EXISTS PUBLIC_CORKBOARD (
  OwnerEmail varchar(250) NOT NULL,
  CB_DateTime datetime NOT NULL,
  PRIMARY KEY (OwnerEmail,CB_DateTime),
  KEY OwnerEmail (OwnerEmail),
  KEY CB_DateTime (CB_DateTime)
);


CREATE TABLE IF NOT EXISTS PRIVATE_CORKBOARD (
  OwnerEmail varchar(250) NOT NULL,
  CB_DateTime datetime NOT NULL,
  `Password` varchar(60) NOT NULL,
  PRIMARY KEY (OwnerEmail,CB_DateTime),
  KEY OwnerEmail (OwnerEmail),
  KEY CB_DateTime (CB_DateTime)
);


CREATE TABLE IF NOT EXISTS PUSHPIN (
  OwnerEmail varchar(250) NOT NULL,
  CB_DateTime datetime NOT NULL,
  PP_DateTime datetime NOT NULL,
  Link varchar(500) NOT NULL,
  Description varchar(500) NOT NULL,
  PRIMARY KEY (OwnerEmail,CB_DateTime,PP_DateTime),
   KEY OwnerEmail (OwnerEmail),
    KEY CB_DateTime (CB_DateTime),
	 KEY PP_DateTime (PP_DateTime)
);

CREATE TABLE IF NOT EXISTS `COMMENT` (
  CommenterEmail varchar(250) NOT NULL,
  Com_DateTime datetime NOT NULL,
  PP_DateTime datetime NOT NULL,
  `Text` varchar(1000) NOT NULL,
  CB_DateTime datetime NOT NULL,
  OwnerEmail varchar(250) NOT NULL,
  PRIMARY KEY (OwnerEmail,CB_DateTime,PP_DateTime,Com_DateTime),
  KEY OwnerEmail (OwnerEmail),
  KEY CB_DateTime (CB_DateTime),
  KEY PP_DateTime (PP_DateTime),
  KEY Com_DateTime (Com_DateTime)
);

CREATE TABLE IF NOT EXISTS FOLLOWS (
  FollowerEmail varchar(250) NOT NULL,
  FolloweeEmail varchar(250) NOT NULL,
  PRIMARY KEY (FollowerEmail,FolloweeEmail),
  KEY FollowerEmail (FollowerEmail),
  KEY FolloweeEmail (FolloweeEmail)
);

CREATE TABLE IF NOT EXISTS LIKES (
  OwnerEmail varchar(250) NOT NULL,
  CB_DateTime datetime NOT NULL,
  PP_DateTime datetime NOT NULL,
  LikerEmail varchar(250) NOT NULL,
  PRIMARY KEY (OwnerEmail,CB_DateTime,PP_DateTime,LikerEmail),
   KEY OwnerEmail (OwnerEmail),
   KEY CB_DateTime (CB_DateTime),
   KEY PP_DateTime (PP_DateTime),
   KEY LikerEmail (LikerEmail)
);

CREATE TABLE IF NOT EXISTS PUSHPIN_TAG (
  OwnerEmail varchar(250) NOT NULL,
  CB_DateTime datetime NOT NULL,
  PP_DateTime datetime NOT NULL,
  Tag varchar(100) NOT NULL,
  PRIMARY KEY (OwnerEmail,CB_DateTime,PP_DateTime,Tag),
   KEY OwnerEmail (OwnerEmail),
   KEY CB_DateTime (CB_DateTime),
   KEY PP_DateTime (PP_DateTime),
   KEY Tag (Tag)
);


CREATE TABLE IF NOT EXISTS WATCHES (
  WatcherEmail varchar(250) NOT NULL,
  CB_DateTime datetime NOT NULL,
  OwnerEmail varchar(250) NOT NULL,
  PRIMARY KEY (WatcherEmail,OwnerEmail,CB_DateTime),
   KEY WatcherEmail (WatcherEmail),
   KEY OwnerEmail (OwnerEmail),
   KEY CB_DateTime (CB_DateTime)
);



-- Constriants

ALTER TABLE CORKBOARD
  ADD CONSTRAINT  fk_CORKBOARD_Email_User_Email FOREIGN KEY (OwnerEmail) REFERENCES `User` (Email),
  ADD CONSTRAINT  fk_CORKBOARD_Cate_name_Category_name FOREIGN KEY (Cate_Name) REFERENCES Category (Name);
  
  
  ALTER TABLE PUBLIC_CORKBOARD
  ADD CONSTRAINT  fk_PUBLIC_Email_User_Email FOREIGN KEY (OwnerEmail) REFERENCES CORKBOARD(OwnerEmail),
  ADD CONSTRAINT  fk_PUBLIC_DateTime_CB_DateTime FOREIGN KEY (CB_DateTime) REFERENCES CORKBOARD (CB_DateTime);
  
  ALTER TABLE PRIVATE_CORKBOARD
  ADD CONSTRAINT  fk_PRIVATE_Email_User_Email FOREIGN KEY (OwnerEmail) REFERENCES CORKBOARD(OwnerEmail),
  ADD CONSTRAINT  fk_PRIVATE_DateTime_CB_DateTime FOREIGN KEY (CB_DateTime) REFERENCES CORKBOARD (CB_DateTime);

  ALTER TABLE PUSHPIN
  ADD CONSTRAINT  fk_PUSHPIN_Email_User_Email FOREIGN KEY (OwnerEmail) REFERENCES CORKBOARD(OwnerEmail),
  ADD CONSTRAINT  fk_PUSHPIN_DateTime_CB_DateTime FOREIGN KEY (CB_DateTime) REFERENCES CORKBOARD (CB_DateTime);
  
  
  ALTER TABLE  `COMMENT`
  ADD CONSTRAINT  fk_COMMENT_OWNER_Email_User_Email FOREIGN KEY (OwnerEmail) REFERENCES PUSHPIN(OwnerEmail),
  ADD CONSTRAINT  fk_COMMENT_CB_DateTime_CB_DateTime FOREIGN KEY (CB_DateTime) REFERENCES PUSHPIN (CB_DateTime),
   ADD CONSTRAINT  fk_COMMENT_PP_DateTime_PP_DateTime FOREIGN KEY (PP_DateTime) REFERENCES PUSHPIN (PP_DateTime),
      ADD CONSTRAINT  fk_COMMENT_COMMENTER_Email_User_Email FOREIGN KEY (CommenterEmail) REFERENCES `User` (Email);
	  
	ALTER TABLE FOLLOWS
  ADD CONSTRAINT  fk_FOLLOWS_FOLLOWER_Email_User_Email FOREIGN KEY (FollowerEmail) REFERENCES `User` (Email),
  ADD CONSTRAINT  fk_FOLLOWS_FOLLOWEE_Email_CORKBOARD_Email FOREIGN KEY (FolloweeEmail) REFERENCES CORKBOARD (OwnerEmail);
  
  
  ALTER TABLE LIKES
  ADD CONSTRAINT  fk_like_Owner_Email_PUSHPIN_Email FOREIGN KEY (OwnerEmail) REFERENCES PUSHPIN (OwnerEmail) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT  fk_like_CB_DateTime_PUSHPIN_CB_DateTime FOREIGN KEY (CB_DateTime) REFERENCES PUSHPIN (CB_DateTime) ON DELETE CASCADE ON UPDATE CASCADE,
   ADD CONSTRAINT  fk_like_PP_DateTime_PUSHPIN_PP_DateTime FOREIGN KEY (PP_DateTime) REFERENCES PUSHPIN (PP_DateTime) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT  fk_like_Email_User_Email FOREIGN KEY (LikerEmail) REFERENCES  `User`(Email) ON DELETE CASCADE ON UPDATE CASCADE;
	
	ALTER TABLE PUSHPIN_TAG
  ADD CONSTRAINT  fk_tag_Owner_Email_PUSHPIN_Email FOREIGN KEY (OwnerEmail) REFERENCES PUSHPIN (OwnerEmail),
  ADD CONSTRAINT  fk_tag_CB_DateTime_PUSHPIN_CB_DateTime FOREIGN KEY (CB_DateTime) REFERENCES PUSHPIN (CB_DateTime),
   ADD CONSTRAINT  fk_tag_PP_DateTime_PUSHPIN_PP_DateTime FOREIGN KEY (PP_DateTime) REFERENCES PUSHPIN (PP_DateTime);
   
   ALTER TABLE WATCHES
  ADD CONSTRAINT  fk_watch_Owner_Email_CORKBOARD_Email FOREIGN KEY (OwnerEmail) REFERENCES CORKBOARD (OwnerEmail),
  ADD CONSTRAINT  fk_watch_CB_DateTime_CORKBOARD_CB_DateTime FOREIGN KEY (CB_DateTime) REFERENCES CORKBOARD (CB_DateTime),
    ADD CONSTRAINT  fk_watch_Watcher_Email_User_Email FOREIGN KEY (WatcherEmail) REFERENCES  `User`(Email);
	