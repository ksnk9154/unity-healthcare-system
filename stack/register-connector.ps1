Write-Host "Registering Debezium PostgreSQL connector..." -ForegroundColor Green

# Check if services are running
docker-compose ps

Write-Host "`nAttempting to register connector..." -ForegroundColor Yellow
try {
    $response = Invoke-RestMethod -Uri "http://localhost:8083/connectors" -Method Post -ContentType "application/json" -InFile "postgres-connector.json"
    Write-Host "Connector registered successfully!" -ForegroundColor Green
    $response
} catch {
    Write-Host "Error registering connector: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host "Response: $($_.Exception.Response.StatusCode)" -ForegroundColor Red
}

Write-Host "`nChecking connector status..." -ForegroundColor Yellow
Start-Sleep -Seconds 3
try {
    $status = Invoke-RestMethod -Uri "http://localhost:8083/connectors/postgres-connector/status"
    Write-Host "Connector status:" -ForegroundColor Green
    $status
} catch {
    Write-Host "Error checking status: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host "`nDone!" -ForegroundColor Green
