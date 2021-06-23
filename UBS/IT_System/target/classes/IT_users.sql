DROP DATABASE  IF EXISTS `IT_users`;

CREATE DATABASE  IF NOT EXISTS `IT_users`;
USE `IT_users`;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` char(80) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--
-- NOTE: The passwords are encrypted using BCrypt
--
-- A generation tool is avail at: http://www.luv2code.com/generate-bcrypt-password
--
-- Default passwords here are: parola
--

INSERT INTO `user` (username, password, first_name, last_name, email)
VALUES 
('18011078','$2a$10$5DDFBMsOvPO5mti8H2IyQ.LnsD4taK4gv2eImULPfDeYb4iOdjzke','onur','demir','onur@email.com'),
('19011624','$2a$10$5DDFBMsOvPO5mti8H2IyQ.LnsD4taK4gv2eImULPfDeYb4iOdjzke','ugur','cakil','ugur@email.com'),
('17011057','$2a$10$5DDFBMsOvPO5mti8H2IyQ.LnsD4taK4gv2eImULPfDeYb4iOdjzke','tarik','aytek','tarik@email.com'),
('17011020','$2a$10$5DDFBMsOvPO5mti8H2IyQ.LnsD4taK4gv2eImULPfDeYb4iOdjzke','gufran','kanat','gufran@email.com'),
('18011078','$2a$10$5DDFBMsOvPO5mti8H2IyQ.LnsD4taK4gv2eImULPfDeYb4iOdjzke','gyrath','moosa','gyrath@email.com');


--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `role` (name)
VALUES 
('ROLE_CUSTOMER_CHATTER'),('ROLE_CUSTOMER_TRACKER'),('ROLE_ADMIN');

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;

CREATE TABLE `users_roles` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  
  PRIMARY KEY (`user_id`,`role_id`),
  
  KEY `FK_ROLE_idx` (`role_id`),
  
  CONSTRAINT `FK_USER_05` FOREIGN KEY (`user_id`) 
  REFERENCES `user` (`id`) 
  ON DELETE NO ACTION ON UPDATE NO ACTION,
  
  CONSTRAINT `FK_ROLE` FOREIGN KEY (`role_id`) 
  REFERENCES `role` (`id`) 
  ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

SET FOREIGN_KEY_CHECKS = 1;

--
-- Dumping data for table `users_roles`
--

INSERT INTO `users_roles` (user_id,role_id)
VALUES 
(1, 3),
(2, 3),
(3, 3),
(4, 3),
(5, 3)