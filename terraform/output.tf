output "vertica-public" {
    description = "public IP of VM"
    value = vsphere_virtual_machine.vertica[*].guest_ip_addresses[0]
}
output "vertica-private" {
    description = "private IP of VM"
    value = vsphere_virtual_machine.vertica[*].guest_ip_addresses[2]
}
