resource "docker_container" "bd" {
  name  = "bd-${terraform.workspace}"
  image = docker_image.postgres.image_id
  env   = ["POSTGRES_PASSWORD=root"]

  ports {
    internal = 5432
    external = var.bd_port[terraform.workspace]
  }
  
  networks_advanced {
    name = docker_network.red_back.name
  }
}