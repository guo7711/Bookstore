-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 17, 2014 at 12:01 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bookstore`
--
CREATE DATABASE IF NOT EXISTS `bookstore` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `bookstore`;

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE IF NOT EXISTS `book` (
  `ISBN` varchar(50) NOT NULL,
  `Name` text NOT NULL,
  `Author` varchar(50) NOT NULL,
  `Version` varchar(50) DEFAULT NULL,
  `Introduction` text,
  `Publish` varchar(50) DEFAULT NULL,
  `Price` varchar(50) NOT NULL,
  `image` text NOT NULL,
  `Sales` int(4) NOT NULL,
  `Stock` int(4) NOT NULL,
  `Catelog` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`ISBN`, `Name`, `Author`, `Version`, `Introduction`, `Publish`, `Price`, `image`, `Sales`, `Stock`, `Catelog`) VALUES
('978-0071791236', 'The Official Guide to the GRE Revised General Test\r\n', 'Educational Testing Service', '2nd Edition (August 7, 2012)', 'If you''re looking for the best, most authoritative guide to the GRE revised General Test, you''ve found it! The Official Guide to the GRE revised General Test is the only GRE guide specially created by ETS--the people who actually make the test. It''s packed with everything you need to do your best on the test--and move toward your graduate or business school degree.', 'McGraw-Hill', '$19.61', './images/books/The Official Guide to the GRE Revised General Test, 2nd Edition.jpeg', 3, 20, 'Education'),
('978-0071794312', 'Web Developer''s Cookbook', 'Robin Nixon', '1 Edition (March 27, 2012)', 'The Web Developers Cookbook offers a comprehensive suite of over 300 ready-to-use solutions for PHP, JavaScript, and CSS - the most commonly used and most versatile open-source languages currently used for Web development.', 'McGraw-Hill Osborne Media', '$33.07', './images/books/Web Developer''s Cookbook.jpeg', 26, 1, 'Computer-Technology'),
('978-0132613163', 'Educational Psychology (12th Edition)\r\n', 'Anita Woolfolk', '12 Edition (January 15, 2012)', 'The 12th Edition of Educational Psychology maintains the lucid writing style for which the author is renowned.  It is as free of jargon and technical language as possible in order to be clear, relevant, and interesting to all readers.  Theory and practice are not separated in the text, but are considered together.  The book shows very clearly how information and ideas drawn from research in educational psychology can be applied to solve the everyday problems of teaching. Readers explore the connections between research and practice through a wealth of examples, lesson segments, case studies, guidelines, and  practical tips from experienced teachers. The content reveals the immense value and usefulness of educational psychology, a field that offers unique and crucial knowledge to any who dare to teach and to all who love to learn.', 'Pearson', '$151.55', './images/books/Educational Psychology (12th Edition).jpeg', 7, 5, 'Education'),
('978-0142415436', 'If I Stay', 'Gayle Forman', 'Reprint Edition (April 6, 2010)', 'In the blink of an eye everything changes. Seventeen ­year-old Mia has no memory of the accident; she can only recall what happened afterwards, watching her own damaged body being taken from the wreck. Little by little she struggles to put together the pieces- to figure out what she has lost, what she has left, and the very difficult choice she must make. Heartwrenchingly beautiful, this will change the way you look at life, love, and family. Now a major motion picture starring Chloe Grace Moretz, Mia''s story will stay with you for a long, long time.', 'Speak', '$6.01', './images/books/If I Stay.jpeg', 2, 18, 'Literature'),
('978-0143125471', 'The Boys in the Boat', 'Daniel James Brown', 'Reprint Edition (May 27, 2014)', 'The #1 New York Times–bestselling story about American Olympic triumph in Nazi Germany', 'Penguin Books', '$10.2', './images/books/The Boys in the Boat Nine Americans and Their Epic Quest for Gold at the 1936 Berlin Olympics.jpeg', 15, 5, 'Sports'),
('978-0262033848', 'Introduction to Algorithms, 3rd Edition\r\n', 'Thomas H. Cormen', '3rd Edition (July 31, 2009)', 'Some books on algorithms are rigorous but incomplete; others cover masses of material but lack rigor. Introduction to Algorithms uniquely combines rigor and comprehensiveness. The book covers a broad range of algorithms in depth, yet makes their design and analysis accessible to all levels of readers. Each chapter is relatively self-contained and can be used as a unit of study. The algorithms are described in English and in a pseudocode designed to be readable by anyone who has done a little programming. The explanations have been kept elementary without sacrificing depth of coverage or mathematical rigor.The first edition became a widely used text in universities worldwide as well as the standard reference for professionals. The second edition featured new chapters on the role of algorithms, probabilistic analysis and randomized algorithms, and linear programming. The third edition has been revised and updated throughout. It includes two completely new chapters, on van Emde Boas trees and multithreaded algorithms, substantial additions to the chapter on recurrence (now called "Divide-and-Conquer"), and an appendix on matrices. It features improved treatment of dynamic programming and greedy algorithms and a new notion of edge-based flow in the material on flow networks. Many new exercises and problems have been added for this edition. As of the third edition, this textbook is published exclusively by the MIT Press.', 'The MIT Press', '$76.66', './images/books/Introduction to Algorithms, 3rd Edition.jpeg', 7, 3, 'Computer-Technology'),
('978-0262731423', 'The Idea Factory: Learning to Think at MIT\r\n', 'Pepper White', 'Reprint Edition (October 1, 2001)', 'This is a personal story of the educational process at one of the world''s great technological universities. Pepper White entered MIT in 1981 and received his master''s degree in mechanical engineering in 1984. His account of his experiences, written in diary form, offers insight into graduate school life in general--including the loneliness and even desperation that can result from the intense pressure to succeed--and the purposes of engineering education in particular. The first professor White met at MIT told him that it did not really matter what he learned there, but that MIT would teach him how to think. This, then, is the story of how one student learned how to think. There have of course been changes at MIT since 1984, but its essence is still the same. White has added a new preface and concluding chapter to this edition to bring the story of his continuing education up to date.', 'The MIT Press', '$16.62', './images/books/The Idea Factory- Learning to Think at MIT.jpeg', 1, 10, 'Education'),
('978-0345535528', 'A Game of Thrones 5-Book Boxed Set', 'George R.R. Martin', 'Box Mti Edition (October 29, 2013)', 'For the first time, all five novels in the epic fantasy series that inspired HBO’s Game of Thronesare together in one boxed set. An immersive entertainment experience unlike any other, A Song of Ice and Fire has earned George R. R. Martin—dubbed “the American Tolkien” by Timemagazine—international acclaim and millions of loyal readers. ', 'Bantam', '$29.81', './images/books/A Game of Thrones 5-Book Boxed Set.jpeg', 15, 3, 'Literature'),
('978-0375842207', 'The Book Thief', 'Markus Zusak', 'Reprint Edition (September 11, 2007)', 'The extraordinary #1 New York Times bestseller that is now a major motion picture, Markus Zusak''s unforgettable story is about the ability of books to feed the soul.', 'Alfred A. Knopf', '$8.52', './images/books/The Book Thief.jpeg ', 12, 6, 'Literature'),
('978-0399167065', 'Big Little Lies', 'Liane Moriarty', 'Putnam (July 29, 2014)', '"A surefire hit... The Aussie author of last year''s runaway hit The Husband’s Secretcomes back with another winning and wise novel that intertwines the lives of three women." -Entertainment Weekly', 'Amy Einhorn Books', '$16.16', './images/books/Big Little Lies.jpeg', 5, 25, 'Literature'),
('978-0415690157', 'Visible Learning for Teachers: Maximizing Impact on Learning', 'John Hattie', '1 Edition (December 13, 2011)', 'In November 2008, John Hattie’s ground-breaking book Visible Learning synthesised the results of more than fifteen years research involving millions of students and represented the biggest ever collection of evidence-based research into what actually works in schools to improve learning.', 'Routledge', '$44.14', './images/books/Visible Learning for Teachers- Maximizing Impact on Learning.jpeg', 0, 24, 'Education'),
('978-0470825211', 'The Principles of Banking', 'Moorad Choudhry', 'First Edition (May 29, 2012)', 'The ultimate guide for bank management: how to survive and thrive throughout the business cycle', 'Wiley', '$72.36', './images/books/The Principles of Banking.jpeg', 4, 8, 'Finance'),
('978-0545162074', 'Harry Potter Paperback Box Set (Books 1-7)\r\n', 'J. K. Rowling', 'Slp Edition (July 7, 2009)', 'Now for the first time ever, J.K. Rowling’s seven bestselling Harry Potter books are available in a stunning paperback boxed set! The Harry Potter series has been hailed as “one for the ages” by Stephen King and “a spellbinding saga’ by USA Today. And most recently, The New York Timescalled Harry Potter and the Deathly Hallows the “fastest selling book in history.” This is the ultimate Harry Potter collection for Harry Potter fans of all ages!', 'Arthur A. Levine Books', '$50.85', './images/books/Harry Potter Paperback Box Set (Books 1-7).jpeg\r\n', 10, 10, 'Literature'),
('978-0596009205', 'Head First Java, 2nd Edition\r\n', 'Kathy Sierra', '2nd Edition (February 9, 2005)', 'Learning a complex new language is no easy task especially when it s an object-oriented computer programming language like Java. You might think the problem is your brain. It seems to have a mind of its own, a mind that doesn''t always want to take in the dry, technical stuff you''re forced to study.\r\n', 'O''Reilly Media', '$26.07', './images/books/Head First Java, 2nd Edition.jpeg', 25, -5, 'Computer-Technology'),
('978-0674430006', 'Capital in the Twenty-First Century', 'Thomas Piketty', 'First Edition (March 10, 2014)', 'What are the grand dynamics that drive the accumulation and distribution of capital? Questions about the long-term evolution of inequality, the concentration of wealth, and the prospects for economic growth lie at the heart of political economy. But satisfactory answers have been hard to find for lack of adequate data and clear guiding theories. In Capital in the Twenty-First Century,Thomas Piketty analyzes a unique collection of data from twenty countries, ranging as far back as the eighteenth century, to uncover key economic and social patterns. His findings will transform debate and set the agenda for the next generation of thought about wealth and inequality.', 'Belknap Press', '$23.97', './images/books/Capital in the Twenty-First Century.jpeg', 10, 15, 'Finance'),
('978-0738535227', 'University of Pennsylvania (PA) (Campus History Series)', 'Amey A. Hutchins', '', '', 'Arcadia Publishing (July 26, 2004)', '$17.22', './images/books/University of Pennsylvania (PA) (Campus History Series).jpg', 0, 20, 'Education'),
('978-0802144652', 'The House of Morgan', 'Ron Chernow', NULL, '*Winner of the National Book Award and now considered a classic, The House of Morgan is the most ambitious history ever written about an American banking dynasty. Acclaimed by the Wall Street Journal as ''''brilliantly researched and written,'''' the book tells the rich, panoramic story of four generations of Morgans and the powerful, secretive firms they spawned. It is the definitive account of the rise of the modern financial world. A gripping history of banking and the booms and busts that shaped the world on both sides of the Atlantic, The House of Morgan traces the trajectory of the J. P. Morgan empire from its obscure beginnings in Victorian London to the crash of 1987. Ron Chernow paints a fascinating portrait of the private saga of the Morgans and the rarefied world of the American and British elite in which they moved. Based on extensive interviews and access to the family and business archives, The House of Morgan is an investigative masterpiece, a compelling account of a remarkable institution and the men who ran it, and an essential book for understanding the money and power behind the major historical events of the last 150 years.', 'Grove Press', '$13.7', './images/books/The House of Morgan- An American Banking Dynasty and the Rise of Modern Finance.jpeg', 19, 1, 'Finance'),
('978-0804138598', 'Stress Test: Reflections on Financial Crises', 'Timothy F. Geithner', 'First Edition (May 29, 2012)', 'As president of the Federal Reserve Bank of New York and then as President Barack Obama’s secretary of the Treasury, Timothy F. Geithner helped the United States navigate the worst financial crisis since the Great Depression, from boom to bust to rescue to recovery. In a candid, riveting, and historically illuminating memoir, he takes readers behind the scenes of the crisis, explaining the hard choices and politically unpalatable decisions he made to repair a broken financial system and prevent the collapse of the Main Street economy. This is the inside story of how a small group of policy makers—in a thick fog of uncertainty, with unimaginably high stakes—helped avoid a second depression but lost the American people doing it. Stress Test is also a valuable guide to how governments can better manage financial crises, because this one won’t be the last.', 'Crown', '$23.82', './images/books/Stress Test- Reflections on Financial Crises.jpeg', 10, 3, 'Finance'),
('978-1416503460', 'Soul Surfer', 'Bethany Hamilton', 'Reprint Edition (June 6, 2006)', 'They say Bethany Hamilton has saltwater in her veins. How else could one explain the passion that drives her to surf? How else could one explain that nothing—not even the loss of her arm—could come between her and the waves? That Halloween morning in Kauai, Hawaii, Bethany responded to the shark’s stealth attack with the calm of a girl with God on her side. Pushing pain and panic aside, she began to paddle with one arm, focusing on a single thought: “Get to the beach....” And when the first thing Bethany wanted to know after surgery was “When can I surf again?” it became clear that her spirit and determination were part of a greater story—a tale of courage and faith that this soft-spoken girl would come to share with the world. ', 'MTV Books', '$8.48', './images/books/Soul Surfer- A True Story of Faith, Family, and Fighting to Get Back on the Board.jpeg', 0, 20, 'Sports'),
('978-1449330729', 'Think Python', 'Allen B. Downey', '1 Edition (August 23, 2012)', 'If you want to learn how to program, working with Python is an excellent way to start. This hands-on guide takes you through the language one step at a time, beginning with basic programming concepts before moving on to functions, recursion, data structures, and object-oriented design.', 'O''Reilly Media', '$33.74', './images/books/Think Python.jpeg', 15, 2, 'Computer-Technology'),
('978-1500628024', 'Football Outsiders Almanac 2014', 'Aaron Schatz', NULL, 'The most authoritative and innovative guide to professional football (previously known as "Pro Football Prospectus") is back for an all-new season with more cutting-edge statistical analysis, obsessive film study, and trademark humor. Includes comprehensive coverage of all 32 NFL teams, analysis of offseason personnel changes, over 500 KUBIAK fantasy football projections, and breakdowns of every team from the five major college football conferences plus the top independent and mid-major college teams. With numerous statistical measures that go far beyond standard NFL stats, Football Outsiders Almanac 2014 gives NFL fans the kind of sabermetric-like statistical analysis that revolutionized the fan''s understanding of baseball. It''s also written with a knowing dry wit that gets under the skin of America''s most popular spectator sport.', 'CreateSpace Independent Publishing Platform', '$17.87', './images/books/Football Outsiders Almanac 2014- The Essential Guide to the 2014 NFL and College Football Seasons.jpeg', 10, 10, 'Sports'),
('978-1591845324', 'Leaders Eat Last: Why Some Teams Pull Together and Others Don’t', 'Simon Sinek', 'First Edition (January 7, 2014)', 'Why do only a few people get to say “I love my job”? It seems unfair that finding fulfillment at work is like winning a lottery; that only a few lucky ones get to feel valued by their organizations, to feel like they belong.', 'Portfolio Hardcover', '$16.41', './images/books/Leaders Eat Last- Why Some Teams Pull Together and Others Don’t.jpeg', 54, -4, 'Finance'),
('978-1593274245', 'Think Like a Programmer', 'V. Anton Spraul ', '1 edition (August 11, 2012)', 'Examples in this book are written in C++, but will improve your ability to think like a programmer in any language.', 'No Starch Press', '$25.09', './images/books/Think Like a Programmer- An Introduction to Creative Problem Solving.jpeg', 8, 12, 'Computer-Technology'),
('978-1596950962', 'Webster''s Spanish-English Dictionary for Students (Spanish Edition)', 'Merriam-Webster', 'Bilingual edition (May 1, 2010)', '', 'Federal Street Press', '$4.04', './images/books/Webster''s Spanish-English Dictionary for Students (Spanish Edition).jpg', 0, 20, 'Education'),
('978-1616285456', 'Surf: 100 Greatest Waves', 'Casey Koteen', 'First Edition (May 12, 2014)', 'In this book, Transworld SURF’s expert editors and photographers visit the 100 best surf spots on Earth to bring you insider information on beaches everywhere from Australia and California to emerging destinations in West Africa, Japan, Norway and beyond. Packed with amazing photos, pro tips, and travel details, this is the book you need--whether you’re planning a lifetime of trips, or the trip of a lifetime.', 'Weldon Owen', '$27.46', './images/books/Surf- 100 Greatest Waves.jpeg', 10, 5, 'Sports'),
('978-1618656230', 'GRE Premier 2015 with 6 Practice Tests', 'Kaplan', 'Pap/Psc/Dv edition (June 3, 2014)', 'Kaplan''s GRE Premier 2015 is a comprehensive prep system that includes both book and mobile-enabled online components. Get access to in-depth strategies, test information, and practice questions to help you score higher on the GRE.  ', 'Kaplan Publishing', '$29.69', './images/books/GRE Premier 2015 with 6 Practice Tests- Book + DVD + Online + Mobile (Kaplan Test Prep).jpeg', 5, 10, 'Education'),
('978-1937715212', 'Swim Speed Strokes for Swimmers and Triathletes', 'Sheila Taormina', NULL, 'In her best-selling book Swim Speed Secrets, 4-time Olympian and gold medalist Sheila Taormina revealed the freestyle swimming technique used by the world’s fastest swimmers.', 'VeloPress ', '$16.07', './images/books/Swim Speed Strokes for Swimmers and Triathletes- Master Butterfly, Backstroke, Breaststroke, and Freestyle for Your Fastest Swimming (Swim Speed Series).jpeg', 5, 15, 'Sports');

-- --------------------------------------------------------

--
-- Table structure for table `favorite`
--

CREATE TABLE IF NOT EXISTS `favorite` (
  `UserName` varchar(50) NOT NULL,
  `ISBN` varchar(50) NOT NULL,
  PRIMARY KEY (`UserName`,`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `favorite`
