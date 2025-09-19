resource "docker_container" "gateway" {
  name  = "reverse-proxy-${terraform.workspace}"
  image = "nginx:stable-alpine3.21-perl"

  networks_advanced {
    name = docker_network.app_net.name
  }

  ports {
    internal = 80
    external = var.proxy_external_port[terraform.workspace]
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
