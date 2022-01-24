use ldb;

CREATE TABLE `bookdto` (
  `bookName` varchar(300) DEFAULT NULL,
  `category` varchar(300) DEFAULT NULL,
  `writer` varchar(300) DEFAULT NULL,
  `publisher` varchar(300) DEFAULT NULL,
  `bookPublishYear` varchar(300) DEFAULT NULL,
  `bookPrice` int DEFAULT NULL,
  `bookIsbn` varchar(300) DEFAULT NULL,
  `bookImageURL` varchar(300) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `cart` (
  `userId` varchar(40) DEFAULT NULL,
  `bookName` varchar(300) DEFAULT NULL,
  `category` varchar(300) DEFAULT NULL,
  `imgUrl` varchar(500) DEFAULT NULL,
  `bookIsbn` varchar(20) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `amount` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `comments` (
  `rno` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `isbn` varchar(30) DEFAULT NULL,
  `content` varchar(8000) DEFAULT NULL,
  `pic` varchar(1000) DEFAULT NULL,
  `img_Url` varchar(1000) DEFAULT NULL,
  `regdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rno`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `member` (
  `userId` varchar(20) NOT NULL,
  `userPwd` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `birthyear` int DEFAULT NULL,
  `age` int DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `pay` (
  `userId` varchar(40) DEFAULT NULL,
  `bookName` varchar(300) DEFAULT NULL,
  `category` varchar(300) DEFAULT NULL,
  `imgUrl` varchar(500) DEFAULT NULL,
  `bookIsbn` varchar(20) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `purchaseDate` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `users` (
  `id` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `age` varchar(50) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `profile_image` varchar(200) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `birthyear` int DEFAULT NULL,
  `birthday` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx1_name` (`name`),
  KEY `idx2_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
