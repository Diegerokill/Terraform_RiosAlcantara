# Replica 1 para Backend
resource "docker_container" "backend_1" {
  name    = "backend-${terraform.workspace}-1"
  image   = docker_image.node.image_id
  command = ["sleep", "3600"]

  ports {
    internal = 3000
    external = var.api_port[terraform.workspace]
  }

  networks_advanced {
    name = docker_network.red_front.name
  }
  networks_advanced {
    name = docker_network.red_back.name
  }
}

# Replica 2 para Backend (Copia manual)
resource "docker_container" "backend_2" {
  name    = "backend-${terraform.workspace}-2"
  image   = docker_image.node.image_id
  command = ["sleep", "3600"]

  ports {
    internal = 3000
    external = var.api_port[terraform.workspace] + 10
  }

  networks_advanced {
    name = docker_network.red_front.name
  }
  networks_advanced {
    name = docker_network.red_back.name
  }
}