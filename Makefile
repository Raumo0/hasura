# Define phony targets to ensure commands run regardless of files with the same name
.PHONY: help build start start-logs start-no-migration clean prod-start prod-start

# Display available make commands
help:
	@echo ""
	@echo "Available commands:"
	@echo "  build              - Build or rebuild services"
	@echo "  start              - Start services in detached mode (background)"
	@echo "  start-logs         - Start services in attached mode with logs in the console"
	@echo "  start-no-migration - Start Hasura without applying migrations"
	@echo "  clean              - Stop and remove containers, networks, volumes, and images"
	@echo "  prod-start         - Start production services in detached mode"
	@echo ""

# Build or rebuild services for both development and production environments
build:
	docker-compose -f docker-compose.yaml -f docker-compose.dev.yaml build

# Start development services in detached mode (background)
start:
	docker-compose -f docker-compose.yaml -f docker-compose.dev.yaml up -d

# Start development services in attached mode with logs in the console
start-logs:
	docker-compose -f docker-compose.yaml -f docker-compose.dev.yaml up

# Start Hasura for development without applying migrations
start-no-migration:
	docker-compose -f docker-compose.yaml -f docker-compose.dev.reup.yaml up -d hasura

# Stop and remove containers, networks, volumes, and images for development
clean:
	docker-compose -f docker-compose.yaml -f docker-compose.dev.yaml down -v

# Start production services in detached mode
prod-start:
	docker-compose -f docker-compose.yaml -f docker-compose.prod.yaml up -d
