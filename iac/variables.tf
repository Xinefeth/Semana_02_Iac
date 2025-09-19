variable "app1_port" {
  description = "Puerto externo asignado para la aplicación App1"
  type        = map(number)
}

variable "app2_port" {
  description = "Puerto externo asignado para la aplicación App2"
  type        = map(number)
}

variable "app3_port" {
  description = "Puerto externo asignado para la aplicación App3"
  type        = map(number)
}

variable "proxy_port" {
  description = "Puerto externo del contenedor Proxy"
  type        = map(number)
}

variable "postgre_port" {
  description = "Puerto externo del contenedor PostgreSQL"
  type        = map(number)
}

variable "grafana_port" {
  description = "Puerto externo del contenedor Grafana"
  type        = map(number)
}

variable "redis_port" {
  description = "Puerto externo del contenedor Redis"
  type        = map(number)
}
