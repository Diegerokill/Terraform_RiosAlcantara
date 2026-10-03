# Replica 1 para Frontend
resource "docker_container" "frontend_1" {
  name  = "frontend-${terraform.workspace}-1"
  image = docker_image.nginx.image_id

  ports {
    internal = 80
    external = var.web_port[terraform.workspace]
  }
  
  networks_advanced {
    name = docker_network.red_front.name
  }
}

# Replica 2 para Frontend (Copia manual)
resource "docker_container" "frontend_2" {
  name  = "frontend-${terraform.workspace}-2"
  image = docker_image.nginx.image_id

  ports {
    internal = 80
    external = var.web_port[terraform.workspace] + 10
  }
  
  networks_advanced {
    name = docker_network.red_front.name
  }
}