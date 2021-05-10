provider "vsphere" {
    user = var.vsphere_user
    password = var.vsphere_password
    vsphere_server = "192.168.88.59"
    allow_unverified_ssl = "true"
}

data "vsphere_datacenter" "dudullu" {
    name = "TcellDudulluDC"
}

data "vsphere_compute_cluster" "gen10"{
    name = "vGlobalCloud"
    datacenter_id = data.vsphere_datacenter.dudullu.id
}

data "vsphere_virtual_machine" "template" {
  name = "Vertica-CentOS-7-x86_64"
  datacenter_id = data.vsphere_datacenter.dudullu.id
}


data "vsphere_network" "public_network" {
  name = "VLAN12-10G"
  datacenter_id = data.vsphere_datacenter.dudullu.id
}

data "vsphere_network" "private_network" {
  name = "VLAN22-Private"
  datacenter_id = data.vsphere_datacenter.dudullu.id
}

data "vsphere_network" "storage_network" {
  name = "VLAN32-PureStore"
  datacenter_id = data.vsphere_datacenter.dudullu.id
}

data "vsphere_datastore" "ssd_storage" {
  name = "datastore_L1-L5_R1_800GB_SSD_node54"
  datacenter_id = data.vsphere_datacenter.dudullu.id
}

data "vsphere_host" "myesx" {
    name          = "192.168.88.54"
    datacenter_id = data.vsphere_datacenter.dudullu.id
}


data "local_file" "public_key" {

  filename = "keys/terraform.pub"


}






