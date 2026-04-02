# n8n + MySQL with Docker Compose

Capstone Design - Docker 실습: n8n과 MySQL 연동

## 구성

| 서비스 | 이미지 | 포트 |
|--------|--------|------|
| MySQL  | mysql:8.0 | 3306 |
| n8n    | n8nio/n8n:latest | 5678 |

## 실행 방법

### 1. 컨테이너 시작
```bash
docker-compose up -d
```

### 2. 상태 확인
```bash
docker-compose ps
docker-compose logs -f
```

### 3. n8n 접속
- URL: http://localhost:5678
- ID: admin
- PW: admin123

### 4. MySQL 접속 (컨테이너 내부)
```bash
docker exec -it n8n_mysql mysql -u n8n_user -pn8n_password n8n_db
```

### 5. 컨테이너 중지
```bash
docker-compose down
```

### 6. 컨테이너 및 볼륨 삭제 (데이터 초기화)
```bash
docker-compose down -v
```

## n8n에서 MySQL 연결 설정

1. n8n 접속 후 **Credentials** → **New Credential** → **MySQL**
2. 설정값:
   - Host: `mysql`
   - Port: `3306`
   - Database: `n8n_db`
   - User: `n8n_user`
   - Password: `n8n_password`

## 프로젝트 구조

```
n8n-mysql/
├── docker-compose.yml   # 서비스 정의
├── init.sql             # MySQL 초기화 스크립트
├── .env                 # 환경변수
└── README.md
```
