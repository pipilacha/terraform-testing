terraform {
  cloud {
    organization = "maus-org"
    workspaces {
      name = "test-workspace"
    }
  }

  # backend "local"{
  #   path = "state/terraform.tfstate"
  # }

  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }

  required_version = "~> 1.5.3"
}


provider "docker" {
  host = "npipe:////.//pipe//docker_engine"
}


resource "docker_image" "nginx" {
  name         = var.container_image
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "tutorial"

  ports {
    internal = 80
    external = 8080
  }
}

resource "docker_image" "python" {
  name         = "python:3.12.0b4-alpine3.18"
  keep_locally = false
}

resource "docker_image" "ubuntu" {
  name         = "ubuntu:latest"
  keep_locally = false
}