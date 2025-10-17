SELECT
  id,
  press_name,
  created_at
FROM press_exclusion
WHERE id > :sql_last_value
ORDER BY id ASC;
