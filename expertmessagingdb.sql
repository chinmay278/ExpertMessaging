-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 19, 2019 at 07:18 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `expertmessagingdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` varchar(40) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `password`) VALUES
('admin@gmail.com', '3313e');

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE `answer` (
  `id` int(11) NOT NULL,
  `ansDesc` varchar(1000) NOT NULL,
  `postedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `questionID` int(11) NOT NULL,
  `expertID` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`id`, `ansDesc`, `postedDate`, `questionID`, `expertID`) VALUES
(5, 'Mahendra Singh Dhoni  also known as mahi !!!! ', '2019-11-19 14:45:24', 10, 'exp4@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` varchar(40) NOT NULL,
  `password` varchar(20) NOT NULL,
  `firstName` varchar(40) NOT NULL,
  `lastName` varchar(40) NOT NULL,
  `mobileNumber` varchar(10) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `blocked` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `password`, `firstName`, `lastName`, `mobileNumber`, `verified`, `blocked`) VALUES
('chinmay27rangnekar@gmail.com', 'abcdef@123', 'chinmay', 'rangnekar', '9898989898', 1, 0),
('D@gmail.com', 'D@123', 'ram', 'sharma', '9198989898', 1, 1),
('shivipaliwal374@gmail.com', 'Sp@123456', 'shivi', 'paliwal', '9898989898', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `expert`
--

CREATE TABLE `expert` (
  `id` varchar(40) NOT NULL,
  `password` varchar(20) NOT NULL,
  `blocked` tinyint(1) NOT NULL,
  `categoryID` int(11) NOT NULL,
  `subCategoryID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `expert`
--

INSERT INTO `expert` (`id`, `password`, `blocked`, `categoryID`, `subCategoryID`) VALUES
('exp1@gmail.com', 'exp1@123', 0, 3, 6),
('exp2@gmail.com', 'exp2@123', 0, 3, 7),
('exp3@gmail.com', 'exp3@123', 1, 4, 8),
('exp4@gmail.com', 'exp4@123', 0, 4, 9);

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `questionTitle` varchar(50) NOT NULL,
  `questionDesc` varchar(200) NOT NULL,
  `postedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL,
  `visibility` tinyint(1) NOT NULL,
  `categoryID` int(11) NOT NULL,
  `subCategoryID` int(11) NOT NULL,
  `customerID` varchar(40) NOT NULL,
  `expertID` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `questionTitle`, `questionDesc`, `postedDate`, `status`, `visibility`, `categoryID`, `subCategoryID`, `customerID`, `expertID`) VALUES
(2, 'with health', 'How i maintain my diet?', '2019-05-09 11:27:14', 1, 1, 3, 6, 'yabhishek612@gmail.com', 'exp1@gmail.com'),
(5, 'health issue', 'maintain my health', '2019-05-03 06:50:26', 0, 1, 3, 6, 'D@gmail.com', 'exp1@gmail.com'),
(6, 'sports', 'describe the rules of tennis', '2019-05-09 17:42:52', 0, 0, 4, 8, 'yabhishek612@gmail.com', 'exp3@gmail.com'),
(9, ' ind vs ban match 2019 ', 'what is the result of india vs bangladesh match 2019 and who was the man of the match ??', '2019-11-19 14:38:29', 0, 1, 4, 9, 'shivipaliwal374@gmail.com', 'exp4@gmail.com'),
(10, 'captain of indian cricket team', 'who is the most cool captain of indian cricket team ??', '2019-11-19 14:45:24', 1, 1, 4, 9, 'shivipaliwal374@gmail.com', 'exp4@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `questioncategory`
--

CREATE TABLE `questioncategory` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questioncategory`
--

INSERT INTO `questioncategory` (`id`, `categoryName`) VALUES
(3, 'Health'),
(4, 'Sports');

-- --------------------------------------------------------

--
-- Table structure for table `questionsubcategory`
--

CREATE TABLE `questionsubcategory` (
  `id` int(11) NOT NULL,
  `subCategoryName` varchar(60) NOT NULL,
  `categoryID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questionsubcategory`
--

INSERT INTO `questionsubcategory` (`id`, `subCategoryName`, `categoryID`) VALUES
(6, 'Heart Specialist', 3),
(7, 'Brain Specialist', 3),
(8, 'Tennis', 4),
(9, 'Cricket', 4);

-- --------------------------------------------------------

--
-- Table structure for table `reportedincidentsbycustomer`
--

CREATE TABLE `reportedincidentsbycustomer` (
  `id` int(11) NOT NULL,
  `incDesc` varchar(200) NOT NULL,
  `postedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `expertID` varchar(40) NOT NULL,
  `customerID` varchar(40) NOT NULL,
  `questionID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reportedincidentsbycustomer`
--

INSERT INTO `reportedincidentsbycustomer` (`id`, `incDesc`, `postedDate`, `expertID`, `customerID`, `questionID`) VALUES
(2, 'not a proper answer', '2019-05-07 11:21:10', 'exp4@gmail.com', 'yabhishek612@gmail.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `reportedincidentsbyexperts`
--

CREATE TABLE `reportedincidentsbyexperts` (
  `id` int(11) NOT NULL,
  `incDesc` varchar(200) NOT NULL,
  `expertID` varchar(40) NOT NULL,
  `customerID` varchar(40) NOT NULL,
  `questionID` int(11) NOT NULL,
  `postedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reportedincidentsbyexperts`
--

INSERT INTO `reportedincidentsbyexperts` (`id`, `incDesc`, `expertID`, `customerID`, `questionID`, `postedDate`) VALUES
(3, 'false language used', 'exp1@gmail.com', 'D@gmail.com', 5, '2019-05-07 08:22:05'),
(4, 'question is not clear', 'exp3@gmail.com', 'yabhishek612@gmail.com', 6, '2019-05-10 07:57:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `questionID` (`questionID`),
  ADD KEY `expertID` (`expertID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expert`
--
ALTER TABLE `expert`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoryID` (`categoryID`),
  ADD KEY `subCategoryID` (`subCategoryID`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoryID` (`categoryID`),
  ADD KEY `subCategoryID` (`subCategoryID`),
  ADD KEY `customerID` (`customerID`),
  ADD KEY `expertID` (`expertID`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `questioncategory`
--
ALTER TABLE `questioncategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questionsubcategory`
--
ALTER TABLE `questionsubcategory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoryID` (`categoryID`);

--
-- Indexes for table `reportedincidentsbycustomer`
--
ALTER TABLE `reportedincidentsbycustomer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expertID` (`expertID`),
  ADD KEY `customerID` (`customerID`),
  ADD KEY `fk_grade_id` (`questionID`);

--
-- Indexes for table `reportedincidentsbyexperts`
--
ALTER TABLE `reportedincidentsbyexperts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expertID` (`expertID`),
  ADD KEY `customerID` (`customerID`),
  ADD KEY `questionID` (`questionID`),
  ADD KEY `questionID_2` (`questionID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answer`
--
ALTER TABLE `answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `questioncategory`
--
ALTER TABLE `questioncategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `questionsubcategory`
--
ALTER TABLE `questionsubcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `reportedincidentsbycustomer`
--
ALTER TABLE `reportedincidentsbycustomer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reportedincidentsbyexperts`
--
ALTER TABLE `reportedincidentsbyexperts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answer`
--
ALTER TABLE `answer`
  ADD CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`questionID`) REFERENCES `question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `answer_ibfk_2` FOREIGN KEY (`expertID`) REFERENCES `expert` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `expert`
--
ALTER TABLE `expert`
  ADD CONSTRAINT `expert_ibfk_1` FOREIGN KEY (`categoryID`) REFERENCES `questioncategory` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `expert_ibfk_2` FOREIGN KEY (`subCategoryID`) REFERENCES `questionsubcategory` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`categoryID`) REFERENCES `questioncategory` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `question_ibfk_2` FOREIGN KEY (`subCategoryID`) REFERENCES `questionsubcategory` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `question_ibfk_3` FOREIGN KEY (`customerID`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `question_ibfk_4` FOREIGN KEY (`expertID`) REFERENCES `expert` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `questionsubcategory`
--
ALTER TABLE `questionsubcategory`
  ADD CONSTRAINT `questionsubcategory_ibfk_1` FOREIGN KEY (`categoryID`) REFERENCES `questioncategory` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reportedincidentsbycustomer`
--
ALTER TABLE `reportedincidentsbycustomer`
  ADD CONSTRAINT `ReportedIncidentsByCustomer_ibfk_1` FOREIGN KEY (`expertID`) REFERENCES `expert` (`id`),
  ADD CONSTRAINT `ReportedIncidentsByCustomer_ibfk_2` FOREIGN KEY (`customerID`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `fk_grade_id` FOREIGN KEY (`questionID`) REFERENCES `question` (`id`);

--
-- Constraints for table `reportedincidentsbyexperts`
--
ALTER TABLE `reportedincidentsbyexperts`
  ADD CONSTRAINT `ReportedIncidentsByExperts_ibfk_1` FOREIGN KEY (`expertID`) REFERENCES `expert` (`id`),
  ADD CONSTRAINT `ReportedIncidentsByExperts_ibfk_2` FOREIGN KEY (`customerID`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `fk_qstn_id` FOREIGN KEY (`questionID`) REFERENCES `question` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
