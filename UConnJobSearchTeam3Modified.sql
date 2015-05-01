#UConnJobSearch Database Schema
#Created by Team 3, with modifications by Ryan Tracey

-- phpMyAdmin SQL Dump
-- version 2.11.0
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 06, 2007 at 11:47 AM
-- Server version: 5.0.45
-- PHP Version: 5.2.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

CREATE SCHEMA IF NOT EXISTS `UCONNJobSearch` ;
USE `UCONNJobSearch`;

--
-- Database: `uconnjobsearch`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

CREATE TABLE `administrator` (
  `UName` varchar(50) NOT NULL,
  `PrivilegesID` int(10) NOT NULL,
  `AExpirDate` date NOT NULL,
  `APasswd` varchar(50) NOT NULL,
  PRIMARY KEY  (`UName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `administrator`
--

INSERT INTO `administrator` (`UName`, `PrivilegesID`, `AExpirDate`, `APasswd`) VALUES
('a', 1, '9999-99-99', 'a');

-- --------------------------------------------------------

--
-- Table structure for table `applies`
--

CREATE TABLE `applies` (
  `JobID` int(10) NOT NULL,
  `UName` varchar(50) NOT NULL,
  `ApplicationID` int(10) NOT NULL,
  `DateApplied` date NOT NULL,
  PRIMARY KEY  (`JobID`,`UName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `applies`
--

INSERT INTO `applies` (`JobID`, `UName`, `ApplicationID`, `DateApplied`) VALUES
(1, 'bfry', 0, '2007-12-01'),
(1, 'ebaily', 0, '2007-12-06'),
(1, 's', 0, '2007-12-05'),
(2, 'ncooper', 12, '2007-11-28'),
(2, 's', 0, '2007-12-05'),
(2, 'sallen', 14, '2007-11-14'),
(3, 'bfry', 0, '2007-12-01'),
(3, 'ebaily', 0, '2007-12-06'),
(4, 'bfry', 7, '2007-12-01'),
(8, 'bfry', 0, '2007-12-01'),
(8, 'ncooper', 9, '2007-12-01'),
(8, 's', 0, '2007-12-04'),
(28, 'ebaily', 0, '2007-12-06');

-- --------------------------------------------------------

--
-- Table structure for table `bankpayment`
--

CREATE TABLE `bankpayment` (
  `PaymentID` int(50) NOT NULL,
  `BName` varchar(50) NOT NULL,
  `BVNumber` varchar(50) NOT NULL,
  `BAcctNumber` varchar(50) NOT NULL,
  PRIMARY KEY  (`PaymentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bankpayment`
--

INSERT INTO `bankpayment` (`PaymentID`, `BName`, `BVNumber`, `BAcctNumber`) VALUES
(1, 'Bank of America', 12, 64877589937573);

-- --------------------------------------------------------

--
-- Table structure for table `cctype`
--

CREATE TABLE `cctype` (
  `CCTypeID` int(10) NOT NULL auto_increment,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY  (`CCTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `cctype`
--


-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `CName` varchar(100) NOT NULL,
  `CStreet1` varchar(100) NOT NULL,
  `CStreet2` varchar(100) default NULL,
  `CCity` varchar(100) NOT NULL,
  `StateID` int(50) NOT NULL,
  `Zipcode` varchar(5) NOT NULL,
  `CEmail` varchar(100) NOT NULL,
  `CPhone` varchar(10) NOT NULL,
  `CFax` varchar(10) default NULL,
  `CCell` varchar(10) default NULL,
  `CHomePage` varchar(500) default NULL,
  PRIMARY KEY  (`CName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`CName`, `CStreet1`, `CStreet2`, `CCity`, `StateID`, `Zipcode`, `CEmail`, `CPhone`, `CFax`, `CCell`, `CHomePage`) VALUES
('A&T Systems, Inc.', '123 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('AC Technologies, Inc.', '124 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('ADVANCED CONCEPTS, INC.', '125 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('Ahmad Associates, Ltd.', '126 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('Analex Corporation', '127 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('ANTEON CORPORATION', '128 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('AnviCom, Inc.', '129 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('ASCENTRY TECHNOLOGIES, Inc.', '130 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('ATS', '131 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('Baesch Computer Consulting, Inc', '132 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('Bechtel', '133 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('Beers & Cutler Government Contracts Consulting', '134 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('Booz Allen Hamilton', '135 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('Brand-Name IT Products and Services Provider', '136 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('C&S Wholesale Grocers', '137 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('Computer & Hi-tech Management, Inc.', '138 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('Consumer Electronics Association', '139 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('Cox Enterprises', '140 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('Decision Systems Technologies, Inc.', '141 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('DeVry University', '142 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('DSA Information Technology Solutions', '143 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('Electronic Consulting Services, Inc.', '144 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('Engineering and Technical Services', '145 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('ENSCO, Inc.', '146 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('Enterprise Rent-A-Car', '147 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('Ernst & Young', '148 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('Fidelity Investments', '149 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('Gefion, Inc.', '150 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('GeoLogics Corporation<', '151 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('Georgia Institute of Technology', '152 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('Giant Eagle', '153 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('Graybar Electric', '154 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('HE Butt Grocery', '155 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('High Performance Technologies, Inc.', '156 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('Hogan & Hartson L.L.P.', '157 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('Huntsman', '158 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('IBM Corporation Federal Software Group', '159 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('Innovative Logistics Techniques, Inc.', '160 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('Integic Corporation', '161 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('Integrated Systems Analysts, Inc.', '162 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('JM Family Enterprises', '163 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('Ken Leiner Associates, Inc.', '164 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('Keynote System, Inc.', '165 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('Koch Industries', '166 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('Levi Strauss & Co', '167 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('Lloyd Lamont Design, Inc.', '168 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('Marmon Group', '169 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('Mars', '170 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('MATCOM International Corporation', '171 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('MBM', '172 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('Meijer', '173 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('Menard', '174 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('NATEK Incorporated', '175 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('NCI Information Systems, Inc.', '176 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('Panacea Consulting, Inc.', '177 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('PCCI Government Solutions', '178 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('Perot Systems Government Services', '179 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('Phoenix Computer Associates, Inc.', '180 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('Planned Systems International, Inc.', '181 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('PricewaterhouseCoopers', '182 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('Publix Super Markets', '183 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('QSS Group, Inc.', '184 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('RESOURCE CONSULTANTS, INC.', '185 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('SAGE, Inc.', '186 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('Science Applications Intl', '187 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('Seagate Technology', '188 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('SRA International, Inc.', '189 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('Swift & Co', '190 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('TranTech, Inc.', '191 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('Wilson Sonsini Goodrich & Rosati', '192 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com'),
('Windsor Group,LLC', '193 pinetree dr', '', 'Storrs', 8, '6279', 'jon.doe@gmail.com', '5555555555', '5555555555', '5555555555', 'htttp://homepage.com');

-- --------------------------------------------------------

--
-- Table structure for table `creditcard`
--

CREATE TABLE `creditcard` (
  `PaymentID` int(10) NOT NULL,
  `CCNumber` int(20) NOT NULL,
  `CCTypeID` int(10) NOT NULL,
  `CCExpirDate` date NOT NULL,
  `CCDate` date NOT NULL,
  PRIMARY KEY  (`PaymentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `creditcard`
--

INSERT INTO `creditcard` (`PaymentID`, `CCNumber`, `CCTypeID`, `CCExpirDate`, `CCDate`) VALUES
(2, 1683154865234786, 1, '2018-03-24', '2014-10-30');
-- --------------------------------------------------------

--
-- Table structure for table `degreearea`
--

CREATE TABLE `degreearea` (
  `DegreeAreaID` int(10) NOT NULL auto_increment,
  `DegreeArea` varchar(50) NOT NULL,
  PRIMARY KEY  (`DegreeAreaID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=32 ;

--
-- Dumping data for table `degreearea`
--

INSERT INTO `degreearea` (`DegreeAreaID`, `DegreeArea`) VALUES
(1, 'Aerospace Engineering'),
(2, 'Applied Physiology'),
(3, 'ArchitectureBuilding Construction'),
(4, 'Art'),
(5, 'ArtsEconomics History'),
(6, 'Biology'),
(7, 'Biomedical Engineering'),
(8, 'Biomolecular Engineering'),
(9, 'Business'),
(10, 'Chemical Engineering'),
(11, 'ChemistryBiochemistry'),
(12, 'City and Regional Planning'),
(13, 'Civil Engineering'),
(14, 'Communication'),
(15, 'Computer Engineering'),
(16, 'Computer Science'),
(17, 'Earth and Atmospheric Sciences'),
(18, 'Electrical Engineering'),
(19, 'Industrial and Systems Engineering'),
(20, 'Industrial Design'),
(21, 'International Affairs'),
(22, 'Literature'),
(23, 'Materials Science and Engineering'),
(24, 'Mathematics'),
(25, 'Mechanical Engineering'),
(26, 'Modern Languages'),
(27, 'Music'),
(28, 'Physics'),
(29, 'Psychology'),
(30, 'Public Policy'),
(31, 'Textile Engineering');

-- --------------------------------------------------------

--
-- Table structure for table `degreetype`
--

CREATE TABLE `degreetype` (
  `DegreeTypeID` int(10) NOT NULL auto_increment,
  `DegreeType` varchar(50) NOT NULL,
  PRIMARY KEY  (`DegreeTypeID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `degreetype`
--

INSERT INTO `degreetype` (`DegreeTypeID`, `DegreeType`) VALUES
(1, 'High School or equivalent'),
(2, 'Associate Degree'),
(3, 'Bachelors Degree'),
(4, 'Masters Degree'),
(5, 'Doctorate');

-- --------------------------------------------------------

--
-- Table structure for table `education`
--

CREATE TABLE `education` (
  `EducationID` int(10) NOT NULL auto_increment,
  `EUniversityID` int(10) NOT NULL,
  `EGPA` float NOT NULL,
  `EstartDate` date NOT NULL,
  `EGradDate` date NOT NULL,
  `DegreeTypeID` int(10) NOT NULL,
  `DegreeAreaID` int(10) NOT NULL,
  `ResumeID` int(10) NOT NULL,
  PRIMARY KEY  (`EducationID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `education`
--

INSERT INTO `education` (`EducationID`, `EUniversityID`, `EGPA`, `EstartDate`, `EGradDate`, `DegreeTypeID`, `DegreeAreaID`, `ResumeID`) VALUES
(1, 35, 2.85, '2003-08-05', '2007-12-16', 3, 1, 1),
(2, 13, 3.92, '2002-12-15', '2007-12-20', 2, 2, 1),
(3, 7, 3.29, '2007-12-16', '2011-11-11', 4, 8, 2),
(4, 25, 3.3, '2001-10-22', '2006-10-25', 1, 27, -1),
(8, 5, 5, '1984-11-14', '2007-12-04', 4, 21, 6),
(9, 5, 5, '1985-11-14', '2007-12-04', 4, 21, 6),
(10, 26, 0, '2000-10-22', '2011-10-11', 4, 27, 1);

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `PaymentID` int(10) NOT NULL,
  `INumber` varchar(50) NOT NULL,
  `IDate` date NOT NULL,
  PRIMARY KEY  (`PaymentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`PaymentID`, `INumber`, `IDate`) VALUES
(3, 384, '2000-04-02');
-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE `job` (
  `JobID` int(10) NOT NULL auto_increment,
  `JListDate` date NOT NULL,
  `JobTitle` varchar(100) NOT NULL,
  `JCity` varchar(100) NOT NULL,
  `StateID` int(10) NOT NULL,
  `Zipcode` varchar(5) NOT NULL,
  `JDuties` varchar(5000) NOT NULL,
  `JYRSExperience` int(11) NOT NULL,
  `JLowRange` int(11) NOT NULL,
  `JHighRange` int(11) NOT NULL,
  `JFillStatus` enum('Yes','No') NOT NULL,
  `CName` varchar(100) NOT NULL,
  PRIMARY KEY  (`JobID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1000 ;

--
-- Dumping data for table `job`
--

INSERT INTO `job` (`JobID`, `JListDate`, `JobTitle`, `JCity`, `StateID`, `Zipcode`, `JDuties`, `JYRSExperience`, `JLowRange`, `JHighRange`, `JFillStatus`, `CName`) VALUES
(1, '2001-01-01', 'Account Manager', 'storrs', 8, '6279', 'Do work', 5, 25000, 50000, 'Yes', 'A&T Systems, Inc.'),
(2, '2001-01-02', 'Accountant', 'storrs', 8, '6279', 'Do work', 5, 25500, 50500, 'No', 'AC Technologies, Inc.'),
(3, '2001-01-03', 'Administrator', 'storrs', 8, '6279', 'Do work', 5, 26000, 51000, 'No', 'ADVANCED CONCEPTS, INC.'),
(4, '2007-11-20', 'Application Developer', 'storrs', 8, '6279', 'Do work', 5, 26500, 51500, 'No', 'Ahmad Associates, Ltd.'),
(5, '2001-01-05', 'Assistant Program Director', 'storrs', 8, '6279', 'Do work', 5, 27000, 52000, 'No', 'Analex Corporation'),
(6, '2001-01-06', 'Assitant manager', 'storrs', 8, '6279', 'Do work', 5, 27500, 52500, 'No', 'ANTEON CORPORATION'),
(7, '2001-01-07', 'Chemical Engineer', 'storrs', 8, '6279', 'Do work', 5, 28000, 53000, 'No', 'AnviCom, Inc.'),
(8, '2001-01-08', 'Computer Scientist', 'storrs', 8, '6279', 'Do work', 5, 28500, 53500, 'No', 'ASCENTRY TECHNOLOGIES, Inc.'),
(9, '2001-01-09', 'Consultant', 'storrs', 8, '6279', 'Do work', 5, 29000, 54000, 'No', 'ATS'),
(10, '2001-01-10', 'Customer Support', 'storrs', 8, '6279', 'Do work', 5, 29500, 54500, 'No', 'Baesch Computer Consulting, Inc'),
(11, '2001-01-11', 'Dental Hygienists', 'storrs', 8, '6279', 'Do work', 5, 30000, 55000, 'No', 'Bechtel'),
(12, '2001-01-12', 'Dentist', 'storrs', 8, '6279', 'Do work', 5, 30500, 55500, 'No', 'Beers & Cutler Government Contracts Consulting'),
(13, '2001-01-13', 'Dieticians', 'storrs', 8, '6279', 'Do work', 5, 31000, 56000, 'No', 'Booz Allen Hamilton'),
(14, '2001-01-14', 'Electrical Engineer', 'storrs', 8, '6279', 'Do work', 5, 31500, 56500, 'No', 'Brand-Name IT Products and Services Provider'),
(15, '2001-01-15', 'Entry Level Manager', 'storrs', 8, '6279', 'Do work', 5, 32000, 57000, 'No', 'C&S Wholesale Grocers'),
(16, '2001-01-16', 'Entry Level Sales', 'storrs', 8, '6279', 'Do work', 5, 32500, 57500, 'No', 'Computer & Hi-tech Management, Inc.'),
(17, '2001-01-17', 'Field Auditor', 'storrs', 8, '6279', 'Do work', 5, 33000, 58000, 'No', 'Consumer Electronics Association'),
(18, '2001-01-18', 'Healthcare Administrator', 'storrs', 8, '6279', 'Do work', 5, 33500, 58500, 'No', 'Cox Enterprises'),
(19, '2001-01-19', 'Industrial Engineer', 'storrs', 8, '6279', 'Do work', 5, 34000, 59000, 'No', 'Decision Systems Technologies, Inc.'),
(20, '2001-01-20', 'Manager', 'storrs', 8, '6279', 'Do work', 5, 34500, 59500, 'No', 'DeVry University'),
(21, '2001-01-21', 'Marketing Research Analysis', 'storrs', 8, '6279', 'Do work', 5, 35000, 60000, 'No', 'DSA Information Technology Solutions'),
(22, '2001-01-22', 'Mechanical Engineer', 'storrs', 8, '6279', 'Do work', 5, 35500, 60500, 'No', 'Electronic Consulting Services, Inc.'),
(23, '2001-01-23', 'Medical and Clinical Researcher', 'storrs', 8, '6279', 'Do work', 5, 36000, 61000, 'Yes', 'Engineering and Technical Services'),
(24, '2001-01-24', 'Medical Records Administrator', 'storrs', 8, '6279', 'Do work', 5, 36500, 61500, 'Yes', 'ENSCO, Inc.'),
(25, '2001-01-25', 'Nurse', 'storrs', 8, '6279', 'Do work', 5, 37000, 62000, 'Yes', 'Enterprise Rent-A-Car'),
(26, '2001-01-26', 'Occupational Theropist', 'storrs', 8, '6279', 'Do work', 5, 37500, 62500, 'Yes', 'Ernst & Young'),
(27, '2001-01-27', 'Pharmacist', 'storrs', 8, '6279', 'Do work', 5, 38000, 63000, 'Yes', 'Fidelity Investments'),
(28, '2001-01-28', 'Physical Scientists', 'storrs', 8, '6279', 'Do work', 5, 38500, 63500, 'Yes', 'Gefion, Inc.'),
(29, '2001-01-29', 'Physical Therapist', 'storrs', 8, '6279', 'Do work', 5, 39000, 64000, 'Yes', 'GeoLogics Corporation<'),
(30, '2001-01-30', 'Physician', 'storrs', 8, '6279', 'Do work', 5, 39500, 64500, 'Yes', 'Georgia Institute of Technology'),
(31, '2001-01-31', 'Physician Assistant', 'storrs', 8, '6279', 'Do work', 5, 40000, 65000, 'No', 'Giant Eagle'),
(32, '2001-02-01', 'Program Director', 'storrs', 8, '6279', 'Do work', 5, 40500, 65500, 'No', 'Graybar Electric'),
(33, '2001-02-02', 'Sales and Marketing Representatives', 'storrs', 8, '6279', 'Do work', 5, 41000, 66000, 'No', 'HE Butt Grocery'),
(34, '2001-02-03', 'Sales Executive', 'storrs', 8, '6279', 'Do work', 5, 41500, 66500, 'No', 'High Performance Technologies, Inc.'),
(35, '2001-02-04', 'Scientist', 'storrs', 8, '6279', 'Do work', 5, 42000, 67000, 'No', 'Hogan & Hartson L.L.P.'),
(36, '2001-02-05', 'Social Worker', 'storrs', 8, '6279', 'Do work', 5, 42500, 67500, 'No', 'Huntsman'),
(37, '2001-02-06', 'Speech Therapist', 'storrs', 8, '6279', 'Do work', 5, 43000, 68000, 'No', 'IBM Corporation Federal Software Group'),
(38, '2001-02-07', 'Teacher', 'storrs', 8, '6279', 'Do work', 5, 43500, 68500, 'No', 'Innovative Logistics Techniques, Inc.'),
(39, '2001-02-08', 'Textile Engineer', 'storrs', 8, '6279', 'Do work', 5, 44000, 69000, 'No', 'Integic Corporation'),
(40, '2001-02-09', 'Therapist', 'storrs', 8, '6279', 'Do work', 5, 44500, 69500, 'No', 'Integrated Systems Analysts, Inc.'),
(999, '9999-99-99', 'aa', 'a', 11, 'as', 'as', 1, 2, 3, 'No', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `jobtitle`
--

CREATE TABLE `jobtitle` (
  `title` varchar(100) NOT NULL,
  PRIMARY KEY  (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jobtitle`
--

INSERT INTO `jobtitle` (`title`) VALUES
('Account Manager'),
('Accountant'),
('Administrator'),
('Application Developer'),
('Assistant Program Director'),
('Assitant manager'),
('Chemical Engineer'),
('Computer Scientist'),
('Consultant'),
('Customer Support'),
('Dental Hygienists'),
('Dentist'),
('Dieticians'),
('Electrical Engineer'),
('Entry Level Manager'),
('Entry Level Sales'),
('Field Auditor'),
('Healthcare Administrator'),
('Industrial Engineer'),
('Manager'),
('Marketing Research Analysis'),
('Mechanical Engineer'),
('Medical and Clinical Researcher'),
('Medical Records Administrator'),
('Nurse'),
('Occupational Theropist'),
('Pharmacist'),
('Physical Scientists'),
('Physical Therapist'),
('Physician'),
('Physician Assistant'),
('Program Director'),
('Sales and Marketing Representatives'),
('Sales Executive'),
('Scientist'),
('Social Worker'),
('Speech Therapist'),
('Teacher'),
('Textile Engineer'),
('Therapist');

-- --------------------------------------------------------

--
-- Table structure for table `job_degreearea`
--

CREATE TABLE `job_degreearea` (
  `DegreeAreaID` int(10) NOT NULL,
  `JobID` int(10) NOT NULL,
  PRIMARY KEY  (`DegreeAreaID`,`JobID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job_degreearea`
--

INSERT INTO `job_degreearea` (`DegreeAreaID`, `JobID`) VALUES
(1, 1),
(2, 2),
(21, 3),
(21, 4);

-- --------------------------------------------------------

--
-- Table structure for table `job_degreetype`
--

CREATE TABLE `job_degreetype` (
  `DegreeTypeID` int(10) NOT NULL,
  `JobID` int(10) NOT NULL,
  PRIMARY KEY  (`DegreeTypeID`,`JobID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job_degreetype`
--

INSERT INTO `job_degreetype` (`DegreeTypeID`, `JobID`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `job_skills`
--

CREATE TABLE `job_skills` (
  `SSkillID` int(10) NOT NULL,
  `JobID` int(10) NOT NULL,
  PRIMARY KEY  (`SSkillID`,`JobID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job_skills`
--

INSERT INTO `job_skills` (`SSkillID`, `JobID`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9);

-- --------------------------------------------------------

--
-- Table structure for table `onlineservice`
--

CREATE TABLE `onlineservice` (
  `PaymentID` int(10) NOT NULL,
  `SName` varchar(50) NOT NULL,
  `STransID` int(20) NOT NULL,
  `SFee` int(10) NOT NULL,
  PRIMARY KEY  (`PaymentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `onlineservice`
--

INSERT INTO `onlineservice` (`PaymentID`, `SName`, `STransId`, `SFee`) VALUES
(4, 'PayPal', 35486943, 5);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `PaymentID` int(10) NOT NULL auto_increment,
  `PAmount` int(10) NOT NULL,
  `PStatusID` int(10) NOT NULL,
  `PDate` date NOT NULL,
  PRIMARY KEY  (`PaymentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`PaymentID`, `PAmount`, `PStatusID`, `PDate`) VALUES
(1, 24535, 5, '2015-03-22'),
(2, 3497957, 8, '2000-04-01'),
(3, 234, 2, '2000-04-02'),
(4, 237429, 9, '2000-04-03'),
(5, 6, 1, '2000-04-04'),
(6, 666, 6, '2000-04-05');

-- --------------------------------------------------------

--
-- Table structure for table `postandpay`
--

CREATE TABLE `postandpay` (
  `PaymentID` int(10) NOT NULL,
  `JobID` int(10) NOT NULL,
  `UName` varchar(50) NOT NULL,
  PRIMARY KEY  (`PaymentID`,`JobID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `postandpay`
--


-- --------------------------------------------------------

--
-- Table structure for table `poster`
--

CREATE TABLE `poster` (
  `UName` varchar(50) NOT NULL,
  `PPosition` varchar(50) NOT NULL,
  `PContactEmail` varchar(50) NOT NULL,
  `CName` varchar(100) NOT NULL,
  PRIMARY KEY  (`UName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `poster`
--

INSERT INTO `poster` (`UName`, `PPosition`, `PContactEmail`, `CName`) VALUES
('bfry', 'HR', 'bfry@sra.com', 'SRA International, Inc.'),
('bob', 'Test', 'abc@abc', 'DeVry University'),
('dlewis', 'HR', 'dlewis@ey.com', 'Ernst & Young'),
('ncooper', 'HR', 'ncooper@gatech.edu', 'Georgia Institute of Technology'),
('p', 'test', 'test', 'AC Technologies, Inc.'),
('post', 'President', 'poster@poster.com', 'DSA Information Technology Solutions');

-- --------------------------------------------------------

--
-- Table structure for table `priorjobs`
--

CREATE TABLE `priorjobs` (
  `PjobID` int(10) NOT NULL auto_increment,
  `PJCompanyName` varchar(50) NOT NULL,
  `PJJobTitle` varchar(50) default NULL,
  `PJDuties` varchar(50) default NULL,
  `PJCity` varchar(50) default NULL,
  `StateID` int(10) default NULL,
  `PJStartDate` date NOT NULL,
  `PJEndDate` date NOT NULL,
  `ResumeID` int(10) NOT NULL,
  PRIMARY KEY  (`PjobID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `priorjobs`
--

INSERT INTO `priorjobs` (`PjobID`, `PJCompanyName`, `PJJobTitle`, `PJDuties`, `PJCity`, `StateID`, `PJStartDate`, `PJEndDate`, `ResumeID`) VALUES
(1, 'Lockheed Martin', 'Missile Tester', 'Tested Missiles', 'Mitchel Field', 20, '2003-09-01', '2003-11-30', 1),
(2, 'ITT Industries', 'summer hire', 'do work for 8 hours, then go home', 'clifton', 22, '2005-08-01', '2007-08-01', 2);

-- --------------------------------------------------------

--
-- Table structure for table `privileges`
--

CREATE TABLE `privileges` (
  `PrivilegesID` int(10) NOT NULL auto_increment,
  `Name` varchar(50) NOT NULL,
  `Desc` varchar(50) default NULL,
  PRIMARY KEY  (`PrivilegesID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `privileges`
--

INSERT INTO `privileges` (`PrivilegesID`, `Name`, `Desc`) VALUES
(1, 'Everything', 'Has full access to all admin priveledges');

-- --------------------------------------------------------

--
-- Table structure for table `pstatus`
--

CREATE TABLE `pstatus` (
  `PStatusID` int(10) NOT NULL auto_increment,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY  (`PStatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `pstatus`
--

INSERT INTO `pstatus` (`PStatusID`, `Name`) VALUES
(1, 'Canceled'),
(2, 'Cleared'),
(3, 'Completed'),
(4, 'Denied'),
(5, 'Declined'),
(6, 'Failed'),
(7, 'Held'),
(8, 'In progress'),
(9, 'On hold'),
(10, 'Paid'),
(11, 'Partially refunded'),
(12, 'Pending verification'),
(13, 'Placed'),
(14, 'Processing'),
(15, 'Refunded'),
(16, 'Temporary hold'),
(17, 'Unclaimed');

-- --------------------------------------------------------

--
-- Table structure for table `resume`
--

CREATE TABLE `resume` (
  `ResumeID` int(10) NOT NULL auto_increment,
  `RObjective` varchar(500) default NULL,
  `RSalaryMin` int(10) default NULL,
  `RFile` blob,
  `UName` varchar(50) NOT NULL,
  PRIMARY KEY  (`ResumeID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `resume`
--

INSERT INTO `resume` (`ResumeID`, `RObjective`, `RSalaryMin`, `RFile`, `UName`) VALUES
(1, 'I want work', 40000, 0x255044462d312e340d25e2e3cfd30d0a392030206f626a0d3c3c2f4c696e656172697a656420312f4c2031383736352f4f2031312f452031333832332f4e20322f542031383533392f48205b20373336203230345d3e3e0d656e646f626a0d202020202020202020202020202020202020200d0a787265660d0a392032320d0a30303030303030303136203030303030206e0d0a30303030303030393430203030303030206e0d0a30303030303031303138203030303030206e0d0a30303030303031313437203030303030206e0d0a30303030303031323736203030303030206e0d0a30303030303031373939203030303030206e0d0a30303030303032323633203030303030206e0d0a30303030303032343835203030303030206e0d0a30303030303032373139203030303030206e0d0a30303030303032373936203030303030206e0d0a30303030303034393530203030303030206e0d0a30303030303035303831203030303030206e0d0a30303030303035323034203030303030206e0d0a30303030303035333632203030303030206e0d0a30303030303039313135203030303030206e0d0a30303030303039333435203030303030206e0d0a30303030303039353531203030303030206e0d0a30303030303039383338203030303030206e0d0a30303030303133313334203030303030206e0d0a30303030303133333734203030303030206e0d0a30303030303133353839203030303030206e0d0a30303030303030373336203030303030206e0d0a747261696c65720d0a3c3c2f53697a652033312f507265762031383532392f526f6f74203130203020522f496e666f2038203020522f49445b3c34333531433143303330433237363234433534303831393639303833344442363e3c32463739464435454636354434443444414531443243463132303132393130413e5d3e3e0d0a7374617274787265660d0a300d0a2525454f460d0a2020202020202020202020202020200d0a33302030206f626a0d3c3c2f4c656e677468203131372f46696c7465722f466c6174654465636f64652f49203133312f4c203131352f532035393e3e73747265616d0d0a78da6260606006223d06560606a63d0c7c0c08c0c7c002946361e06860d8abc2c0d00a14eadac3c0c02804648004908030143330f832f0303b98483f6ce61498cbc021cb9ca0c72a17c339a191576732974117e705887a160606f3f7409a0988ad80988381c16d3b906604e27b00010600f58910740d0a656e6473747265616d0d656e646f626a0d31302030206f626a0d3c3c2f4d657461646174612037203020522f50616765732036203020522f547970652f436174616c6f672f506167654c6162656c732034203020523e3e0d656e646f626a0d31312030206f626a0d3c3c2f43726f70426f785b30203020363132203739325d2f506172656e742036203020522f436f6e74656e7473203138203020522f526f7461746520302f4d65646961426f785b30203020363132203739325d2f5265736f7572636573203132203020522f547970652f506167653e3e0d656e646f626a0d31322030206f626a0d3c3c2f466f6e743c3c2f545432203133203020522f545434203134203020522f545435203139203020522f545436203230203020522f545438203231203020523e3e2f50726f635365745b2f5044462f546578745d2f4578744753746174653c3c2f475331203137203020523e3e3e3e0d656e646f626a0d31332030206f626a0d3c3c2f537562747970652f54727565547970652f466f6e7444657363726970746f72203135203020522f4c61737443686172203135302f5769647468735b323738203020302030203020302030203020333333203333332030203538342032373820333333203237382032373820353536203535362035353620353536203535362035353620353536203535362035353620353536203237382030203020302030203020313031352036363720363637203732322037323220363637203631312037373820373232203237382035303020302035353620383333203732322037373820363637203737382037323220363637203631312037323220363637203934342036363720363637203020302030203020302030203020353536203535362035303020353536203535362032373820353536203535362032323220323232203530302032323220383333203535362035353620353536203020333333203530302032373820353536203530302037323220353030203530302030203020302030203020302030203020302030203020302030203020302030203020302030203020302030203020302030203020302030203535365d2f42617365466f6e742f417269616c4d542f4669727374436861722033322f456e636f64696e672f57696e416e7369456e636f64696e672f547970652f466f6e743e3e0d656e646f626a0d31342030206f626a0d3c3c2f537562747970652f54727565547970652f466f6e7444657363726970746f72203136203020522f4c61737443686172203134362f5769647468735b333333203020302030203020302030203020333839203338392030203020302030203333332032373820302030203020302030203020302030203020302030203020302030203020302030203737382037373820373738203737382037323220302030203833332033383920302030203636372039343420302030203020302037373820373232203732322030203737382031303030203020302030203020302030203020302030203636372030203636372036363720363637203338392036363720363637203333332030203636372033333320313030302036363720363637203636372030203434342036313120343434203636372036313120393434203636372030203020302030203020302030203020302030203020302030203020302030203020302030203020302030203020302030203237385d2f42617365466f6e742f417269616c2d426c61636b2f4669727374436861722033322f456e636f64696e672f57696e416e7369456e636f64696e672f547970652f466f6e743e3e0d656e646f626a0d31352030206f626a0d3c3c2f5374656d562038382f466f6e744e616d652f417269616c4d542f466f6e74537472657463682f4e6f726d616c2f466f6e74576569676874203430302f466c6167732033322f44657363656e74202d3231312f466f6e7442426f785b2d363635202d333235203230303020313030365d2f417363656e74203930352f466f6e7446616d696c7928417269616c292f436170486569676874203731382f58486569676874203531352f547970652f466f6e7444657363726970746f722f4974616c6963416e676c6520303e3e0d656e646f626a0d31362030206f626a0d3c3c2f5374656d56203230302f466f6e744e616d652f417269616c2d426c61636b2f466f6e74537472657463682f4e6f726d616c2f466f6e74576569676874203430302f466c6167732033322f44657363656e74202d3330392f466f6e7442426f785b2d313934202d333037203136383820313038335d2f417363656e7420313130302f466f6e7446616d696c7928417269616c20426c61636b292f436170486569676874203731382f58486569676874203531352f547970652f466f6e7444657363726970746f722f4974616c6963416e676c6520303e3e0d656e646f626a0d31372030206f626a0d3c3c2f4f504d20312f4f502066616c73652f6f702066616c73652f547970652f4578744753746174652f53412066616c73652f534d20302e30323e3e0d656e646f626a0d31382030206f626a0d3c3c2f4c656e67746820323038332f46696c7465722f466c6174654465636f64653e3e73747265616d0d0a68de9c58db52e348127de72bea51dab184aa74ef98d858039e6e08a0d9b167d889ee791072d9a891258724c3f01bf3d0dfbb27ab4abe43444f1058b25495d79327b37cfa71ccd9bc3d399b9c9c4e26827136999d70cff504f3f0a7ef52df0d1216e34b1cb1c9e2c46373fc4f72fa7839b1983df9865b87bb3c486336b9308fe25e8aba1169e88a8845a9e7860149715ccf1382c4e0260a48d4178b47ecd36a36b39dc80d2cf6eb94d97f4eae7ae1a14fc2b1da4bcc36df6cbbb79dc0e55666736c7bb5b9ef46562507ec56df5ed98eef86b02aa14fe6d9a99b5a7110eb1bad030b7d1e21026b4564a0171b4d41aa35dd3dd695645f2d3b86a834f6bfda5a6a98784e84bbc0e2dc3b62b51216f6c2622d6ce42cb2a264674d61275656b9373617964bbec4d6795d435c642d65f39f392dc31237af175a369215e8648958c518179da6288452e17113e2880c574a3d5f670bdab28addb80c1a205ca56a343949b99b62b79fb89c05beef22c66ecc5324b491273302c87158445ee026519f502e36b8184d5779d61575a5546ce015bb3c09230a4e9406d13a383eed54a0e03a3ae9299e7d675c9c7ab14dd973b81fa6ae4f77becf63c4fab7aa78964d5b74afac9ec1a10aeb2aacb3246e72caba6f7545beea104aaef679a14e792f61dcd54dd30ed8f9643fb02a7d7e1c8bde426e0229126ddf59963fcab26e48f53807207cab90552e5951b151352f2a299ba29a6bb990d240e447fc5f2182df982bd80b14ddb02f7f7a6c7a027ca6100c9581a755922603baf37ab15c75928091588ded506dd89135ceb5beac9aee28fc6a0dcf46135a31ccf3c66c9ba23684557472fad5b69d5885c3382c7a8761a243551e270159227c3fdc2d04aa91d0809731f6f16ef881d92692c24dc2f597d3f55d40ca02a09a03d49eb7561aee834178a902c386597e86d6e4df3bd871838873c4afb72aa0c5dcf5c2d8848a8d8b7955cc8a3cab3a66739deebba6fe267380c06a0913c1c6f5c8309e0b57fd6d0adbb122f1f7ad08c3032b14748d1180a01785d03c96550184201517d20ef0a02de6ea4a28a51c28d3d4935c9bd60dd82f5959320152fcc0ce1b9975fafdd4ec40f10e2f096357d973c6ba9a2dcbec95758f92cdb3853464e6fa01dff147d9c937c5f9191bcab2ee4b33d18e4dfea51db7eadd92053893443bbc96e3a63ceda1a0bd08613ebc103016b14f8500e0ae6536552f886976838e857e1a0a6da5ff43512723c43ae8d1bb510fc1ce1475ba22ead4017a73436d6e42411f2f55ed20ecea45ac62af2ccfd426140efb5d3e16796947d8a1abee7cd576f5020f524bcb6b485e5f5a8759d8058be191cb6a56370bcd946310550c590ec8a4792e72f430e4bb86ec5819ef5ba51d5b85cdd1de58b65c9605be2a27228b24e8856c2a5b7a31afa47a3065d0c056ad640faf14953c33c940bec9a4a837c9d7164d6556d2ce94fca1ba6d1f8ba5fade12e0ba26cb9fd872a557e48fea4a51e2562bcdb2acd22100728510ef646dca8ac5723b76f5b364f94aa7ed78701bd9c94a3b1bc059a5c81170943c398aa67766949e7e54aadeec45e841117a518c8b6945298f00efed46b29abeb2e1435313e07b0440bec7930d5570de4be626d60e334d4c8f3085069bea67b7f22537838d79db95a6c0035d0caa5d70f166706f75e020c687b1598bfd3414f900f0d81678733f604360b8c900248275a6d66fcd2faa428fc472d3271d01c8062264488eea6107ace82ba0f75dac39bd9cb0f15351966d2fe9a017845192fe482f589392723edce2839effe74db658149582cc5c7db2ebac9aaf7485cf75a5b7287a8c023ffd34d0d98bdcd087211ba24fd6d9eb3987487880de1fa1f3fcf71ad16c5bb95035f040a5135ae5eb805d5f8eeff61b9fc363d5f57818fda8a7c7994f797a219f3192a8242e1728123542b25fe0bc41029590b0eaed7a7a6a3fe8651feb7a4e008bac7bf94097495d974f457760bab6e71f58efec9a2ff6cd1f55cf455357ca58ae080fad0459b92faa69ad9ebdb42c553789fa1cd8e4ceeefbffa961efce26df10fba25afdf58e07ff64ea08d73048f73d18d7b3ee256b241b1239ebf9170e8c72149839667869b8cd086baee1866b96aad87db498cb8bd180dd1479539b4710ce7e2fcc975556529200574d0e035bcd07fbeb3fcf300d198948b8296e8783d72378b23f231cf8365e61681cb0cf4b59913a254e32f5747f6476129c218422822048d722d3351118ce1b2242d396fd2a6d62ce5c82ffa65b63f2d60121f6e2e3e3b735ca08abe3bcc670bf932c35c6a272c368bb7237ec606c009b9fd5af464082e0b444b9c305466830a1393d80790fce5b6a4a36f2b7c6f56327840b8936a84e737fb70062db1d9e0bf6ec063c544dbd4939d6f7cd787840c49eee06340d7841b2db73b68e13f775f3c4467f2d29fcc26af42162cf9a4d0e62df0bdf0e233aa2875026a75e80fa13475be31f37ce1ff79f86ecb66eba477625d5c2a695af887b7ffc167c3f63c1fac011f4078efbec954ef5fdd1e2f6ea78727a59fbe7b7cdd9f48b755dcc24d8dfa1c91a60d4375b7daf4fab1e87d91188e9653e45f7282d5368421d9a70337ef4fd94de46faadce2346b1a36709ac8bf5bad8d6361e06f872326197d5941a39815750a11317b4ec945df6830855a6b77649693081c5eef3ba59d68d622b64471db179ec03b81b25e76531ebea0af3c31b61373af6a2eef5bf3f087558009d2c5063ec5381e9fa30a8342fc5c97b4dfd3b866eddacf57098d0c9622cd5b06ca8cd08d93fc11e52c0dab775db14d612549411d1691e2506c5295ab62dbbc8ba4c2d79d017ccba3d7223b18ddc83e971bb19b0996a4f35fd4ad1e0188781a80291b73b1ef432b786d9fd039c1ac241236eff03ceff05180069caa6650a0d0a656e6473747265616d0d656e646f626a0d31392030206f626a0d3c3c2f537562747970652f54797065302f44657363656e64616e74466f6e74735b3234203020525d2f42617365466f6e742f4f4a4a4a4d502b53796d626f6c4d542f546f556e69636f6465203235203020522f456e636f64696e672f4964656e746974792d482f547970652f466f6e743e3e0d656e646f626a0d32302030206f626a0d3c3c2f537562747970652f54797065302f44657363656e64616e74466f6e74735b3238203020525d2f42617365466f6e742f4f4a4a4a4e412b57696e6764696e67732d526567756c61722f456e636f64696e672f4964656e746974792d482f547970652f466f6e743e3e0d656e646f626a0d32312030206f626a0d3c3c2f537562747970652f54727565547970652f466f6e7444657363726970746f72203239203020522f4c61737443686172203131312f5769647468735b3630305d2f42617365466f6e742f436f75726965724e657750534d542f466972737443686172203131312f456e636f64696e672f57696e416e7369456e636f64696e672f547970652f466f6e743e3e0d656e646f626a0d32322030206f626a0d3c3c2f4c656e67746820333636392f46696c7465722f466c6174654465636f64652f4c656e6774683120353838343e3e73747265616d0d0a68dee4387f7454d599dfbdf7bd99971f904908212440def8486232f90d427e35992433013224844cc019409dc964f2030389498866019bc252e920e9583d60b555aa5405aabe0960275d0bd162f59cd55d4fd966f728ed8a2072dca21c8bb82ac9dbefbe0c11aca7dd73facf9eb3efce77bfdff7fbee77ef7bf7bd0102003130040c0a5639f38bfef1cf177b51f232c25adf40bf9c7deaab5d0024114014da7ada377d5670ea1e004332f271ed5d836d87773dff0a403cb71fe9f07b5b5f7b7e831f20e914f24b3a501097cbbe87016e457e61c7a6fefbee6d5c5181fc4a007aadabdbe74d2e4f2e0748e8c1183b3679efeba14c7c16fd0fa2bdbcd9bbc99f72aab31d60d615b47fa1a7d7df737fdc2b38fecce500ec1e20c25b240822e6f298b80847489fc2ec00b4d18458268a8412a3818a46f8c655dfbdb91bac97e5cb9af8e0642d5924c5905787a6b5e21d5028ae84348479ec114805d0ce46e0fca45bbb24de0dcae446ed4c661c1a1f8bc0d4e58574b813b2a00e5e85cb70826443238c696f830f5cf45ec845f90fe19730067f041bb4028514b20d64ed27f02064c04e380025428a761c56c245290e92602194926e30c06c688727c81958010e1ca30c96c10fa017fbd528ff9c14a3864034dc81d11f81c7e104fc0bfc27ccc511f3609c18c9e7da3f410d383187ad300a7f14abc53d300b1e8267e110bc021f903c72907cc43ed68e6b6f6aff855e5950084b603db460fb11fc0ced9e857fa60a7b5a4bd1b66acf696fc03cccfe08cefa15780d635d2532594b7cf4193638f9a5b6593b827588c59c317b6c55389b06e8879fa3e5387c45a2b0eda032ada4bec9786d0e18210d64b0607e6b6013dc0fbb612fcee23178125e848ba4927490b7c8c774061da227c5466383b121eae4c4efb565da558c110b66ccf676b81bee43cf1fc1c3b00f3d7f86b14e61bb0c136409292315640569223f24df273f27ff4d2df45dfa159bc9e2580e73330fdbc6de675f48e2c4aac9fd936f6b8dda7d584b82358fc695acc17936c306e8813eb817b6e15db21b86b105b17a47b0a958cf93d87e037f8073d82ec045f813ee3911e7184db2b115602b23565247d690bb483be923fbc94b244c4e90d7c847e40a5d4c97d012ba8a36d176da43fb6990aa34444fd2f3f4cf986529b3b33ef65d7684bdcade60bf63ef0820d4095ea153d8223c22a8c2ef85cbc21561520451c196277ac503134f4d3a26d76b195a99d6a2edd582d82e628d17e06c322013e7d388abea8336dc393dd8eec13688b5db8533da074f60ed78f55e82303e01c6700fbf06bf85b7e11d9cdf1fe07df81cbec0e2f0f9cd2666924b0ab1bedf21cbb0adc3751a20dbc81019268f619d43e438b6317206673989335c4bddf44e3a40b7d1bd743f7d9c8ed2313a8e2ba13103ae44325bc61cec76b69eddc9fad93ef628fb317b823dc9c26c8cfd56a042a9d028f40a3b85a0f094f0a2f0ba705a382316886562009b2a1e177f2d5e302418520d8b0d4e43d8689006a50fa549380aaf43088e7ff3de27bb898984e079f22113d8107d93ba680c1d273b847f2599b802e504c461d80c9f6286f3c9efe852723bf3917558bf1da48dac879fb279ec2956076f8a9b8993359256700afbe19af81bf08a013ac2a8186013e40b7a043a6098de3d7148739399e02407e933b863b64339640929304e4b8451924eb3e849e30b240c1546032b61a5521c7207d9394cd329c5918fc0cbdec7fbe72cde5b4df4197c265c20678cab30bb09f622da6c870a7270321e0e896eea21f3e841b27262e7c47fb0c7b527c95cfa3ec044fc4415adc11db7463b4c4fc027b07ff20be13d3841df8535f8d4f0e977cea778efdd8b4f9ab5708dcec0fbc989cf911e6b6565c577cacb4a4b8a97deb678515161417e5e6e8e253bebd6cc8cf485ca2d66396dc1fc79a9297393e724cd4e9c95106f8a9b392336263a4a321a448151023976a5d623ab191e55c850962fcfe5bce24581f70681479551547bb38d2a7b7433f9664b2b5ab67dc3d23a65699db62426b91cca737364bb22ab6fd914394cd6ad7621bdd7a6b865f5924ed7ebb490a1333390319bd143b62777d864957864bb5a3bd011b07b6c385e2826ba46a9f147e7e640283a06c918a4d4394a4f88cca9203a41e7d84b4314a41998959aa2d8ecea5cc5c6535059badddbaa36ae76d96da966b33b374725353ea54505a55a8db3e82650a387510d35aa510f2377f2e9c01e3994331678306c82168f25b65569f56e70a9ccebe631e22d18d7a6cef987f3c95fb33878428deb811bb5a92c604fee94391b083c20ab0756bb6ed49a79ef76e318e84bd36b3d815a0cfd2056d1e194311adde576a964178694f94cf8aca6e6e757ec5ce2d928ab514ab5d211d8e8c1b54909a8d034681e4949b18e6aef418a5d0e34bb14b35a99aab8bdb679a14408340d1e9d6b95e7deacc9cd0999e2a70a1b9a1917216267dc48f8a7753aa59b73cad1345d59c2335256e08e50659f8c99b8149c5331effcc510f015a3195e6e825e6a2bae48a71a55e309984ab99cfbab62ba4991039f01ee00e5d29f6e9678231243bae933e024df27d37b0df5d769d56251b3b3f91631d6e09a628e153a7f5b6ece409856293d261911960f1ab1b65e77693e96df6ce60bbc276c851664d4a1d5ae295e8696d411b0e65bdc2af570cdd875cdec355c33745d33edee5170271f03fe4e375b9532a67f71a6a459f68e529524fd15b57f4aef702a8ed5eb5cb23de089d4d6d17c1337a52f9ed6452875568d8ba5d208455399aec54db961da9833ae585548c79f41dfd4ad61a384bb529710b9563579964ff5ee68b3f97fe914d62e732f1d7ded1649532db5dccc97ddc4df945e6c8061c242067534af0b04a26fd4012f9a143389efaed2dac923d7f2a47ebd8c375e2784b7f054e5d797f8b68a881e86f3e231f00a00e9422bac361c8665861258ce764229ea9a117251f710ead2d17e73043f444b340de57508971172109c0832420b821b6125c23684d5b4047e81b0077dcbb93fc76c2fb8382dbe0e89e25ab8057182f001a408e720d3900acb85d3a0a02c03e32f1263a101e974713b241ae7731fed22f22b0de968f331e6d00719c2cb508cbe65e22e48c2dc97a1ae58cc826ac3068c770e92709c670d1f928d88eb441bca40fb4400f60e8edd8c790c22d4b22b6047df15820596b13a9cdf69c8a54f410d623bea6723140a3fc13959e056a479fe4b917623ee449b06f4b5a07e19d6b30a736d649fc27ac4f938ee7af6ef709a3c0607118fa3fd62e12acc225fea71cb09ae16fa2cc15a81c100a306032940fc39c255692d64193f00078e7fc775cc16411baf1d9ef09d919a0ea27f1bc6a9622fc0c6488d392ce4b124800bc2695a2281b617e72e1bf6e19a6f875caccd9dc60fc80eac55830efbc08bb89e038e578cb014a12c02a5e231128d10837a27f2758626f07130a64111fae661ac66be3750578079ea10c97f65247f1d639ef958d7aaebfe863ac8461f0b4b00e70d00d37005df37aee0778e8ec941f4d982fe15b410bf83b6d367a6006a5882f6304ba0774c615090fe9e8ed1971c847955b321816662cba019d04d92f0eeb84bef57e97da5dee7f39ee68fe4a7a58569dec8018e7246e667215a688d399b9256989990569ec9f939d6b2aeacb4f70ecf4d3b8b7024b3286d777951da4e847c8401e4b95de6e1acb4eeccee4ddddfef7e40580a4949b8ca09f192354ccebdb426312a316a69304c4e5a4b8cc15f1b83478dc17663b0d518bcdd18ac350697188379c6a0c5184c3706171a13a504c924cd9462a56849920c92205109a4c4b0f69ed5c26ffe4483892383c07b41a74d94f7fc46c727012512c5af3b7516735087b35a2db638c246ad495d6a71a8c6c6f5ae1021c36e94aa74779840b32b4c342eda95ca4fed512044dbb5373582dd6ee250c77ce06891d5ab4e254ca2f141252ad5444d7080a3b93a1992062a932b132ae24b6a6ddfd27922bde5eb2bd972e3e5681c7c19d2c816fef145fa8f1ad31e3672a913a5415d1ae4d2a02e4d9eafee73385deae1f96eb58813da7c37395a75dcba95bf077814bb1fc1a3ee19e84856875a6439643d1e7941c8f0b4f83a38f6fad5e38adfa65a159b1caadafa2deaad5c5da5d842b0d5deec0a6db5fa6d2355d62abbe2b5b947a181b484b2876f0af783ebe146219bb4fce58861d2c287cce6111b86bf25e2305737f088c33ce2308fd8606dd023da3b9dd5c4d1e80a4950edc6c347c747694c342e9527d5ecae4e32f554e8eb56664ebe3ff5570290e72006cfe2587caf9b81c055b955b9555c851b86ab66f257be882af9fe3273eaafc873119509c5f14a3558b658be71f5f10b92ed9d360e98c9a83646874612d28a2c6e7ece507e0489fc0f10868b56665d6030fa50260a3e06d106d1c7184d89320a3e0273a5ace2644b83e94a79fd447983e96a79bd69a21c2acb27ca39141698e3cdf1e9d8e1de866b321bbb6615e12b3c71c6f453ee347d179f7d31601e05468e59674619216586616eec8c4fcc7c584bc379d305a8acbf545840120dca2d19b72d5eb2a82889be3bbeffd1f1f147f78fd3aa293cae9f8e45ffcf9afbff58e357347ef35f7f7ff9eed4130cf82e8a436e8a16901e8ed006a47f8a5a10a2909b845f4468020bc8e1084d612679234233948f476801e92b11da000b6842f3608fbfcdebf3cb87e4e60ebfccff8aeb47915cd3dddbd3ddebedefecde2cf774f9f2649bb7dffb378cf2f960b2b3bb6b0b97f4c92b36a35f614949412e76457972555797dcd4d9ded1df2737f9fbfcbd03fed655757575f58d16e7e0a696eeaefae6bfce42330c420ff8a10dbf897d88653884d08cdff69cae876efc16ef86fe88950c35c8f522cd7b2fca3b750b19255de89f87944d977bffce91f2a73393f17bbd1b655ba66dfa50b602f154bc4228c15600b911aa489756a14717e226f469c71cfa75af261caf0fa11706b06f855578a2f1560f8dfa3f7483b0095af468f5189f5bb763dc2eccaff76fd8fe3ddaa9dd3986b1447d375230e1fcad485d12e3a6fed2e1d221387c32eae9bbe2ca3f93e64bbaf8e9e52f97713cb2f2dfce6ada6485f4a114a3ffdb1dd9f9ff23c0008a8b7f6d0a0d0a656e6473747265616d0d656e646f626a0d32332030206f626a0d3c3c2f5374656d5620302f466f6e744e616d652f4f4a4a4a4d502b53796d626f6c4d542f466f6e74537472657463682f4e6f726d616c2f466f6e7446696c6532203232203020522f466f6e74576569676874203430302f466c61677320342f44657363656e74202d3231392f466f6e7442426f785b30202d323230203131313320313030355d2f417363656e7420313030352f466f6e7446616d696c792853796d626f6c292f43617048656967687420302f547970652f466f6e7444657363726970746f722f4974616c6963416e676c6520303e3e0d656e646f626a0d32342030206f626a0d3c3c2f537562747970652f434944466f6e7454797065322f466f6e7444657363726970746f72203233203020522f42617365466f6e742f4f4a4a4a4d502b53796d626f6c4d542f575b3132305b3436305d5d2f434944546f4749444d61702f4964656e746974792f43494453797374656d496e666f3c3c2f537570706c656d656e7420302f4f72646572696e67284964656e74697479292f52656769737472792841646f6265293e3e2f445720313030302f547970652f466f6e743e3e0d656e646f626a0d32352030206f626a0d3c3c2f4c656e677468203231372f46696c7465722f466c6174654465636f64653e3e73747265616d0d0a68de54503d4fc5300cdcf32b3c821892178160a8ba3c960e7c8816f6bcc42d91a813b9e9d07f4f12b50f31d896cf3eddd9f2dc3d77e413c8770eb6c704a327c7b884952dc205274f70d2e0bc4d7b57b39d4d0499c9fdb6249c3b1a03348d901f79b824dee066181eeed42dc83776c89ea68cdcebcfaf8cf46b8c3f38232550d0b6e07014f2fc62e2ab99116425fe81c3161174ed4fbb7670b84463910d4d088d528f4fed5190dcfff9c1ba8cf6dbb038b6b5d2ba15797bc70bafdc74f56157e66cb11e5e8d140b9ef0fa9b1862512b217e051800e7186a900a0d0a656e6473747265616d0d656e646f626a0d32362030206f626a0d3c3c2f4c656e67746820333231322f46696c7465722f466c6174654465636f64652f4c656e6774683120363131363e3e73747265616d0d0a68deec580d7054d7753ef7bedf5d09f4832454d6316f594b2648ab1f30e1d762f5b3024943104836bbd82ebbd2ae7eccc22a2b59b66ccac80517bc12a9522bcec48d8d9c180730729e1076844b6bea04a28edbb84ced342eae9da6ca38935a99b835717fc6a8df7d6fa5201a3bc94ca7d3cce41d7def3bf79c73cfbde7defbb46f971811a5513f4954b6ada97465f9a5a9242ce7813b5b7b7b8ce74b4f9e24623944cafab6aef6bddffe608349a43612c9bbdb637d6d0bfeb5334494051bedef8886237f75b8ad9968f169b43fd30143f622e7e7899cc27f4bc7de9e07eaaa928fa2fd3a917424166f0de7d6e696106517638c4b7bc30f744977aa2bd07f10f1c6bef0dee8cbcaa15b89167d80f82f7525a25ddbbe73eb6ea28577a3dd4c4cbb990d9182b97c57fe2e2c79b34c11c948178e8fb9b6361906f97e66fc6c462d62cf50b956cecc7efa7f7b5dfe584f39a49505f8c37c17b43fa516dc9f0022c097699886f9b81d43ab00135a3dbdab4cd24a4a58f655b41ff71afa777682fec8b26ca416f85b107d115c015f2b98593986d9a0c57f408790fb7d3ece5fe1af58de4dc85b2f226ce1e3ca24ec22df417a9ede661710f3103d06df39ba2c7a21f3308dd2876c396480fd884df3465899181f79f6207a18f3fd0b7a93fe8de5b00a9664e71193cd1fb6e6628fd68f988b90cb5616215b598cc559823d8a9c535ce2ab9135ce8ff0116ef257a4a05ca14caad9ea1a2d862c8c384e7d162a14d93e4b4d18b9853e3797d596bf659c6d67cdac833dce4630878b6c1af201f7f24d5875215f944272bafc63658ff255c8a47a87f6a4ae22b7422a2d21830ae83654e5c718db31e708dd4b0f5af210643fd6f20fe9188dd0d37492c6e825fa4b31265da1b7e943ac4e0644d4b586ad633b214148821d6087b01e03d7c951f61536ce5ec2fc5e656ff0a5a8da9618aab76779903fc1cff257f95ff377f814ff097f5f22c921ed965aa46ee9b8744a7a4d7a4dde228fc84fcb6fc96f294c31ad95ca5673d47bd401c8a0e6d0f66887b42f684f6a2f3a4b6831ea2a465df5b41355f5a192fd748492d6ae8d41ced20b9049fa89a8033293aa44c83a56c36ad91d9020dbc5426c2feb660fcc55f40c7b969d606751cb1b90efb32bec9fd8bfb09f5af22157791e2f9aabaf9137f19d7c0f7f9c7f997f853f871339cecff3eff3b751e314bf8a1ad3a46c2957ba59f24bb59066e92ee901e9a0342abd225d91a6b16fe9f2ed72857c877c0f6abf244fc93fc64e7245520a94d5ca7a4887b24f39a00c284fe1444f2bd36abab52ad9ea2275837a583da68eab6faa1f69b95a9eb60c52a2956b4d5a4cebd54e6953dabbfa6947a5a3d3917016d3292aa36fdef0f4be80d3fd2d7e8f5a4a4bd8159c86cf49198832c4b3c7d3b598a3938f8bd9694d6c3976ea1fe943c9410df225da29dd4531a5454ad3dea313ac5b7e983d27d5d2693aaef5b2f352489a968e2b05ea067b3df913d229ad4f0b69ef62a61f488f291d5a09ab5406d809be094f74826da79fb3abf4fb18b987afa04bf4281d61bda4d3b07e9a2dc0b376912f6503ca57a533f288e4570eb04f63075dcaa4f408ada65c4aa7e5b40c675da11cf10fd7b766ed9adb56ad2c2f2b2df11617adf8f4f25b0b0b6ef12c731b4b6ffed44dae25bf97bf382f376751765666c6c205e9694e87aea98a2c7146c57e4f6dc8300b43a65ce8d9b2c52bda9e300ce1eb0c21d380a9767e8c6984ac30637ea40f916d3744faec48df5c24cb3436d2466fb1e1f718e6dfd4788c09b66b7b00fad11a4fd030a72d7daba5cb855663011a6e377a18fefc8e1ac36421c36fd6f67624fda11ae41b4b73567baaa34e6f318d39d3a0a641336b3d5d63acb682590aaff5af1fe3a42fc0accc7a4f8ddfacf3d488299852813f1c311bb707fc352eb73be82d365975aba7c5244f959951648550b5358ca9569b9a358cd129caa10163acf842727022935a4245e9114f247c77c094c24131465691b9d953636e7e702adf5b3cc19e6d0e988eea0946cd8173543fd33f56d75f531314a36557070e5be18b11bef8c1299794f4e7771aa2994c1e36cc91ed81ebbd6e710f0691d45bdcb023e0c6ac3dfe414394b123605580a42cbf1493143651a65d70d4e31796d0bd86e9f054793a92f786b0594b9226ede8739f5952ef3b37f303aaf71bc9e680c76d6e727982e19a9bc67228b9a36fbcce67d4cdf7788bc732b3ec951e5b989152d2175caf44e77c9666850b0db39e5d6a2666e4a9c311318d56033309784c5eb056dca26b29d9ba1661b8820c2bda89f50b2533d78b8d500a323d46f22ae12078a6df9b6f09a72c6a41e65512aa382e73470efe59dd2c2a3257ac102745abc6d6626615567bb5b7b8d76cf074651a6603968c1a03e8145c5f8a2577bbc52e0f4cf8a8050db37f7bc06e1bd4e23a43bed2a2a0c943c27361d6937b87f0f4cf7ae6ba873c38ce6749bc08e69a7ae1dc5f4666de227fc77a93e57d823b6afbf1f8f88d3159294836060ac3c9015761283918c4d6d4e2514c266b3d466d32940c4fccf4b7788c4c4f72aca121d9e50fcd9634317361c065fa06831d0c8b6aaeb257c35c541d905c3c686bdc2505bd24e6a1955fc3fb671ade11675e73be63cdecfaeb873291f532a702ba4005d53b96d3b0b313b840f55a210d3bced3a8748a2eeaa769545b46a38e8c1476db483b0c0cd2a87e91469d2fd3a8f2251b22568e0397e1c31b8cf645aad74790f31074b7edb720f4cdb003f2388daa01f48fdad01eb521476c8878f565ba7316fa3f236e0b6caf628c17e1770169b0dd06dbc3e05c1a56eb6878762ce53f5298043067f52ed87353f35861cfc5e1432ecc5b433efd1c18f569f7035f407b15789f5dabfe08fadf0e6ea37167111d91b17602b363613deb6fc0da797808310fddb016ffcbc03be0a874d2aed91ae7461cb3f1abe2641137757d0ccb4cf92e43cff8a5b92db0961b6c873f3ef6d783de7203f06eafdbe7b7fc93e054713e557bcfad7d9f9ff7efe7f4efa5906aababe7434fda98f3ffd77cccd9f7d34501b1c7965e09be0ed2156a9572a955df4c115f3ad5d6a286ec2cddb7c598e09f39b36525e8a045ecb44dcfd974d2a613367ddda6afd9f4b44dc76caab3698b4d9b6daab2c96753854d1b6d5a67936a936c936413f36d03bf055c01fe01f81ef02de045e005e01bc028701a38017c1d38063c053c090c0207815660b795f31b76ea519b4ed9f4ac4dc76d7ac6a6a76caab1a9d2a6db6d5a6b9366936213b7897c3ef09bc01bc024f01de0127011f826701618079e0746803f01fa80c89695398e1cc79aa109d6ebabd3869ed6861ed3868e6a43716d28a60db56943516de86e6d68973614d48602da2dfa32ddd06fd66fd297e8f97a9e9ea367eb99fa423d5d77eabaaeeab2ce759c517391d4c01b9aaa588379a1951a5a0cf3e74d9e09e6dcbecb543c55cccc6ea086e6aa7c736d91c98f586f1e136c668cb1cf3fe2122f1de788b199478eba521c0c525ed1ffbcf2e7b51a1afbced352b68634dc578d6b4bbfad096b13ac4396754858872c6b3e3bd3482b1bc203a14f51d1275dace8d7bd98bf5394db1818d3a92a587db7cde33ccd897a422e77b02a2fb3abc22a6e833bff80eb2599f0153b0d9fbde978995b000897b7d25b295cf8c412ae85e23d2fe5ca3fb0c1ed7a899d48b93261cec252e27b253edba47efcaf9750a4c797a1bdcee4d7d9d788e4195266a473ec4744a5d7a633a769d34f712f2f5b95e5ce2a7067b9fb25faa89fd3355226ff736dbf3c293e4b47d979fe919c8e5c397f4e8cafc1d32ab1562498c65f79d922741de58d086afc48fc844385bf1348c56fb5882b9d1e9f7b6fea224ae912e5a365eb32f423295d853e92d2355a47138824d981d60fe8fd94cec86097533aa7856cd62e51199b49e93295f1d294ae42df9dd2354af03fae8e77f5253adb3b7a8c9346f9ba752bbdb8ad36b676b626e2ddf1b61ea33a9ee82a312a6331638788ea367644bba389de68a4c4ee50263a941bcd7d5d51a3291ebbafa733beafbbd8a8dbd7facb7b6dabafafff6c65d1cece7ded11a0dbbb23da7e5f2c9cf84dedcd1d5103c648fcfe6e23166f8f1b9dddf892da930847a27bc3893d46bced8622e289b0985b0955531ccbdd4709eaa476eaa01e7cf53f09946389d7d14af2a6b4d5b06d454c2b22e3d40db459b1a27f02194aa057520c62d08eb95cdd562b0a8e22aa17f78815f98b11cae6462887ad1933e94294414dc81ba3fb90a313da3e642886b50e5aeb6f34d636eb8735f1d35a2515d14e44ef437c24c5dd568f768c13a3307afdaa68efff717c332a13ab614746b012f75b75c6a0b50306eca21d067a101f464c94f65a7df7c02676e993f72d6ef59a5de512fb29fc214ba7523a4a0bf11465425b07f37bf26eebf74ae1e7fd54f777a7ff6c77c6c6abba4bb71ec9e3a38f5d133cf6aaf63ad1b546e73b5ab9f58ca79ef0ff16600052215e9d0a0d0a656e6473747265616d0d656e646f626a0d32372030206f626a0d3c3c2f5374656d5620302f466f6e744e616d652f4f4a4a4a4e412b57696e6764696e67732d526567756c61722f466f6e74537472657463682f4e6f726d616c2f466f6e7446696c6532203236203020522f466f6e74576569676874203430302f466c61677320342f44657363656e74202d3231302f466f6e7442426f785b30202d3231312031333539203839395d2f417363656e74203839382f466f6e7446616d696c792857696e6764696e6773292f43617048656967687420302f547970652f466f6e7444657363726970746f722f4974616c6963416e676c6520303e3e0d656e646f626a0d32382030206f626a0d3c3c2f537562747970652f434944466f6e7454797065322f466f6e7444657363726970746f72203237203020522f42617365466f6e742f4f4a4a4a4e412b57696e6764696e67732d526567756c61722f575b3133315b3435385d5d2f434944546f4749444d61702f4964656e746974792f43494453797374656d496e666f3c3c2f537570706c656d656e7420302f4f72646572696e67284964656e74697479292f52656769737472792841646f6265293e3e2f445720313030302f547970652f466f6e743e3e0d656e646f626a0d32392030206f626a0d3c3c2f5374656d562034322f466f6e744e616d652f436f75726965724e657750534d542f466f6e74537472657463682f4e6f726d616c2f466f6e74576569676874203430302f466c6167732033342f44657363656e74202d3330302f466f6e7442426f785b2d3231202d3638302036333820313032315d2f417363656e74203833322f466f6e7446616d696c7928436f7572696572204e6577292f436170486569676874203537382f58486569676874202d3537382f547970652f466f6e7444657363726970746f722f4974616c6963416e676c6520303e3e0d656e646f626a0d312030206f626a0d3c3c2f43726f70426f785b30203020363132203739325d2f506172656e742036203020522f436f6e74656e74732033203020522f526f7461746520302f4d65646961426f785b30203020363132203739325d2f5265736f75726365732032203020522f547970652f506167653e3e0d656e646f626a0d322030206f626a0d3c3c2f466f6e743c3c2f545432203133203020522f545434203134203020523e3e2f50726f635365745b2f5044462f546578745d2f4578744753746174653c3c2f475331203137203020523e3e3e3e0d656e646f626a0d332030206f626a0d3c3c2f4c656e677468203431302f46696c7465722f466c6174654465636f64653e3e73747265616d0d0a68de6c52cb4eeb3014dce72bced246c4b193348f6529e84a576285d5bb0016c6b88d21c4c84e5af1237ceff5a3bc2494857dce78c673c629fedc30d8bbec826705e73530e0bb8c51424ba0fe4bbbbe2275072ded48db017fc928ecb39c50ca6ae032ee4adf3f66686bc6659a95b2f0cfd867c0fc29a89649b52575d332c819e97b4fbccc3ccf8b7f283451a129fa0ede81b1c243815f918af97bf2f283c13e19abc0b845d7da49358e62c22b52236596b83a389cccc4d2c231381209c31561c89958482de674e611e7a44170d4f300f3a0e0c2bcc18d34cbecc0ec00dff3bf7e726fbfea57d1cd2d5abf28aba5003dc91137a445cb37213dedc1aaa7533f740e6a4a06e680bd2e0fa38ea8c479497a04af09b5cfee1cc4f4e8d9bbc53e6837a4639e23400ee90e1b3825924332c6cf62385d0887a65c9c1c8c19b18f1d0d3e94268cac08ee3d2b71f2dfb34555419b1fd97f8d1c72a75faf9e2eda9809d7debfc35ed1bf402ca2bf161dc4ac4f707a8198eec6c4cee47e390bdb049efe2407eb25a9cf568c5ac01dda6cd777388d70c5b3ff020c007840b3600a0d0a656e6473747265616d0d656e646f626a0d342030206f626a0d3c3c2f4e756d735b302035203020525d3e3e0d656e646f626a0d352030206f626a0d3c3c2f532f443e3e0d656e646f626a0d362030206f626a0d3c3c2f436f756e7420322f547970652f50616765732f4b6964735b3131203020522031203020525d3e3e0d656e646f626a0d372030206f626a0d3c3c2f537562747970652f584d4c2f4c656e67746820333539312f547970652f4d657461646174613e3e73747265616d0d0a3c3f787061636b657420626567696e3d22efbbbf222069643d2257354d304d7043656869487a7265537a4e54637a6b633964223f3e0a3c783a786d706d65746120786d6c6e733a783d2261646f62653a6e733a6d6574612f2220783a786d70746b3d2241646f626520584d5020436f726520342e302d633331362034342e3235333932312c2053756e204f637420303120323030362031373a31343a3339223e0a2020203c7264663a52444620786d6c6e733a7264663d22687474703a2f2f7777772e77332e6f72672f313939392f30322f32322d7264662d73796e7461782d6e7323223e0a2020202020203c7264663a4465736372697074696f6e207264663a61626f75743d22220a202020202020202020202020786d6c6e733a7064663d22687474703a2f2f6e732e61646f62652e636f6d2f7064662f312e332f223e0a2020202020202020203c7064663a50726f64756365723e4163726f6261742044697374696c6c657220382e312e30202857696e646f7773293c2f7064663a50726f64756365723e0a2020202020203c2f7264663a4465736372697074696f6e3e0a2020202020203c7264663a4465736372697074696f6e207264663a61626f75743d22220a202020202020202020202020786d6c6e733a7861703d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f223e0a2020202020202020203c7861703a43726561746f72546f6f6c3e50536372697074352e646c6c2056657273696f6e20352e322e323c2f7861703a43726561746f72546f6f6c3e0a2020202020202020203c7861703a4d6f64696679446174653e323030372d31312d33305431343a34323a34382d30353a30303c2f7861703a4d6f64696679446174653e0a2020202020202020203c7861703a437265617465446174653e323030372d31312d33305431343a34323a34382d30353a30303c2f7861703a437265617465446174653e0a2020202020203c2f7264663a4465736372697074696f6e3e0a2020202020203c7264663a4465736372697074696f6e207264663a61626f75743d22220a202020202020202020202020786d6c6e733a64633d22687474703a2f2f7075726c2e6f72672f64632f656c656d656e74732f312e312f223e0a2020202020202020203c64633a666f726d61743e6170706c69636174696f6e2f7064663c2f64633a666f726d61743e0a2020202020202020203c64633a7469746c653e0a2020202020202020202020203c7264663a416c743e0a2020202020202020202020202020203c7264663a6c6920786d6c3a6c616e673d22782d64656661756c74223e4d6963726f736f667420576f7264202d20526573756dc3a92e646f633c2f7264663a6c693e0a2020202020202020202020203c2f7264663a416c743e0a2020202020202020203c2f64633a7469746c653e0a2020202020202020203c64633a63726561746f723e0a2020202020202020202020203c7264663a5365713e0a2020202020202020202020202020203c7264663a6c693e427269616e3c2f7264663a6c693e0a2020202020202020202020203c2f7264663a5365713e0a2020202020202020203c2f64633a63726561746f723e0a2020202020203c2f7264663a4465736372697074696f6e3e0a2020202020203c7264663a4465736372697074696f6e207264663a61626f75743d22220a202020202020202020202020786d6c6e733a7861704d4d3d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f6d6d2f223e0a2020202020202020203c7861704d4d3a446f63756d656e7449443e757569643a64623434323330312d306337632d343636622d396133322d6163613262376234626236393c2f7861704d4d3a446f63756d656e7449443e0a2020202020202020203c7861704d4d3a496e7374616e636549443e757569643a66376531303438392d303763372d343330642d393166612d3736623961306162336463613c2f7861704d4d3a496e7374616e636549443e0a2020202020203c2f7264663a4465736372697074696f6e3e0a2020203c2f7264663a5244463e0a3c2f783a786d706d6574613e0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a2020202020202020202020202020202020202020202020202020200a3c3f787061636b657420656e643d2277223f3e0d0a656e6473747265616d0d656e646f626a0d382030206f626a0d3c3c2f4372656174696f6e4461746528443a32303037313133303134343234382d303527303027292f417574686f7228427269616e292f43726561746f722850536372697074352e646c6c2056657273696f6e20352e322e32292f50726f6475636572284163726f6261742044697374696c6c657220382e312e30205c2857696e646f77735c29292f4d6f644461746528443a32303037313133303134343234382d303527303027292f5469746c65284d6963726f736f667420576f7264202d20526573756de92e646f63293e3e0d656e646f626a0d787265660d0a3020390d0a3030303030303030303020363535333520660d0a30303030303133383233203030303030206e0d0a30303030303133393439203030303030206e0d0a30303030303134303434203030303030206e0d0a30303030303134353233203030303030206e0d0a30303030303134353537203030303030206e0d0a30303030303134353831203030303030206e0d0a30303030303134363339203030303030206e0d0a30303030303138333037203030303030206e0d0a747261696c65720d0a3c3c2f53697a6520393e3e0d0a7374617274787265660d0a3131360d0a2525454f460d0a, 'ebaily'),
(6, '', 500, NULL, 's');

-- --------------------------------------------------------

--
-- Table structure for table `seeker`
--

CREATE TABLE `seeker` (
  `UName` varchar(50) NOT NULL,
  PRIMARY KEY  (`UName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `seeker`
--

INSERT INTO `seeker` (`UName`) VALUES
('ebaily'),
('s'),
('sallen'),
('tbrittan');

-- --------------------------------------------------------

--
-- Table structure for table `skill`
--

CREATE TABLE `skill` (
  `SSkillID` int(10) NOT NULL auto_increment,
  `SSkillName` varchar(50) NOT NULL,
  PRIMARY KEY  (`SSkillID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `skill`
--

INSERT INTO `skill` (`SSkillID`, `SSkillName`) VALUES
(1, 'C++'),
(2, 'C'),
(3, 'Java'),
(4, 'XML'),
(5, 'Visual Basic'),
(6, 'Cobol'),
(7, 'Informix'),
(8, 'Oracle'),
(9, 'MySQL'),
(10, 'C#'),
(11, '.NET'),
(12, 'HTML'),
(13, 'JavaScript'),
(14, 'Visual Basic'),
(15, 'VB Script'),
(16, 'UNIX'),
(17, 'Java Server Pages'),
(18, 'Active Server Pages'),
(19, 'SyBase'),
(20, 'Python'),
(21, 'Fortran'),
(22, 'Microsoft Word'),
(23, 'Microsoft Access'),
(24, 'Microsoft Project'),
(25, 'Linux'),
(26, 'Pascal'),
(27, 'Assembly'),
(28, 'DBase'),
(29, 'FoxPro'),
(30, 'LISP');

-- --------------------------------------------------------

--
-- Table structure for table `skillset`
--

CREATE TABLE `skillset` (
  `SSkillID` int(10) NOT NULL,
  `ResumeID` int(10) NOT NULL,
  PRIMARY KEY  (`SSkillID`,`ResumeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `skillset`
--

INSERT INTO `skillset` (`SSkillID`, `ResumeID`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(25, 2),
(25, 3),
(26, 3),
(29, 2);

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `StateID` int(50) NOT NULL auto_increment,
  `StateName` varchar(50) NOT NULL,
  `Abbr` varchar(4) NOT NULL,
  PRIMARY KEY  (`StateID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=60 ;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`StateID`, `StateName`, `Abbr`) VALUES
(1, 'ALABAMA', 'AL'),
(2, 'ALASKA', 'AK'),
(3, 'AMERICAN SAMOA', 'AS'),
(4, 'ARIZONA', 'AZ'),
(5, 'ARKANSAS', 'AR'),
(6, 'CALIFORNIA', 'CA'),
(7, 'COLORADO', 'CO'),
(8, 'CONNECTICUT', 'CT'),
(9, 'DELAWARE', 'DE'),
(10, 'DISTRICT OF COLUMBIA', 'DC'),
(11, 'FEDERATED STATES OF MICRONESIA', 'FM'),
(12, 'FLORIDA', 'FL'),
(13, 'GEORGIA', 'GA'),
(14, 'GUAM', 'GU'),
(15, 'HAWAII', 'HI'),
(16, 'IDAHO', 'ID'),
(17, 'ILLINOIS', 'IL'),
(18, 'INDIANA', 'IN'),
(19, 'IOWA', 'IA'),
(20, 'KANSAS', 'KS'),
(21, 'KENTUCKY', 'KY'),
(22, 'LOUISIANA', 'LA'),
(23, 'MAINE', 'ME'),
(24, 'MARSHALL ISLANDS', 'MH'),
(25, 'MARYLAND', 'MD'),
(26, 'MASSACHUSETTS', 'MA'),
(27, 'MICHIGAN', 'MI'),
(28, 'MINNESOTA', 'MN'),
(29, 'MISSISSIPPI', 'MS'),
(30, 'MISSOURI', 'MO'),
(31, 'MONTANA', 'MT'),
(32, 'NEBRASKA', 'NE'),
(33, 'NEVADA', 'NV'),
(34, 'NEW HAMPSHIRE', 'NH'),
(35, 'NEW JERSEY', 'NJ'),
(36, 'NEW MEXICO', 'NM'),
(37, 'NEW YORK', 'NY'),
(38, 'NORTH CAROLINA', 'NC'),
(39, 'NORTH DAKOTA', 'ND'),
(40, 'NORTHERN MARIANA ISLANDS', 'MP'),
(41, 'OHIO', 'OH'),
(42, 'OKLAHOMA', 'OK'),
(43, 'OREGON', 'OR'),
(44, 'PALAU', 'PW'),
(45, 'PENNSYLVANIA', 'PA'),
(46, 'PUERTO RICO', 'PR'),
(47, 'RHODE ISLAND', 'RI'),
(48, 'SOUTH CAROLINA', 'SC'),
(49, 'SOUTH DAKOTA', 'SD'),
(50, 'TENNESSEE', 'TN'),
(51, 'TEXAS', 'TX'),
(52, 'UTAH', 'UT'),
(53, 'VERMONT', 'VT'),
(54, 'VIRGIN ISLANDS', 'VI'),
(55, 'VIRGINIA', 'VA'),
(56, 'WASHINGTON', 'WA'),
(57, 'WEST VIRGINIA', 'WV'),
(58, 'WISCONSIN', 'WI'),
(59, 'WYOMING', 'WY');

-- --------------------------------------------------------

--
-- Table structure for table `university`
--

CREATE TABLE `university` (
  `UniversityID` int(10) NOT NULL auto_increment,
  `UniversityName` varchar(50) NOT NULL,
  PRIMARY KEY  (`UniversityID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=60 ;

--
-- Dumping data for table `university`
--

INSERT INTO `university` (`UniversityID`, `UniversityName`) VALUES
(1, 'Abraham Baldwin Agricultural College'),
(2, 'Agnes Scott College'),
(3, 'Albany State University'),
(4, 'American Academy of Religion'),
(5, 'American InterContinental University'),
(6, 'Andrew College'),
(7, 'Armstrong Atlantic State University'),
(8, 'Art Institute of Atlanta'),
(9, 'Ashworth College'),
(10, 'Atlanta College of Art'),
(11, 'Atlanta Technical Institute'),
(12, 'Augusta State University'),
(13, 'Berry College'),
(14, 'Brenau University'),
(15, 'Brewton-Parker College'),
(16, 'Christian Life School of Theology'),
(17, 'Clark Atlanta University'),
(18, 'Clayton College and State University'),
(19, 'Coastal Georgia Community College'),
(20, 'Columbia Theological Seminary'),
(21, 'Columbus State University'),
(22, 'Columbus Technical College'),
(23, 'Dalton State College'),
(24, 'Darton College'),
(25, 'DeVry University'),
(26, 'East Georgia College'),
(27, 'Emmanuel College'),
(28, 'Emory University'),
(29, 'Flint River Technical College'),
(30, 'Floyd College'),
(31, 'Fort Valley State University'),
(32, 'Gainesville College'),
(33, 'Georgia Baptist College of Nursing'),
(34, 'Georgia College and State University'),
(35, 'Georgia Institute of Technology'),
(36, 'Georgia Military College'),
(37, 'Georgia Perimeter College'),
(38, 'Georgia Southern University'),
(39, 'Georgia Southwestern State University'),
(40, 'Georgia State University'),
(41, 'Gordon College'),
(42, 'John Marshall Law School'),
(43, 'Kennesaw State University'),
(44, 'LaGrange College'),
(45, 'Macon State College'),
(46, 'Medical College of Georgia'),
(47, 'Mercer University'),
(48, 'Middle Georgia College'),
(49, 'Morehouse College'),
(50, 'Oglethorpe University'),
(51, 'Oxford College'),
(52, 'Savannah College of Art and Design'),
(53, 'Savannah State University'),
(54, 'South Georgia Technical College'),
(55, 'Spelman College'),
(56, 'University of Georgia'),
(57, 'Valdosta State University'),
(58, 'Wesleyan College'),
(59, 'University of Connecticut');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UName` varchar(15) NOT NULL,
  `UPasswd` varchar(15) NOT NULL,
  `UFName` varchar(50) NOT NULL,
  `ULName` varchar(50) NOT NULL,
  `UStreet1` varchar(100) NOT NULL,
  `UStreet2` varchar(100) default NULL,
  `UCity` varchar(100) NOT NULL,
  `StateID` int(50) NOT NULL,
  `Zipcode` varchar(5) NOT NULL,
  `UEmail` varchar(100) NOT NULL,
  `UPhone` varchar(10) NOT NULL,
  `UFax` varchar(10) default NULL,
  `UCell` varchar(10) default NULL,
  `UHomePage` varchar(200) default NULL,
  `UStatusID` varchar(5) NOT NULL,
  PRIMARY KEY  (`UName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UName`, `UPasswd`, `UFName`, `ULName`, `UStreet1`, `UStreet2`, `UCity`, `StateID`, `Zipcode`, `UEmail`, `UPhone`, `UFax`, `UCell`, `UHomePage`, `UStatusID`) VALUES
('a', 'a', 'admin', 'dude', '', 'street', 'city', 1, '6279', 'admin@google.com', 'phone', 'fax', 'cell', 'homepage', '1'),
('bfry', 'poster01', 'Barbara', 'Fry', 'P.O. Box 92957', '', 'Los Angeles', 6, '90009', 'bfry@sra.com', '', '', '', '', ''),
('bob', 'bob', 'Bob', 'Bob', 'a', 'N/A', 'a', 26, '12122', 'abc@abc', 'N/A', 'N/A', 'N/A', 'wwww.test.com', '0'),
('dlewis', 'poster02', 'Duane ', 'Lewis', '123 Anywhere Street', '', 'Atlanta', 13, '30123', 'dlewis@ey.com', '', '', '', '', ''),
('ebaily', 'seeker01', 'Eric', 'Bailey', '2345 James Avenue', '', 'Los Angeles', 6, '90009', 'ebaily@needjob.com', '', '', '', '', ''),
('ncooper', 'poster03', 'Nathalie', 'Cooper', '456 Nowhere Street', '', 'Atlanta', 13, '33219', 'ncooper@gatech.edu', '8601', '', '', '', ''),
('p', 'p', 'the', 'poster', 'street', 'N/A', 'abc', 12, '12', 'asds', 'N/A', 'N/A', 'N/A', '', '0'),
('post', 'post', 'Mr', 'Poster', 'Addr', 'N/A', 'Cty', 4, '01011', 'poster@poster.com', 'N/A', 'N/A', 'N/A', 'www.dsa.com', '0'),
('sallen', 'seeker03', 'Susan', 'Allen', '231 Tech Lane', '', 'Atlanta', 13, '33219', 'sallen@needjob.com', '', '', '', '', ''),
('tbrittan', 'seeker02', 'Tyrone', 'Brittan', '3321 Old Peachtree Road', '', 'Doraville', 13, '30123', 'tbrittan@needjob.com', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `ustatus`
--

CREATE TABLE `ustatus` (
  `UStatusID` int(5) NOT NULL auto_increment,
  `Name` varchar(100) NOT NULL,
  PRIMARY KEY  (`UStatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ustatus`
--

