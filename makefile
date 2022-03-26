up:
	# Start containers
	docker-compose up -d

down:
	# Stop containers
	docker-compose down

downwipe:
	# Stop containers and delete volumes
	docker-compose down -v

pgshell:
	# Connect to PostgreSQL container
	docker-compose exec db bash

psql:
	# Start PostgreSQL command line inside container
	docker-compose exec pgdb psql -h pgdb -U postgres
