#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ELASTICSEARCH_HOST="${ELASTICSEARCH_HOST:-http://localhost:9200}"

curl -X PUT "${ELASTICSEARCH_HOST}/_ilm/policy/naver-news-ilm" \
  -H 'Content-Type: application/json' \
  --data "@${SCRIPT_DIR}/ilm/naver-news-ilm.json"

curl -X PUT "${ELASTICSEARCH_HOST}/_index_template/naver-news-template" \
  -H 'Content-Type: application/json' \
  --data "@${SCRIPT_DIR}/templates/naver-news-template.json"
