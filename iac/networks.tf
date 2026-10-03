# Frontend y Backend
resource "docker_network" "red_front" {
  name = "red-front-${terraform.workspace}"
}

# Backend y Base de Datos
resource "docker_network" "red_back" {
  name = "red-back-${terraform.workspace}"
}