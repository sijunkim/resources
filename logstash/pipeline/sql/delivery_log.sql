SELECT
  id,
  article_id,
  channel,
  status,
  http_status,
  sent_at,
  response_body
FROM delivery_log
WHERE id > :sql_last_value
ORDER BY id ASC;
