# Host: localhost  (Version 5.5.5-10.4.11-MariaDB)
# Date: 2020-09-27 19:31:26
# Generator: MySQL-Front 6.0  (Build 2.20)


#
# Structure for table "list-friend"
#

DROP TABLE IF EXISTS `list-friend`;
CREATE TABLE `list-friend` (
  `id_list_friend` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `id_roomchat` int(11) NOT NULL,
  PRIMARY KEY (`id_list_friend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# Data for table "list-friend"
#


#
# Structure for table "messages"
#

DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_roomchat` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `message_crated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# Data for table "messages"
#


#
# Structure for table "room_chat"
#

DROP TABLE IF EXISTS `room_chat`;
CREATE TABLE `room_chat` (
  `id_roomchat` int(11) NOT NULL AUTO_INCREMENT,
  `room_chat` int(11) NOT NULL,
  `roomchat_crated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_roomchat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# Data for table "room_chat"
#


#
# Structure for table "users"
#

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_fullname` varchar(100) NOT NULL,
  `user_email` varchar(150) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_image` varchar(100) NOT NULL,
  `user_phone` char(13) NOT NULL,
  `user_bio` varchar(255) NOT NULL,
  `user_status` int(1) NOT NULL,
  `user_key` int(11) NOT NULL,
  `user_lat` varchar(255) NOT NULL,
  `user_lng` varchar(255) NOT NULL,
  `user_created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

#
# Data for table "users"
#

INSERT INTO `users` VALUES (1,'Bagas','bagasafrz7@gmail.com','$2b$10$bxGOBAdU0x6B86H8MiMnkuoh6g1o2DjQ92AWOcE9Oko6viSdIspem','bagass_i','user_image-2020-09-27T09-52-54.758Z-nial.jpg','085948372635','Ini bio tentang Bagas Afrizal',1,0,'','','2020-09-23 21:04:41','2020-09-27 16:52:54'),(2,'Udin Raharja','udin@gmail.com','$2b$10$G9FjJyMWL64VV4Wx6te4sOZ9qbTTTurkN5QbtSaYpLfDI8lssrPUe','udin_','user_image-2020-09-25T09-51-21.007Z-luis.jpg','098474827364','Ini bio tentang Udin',1,0,'','','2020-09-23 23:32:07','2020-09-25 16:51:21'),(3,'Sergio Aguero','aguero@gmail.com','$2b$10$bK0YJ4pN1VJe7eea3mR3jO9RwUyHSTwDj9Wt.Gxm2zBEW/SGpa95K','aguero_','user_image-2020-09-25T09-46-06.814Z-luis.jpg','2147483647','Ini bio tentang sergio aguero',1,0,'','','2020-09-24 11:30:38','2020-09-25 16:46:07'),(4,'MAWAR','mawar@gmail.com','$2b$10$i2pOEUnBj5guZ5/VpvRpbO2Ot9m/ydX6x.SoIuIoZ7ARPGTHDbAm6','mawar_','user_image-2020-09-25T14-07-50.697Z-luis.jpg','08937462721','Ini bio tentang Mawar',1,0,'','','2020-09-25 21:04:44','2020-09-25 21:07:51'),(5,'Jhon','jhon@gmail.com','$2b$10$VPaw9dthPMFZwOajBuogs.affaxnwlSIMa8NoERRXUxDs4qbQiBYK','','blank-user.png','','',1,0,'','','2020-09-27 16:54:59','2020-09-27 16:54:59');
