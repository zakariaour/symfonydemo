up:
	# Start containers
	@docker compose up -d

down:
	# Stop containers
	@docker compose down

downwipe:
	# Stop containers and delete volumes
	@docker compose down -v

pgshell:
	# Connect to PostgreSQL container
	@docker compose exec pgdb bash

psql:
	# Start PostgreSQL command line inside container
	@docker compose exec pgdb psql -h pgdb -d appdb -U postgres

myshell:
	# Connect to MariaDB container
	@docker compose exec mariadb bash

mysql:
	# Start mysql command line inside container
	@docker compose exec mariadb mysql --host mariadb --database appdb --user appuser --password

phpshell:
	# Start bash inside PHP container
	@docker compose exec php-fpm bash
