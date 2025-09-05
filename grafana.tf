resource "docker_image" "grafana" {
  name         = var.grafana_image
  keep_locally = false
}

resource "docker_container" "grafana" {
  name  = "grafana-${terraform.workspace}"
  image = docker_image.grafana.image_id

  env = [
    "GF_SECURITY_ADMIN_USER=${var.grafana_user}",
    "GF_SECURITY_ADMIN_PASSWORD=${var.grafana_pass}",
  ]

  networks_advanced { name = docker_network.monitor_net.name }

  volumes {
    volume_name    = docker_volume.grafana_data.name
    container_path = "/var/lib/grafana"
  }

  ports {
    internal = 3000
    external = var.grafana_port
  }
}
