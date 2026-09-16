packer {
  required_plugins {
    vsphere = {
      version = ">= 1.4.0"
      source  = "github.com/hashicorp/vsphere"
    }
  }
}

source "vsphere-iso" "engineering-vdi" {

  # -------------------------
  # vSphere connection
  # -------------------------

  vcenter_server      = var.vcenter_server
  username            = var.vcenter_username
  password            = var.vcenter_password
  insecure_connection = true

  datacenter = var.datacenter
  cluster    = var.cluster
  datastore  = var.datastore

  folder = var.vm_folder

  # -------------------------
  # VM configuration
  # -------------------------

  vm_name       = "engineering-vdi-${var.image_version}"
  guest_os_type = "windows11_64Guest"

  CPUs        = 8
  RAM         = 32768
  RAM_reserve_all = false

  disk_controller_type = ["lsilogic-sas"]

  storage {
    disk_size             = 102400
    disk_thin_provisioned = true
  }

  network_adapters {
    network = var.network
  }

  # -------------------------
  # Windows ISO
  # -------------------------

  iso_paths = [
    var.windows_iso
  ]

  # -------------------------
  # Windows unattended setup
  # -------------------------

  floppy_files = [
    "autounattend.xml"
  ]

  communicator   = "winrm"
  winrm_username = var.winrm_username
  winrm_password = var.winrm_password
  winrm_timeout  = "30m"

  # -------------------------
  # VMware Tools
  # -------------------------

  tools_upgrade_policy = true

  # -------------------------
  # Shutdown
  # -------------------------

  shutdown_command = "C:/Windows/System32/Sysprep/Sysprep.exe /oobe /generalize /shutdown /quiet"

  shutdown_timeout = "15m"
}

build {

  sources = [
    "source.vsphere-iso.engineering-vdi"
  ]

  # -------------------------
  # Windows Updates
  # -------------------------

  provisioner "powershell" {
    script = "scripts/windows-updates.ps1"
  }

  # -------------------------
  # Engineering applications
  # -------------------------

  provisioner "powershell" {
    script = "scripts/install-apps.ps1"
  }

  # -------------------------
  # FlexNet configuration
  # -------------------------

  provisioner "powershell" {
    script = "scripts/configure-flexnet.ps1"
  }

  # -------------------------
  # Security hardening
  # -------------------------

  provisioner "powershell" {
    script = "scripts/hardening.ps1"
  }

  # -------------------------
  # Cleanup
  # -------------------------

  provisioner "powershell" {
    script = "scripts/cleanup.ps1"
  }
}
