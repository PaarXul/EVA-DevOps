terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "my_app_image" {
  name = "myapp"
  build {
    context = "."
    dockerfile = "Dockerfile"
  }
  triggers = {
    dir_sha1 = sha1(join("", [for f in fileset(path.module, "src/*") : filesha1(f)]))
  }
}

resource "docker_container" "my_app_container" {
  name  = "myapp"
  image = docker_image.my_app_image.image_id

  ports {
    internal = 8080
    external = 8080
  }

  restart = "unless-stopped"
}