# 🚀 CDC Setup Guide - PostgreSQL → Kafka

## Quick Start Commands

### 1. Start the stack
```bash
cd stack
docker-compose up -d
```

### 2. Register the connector
```bash
curl -X POST http://localhost:8083/connectors \
  -H "Content-Type: application/json" \
  -d @postgres-connector.json
```

### 3. Verify connector status
```bash
curl http://localhost:8083/connectors/postgres-connector/status
```

### 4. List available topics
```bash
docker exec -it stack-kafka-1 kafka-topics.sh --list --bootstrap-server kafka:9092
```

### 5. Consume messages from a table
```bash
# Replace <table_name> with your actual table name
docker exec -it stack-kafka-1 kafka-console-consumer.sh \
  --bootstrap-server kafka:9092 \
  --topic unitydb.public.<table_name> \
  --from-beginning
```

## Expected Topics
After connector registration, you'll see topics like:
- `unitydb.public.users` (for users table)
- `unitydb.public.appointments` (for appointments table)
- `unitydb.schema-changes` (for DDL changes)

## Troubleshooting

### Check connector logs
```bash
docker logs stack-connect-1
```

### Restart connector if needed
```bash
curl -X DELETE http://localhost:8083/connectors/postgres-connector
# Then register again with step 2
```

### Verify PostgreSQL replication
```bash
docker exec -it stack-postgres-1 psql -U postgres -d unitydb -c "SELECT * FROM pg_replication_slots;"
