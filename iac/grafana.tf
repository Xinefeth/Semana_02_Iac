resource "docker_container" "monitoring" {
  name  = "monitor-${terraform.workspace}"
  image = "grafana/grafana-enterprise:9.5.2"

  networks_advanced {
    name = docker_network.monitor_net.name
  }

  ports {
    internal = 3000
    external = var.grafana_external_port[terraform.workspace]
  }
}
