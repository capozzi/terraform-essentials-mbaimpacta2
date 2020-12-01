terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

# Configura o Provider Google Cloud com o Projetio
provider "google" {
  version = "3.5.0"

  

  project     i= "noted-runway-295223"
  region  = "us-central1"
  zone    = "us-central1-c"
}

# Cria uma VM no Google Cloud
resource "google_compute_instance" "firstvm" {
  name         = "helloworld"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  # Defini a Imagem da VM
  boot_disk {
    initialize_params {
      image = "ubuntu-1804-bionic-v20201014"
    }
  }

  # Habilita rede para a VM com um IP público
  network_interface {
    network = "default" # Estamos usando a VPC default que já vem por padrão no projeto.

    access_config {
      // A presença do bloco access_config, mesmo sem argumentos, garante que a instância estará acessível pela internet.
    }
  }

