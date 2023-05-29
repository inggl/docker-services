# Docker Services
## Setup
### Swarm
Init
```shell
docker swarm init --task-history-limit=0
```

Update existing history limit configuration
```shell
docker swarm update --task-history-limit=0
```

Leave
```shell
docker swarm leave --force
```

### Compose
Run
```shell
docker-compose up -d
```

## Services
### Compose

Run
```shell
docker-compose up -d
```

Services list
```shell
docker service ls
```

### Swarm
Deploy
```shell
make swarm-deploy
```

List
```shell
docker stack ls
```

Remove
```
docker stack rm <stack>
```

Scale
```shell
make swarm-scale
```

#### Stacks
##### Proxy
```shell
docker stack deploy --resolve-image changed -c docker-compose.proxy.yml proxy
```

##### Portainer
```shell
docker stack deploy --resolve-image changed -c docker-compose.portainer.yml portainer
```

##### Database
```shell
docker stack deploy --resolve-image changed -c docker-compose.db.yml db
```

##### Discovery
```shell
docker stack deploy --resolve-image changed -c docker-compose.discovery.yml discovery
```

##### Auth
```shell
docker stack deploy --resolve-image changed -c docker-compose.auth.yml auth
```

##### Registry
```shell
docker stack deploy --resolve-image changed -c docker-compose.registry.yml registry
```

##### ELK
```shell
docker stack deploy --resolve-image changed -c docker-compose.elk.yml elk
```

##### Monitoring
```shell
docker stack deploy --resolve-image changed -c docker-compose.monitoring.yml monitoring
```

##### Broker
```shell
docker stack deploy --resolve-image changed -c docker-compose.broker.yml broker
```

##### Storage
```shell
docker stack deploy --resolve-image changed -c docker-compose.storage.yml storage
```

##### Mail
```shell
docker stack deploy --resolve-image changed -c docker-compose.mail.yml mail
```

##### Gateway
```shell
docker stack deploy --resolve-image changed -c docker-compose.gateway.yml gateway
```

##### Git
```shell
docker stack deploy --resolve-image changed -c docker-compose.git.yml git
```

##### Vault
```shell
docker stack deploy --resolve-image changed -c docker-compose.vault.yml vault
```

---

###### Traefik
<http://localhost/dashboard/>

###### Nginx
<http://localhost/>

###### Portainer
<http://localhost/portainer>

###### Postgres
User
```text
postgres
```
Password
```text
postgres
```

###### pgAdmin 4
<http://localhost/pgadmin4>

User
```text
pgadmin4@pgadmin.org
```
Password
```text
admin
```

###### Mongo
<http://localhost/mongo-express>

Generate secret key
```
openssl rand -base64 700 > file.key
```

Init replica set
```
mongosh -u mongo --authenticationDatabase admin -p mongo --eval 'rs.initiate({"_id": "rs0", "members": [{_id: 0, host: "mongo"}]})'
```

###### Keycloak
<http://localhost/keycloak/auth/>

User
```text
keycloak
```
Password
```text
keycloak
```

###### Consul
<http://localhost/consul/ui>

###### Registry
<http://localhost/v2/_catalog>

###### Verdaccio
<http://localhost/verdaccio>

User registration
```shell
npm adduser --registry http://localhost/verdaccio/
```

###### RabbitMQ
<http://localhost/rabbitmq/>

User
```text
rabbitmq
```
Password
```text
rabbitmq
```

###### Maildev
<http://localhost/maildev>

Username
```text
maildev
```
Password
```text
maildev
```

###### Prometheus
<http://localhost/prometheus>

###### Node Exporter
<http://localhost:9100>

###### cAdvisor
<http://localhost/cadvisor>

###### Grafana
<http://localhost/grafana>

###### Elasticsearch
<http://localhost:9200>

###### Kibana
<http://localhost/kibana>

###### Vault
<http://localhost:8200>

###### Spring Cloud Data Flow
<http://localhost:9393/dashboard>