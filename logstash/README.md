# Logstash 구성 개요

- `Dockerfile`: JDBC 입력 플러그인 설치.
- `config/logstash.yml`: 기본 설정 및 자동 재로딩 활성화.
- `config/pipelines.yml`: 애플리케이션 로그, MySQL 동기화 2개 파이프라인 선언.
- `pipeline/app-logs.conf`: TCP JSON 로그 → Elasticsearch.
- `pipeline/mysql-sync.conf`: MySQL 증분 수집 → Elasticsearch.
- `pipeline/sql/*.sql`: JDBC 쿼리 템플릿(delivery_log, keyword_exclusion, news_article, news_company, press_exclusion, runtime_state, spam_keyword_log).
- `drivers/`: MySQL 커넥터 JAR을 배치. 예) `mysql-connector-j-8.0.33.jar`.
- `state/`: JDBC `last_run` 메타데이터 저장소. Git에는 `.gitkeep`만 포함.

## 준비 절차

1. [MySQL 공식 사이트](https://dev.mysql.com/downloads/connector/j/)에서 커넥터 JAR을 다운로드.
2. `logstash/drivers/mysql-connector-j-8.0.33.jar` 이름으로 저장.
3. `logstash/.env`의 DB 접속 정보와 스케줄을 실제 환경에 맞게 수정.
4. `pipeline/sql/*.sql` 파일에서 컬럼·테이블명을 서비스 스키마에 맞게 조정.
