# Docker Services
## Environment
### Windows
Enable WSL2 integration

**.wslconfig**
```text
[wsl2]
memory=3GB
localhostForwarding=true
```

## Setup Swarm
### Enable Swarm mode
```shell
docker swarm init --task-history-limit=0
```

### Update existing Swarm task history configuration
```shell
docker swarm update --task-history-limit=0
```

### Leave Swarm mode
```shell
docker swarm leave --force
```

### Deploy
#### Compose
```shell
docker-compose up -d
```

##### Services
###### Spring Cloud
- Spring Cloud Data Flow
- Spring Cloud Skipper

```shell
docker-compose up -d dataflow
```

#### Swarm
Deploy all stacks
```shell
docker stack deploy --resolve-image changed -c docker-compose.proxy.yml proxy && docker stack deploy --resolve-image changed -c docker-compose.portainer.yml portainer && docker stack deploy --resolve-image changed -c docker-compose.db.yml db &&  docker stack deploy --resolve-image changed -c docker-compose.discovery.yml discovery && docker stack deploy --resolve-image changed -c docker-compose.auth.yml auth && docker stack deploy --resolve-image changed -c docker-compose.registry.yml registry && docker stack deploy --resolve-image changed -c docker-compose.amqp.yml amqp && docker stack deploy --resolve-image changed -c docker-compose.storage.yml storage && docker stack deploy --resolve-image changed -c docker-compose.mail.yml mail
```

##### Stacks
###### Proxy
```shell
docker stack deploy --resolve-image changed -c docker-compose.proxy.yml proxy
```

###### Portainer
```shell
docker stack deploy --resolve-image changed -c docker-compose.portainer.yml portainer
```

###### Database
```shell
docker stack deploy --resolve-image changed -c docker-compose.db.yml db
```

###### Discovery
```shell
docker stack deploy --resolve-image changed -c docker-compose.discovery.yml discovery
```

###### Auth
```shell
docker stack deploy --resolve-image changed -c docker-compose.auth.yml auth
```

###### Registry
```shell
docker stack deploy --resolve-image changed -c docker-compose.registry.yml registry
```

###### ELK
```shell
docker stack deploy --resolve-image changed -c docker-compose.elk.yml elk
```

###### Monitoring
```shell
docker stack deploy --resolve-image changed -c docker-compose.monitoring.yml monitoring
```

###### AMQP
```shell
docker stack deploy --resolve-image changed -c docker-compose.amqp.yml amqp
```

###### BPMN
```shell
docker stack deploy --resolve-image changed -c docker-compose.bpmn.yml bpmn
```

###### Storage
```shell
docker stack deploy --resolve-image changed -c docker-compose.storage.yml storage
```

###### Mail
```shell
docker stack deploy --resolve-image changed -c docker-compose.mail.yml mail
```

###### Gateway
```shell
docker stack deploy --resolve-image changed -c docker-compose.gateway.yml gateway
```

###### DevOps
```shell
docker stack deploy --resolve-image changed -c docker-compose.devops.yml devops
```

###### Secret
```shell
docker stack deploy --resolve-image changed -c docker-compose.secret.yml secret
```

### Cluster information
#### Get stack list
```shell
docker stack ls
```

#### Remove stack 
```
docker stack rm <stack>
```

#### Get services list
```shell
docker service ls
```

## Services
### Traefik
#### Dashboard
<http://localhost/dashboard/>

### NGINX
<http://localhost/>

### Portainer
<http://localhost/portainer> or <http://localhost:9000>

### Docker registry
<http://localhost/v2/_catalog> or <http://localhost:5000/v2/_catalog>

### Nexus
<http://localhost/nexus>

### Prometheus
<http://localhost/prometheus>

### Node Exporter
<http://localhost:9100>

### cAdvisor
<http://localhost/cadvisor>

### Grafana
<http://localhost/grafana>

### Keycloak
<http://localhost/keycloak/auth/>

### RabbitMQ
Username: __rabbitmq__ \
Password: __rabbitmq__

<http://localhost/rabbitmq/>

### pgAdmin4
<http://localhost/pgadmin4>

### Mongo Express
<http://localhost/mongo-express>

### Elasticsearch
<http://localhost:9200>

### Kibana
<http://localhost/kibana>

### Consul
<http://localhost/consul/ui> or <http://localhost:8500/consul/ui>

### Camunda
Username: __demo__ \
Password: __demo__
<http://localhost/camunda/>

### Spring Cloud Data Flow
<http://localhost:9393/dashboard>

### Verdaccio
<http://localhost/verdaccio>

### Vault
<http://localhost:8200>

## Configuration
### Keycloak
```
/opt/keycloak/bin/kc.sh export --file /opt/keycloak/data/import/realm.json --users same_file
```

### Mongo
#### Init replica set
Generate secret key
```
openssl rand -base64 700 > file.key
```

Go to mongo container
```
mongo -u mongo --authenticationDatabase admin -p
```

```
db.runCommand({connectionStatus : 1})
```

```
rs.initiate();
```

```
rs.status();
```