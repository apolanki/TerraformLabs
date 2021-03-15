terraform {
    required_providers {
        google = {

    source = "hashicorp/google"
    version = ">=3.5.0"
    }
    }
}

provider "google" {
    credentials = file("continual-air-298711-682aef04b450.json")
    project = "continual-air-298711"
    region = "us-central1"
    zone = "us-central1-a"

}

resource "google_compute_instance" "googlecloudvm" {
    name = "gcvm1"
    machine_type = "f1-micro"
    //network_interface = google_compute_subnetwork.google-mysubnet.id
    allow_stopping_for_update = true

    boot_disk {
        initialize_params {
            image = "ubuntu-1804-lts"
   
        }
    }

    network_interface {
        network = google_compute_subnetwork.google-mysubnet.id
        access_config {

        }
    }
}

resource "google_compute_network" "google-vpc" {
    name = "myvpc1"
    mtu = 1500
    auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "google-mysubnet" {
    name = "mysubnetwork1"
    ip_cidr_range = "10.2.0.0/16"
    region = "us-central1"
    network = google_compute_network.google-vpc.id
    secondary_ip_range {
        range_name = "mysecondaryrange1"
        ip_cidr_range = "192.168.10.0/24"
    }


}
