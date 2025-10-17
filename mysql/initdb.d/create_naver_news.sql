CREATE DATABASE IF NOT EXISTS `naver_news` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `naver_news`;

CREATE TABLE IF NOT EXISTS `delivery_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `article_id` bigint NOT NULL,
  `channel` enum('BREAKING','EXCLUSIVE','DEV') NOT NULL,
  `status` enum('SUCCESS','RETRY','FAILED') NOT NULL,
  `http_status` int DEFAULT NULL,
  `sent_at` datetime NOT NULL,
  `response_body` text,
  PRIMARY KEY (`id`),
  KEY `idx_sent_at` (`sent_at` DESC)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `keyword_exclusion` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `scope` enum('BREAKING','EXCLUSIVE','ALL') NOT NULL,
  `keyword` varchar(200) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_scope_keyword` (`scope`,`keyword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `news_article` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(500) NOT NULL,
  `summary` text,
  `company_id` bigint DEFAULT NULL,
  `naver_link_hash` char(64) NOT NULL,
  `naver_link` varchar(399) DEFAULT NULL,
  `original_link` varchar(400) DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `fetched_at` datetime NOT NULL,
  `raw_json` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_published_at` (`published_at` DESC)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `news_company` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `domain_prefix` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `domain_prefix` (`domain_prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `press_exclusion` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `press_name` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_press` (`press_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `runtime_state` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `key` varchar(100) DEFAULT NULL,
  `value` text NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `spam_keyword_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `keyword` varchar(200) NOT NULL,
  `count` int NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `keyword_UNIQUE` (`keyword`),
  KEY `idx_created_at` (`created_at`),
  KEY `idx_keyword` (`keyword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
