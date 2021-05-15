output "windows_vm_password" {
  description = "Password for the windows VM"
  value       = module.virtual-machine.windows_vm_password
  sensitive = true
}

output "windows_vm_public_ips" {
  description = "Public IP's map for the all windows Virtual Machines"
  value       = module.virtual-machine.windows_vm_public_ips
}

output "windows_vm_private_ips" {
  description = "Public IP's map for the all windows Virtual Machines"
  value       = module.virtual-machine.windows_vm_private_ips
}
output "windows_virtual_machine_ids" {
  description = "The resource id's of all Windows Virtual Machine."
  value       = module.virtual-machine.windows_virtual_machine_ids
}

output "network_security_group_ids" {
  description = "List of Network security groups and ids"
  value       = module.virtual-machine.network_security_group_ids
}

output "vm_availability_set_id" {
  description = "The resource ID of Virtual Machine avilability set"
  value       = module.virtual-machine.vm_availability_set_id
}

output "active_directory_domain" {
  description = "The name of the active directory domain"
  value       = module.virtual-machine.active_directory_domain
}

output "active_directory_netbios_name" {
  description = "The name of the active directory netbios name"
  value       = module.virtual-machine.active_directory_netbios_name
}
