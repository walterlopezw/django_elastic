# See https://cloud.google.com/compute/docs/load-balancing/network/example

provider "google" {
  region      = var.region
  project     = var.project_name
  credentials = file(var.credentials_file_path)
}

resource "google_compute_http_health_check" "default" {
  name                = "quantum-tourism-basic-check"
  request_path        = "/"
  check_interval_sec  = 1
  healthy_threshold   = 1
  unhealthy_threshold = 10
  timeout_sec         = 1
}

resource "google_compute_target_pool" "default" {
  name          = "quantum-tourism-target-pool"
  instances     = google_compute_instance.www.*.self_link
  health_checks = [google_compute_http_health_check.default.name]
}

resource "google_compute_forwarding_rule" "default" {
  name       = "quantum-tourism-forwarding-rule"
  target     = google_compute_target_pool.default.self_link
  port_range = "80"
}

resource "google_compute_instance" "www" {
  count = 1

  name         = "quantum-tourism-${count.index}"
  machine_type = "e2-standard-4"
  zone         = var.region_zone
  tags         = ["frontend"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-focal-v20220419"
      # image = "ubuntu-os-cloud/ubuntu-1804-bionic-v20220505"
      # image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"

    access_config {
      # Ephemeral
    }
  }

  metadata = {
    ssh-keys = "root:${file(var.public_key_path)}"
  }

  provisioner "file" {
    source      = var.install_script_src_path
    destination = var.install_script_dest_path

    connection {
      host        = self.network_interface.0.access_config.0.nat_ip
      type        = "ssh"
      user        = "root"
      private_key = file(var.private_key_path)
      agent       = false
    }
  }

  provisioner "remote-exec" {
    connection {
      host        = self.network_interface.0.access_config.0.nat_ip
      type        = "ssh"
      user        = "root"
      private_key = file(var.private_key_path)
      agent       = false
    }

    inline = [
      "chmod +x ${var.install_script_dest_path}",
      "sudo ${var.install_script_dest_path} ${count.index}",
    ]
  }

  service_account {
    scopes = ["https://www.googleapis.com/auth/compute.readonly"]
  }
}

resource "google_compute_instance" "docker" {
  count = 1

  name         = "quantum-tourism-docker-${count.index}"
  machine_type = "e2-standard-4"
  zone         = var.region_zone
  tags         = ["docker"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-focal-v20220419"
      # image = "ubuntu-os-cloud/ubuntu-1804-bionic-v20220505"
      # image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"

    access_config {
      # Ephemeral
    }
  }

  metadata = {
    ssh-keys = "root:${file(var.public_key_path)}"
  }

  provisioner "file" {
    source      = var.install_script_docker_src_path
    destination = var.install_script_docker_dest_path

    connection {
      host        = self.network_interface.0.access_config.0.nat_ip
      type        = "ssh"
      user        = "root"
      private_key = file(var.private_key_path)
      agent       = false
    }
  }

  provisioner "remote-exec" {
    connection {
      host        = self.network_interface.0.access_config.0.nat_ip
      type        = "ssh"
      user        = "root"
      private_key = file(var.private_key_path)
      agent       = false
    }

    inline = [
      "chmod +x ${var.install_script_docker_dest_path}",
      "sudo ${var.install_script_docker_dest_path} ${count.index}",
    ]
  }

  service_account {
    scopes = ["https://www.googleapis.com/auth/compute.readonly"]
  }
}

resource "google_compute_firewall" "default" {
  name    = "quantum-tourism-firewall"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80","8000", "9200"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["frontend", "docker"]
}
