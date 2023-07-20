
# data <data source type> <local name for reference" -> this provides access to the outputs of the tfstate

data "terraform_remote_state" "rmtstate" {
  backend = "remote"
  config = {
    organization = "maus-org"
    workspaces = {
      name = "test-workspace"
    }
  }
}

# previous data source can be used -> terraform_remote_state.rmtstate.outputs.<outputname>

resource "docker_image" "alpine" {
  name         = "alpine:latest"
  keep_locally = false
}