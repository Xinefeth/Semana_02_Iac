resource "docker_container" "postgresql" {
  name  = "db-${terraform.workspace}"
  image = "postgres:15-alpine"

  networks_advanced {
    name = docker_network.data_net.name
  }

  ports {
    internal = 5432
    external = var.postgres_port[terraform.workspace]
  }

  env = [
    "POSTGRES_PASSWORD=securepass123"
  ]
}

resource "docker_container" "redis_cache" {
  name  = "redis-${terraform.workspace}"
  image = "redis:7.2-alpine"

  networks_advanced {
    name = docker_network.data_net.name
  }

  ports {
    internal = 6379
    external = var.redis_port[terraform.workspace]
  }
}
