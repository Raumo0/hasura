# Hasura

Hasura is a postgres with hasura instance that manages data and access to it.

## Installation

* Use the [docker](https://www.docker.com) container service with docker-compose to install database-hasura.
* Use the [Hasura CLI](https://hasura.io/docs/1.0/graphql/manual/hasura-cli/install-hasura-cli.html#install-hasura-cli) to manage migration.

## Usage

* ```Dev``` configuration immediately starts the database snapshot and rolls all migrations.
* After launch, hasura console is available at [localhost:8081/console](localhost:8081/console), if it is not disabled in the configuration.
* The ```./hasura``` directory contains the initial configuration for ```hasura cli```.
* When working with the database through the ```hasura console```, the changes will be exported to the migration and metadata directory where the ```hasura cli``` was initialized.

### Hasura CLI

All commands must be executed in the ```./hasura``` directory or initialized a new directory.

* ```hasura init``` - Initialize directory for Hasura GraphQL Engine migrations, but you can use the existing ```.hasura``` directory. You will need to specify the configuration in the ```config.yaml``` file.

* ```hasura migrate create baseline --from-server``` - Exports a snapshot of the current database schema named ```baseline``` to the ```migrations``` directory.

* ```hasura metadata export``` - Exports the entire hasura metadata schema. The uploaded data is placed in the ```metadata``` directory.

* ```hasura console --console-port 8083``` - Runs hasura console on [localhost:8083/console](localhost:8083/console).

* ```hasura migrate create <name-of-migration>``` - Create sql and yaml files required for a migration.

* ```hasura migrate squash --name "<feature-name>" --from <migration-version>``` - Squash multiple migrations leading upto the latest one into a single migration file.

* ```hasura metadata apply --endpoint <server-endpoint>``` - Apply Hasura metadata on a database. Do apply metadata before ```migrate apply```, this will connect Hasura to the configured databases.

* ```hasura migrate apply --endpoint <server-endpoint> --all-databases``` - Apply migrations on the database. Now, after ```metadata apply``` we can apply migrations to the connected databases.

* ```hasura metadata reload``` - after metadata apply follow it with a metadata reload to make sure Hasura is aware of any newly created database objects.

* ```hasura migrate status``` - Display current status of migrations on a database.

## Dev

Build or rebuild services for both development and production environments:
```
make build
```
Start development services in detached mode (background):
```
make start
```
Start development services in attached mode with logs in the console:
```
make start-logs
```

Start Hasura for development without applying migrations:
```
make start-no-migration
```

![#f03c15](https://via.placeholder.com/15/f03c15/000000?text=+) Danger zone!

Stops containers and removes containers, networks, volumes, and images
created by `up`.

* Not for production! Stop and remove containers, networks, volumes, and images for development:
```diff
- make clean
```

## Prod

Start production services in detached mode. Just builds, (re)creates, starts, and attaches to containers for a service:
```
make prod-start
```
