-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        10.3.9-MariaDB - mariadb.org binary distribution
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 staff 的数据库结构
CREATE DATABASE IF NOT EXISTS `staff` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `staff`;

-- 导出  表 staff.personnel 结构
CREATE TABLE IF NOT EXISTS `personnel` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `sex` char(1) NOT NULL,
  `education` varchar(20) NOT NULL,
  `wages` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  staff.personnel 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `personnel` DISABLE KEYS */;
REPLACE INTO `personnel` (`id`, `name`, `sex`, `education`, `wages`) VALUES
	(1001, '将夜', '男', '博士', 9999),
	(1002, '灵遥', '女', '博士', 9999),
	(1003, '荼', '男', '博士', 9999),
	(1004, '玖', '女', '博士', 9999),
	(1005, '鼬', '男', '博士', 9999);
/*!40000 ALTER TABLE `personnel` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
