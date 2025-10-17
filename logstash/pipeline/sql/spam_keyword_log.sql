SELECT
  id,
  keyword,
  `count`,
  created_at,
  updated_at,
  COALESCE(updated_at, created_at) AS updated_marker
FROM spam_keyword_log
WHERE COALESCE(updated_at, created_at) > :sql_last_value
ORDER BY updated_marker ASC;
