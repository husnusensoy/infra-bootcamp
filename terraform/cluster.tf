resource "vsphere_virtual_machine" "vertica" {
  count = 2
  name = "bootcamp-vertica-${count.index + 1}"

  resource_pool_id = data.vsphere_compute_cluster.gen10.resource_pool_id
  host_system_id = data.vsphere_host.myesx.id

  datastore_id = data.vsphere_datastore.ssd_storage.id

  guest_id = "centos7_64Guest"


  scsi_type = data.vsphere_virtual_machine.template.scsi_type

  network_interface {
    network_id = data.vsphere_network.public_network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }

  network_interface {
    network_id = data.vsphere_network.private_network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[1]
  }

  network_interface {
    network_id = data.vsphere_network.storage_network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[2]
  }

  disk {
    label = "bootcamp-vertica-${count.index + 1}-disk0.vmdk"
    size = data.vsphere_virtual_machine.template.disks.0.size
    eagerly_scrub = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
    datastore_id = data.vsphere_datastore.ssd_storage.id
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    linked_clone = true

    customize {
      linux_options {
        host_name = "bootcamp-vertica-${count.index + 1}"
        domain = "globalmaksimum.lab"
      }

      network_interface {}

      network_interface {}

      network_interface {}
    }
  }

  provisioner "remote-exec" {
    inline = [
      "mkdir -p /root/.ssh",
      "echo \"${data.local_file.public_key.content}\" >> /root/.ssh/authorized_keys"
    ]

    connection {
      type = "ssh"
      user = "root"
      password = "server"
      host = self.default_ip_address
    }
  }

}
