-- -------------------------------------------------------------
-- TablePlus 5.6.6(520)
--
-- https://tableplus.com/
--
-- Database: msd2023
-- Generation Time: 2023-12-11 22:33:28.3630
-- -------------------------------------------------------------
drop database if exists msd2023;
create database msd2023;
use msd2023;
show tables;
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


CREATE TABLE `Attachment` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `courseId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Attachment_courseId_idx` (`courseId`)
) ;

CREATE TABLE `Category` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Category_name_key` (`name`)
) ;

CREATE TABLE `Chapter` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `videoUrl` text COLLATE utf8mb4_unicode_ci,
  `position` int(11) NOT NULL,
  `isPublished` tinyint(1) NOT NULL DEFAULT '0',
  `isFree` tinyint(1) NOT NULL DEFAULT '0',
  `courseId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Chapter_courseId_idx` (`courseId`)
) ;

CREATE TABLE `Course` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `imageUrl` text COLLATE utf8mb4_unicode_ci,
  `price` double DEFAULT NULL,
  `isPublished` tinyint(1) NOT NULL DEFAULT '0',
  `categoryId` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Course_categoryId_idx` (`categoryId`),
  FULLTEXT KEY `Course_title_idx` (`title`)
); 

CREATE TABLE `MuxData` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `assetId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `playbackId` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chapterId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `MuxData_chapterId_key` (`chapterId`)
);

CREATE TABLE `Purchase` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `courseId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Purchase_userId_courseId_key` (`userId`,`courseId`),
  KEY `Purchase_courseId_idx` (`courseId`)
) ;

CREATE TABLE `StripeCustomer` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripeCustomerId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `StripeCustomer_userId_key` (`userId`),
  UNIQUE KEY `StripeCustomer_stripeCustomerId_key` (`stripeCustomerId`)
) ;

CREATE TABLE `UserProgress` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chapterId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isCompleted` tinyint(1) NOT NULL DEFAULT '0',
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UserProgress_userId_chapterId_key` (`userId`,`chapterId`),
  KEY `UserProgress_chapterId_idx` (`chapterId`)
) ;

INSERT INTO `Attachment` (`id`, `name`, `url`, `courseId`, `createdAt`, `updatedAt`) VALUES
('1', 'Attachment 1', 'https://example.com/file1.pdf', 'course1', '2023-12-11 15:32:40.000', '2023-12-11 15:32:40.000'),
('2', 'Attachment 2', 'https://example.com/file2.pdf', 'course2', '2023-12-11 15:32:40.000', '2023-12-11 15:32:40.000'),
('3', 'Attachment 3', 'https://example.com/file3.pdf', 'course3', '2023-12-11 15:32:40.000', '2023-12-11 15:32:40.000');

INSERT INTO `Category` (`id`, `name`) VALUES
('1', 'Computer Science'),
('2', 'Music'),
('3', 'Fitness'),
('4', 'Photography'),
('5', 'Accounting'),
('6', 'Engineering'),
('7', 'Filming');

INSERT INTO `Chapter` (`id`, `title`, `description`, `videoUrl`, `position`, `isPublished`, `isFree`, `courseId`, `createdAt`, `updatedAt`) VALUES
('1', 'Introduction to Programming', 'Learn the basics of programming.', 'https://example.com/video1.mp4', 1, 1, 0, 'course1', '2023-12-11 15:32:40.245', '2023-12-11 15:32:40.000'),
('2', 'Algebra Basics', 'Foundational concepts in algebra.', NULL, 1, 1, 0, 'course2', '2023-12-11 15:32:40.245', '2023-12-11 15:32:40.000'),
('3', 'HTML Basics', 'Introduction to HTML.', 'https://example.com/video3.mp4', 1, 1, 0, 'course3', '2023-12-11 15:32:40.245', '2023-12-11 15:32:40.000');

INSERT INTO `Course` (`id`, `userId`, `title`, `description`, `imageUrl`, `price`, `isPublished`, `categoryId`, `createdAt`, `updatedAt`) VALUES
('course1', 'user1', 'Programming 101', 'Learn the fundamentals of programming.', 'https://example.com/course1.jpg', 19.99, 1, '1', '2023-12-11 15:32:40.000', '2023-12-11 15:32:40.000'),
('course2', 'user2', 'Algebra Fundamentals', 'Introduction to algebraic concepts.', 'https://example.com/course2.jpg', 14.99, 1, '2', '2023-12-11 15:32:40.000', '2023-12-11 15:32:40.000'),
('course3', 'user3', 'Web Development Basics', 'Introduction to web development.', 'https://example.com/course3.jpg', 24.99, 1, '1', '2023-12-11 15:32:40.000', '2023-12-11 15:32:40.000'),
('course4', 'user4', 'Guitar Mastery', 'Learn to play the guitar like a pro.', 'https://example.com/course4.jpg', 29.99, 1, '2', '2023-12-11 15:32:40.000', '2023-12-11 15:32:40.000'),
('course5', 'user5', 'Fitness for Beginners', 'Start your fitness journey today.', 'https://example.com/course5.jpg', 19.99, 1, '3', '2023-12-11 15:32:40.000', '2023-12-11 15:32:40.000');

INSERT INTO `MuxData` (`id`, `assetId`, `playbackId`, `chapterId`) VALUES
('1', 'asset123', 'playback123', '1'),
('2', 'asset456', 'playback456', '2'),
('3', 'asset789', 'playback789', '3');

INSERT INTO `Purchase` (`id`, `userId`, `courseId`, `createdAt`, `updatedAt`) VALUES
('1', 'user1', 'course1', '2023-12-11 15:32:40.000', '2023-12-11 15:32:40.000'),
('2', 'user2', 'course2', '2023-12-11 15:32:40.000', '2023-12-11 15:32:40.000'),
('3', 'user3', 'course3', '2023-12-11 15:32:40.000', '2023-12-11 15:32:40.000');

INSERT INTO `StripeCustomer` (`id`, `userId`, `stripeCustomerId`, `createdAt`, `updatedAt`) VALUES
('1', 'user1', 'cus_123456789', '2023-12-11 15:32:40.000', '2023-12-11 15:32:40.000'),
('2', 'user2', 'cus_987654321', '2023-12-11 15:32:40.000', '2023-12-11 15:32:40.000'),
('3', 'user3', 'cus_111223344', '2023-12-11 15:32:40.000', '2023-12-11 15:32:40.000');

INSERT INTO `UserProgress` (`id`, `userId`, `chapterId`, `isCompleted`, `createdAt`, `updatedAt`) VALUES
('1', 'user1', '1', 1, '2023-12-11 15:32:40.000', '2023-12-11 15:32:40.000'),
('2', 'user2', '2', 0, '2023-12-11 15:32:40.000', '2023-12-11 15:32:40.000'),
('3', 'user3', '3', 1, '2023-12-11 15:32:40.000', '2023-12-11 15:32:40.000');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;