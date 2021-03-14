terraform {
    required_providers {
      google = {
          source = "hashicorp/google"
          version =  ">=3.5.0"
      }
    }
}

resource "google_compute_network" "myvpc" {
    name = "myvpc2"
    
     
}