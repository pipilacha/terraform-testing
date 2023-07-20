# data "terraform_remote_state" "docker_container" {
#   backend = "local"
#   config = {
#     path = "state/terraform.tfstate"
#   }
# }

# resource "docker_image" "ubuntu" {
#   name         = "ubuntu:latest"
#   keep_locally = false
# }