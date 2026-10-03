resource "docker_image" "nginx" {
  name = "nginx:latest"
}

resource "docker_image" "node" {
  name = "node:18"
}

resource "docker_image" "postgres" {
  name = "postgres:15"
}