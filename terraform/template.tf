resource "local_file" "AnsibleInventory" {
 content = templatefile("inventory.j2",
 {
  vertica-dns = vsphere_virtual_machine.vertica[*].clone[0].customize[0].linux_options[0].host_name,
  vertica-public = vsphere_virtual_machine.vertica[*].guest_ip_addresses[0],
 }
 )
 filename = "ansible/inventory"
}
