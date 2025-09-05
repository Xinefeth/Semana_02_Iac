variable "project" { type = string, default = "iac-stack" }

# Redes
variable "app_net"         { type = string, default = "app_net" }
variable "persistence_net" { type = string, default = "persistence_net" }
variable "monitor_net"     { type = string, default = "monitor_net" }

# Apps (Nginx)
variable "nginx_image"           { type = string, default = "nginx:latest" }
variable "nginx_container_count" { type = number, default = 3 }
variable "nginx_base_port"       { type = number, default = 8081 } # 8081..8083

# Redis
variable "redis_image" { type = string, default = "redis:latest" }
variable "redis_port"  { type = number, default = 6379 }

# Postgres
variable "postgres_image" { type = string, default = "postgres:latest" }
variable "postgres_port"  { type = number, default = 5432 }
variable "postgres_user"  { type = string, default = "appuser" }
variable "postgres_pass"  { type = string, default = "s3cret" }
variable "postgres_db"    { type = string, default = "appdb" }

# Grafana
variable "grafana_image" { type = string, default = "grafana/grafana-oss:latest" }
variable "grafana_port"  { type = number, default = 3000 }
variable "grafana_user"  { type = string, default = "admin" }
variable "grafana_pass"  { type = string, default = "admin" }
