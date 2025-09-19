resource "docker_container" "postgresql" {
  name  = "db-${terraform.workspace}"
  image = "postgres:15-alpine"

  networks_advanced {
    name = docker_network.persistence_net.name
  }

  ports {
    internal = 5432
    external = var.db_external_port[terraform.workspace]
  }

  env = [
    "POSTGRES_PASSWORD=securepass123"
  ]
}
