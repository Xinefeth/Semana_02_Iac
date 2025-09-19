# Launch Grafana container
resource "docker_container" "monitoring" {
  name  = "monitor-${terraform.workspace}"
  image = "grafana/grafana-enterprise:9.5.2"

  networks_advanced {
    name = docker_network.observability_net.name
  }

  networks_advanced {
    name = docker_network.services_net.name
  }

  ports {
    internal = 3000
    external = var.monitor_port[terraform.workspace]
  }
}
