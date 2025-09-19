resource "docker_container" "site1" {
  name  = "site1-${terraform.workspace}"
  image = "nginx:stable-alpine3.21-perl"

  networks_advanced {
    name = docker_network.app_net.name
  }

  ports {
    internal = 80
    external = var.app1_external_port[terraform.workspace]
  }

  volumes {
    host_path      = abspath("${path.module}/../data_volumes/site1")
    container_path = "/usr/share/nginx/html"
    read_only      = false
  }
}

resource "docker_container" "site2" {
  name  = "site2-${terraform.workspace}"
  image = "nginx:stable-alpine3.21-perl"

  networks_advanced {
    name = docker_network.app_net.name
  }

  ports {
    internal = 80
    external = var.app2_external_port[terraform.workspace]
  }

  volumes {
    host_path      = abspath("${path.module}/../data_volumes/site2")
    container_path = "/usr/share/nginx/html"
    read_only      = false
  }
}

resource "docker_container" "site3" {
  name  = "site3-${terraform.workspace}"
  image = "nginx:stable-alpine3.21-perl"

  networks_advanced {
    name = docker_network.app_net.name
  }

  ports {
    internal = 80
    external = var.app3_external_port[terraform.workspace]
  }

  volumes {
    host_path      = abspath("${path.module}/../data_volumes/site3")
    container_path = "/usr/share/nginx/html"
    read_only      = false
  }
}
