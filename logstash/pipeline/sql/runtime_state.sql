SELECT
  id,
  `key`,
  `value`,
  updated_at
FROM runtime_state
WHERE updated_at > :sql_last_value
ORDER BY updated_at ASC;
