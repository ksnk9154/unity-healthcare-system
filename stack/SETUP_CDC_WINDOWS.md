# 🚀 CDC Setup Guide - PostgreSQL → Kafka (Windows)

## Quick Start Commands

### 1. Start the stack
```cmd
cd stack
docker-compose up -d
```

### 2. Register the connector (Windows)
**Option A: Use PowerShell**
```powershell
.\register-connector.ps1
```

**Option B: Use Command Prompt**
```cmd
register-connector.bat
```

**Option C: Manual curl command**
```cmd
curl -X POST http://localhost:8083/connectors -H "Content-Type: application/json" -d @postgres-connector.json
```

### 3. Verify connector status
```cmd
curl http://localhost:8083/connectors/postgres-connector/status
```

### 4. List available topics
```cmd
docker exec -it stack-kafka-1 kafka-topics.sh --list --bootstrap-server kafka:9092
```

### 5. Consume messages from a table
```cmd
# Replace <table_name> with your actual table name
docker exec -it stack-kafka-1 kafka-console-consumer.sh --bootstrap-server kafka:9092 --topic unitydb.public.<table_name> --from-beginning
```

## Expected Topics
After connector registration, you'll see topics like:
- `unitydb.public.users` (for users table)
- `unitydb.public.appointments` (for appointments table)
- `unitydb.schema-changes` (for DDL changes)

## Troubleshooting

### Check connector logs
```cmd
docker logs stack-connect-1
```

### Restart connector if needed
```cmd
curl -X DELETE http://localhost:8083/connectors/postgres-connector
# Then register again with step 2
```

### Verify PostgreSQL replication
```cmd
docker exec -it stack-postgres-1 psql -U postgres -d unitydb -c "SELECT * FROM pg_replication_slots;"
```

### Check PostgreSQL is running
```cmd
docker exec -it stack-postgres-1 psql -U postgres -d unitydb -c "\dt"
```

## Fix for Previous Issues
- Added missing PostgreSQL service to docker-compose.yml
- Added Windows-compatible command files (.bat and .ps1)
- Enhanced connector configuration with connection timeout and keep-alive
- Fixed hostname resolution issues
