# Deploy reverse proxy container
resource "docker_container" "gateway" {
  name  = "reverse-proxy-${terraform.workspace}"
  image = "nginx:1.28-alpine"

  networks_advanced {
    name = docker_network.web_net.name
  }

  ports {
    internal = 80
    external = var.gateway_port[terraform.workspace]
  }

  volumes {
    host_path      = abspath("${path.module}/../volumes/nginx_config")
    container_path = "/etc/nginx/conf.d"
    read_only      = false
  }

  volumes {
    host_path      = abspath("${path.module}/../volumes/gateway")
    container_path = "/usr/share/nginx/html"
    read_only      = false
  }
}
