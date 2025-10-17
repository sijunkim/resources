SELECT
  id,
  title,
  summary,
  company_id,
  naver_link_hash,
  naver_link,
  original_link,
  published_at,
  fetched_at,
  raw_json
FROM news_article
WHERE id > :sql_last_value
ORDER BY id ASC;
