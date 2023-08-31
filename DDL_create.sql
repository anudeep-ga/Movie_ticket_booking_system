CREATE TABLE `user` (

  `iduser` int NOT NULL,

  `name` varchar(45) DEFAULT NULL,

  `Password` varchar(45) DEFAULT NULL,

  `phone` int NOT NULL,

  `email` varchar(45) NOT NULL,

  PRIMARY KEY (`iduser`),

  UNIQUE KEY `phone_UNIQUE` (`phone`),

  UNIQUE KEY `email_UNIQUE` (`email`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci



CREATE TABLE `movie` (

  `idmovie` int NOT NULL,

  `title` varchar(45) DEFAULT NULL,

  `language` varchar(45) DEFAULT NULL,

  `genre` varchar(45) DEFAULT NULL,

  `duration` varchar(45) DEFAULT NULL,

  `Certificate` varchar(45) DEFAULT NULL,

  `Rating` int DEFAULT NULL,

  PRIMARY KEY (`idmovie`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci



CREATE TABLE `city` (

  `idcity` int NOT NULL,

  `name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,

  `state` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,

  `zipcode` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,

  PRIMARY KEY (`idcity`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci



CREATE TABLE `theatre` (

  `idcinema` int NOT NULL,

  `name` varchar(45) DEFAULT NULL,

  `numberofscreens` int NOT NULL,

  `cityid` int DEFAULT NULL,

  PRIMARY KEY (`idcinema`),

  KEY `cityid_idx` (`cityid`),

  CONSTRAINT `cityid` FOREIGN KEY (`cityid`) REFERENCES `city` (`idcity`) ON DELETE CASCADE ON UPDATE CASCADE

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci



CREATE TABLE `theaterscreen` (

  `idscreen` int NOT NULL,

  `name` varchar(45) DEFAULT NULL,

  `totalseats` varchar(45) DEFAULT NULL,

  `cinemaid` int DEFAULT NULL,

  PRIMARY KEY (`idscreen`),

  KEY `cinemaid_idx` (`cinemaid`),

  CONSTRAINT `cinemaid` FOREIGN KEY (`cinemaid`) REFERENCES `theatre` (`idcinema`) ON DELETE CASCADE ON UPDATE CASCADE

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci



CREATE TABLE `theatreseat` (

  `idtheatreseat` int NOT NULL,

  `seatnum` varchar(45) DEFAULT NULL,

  `idscreen` int DEFAULT NULL,

  PRIMARY KEY (`idtheatreseat`),

  KEY `screenid_idx` (`idscreen`),

  CONSTRAINT `idscreen` FOREIGN KEY (`idscreen`) REFERENCES `theaterscreen` (`idscreen`) ON DELETE CASCADE ON UPDATE CASCADE

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci



CREATE TABLE `shows` (

  `idshow` int NOT NULL,

  `date` varchar(45) DEFAULT NULL,

  `starttime` datetime DEFAULT NULL,

  `endtime` datetime DEFAULT NULL,

  `screenid` int DEFAULT NULL,

  `movieid` int DEFAULT NULL,

  PRIMARY KEY (`idshow`),

  KEY `screenid_idx` (`screenid`),

  KEY `movieid_idx` (`movieid`),

  CONSTRAINT `movieid` FOREIGN KEY (`movieid`) REFERENCES `movie` (`idmovie`) ON DELETE CASCADE ON UPDATE CASCADE,

  CONSTRAINT `screenid` FOREIGN KEY (`screenid`) REFERENCES `theaterscreen` (`idscreen`) ON DELETE CASCADE ON UPDATE CASCADE

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci



CREATE TABLE `Booking` (

  `idBooking` int NOT NULL,

  `iduser` int DEFAULT NULL,

  `seats` varchar(45) DEFAULT NULL,

  `timestamp` datetime DEFAULT NULL,

  `status` varchar(45) DEFAULT NULL,

  `showid` int DEFAULT NULL,

  PRIMARY KEY (`idBooking`),

  KEY `userid_idx` (`iduser`),

  KEY `idshow_idx` (`showid`),

  CONSTRAINT `iduser` FOREIGN KEY (`iduser`) REFERENCES `user` (`iduser`) ON DELETE CASCADE ON UPDATE CASCADE,

  CONSTRAINT `showid` FOREIGN KEY (`showid`) REFERENCES `shows` (`idshow`) ON DELETE CASCADE ON UPDATE CASCADE

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci



CREATE TABLE `showseat` (

  `idshowseat` int NOT NULL,

  `status` varchar(45) DEFAULT NULL,

  `price` int DEFAULT NULL,

  `theaterseatid` int DEFAULT NULL,

  `idshow` int DEFAULT NULL,

  `idbooking` int DEFAULT NULL,

  PRIMARY KEY (`idshowseat`),

  KEY `idshow_idx` (`idshow`),

  KEY `idbooking_idx` (`idbooking`),

  KEY `theaterseatid_idx` (`theaterseatid`),

  CONSTRAINT `idbooking` FOREIGN KEY (`idbooking`) REFERENCES `Booking` (`idBooking`) ON DELETE CASCADE ON UPDATE CASCADE,

  CONSTRAINT `idshow` FOREIGN KEY (`idshow`) REFERENCES `shows` (`idshow`) ON DELETE CASCADE ON UPDATE CASCADE,

  CONSTRAINT `theaterseatid` FOREIGN KEY (`theaterseatid`) REFERENCES `theatreseat` (`idtheatreseat`) ON DELETE CASCADE ON UPDATE CASCADE

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci



CREATE TABLE `payment` (

  `idpayment` int NOT NULL,

  `amount` int DEFAULT NULL,

  `timestamp` datetime DEFAULT NULL,

  `paymentmethod` varchar(45) DEFAULT NULL,

  `transactionid` varchar(45) NOT NULL,

  `bookingid` int DEFAULT NULL,

  PRIMARY KEY (`idpayment`),

  UNIQUE KEY `transactionid_UNIQUE` (`transactionid`),

  KEY `bookingid_idx` (`bookingid`),

  CONSTRAINT `bookingid` FOREIGN KEY (`bookingid`) REFERENCES `Booking` (`idBooking`) ON DELETE CASCADE ON UPDATE CASCADE

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci