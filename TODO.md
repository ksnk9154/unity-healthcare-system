# TODO: Combine Stack Folder with Backend

## Phase 1: Analysis and Planning
- [x] Analyze stack folder structure and services
- [x] Identify integration points with backend
- [ ] Create unified docker-compose.yml
- [ ] Update backend configuration for stack services

## Phase 2: Configuration Integration
- [ ] Merge PostgreSQL configuration from stack/pg.env
- [ ] Integrate database setup from stack/setup.sql
- [ ] Update backend Dockerfile to use stack patterns
- [ ] Create unified environment configuration

## Phase 3: Service Integration
- [ ] Add Kafka and Debezium services
- [ ] Add monitoring services (Prometheus/Grafana)
- [ ] Update backend to connect with new services
- [ ] Test all service connections

## Phase 4: Testing and Validation
- [ ] Test complete stack startup
- [ ] Verify database connectivity
- [ ] Test API endpoints
- [ ] Update documentation
