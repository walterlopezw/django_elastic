variable "region" {
  default = "europe-west3"
}

variable "region_zone" {
  default = "europe-west3-b"
}

variable "project_name" {
  description = "The ID of the Google Cloud project"
  default = "quantum-bus-develop-5920ae26"
}

variable "credentials_file_path" {
  description = "Path to the JSON file used to describe your account credentials"
  default     = "~/.gcloud/Terraform.json"
}

variable "public_key_path" {
  description = "Path to file containing public key"
  default     = "~/.ssh/gcloud_id_rsa.pub"
}

variable "private_key_path" {
  description = "Path to file containing private key"
  default     = "~/.ssh/gcloud_id_rsa"
}

variable "install_script_src_path" {
  description = "Path to install script within this repository"
  default     = "scripts/install.sh"
}

variable "install_script_dest_path" {
  description = "Path to put the install script on each destination resource"
  default     = "/tmp/install.sh"
}


variable "install_script_docker_src_path" {
  description = "Path to install script within this repository"
  default     = "scripts/install_docker.sh"
}

variable "install_script_docker_dest_path" {
  description = "Path to put the install script on each destination resource"
  default     = "/tmp/install_docker.sh"
}