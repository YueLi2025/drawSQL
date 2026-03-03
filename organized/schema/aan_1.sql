DROP TABLE IF EXISTS `Affiliation`;
CREATE TABLE `Affiliation` (
  `affiliation_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`affiliation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
LOCK TABLES `Affiliation` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Author`;
CREATE TABLE `Author` (
  `author_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
LOCK TABLES `Author` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Author_list`;
CREATE TABLE `Author_list` (
  `paper_id` varchar(25) NOT NULL,
  `author_id` int(11) NOT NULL,
  `affiliation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`paper_id`,`author_id`),
  KEY `author_id` (`author_id`),
  KEY `affiliation_id` (`affiliation_id`),
  CONSTRAINT `Author_list_ibfk_1` FOREIGN KEY (`paper_id`) REFERENCES `Paper` (`paper_id`),
  CONSTRAINT `Author_list_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `Author` (`author_id`),
  CONSTRAINT `Author_list_ibfk_3` FOREIGN KEY (`affiliation_id`) REFERENCES `Affiliation` (`affiliation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
LOCK TABLES `Author_list` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Citation`;
CREATE TABLE `Citation` (
  `paper_id` varchar(25) NOT NULL,
  `cited_paper_id` varchar(25) NOT NULL,
  PRIMARY KEY (`paper_id`,`cited_paper_id`),
  KEY `cited_paper_id` (`cited_paper_id`),
  CONSTRAINT `Citation_ibfk_1` FOREIGN KEY (`paper_id`) REFERENCES `Paper` (`paper_id`),
  CONSTRAINT `Citation_ibfk_2` FOREIGN KEY (`cited_paper_id`) REFERENCES `Paper` (`paper_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
LOCK TABLES `Citation` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Paper`;
CREATE TABLE `Paper` (
  `paper_id` varchar(25) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `venue` varchar(255) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  PRIMARY KEY (`paper_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
LOCK TABLES `Paper` WRITE;
UNLOCK TABLES;
