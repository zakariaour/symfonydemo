up:
	# Start containers
	docker compose up -d

down:
	# Stop containers
	docker compose down

downwipe:
	# Stop containers and delete volumes
	docker compose down -v

phpshell:
	# Start bash inside PHP container
	docker compose exec php-fpm bash
