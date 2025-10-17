SELECT
  id,
  domain_prefix,
  name
FROM news_company
WHERE id > :sql_last_value
ORDER BY id ASC;
