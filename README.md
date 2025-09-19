# 📘 Semana_02_IaC — Uso rápido (Terraform + Docker)

Infraestructura local con **Terraform + Docker** que levanta:  
- **Nginx** (3 aplicaciones balanceadas)  
- **Redis**  
- **PostgreSQL**  
- **Grafana**  

---

## 🖼️ Imágenes usadas

- **Nginx:** `nginx:stable-alpine3.21-perl`  
- **Redis:** `redis:7.4.1-alpine`  
- **PostgreSQL:** `postgres:15-alpine`  
- **Grafana:** `grafana/grafana-enterprise:9.4.7`  

---

## 🔌 Puertos

### 🌐 Nginx (3 apps)
- **Interno:** `80`  
- **Externos:**  
  - `app1` → `8080`  
  - `app2` → `8081`  
  - `app3` → `8082`  

### 🗄️ Redis
- **Interno:** `6379`  
- **Externo (según workspace):**  
  - `dev` → `6380`  
  - `qa`  → `6385`  
  - `prod` → `6381`  

### 🐘 PostgreSQL
- **Interno:** `5432`  
- **Externo:** `5432`  

### 📊 Grafana
- **Interno:** `3000`  
- **Externo:** `3000`  

---

## 🛠️ Comandos Terraform

📌 Ubícate en la raíz del repositorio.

### 1️⃣ Inicializar
```bash
terraform init
terraform workspace list
terraform workspace new dev
terraform workspace select dev
```

### 2️⃣ Planificar
```bash
terraform plan
```

### 3️⃣ Aplicar cambios
```bash
terraform apply
```

### 4️⃣ Ver contenedores activos
```bash
docker ps
```

---

## 🚀 Accesos rápidos

- **Nginx (apps):**  
  - [http://localhost:8080](http://localhost:8080) → App1  
  - [http://localhost:8081](http://localhost:8081) → App2  
  - [http://localhost:8082](http://localhost:8082) → App3  

- **Grafana:** [http://localhost:3000](http://localhost:3000)  

- **PostgreSQL:**  
  - Host: `localhost`  
  - Puerto: `5432`  
  - Credenciales definidas en `terraform.tfvars`  

- **Redis:**  
  - Puerto externo según workspace (ejemplo: `6380` en **dev**)  

---

## 🌱 Variables de ejemplo (`terraform.tfvars`)

```hcl
# PostgreSQL
postgres_user     = "admin"
postgres_password = "admin123"
postgres_db       = "iac_db"

# Redis
redis_password = "redis123"
```
