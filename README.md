 Employee DB Platform

Database deployment project using:

- PostgreSQL
- Flyway
- Jenkins
- AWS RDS
- GitHub

## Project Structure

- sql/ : Flyway migrations
- config/ : Environment configurations
- docs/ : Documentation
- scripts/ : Local utility scripts

## Deployment Flow

GitHub
 ↓
 Jenkins
 ↓
 Flyway
 ↓
 PostgreSQL
