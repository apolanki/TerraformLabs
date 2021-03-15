terraform {
    required_providers {
      google = {
          source = "hashicorp/google"
          version =  ">=3.5.0"
      }
    }
}

provider "google" {
    credentials = file("continual-air-298711-682aef04b450.json")
    project = "continual-air-298711"
    region = "us-central1"
    zone = "us-central1-a"
  
}

resource "google_compute_network" "myvpc" {
    name = "myvpc2"
  
     
}