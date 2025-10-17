# Elasticsearch 초기화 스크립트

- `init/ilm/naver-news-ilm.json`: 30일 핫, 90일 삭제 정책.
- `init/templates/naver-news-template.json`: `naver-news-*` 인덱스 필드 매핑 및 분석기.
- `init/setup.sh`: 위 정책과 템플릿을 Elasticsearch에 적용하는 스크립트.

## 실행 방법

```bash
cd elasticsearch/init
ELASTICSEARCH_HOST=http://localhost:9200 ./setup.sh
```

보안을 활성화할 경우 `ELASTICSEARCH_HOST`에 `https://`와 인증 정보를 포함하거나 `curl` 옵션에 `-u user:pass`를 추가하십시오.
