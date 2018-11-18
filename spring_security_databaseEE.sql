DROP DATABASE  IF EXISTS `spring_security_database_ee`;

CREATE DATABASE  IF NOT EXISTS `spring_security_database_ee`;
USE `spring_security_database_ee`;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` char(68) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/* password: test123 for all users, */

INSERT INTO `users` 
VALUES 
('md','{bcrypt}$2a$04$J1wAyPpk7Z5Hgv8zQL2t7OUrvpMxL3AaxNKoGn66bMkFMJ/8LbcjW',1),
('fs','{bcrypt}$2a$04$J1wAyPpk7Z5Hgv8zQL2t7OUrvpMxL3AaxNKoGn66bMkFMJ/8LbcjW',1),
('ak','{bcrypt}$2a$04$J1wAyPpk7Z5Hgv8zQL2t7OUrvpMxL3AaxNKoGn66bMkFMJ/8LbcjW',1),
('dc','{bcrypt}$2a$04$J1wAyPpk7Z5Hgv8zQL2t7OUrvpMxL3AaxNKoGn66bMkFMJ/8LbcjW',1);



--
-- Table structure for table `authorities`
--

DROP TABLE IF EXISTS `authorities`;
CREATE TABLE `authorities` (
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL,
  UNIQUE KEY `authorities_idx_1` (`username`,`authority`),
  CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `authorities`
--

INSERT INTO `authorities` 
VALUES 
('md','ROLE_ADMIN'),
('fs','ROLE_CMA'),
('ak','ROLE_CMA'),
('dc','ROLE_CMA');





