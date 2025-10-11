# Semana_07_IaC — Terraform + Ansible + Docker

Infraestructura local con Terraform y Ansible que levanta:

- Nginx (proxy + 3 apps balanceadas round-robin)  
- Redis (caché en red de persistencia)  
- PostgreSQL (base de datos en red de persistencia)  
- Grafana (monitorización en red de monitoreo)


---

## Imágenes usadas
- Nginx: nginx:stable-alpine3.21-perl  
- Redis: redis:7.4.1-alpine  
- PostgreSQL: postgres:15-alpine  
- Grafana: grafana/grafana-enterprise:9.4.7

---

## Puertos
### Nginx (3 apps)
- Interno: 80  
- Externos:  
  - app1 → 8080  
  - app2 → 8081  
  - app3 → 8082  

### Redis
- Interno: 6379  
- Externo (según workspace):  
  - dev → 6380  
  - qa → 6385  
  - prod → 6381  

### PostgreSQL
- Interno: 5432  
- Externo: 5432  

### Grafana
- Interno: 3000  
- Externo: 3000  

---

## Despliegue paso a paso

1) Clonar el repositorio:
```
git clone https://github.com/Xinefeth/Semana_02_Iac.git
```

2) Crear infraestructura con Terraform:
```
cd iac
sudo terraform init
sudo terraform workspace new dev 
sudo terraform workspace select dev
sudo terraform plan
sudo terraform apply
```
3) Configurar servicios con Ansible:
```
cd config
sudo ansible-playbook -i config/inventory.ini config/playbook.yaml
```

## Verificación
```
docker ps     # listar contenedores activos
```
