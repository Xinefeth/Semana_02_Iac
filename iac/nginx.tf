# Run web applications
resource "docker_container" "site1" {
  name  = "site1-${terraform.workspace}"
  image = "nginx:1.24-alpine"

  networks_advanced {
    name = docker_network.front_net.name
  }

  networks_advanced {
    name = docker_network.storage_net.name
  }

  ports {
    internal = 80
    external = var.site1_port[terraform.workspace]
  }

  volumes {
    host_path      = abspath("${path.module}/../data_volumes/site1")
    container_path = "/usr/share/nginx/html"
    read_only      = false
  }
}

resource "docker_container" "site2" {
  name  = "site2-${terraform.workspace}"
  image = "nginx:1.28.0-alpine"

  networks_advanced {
    name = docker_network.front_net.name
  }

  networks_advanced {
    name = docker_network.storage_net.name
  }

  ports {
    internal = 80
    external = var.site2_port[terraform.workspace]
  }

  volumes {
    host_path      = abspath("${path.module}/../data_volumes/site2")
    container_path = "/usr/share/nginx/html"
    read_only      = false
  }
}

resource "docker_container" "site3" {
  name  = "site3-${terraform.workspace}"
  image = "nginx:1.30-alpine"

  networks_advanced {
    name = docker_network.front_net.name
  }

  networks_advanced {
    name = docker_network.storage_net.name
  }

  ports {
    internal = 80
    external = var.site3_port[terraform.workspace]
  }

  volumes {
    host_path      = abspath("${path.module}/../data_volumes/site3")
    container_path = "/usr/share/nginx/html"
    read_only      = false
  }
}
