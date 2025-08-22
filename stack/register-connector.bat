@echo off
echo Registering Debezium PostgreSQL connector...
echo.

REM Check if services are running
docker-compose ps

echo.
echo Attempting to register connector...
curl -X POST http://localhost:8083/connectors -H "Content-Type: application/json" -d @postgres-connector.json

echo.
echo Checking connector status...
timeout /t 3 /nobreak > nul
curl http://localhost:8083/connectors/postgres-connector/status

echo.
echo Done! Press any key to exit...
pause > nul
