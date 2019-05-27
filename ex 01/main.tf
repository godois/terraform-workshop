terraform {
  backend "gcs" {
    bucket = "juit-terraform-state"
    prefix = "terraform/ex01"
    credentials = "../../../credential/terraform-account.json"
  }
}

resource "google_compute_instance" "ex01" {
  name         = "ex01"
  machine_type = "n1-standard-1"
  project = "nome_projeto"
  zone         = "us-central1-a"

    boot_disk {
        initialize_params {
        image = "cos-cloud/cos-stable-72-11316-136-0"
        size    = "30"
        type    = "pd-ssd"
        }
        auto_delete = true
    }

    tags = ["teste"]
}