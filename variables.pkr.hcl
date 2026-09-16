variable "vcenter_server" {
  type = string
}

variable "vcenter_username" {
  type      = string
  sensitive = true
}

variable "vcenter_password" {
  type      = string
  sensitive = true
}

variable "datacenter" {
  type = string
}

variable "cluster" {
  type = string
}

variable "datastore" {
  type = string
}

variable "network" {
  type = string
}

variable "vm_folder" {
  type = string
}

variable "windows_iso" {
  type = string
}

variable "winrm_username" {
  type      = string
  sensitive = true
}

variable "winrm_password" {
  type      = string
  sensitive = true
}

variable "image_version" {
  type = string
}
