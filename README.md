# Containers Docker PHP

Ensemble de containers pour du développement PHP _vanilla_ avec bases de données.

> Sur une base générée par https://phpdocker.io

* Serveur **Nginx**
* **PHP**
* **PostgreSQL** + pgAdmin
* **MariaDB** + phpMyAdmin


## Services

| Service | Description | Port interne | Adresse par défaut |
|---|---|---|---|
| `webserver` | Serveur Nginx | 80 | 3000 |
| `php-fpm` | PHP | | |
| `pgdb` | Serveur de bases de données PostgreSQL | 5432 | 3001
| `pgadmin` | Interface d'administration pour PostgreSQL | 80 | 5050
| `mariadb` | Serveur de bases de données MariaDB | 3306 | 3002
| `phpmyadmin` | Interface d'administration pour MariaDB | 80 | 5051


## Identifiants

> Voir le fichier `.env`



# Configuration automatique des serveurs dans pgAdmin

Il est possible de faire en sorte que le **serveur PostgreSQL** doit référencé automatiquement dans **pgAdmin**.

Pour que cette configuration automatique de pgAdmin fonctionne, attributez le fichier `servers.json` au user:group `5050:5050`.
pgAdmin s'exécute sous cette identité, et doit avoir les droits suffisants pour lire `servers.json`.

**Attribuez ces droits AVANT le premier lancement du container pgAdmin :**

```bash
sudo chown 5050:5050 servers.json
```

En cas d'oubli, vous avez toujours la possibilité d'ajouter le serveur `pgdb` manuellement à pgAdmin, après son lancement.


## Démarrage des containers

```bash
docker-compose up -d
```

> **Note :** Les containers de base de données peuvent mettre un certain temps à s'initialiser.

## Arrêt des containers

```bash
docker-compose down
```

## Démarrage et arrêt des containers par `make`

> Un `makefile` est également fourni pour simplifier la gestion des containers. Les commandes suivantes sont disponibles :

```bash
# Démarrer les containers
make up

# Arrêter les containers
make down

# Arrêter les containers et supprimer les volumes associés
make downwipe

# Se connecter au container PostgreSQL
make pgshell

# Se connecter à psql dans le container PostgreSQL
make psql

# Se connecter au container MariaDB
make myshell

# Se connecter à mysql dans le container MariaDB
make mysql
```

## Test de la configuration

* Un dossier `app` doit être créé pour le serveur Nginx. 
* Le projet PHP sera placé dans `app`. 
* Pour tester l'environnement :

    1. Démarrez les containers.
    2. Créez une page `public/index.php` avec ce contenu :
    ```php
    <?php phpinfo();
    ```
    3. Connectez-vous à `localhost:3000`