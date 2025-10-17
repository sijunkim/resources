SELECT
  id,
  scope,
  keyword,
  created_at
FROM keyword_exclusion
WHERE id > :sql_last_value
ORDER BY id ASC;
