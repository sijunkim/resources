CREATE USER IF NOT EXISTS 'logstash_ingest'@'%' IDENTIFIED BY 'change_me';
GRANT SELECT ON `naver_news`.* TO 'logstash_ingest'@'%';
FLUSH PRIVILEGES;
