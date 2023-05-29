help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.PHONY: help
.DEFAULT_GOAL := help

swarm-init: ## Init docker swarm
	docker swarm init --task-history-limit=0

swarm-stack-deploy: ## Deploy docker swarm stack services
	docker stack deploy --resolve-image changed -c docker-compose.proxy.yml proxy
	docker stack deploy --resolve-image changed -c docker-compose.portainer.yml portainer
	docker stack deploy --resolve-image changed -c docker-compose.db.yml db
	docker stack deploy --resolve-image changed -c docker-compose.discovery.yml discovery
	docker stack deploy --resolve-image changed -c docker-compose.auth.yml auth
	docker stack deploy --resolve-image changed -c docker-compose.registry.yml registry
	docker stack deploy --resolve-image changed -c docker-compose.broker.yml broker
	docker stack deploy --resolve-image changed -c docker-compose.storage.yml storage
	docker stack deploy --resolve-image changed -c docker-compose.mail.yml mail
	docker stack deploy --resolve-image changed -c docker-compose.git.yml git
	docker stack deploy --resolve-image changed -c docker-compose.quality.yml quality
	docker stack deploy --resolve-image changed -c docker-compose.gateway.yml gateway

swarm-stack-scale: ## Scale docker swarm stack services
	docker service scale db_mongo=1 \
		db_mongo_express=1 \
		db_pgadmin4=1 \
		db_postgres=1 \
		discovery_consul_client=1 \
		discovery_consul_server=1 \
		auth_keycloak=1 \
		registry_registry=1 \
		registry_verdaccio=1 \
		mail_maildev=1 \
		broker_rabbitmq=1 \
		storage_minio=0
