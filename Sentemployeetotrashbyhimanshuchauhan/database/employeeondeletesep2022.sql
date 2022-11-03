-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 09, 2022 at 05:43 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `employeeondeletesep2022`
--

-- --------------------------------------------------------

--
-- Table structure for table `employeemaster`
--

CREATE TABLE `employeemaster` (
  `Id` int(11) NOT NULL,
  `EmpCode` varchar(10) NOT NULL,
  `FirstName` varchar(10) NOT NULL,
  `LastName` varchar(10) NOT NULL,
  `Department` varchar(10) NOT NULL,
  `Designation` varchar(10) NOT NULL,
  `Phone` varchar(10) NOT NULL,
  `Status` int(1) NOT NULL DEFAULT 0 COMMENT '0 means active, 1 means inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employeemaster`
--

INSERT INTO `employeemaster` (`Id`, `EmpCode`, `FirstName`, `LastName`, `Department`, `Designation`, `Phone`, `Status`) VALUES
(8, 'UBI008', 'Himanshu', 'Chauhan', 'Technical', 'Programmer', '12121212', 1),
(9, 'UBI009', 'punit', 'sharma', 'account', 'data enter', '10101010', 0),
(10, 'UBI0010', 'Aman', 'jain', 'Technical', 'lead', '454545', 0),
(11, 'UBI0011', 'Amit', 'pal', 'Technical', 'tester', '858585', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ondeleteemployeemaster`
--

CREATE TABLE `ondeleteemployeemaster` (
  `Id` int(11) NOT NULL DEFAULT 0,
  `EmpCode` varchar(10) NOT NULL,
  `FirstName` varchar(10) NOT NULL,
  `LastName` varchar(10) NOT NULL,
  `Department` varchar(10) NOT NULL,
  `Designation` varchar(10) NOT NULL,
  `Phone` varchar(10) NOT NULL,
  `Status` int(1) NOT NULL DEFAULT 0 COMMENT '0 means active, 1 means inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ondeleteemployeemaster`
--

INSERT INTO `ondeleteemployeemaster` (`Id`, `EmpCode`, `FirstName`, `LastName`, `Department`, `Designation`, `Phone`, `Status`) VALUES
(5, 'UBI005', 'Rod', 'Knee', 'Management', 'Assistant ', '8746320891', 0),
(7, 'UBI007', 'Willie', 'Clowd', 'Technical', 'Developer', '4258963248', 1),
(12, 'UBI0012', 'shakti', 'sharma', 'Technical', 'lead', '565656', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employeemaster`
--
ALTER TABLE `employeemaster`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `EmpCode` (`EmpCode`);

--
-- Indexes for table `ondeleteemployeemaster`
--
ALTER TABLE `ondeleteemployeemaster`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employeemaster`
--
ALTER TABLE `employeemaster`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