--

INSERT INTO `favorite` (`UserName`, `ISBN`) VALUES
('yguo007@ucr.edu', '978-0071794312'),
('yguo007@ucr.edu', '978-0142415436'),
('yguo007@ucr.edu', '978-0596009205');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `UserName` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Privilege` int(4) NOT NULL,
  PRIMARY KEY (`UserName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`UserName`, `Password`, `Privilege`) VALUES
('hannah.yhg@gmail.com', 'hannah', 2),
('schen064@ucr.edu', 'sean', 1),
('vagelis@cs.ucr.edu', 'vagelis', 1),
('yguo007@ucr.edu', 'guo', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orderbook`
--

CREATE TABLE IF NOT EXISTS `orderbook` (
  `ISBN` varchar(50) NOT NULL,
  `Amount` int(4) NOT NULL,
  `OrderID` varchar(50) NOT NULL,
  PRIMARY KEY (`ISBN`,`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderbook`
--

INSERT INTO `orderbook` (`ISBN`, `Amount`, `OrderID`) VALUES
('978-0071794312', 1, '20140810001'),
('978-0071794312', 1, '20140812001'),
('978-0071794312', 1, '20140812002'),
('978-0071794312', 2, '20140812105153001'),
('978-0142415436', 1, '20140812105153001'),
('978-0262033848', 1, '20140814105248001'),
('978-0262033848', 1, '20140814105306002'),
('978-0262033848', 1, '20140814105421003'),
('978-0262033848', 1, '20140814105728004'),
('978-0470825211', 1, '20140814105248001'),
('978-0470825211', 1, '20140814105306002'),
('978-0470825211', 1, '20140814105421003'),
('978-0470825211', 1, '20140814105728004'),
('978-0596009205', 1, '20140812001'),
('978-0596009205', 1, '20140812002'),
('978-0596009205', 1, '20140812105153001'),
('978-1591845324', 1, '20140812001'),
('978-1591845324', 1, '20140812002');

-- --------------------------------------------------------

--
-- Table structure for table `orderuser`
--

CREATE TABLE IF NOT EXISTS `orderuser` (
  `OrderID` varchar(50) NOT NULL,
  `UserName` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `totalPrice` varchar(50) NOT NULL,
  PRIMARY KEY (`OrderID`,`UserName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderuser`
--

INSERT INTO `orderuser` (`OrderID`, `UserName`, `state`, `totalPrice`) VALUES
('20140812001', 'yguo007@ucr.edu', 'Dlivered', '75.55'),
('20140812002', 'yguo007@ucr.edu', 'Dlivered', '75.55'),
('20140812105153001', 'yguo007@ucr.edu', 'In Process', '98.22'),
('20140814105248001', 'yguo007@ucr.edu', 'In Process', '149.02'),
('20140814105306002', 'yguo007@ucr.edu', 'In Process', '149.02'),
('20140814105421003', 'yguo007@ucr.edu', 'In Process', '149.02'),
('20140814105728004', 'yguo007@ucr.edu', 'In Process', '149.02');

-- --------------------------------------------------------

--
-- Table structure for table `shopcart`
--

CREATE TABLE IF NOT EXISTS `shopcart` (
  `UserName` varchar(50) NOT NULL,
  `ISBN` varchar(50) NOT NULL,
  `Number` int(4) NOT NULL,
  PRIMARY KEY (`UserName`,`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userinfo`
--

CREATE TABLE IF NOT EXISTS `userinfo` (
  `UserName` varchar(50) NOT NULL,
  `Sex` char(10) DEFAULT NULL,
  `Password` varchar(50) NOT NULL,
  `RealName` varchar(50) DEFAULT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `MailCode` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`UserName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userinfo`
--

INSERT INTO `userinfo` (`UserName`, `Sex`, `Password`, `RealName`, `Phone`, `Address`, `MailCode`) VALUES
('hannah.yhg@gmail.com', 'Female', 'hannah', 'Hannah Guo', '', NULL, NULL),
('schen064@ucr.edu', '', 'sean', '', '', '', ''),
('vagelis@cs.ucr.edu', '', 'vagelis', '', '', '', ''),
('yguo007@ucr.edu', 'Female', 'guo', 'Yuhang Guo', '(951)452-8419', '4026 Mt Vernon Ave, Riverside, CA', '92507');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
