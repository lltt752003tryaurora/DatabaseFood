/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `food` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`food_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `food_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `food_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `like_res` (
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `date_like` datetime DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `like_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `userFood` (`user_id`),
  CONSTRAINT `like_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `order_food` (
  `user_id` int DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `arr_sub_id` varchar(100) DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `order_food_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `userFood` (`user_id`),
  CONSTRAINT `order_food_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `rate_res` (
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `date_rate` datetime DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `rate_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `userFood` (`user_id`),
  CONSTRAINT `rate_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `restaurant` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sub_food` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(100) DEFAULT NULL,
  `sub_price` float DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `sub_food_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `userFood` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(4, 'Phở bò', 'phobo.jpg', 35000, 'Phở bò Hà Nội', 1);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(5, 'Bánh mì', 'banhmi.jpg', 20000, 'Bánh mì thịt', 4);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(6, 'Bánh xèo', 'banhxeo.jpg', 30000, 'Bánh xèo miền Trung', 5);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(7, 'Bún chả', 'buncha.jpg', 25000, 'Ngon nổi tiếng', 2),
(8, 'Bánh flan', 'flan.jpg', 15000, 'Thơm ngon', 3),
(9, 'Sushi', 'sushi.jpg', 50000, 'Đặc sản Nhật Bản', 2);

INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(1, 'Pizza');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(2, 'Mì Ý');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(3, 'Gà rán');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(4, 'Bánh ngọt'),
(5, 'Ăn vặt');

INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(2, 2, '2023-02-02 00:00:00');
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(3, 3, '2023-02-20 00:00:00');
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(1, 2, '2023-02-15 00:00:00');
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(3, 1, '2023-02-20 00:00:00'),
(2, 3, '2023-02-25 00:00:00'),
(4, 2, '2023-03-01 00:00:00'),
(5, 3, '2023-03-05 00:00:00'),
(2, 1, '2023-03-10 00:00:00'),
(3, 2, '2023-03-15 00:00:00'),
(4, 1, '2023-03-20 00:00:00'),
(1, 3, '2023-03-25 00:00:00'),
(5, 2, '2023-03-30 00:00:00'),
(4, 1, '2023-03-07 00:00:00'),
(1, 3, '2023-03-12 00:00:00');

INSERT INTO `order_food` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(4, 4, 2, 'Code01', 'Sub01');
INSERT INTO `order_food` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(1, 5, 3, 'Code02', 'Sub02');
INSERT INTO `order_food` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(2, 6, 1, 'Code03', 'Sub03');
INSERT INTO `order_food` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(3, 4, 4, 'Code04', 'Sub04'),
(1, 6, 6, 'Code2392792475049893', 'Sub02392792475049893'),
(2, 7, 22, 'Code2715609601358277', 'Sub02715609601358277'),
(2, 8, 10, 'Code624187552733796', 'Sub0624187552733796');

INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(2, 2, 4, '2023-02-01 00:00:00');
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(3, 3, 3, '2023-02-15 00:00:00');
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(4, 2, 5, '2023-03-05 00:00:00');
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 1, 4, '2023-03-10 00:00:00'),
(7, 3, 6, '2023-12-07 01:40:08'),
(7, 4, 9, '2023-12-07 01:42:40'),
(7, 2, 10, '2023-12-07 01:59:44');

INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(1, 'Nhà hàng C', 'image3.jpg', 'Đặc sản 3 miền');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(2, 'Nhà hàng D', 'image4.jpg', 'Món Âu');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(3, 'Nhà hàng E', 'image5.jpg', 'Lẩu nướng');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(4, 'Nhà hàng F', 'image6.jpg', 'Món hải sản tươi ngon'),
(5, 'Nhà hàng G', 'image7.jpg', 'Quán cà phê'),
(6, 'Nhà hàng H', 'image8.jpg', 'Ẩm thực chay');



INSERT INTO `userFood` (`user_id`, `full_name`, `email`, `password`) VALUES
(1, 'Tran Van C', 'ctran@gmail.com', '000000');
INSERT INTO `userFood` (`user_id`, `full_name`, `email`, `password`) VALUES
(2, 'Nguyen Thi D', 'dnguyen@gmail.com', '111111');
INSERT INTO `userFood` (`user_id`, `full_name`, `email`, `password`) VALUES
(3, 'Le Van E', 'elevan@gmail.com', '222222');
INSERT INTO `userFood` (`user_id`, `full_name`, `email`, `password`) VALUES
(4, 'Nguyen Van F', 'fnguyen@gmail.com', '333333'),
(5, 'Tran Thi G', 'gtrann@gmail.com', '444444'),
(6, 'Le Van H', 'hlevan@gmail.com', '555555'),
(7, 'Hoang Van I', 'ihoang@gmail.com', '666666'),
(8, 'Bui Thi J', 'jbui@gmail.com', '777777'),
(9, 'Doan Van K', 'kdoan@gmail.com', '888888');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;