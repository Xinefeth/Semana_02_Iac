# Semana_07_IaC — Terraform + Ansible + Docker + Firewall

Infraestructura local con Terraform y Ansible que levanta:

- Nginx (proxy + 3 apps balanceadas round-robin)  
- Redis (caché en red de persistencia)  
- PostgreSQL (base de datos en red de persistencia)  
- Grafana (monitorización en red de monitoreo)


## Despliegue paso a paso

1) Clonar el repositorio:
```
git clone https://github.com/Xinefeth/Semana_02_Iac.git
```

2) Crear infraestructura con Terraform:
```
cd iac
terraform init
terraform workspace new dev 
terraform workspace select dev
terraform plan
terraform apply
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
