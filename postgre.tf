resource "docker_image" "postgres" {
  name         = var.postgres_image
  keep_locally = false
}

resource "docker_container" "postgres" {
  name  = "postgres-${terraform.workspace}"
  image = docker_image.postgres.image_id

  env = [
    "POSTGRES_USER=${var.postgres_user}",
    "POSTGRES_PASSWORD=${var.postgres_pass}",
    "POSTGRES_DB=${var.postgres_db}",
  ]

  networks_advanced { name = docker_network.persistence_net.name }

  volumes {
    volume_name    = docker_volume.postgres_data.name
    container_path = "/var/lib/postgresql/data"
  }

  ports {
    internal = 5432
    external = var.postgres_port
  }
}
