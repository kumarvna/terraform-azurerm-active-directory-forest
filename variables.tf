variable "resource_group_name" {
  description = "A container that holds related resources for an Azure solution"
  default     = ""
}

variable "location" {
  description = "The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
  default     = ""
}

variable "virtual_network_name" {
  description = "The name of the virtual network"
  default     = ""
}

variable "subnet_name" {
  description = "The name of the subnet to use in VM scale set"
  default     = ""
}

variable "virtual_machine_name" {
  description = "The name of the virtual machine."
  default     = ""
}

variable "os_flavor" {
  description = "Specify the flavor of the operating system image to deploy Virtual Machine. Valid values are `windows` and `linux`"
  default     = "windows"
}

variable "virtual_machine_size" {
  description = "The Virtual Machine SKU for the Virtual Machine, Default is Standard_A2_V2"
  default     = "Standard_A2_v2"
}

variable "instances_count" {
  description = "The number of Virtual Machines required."
  default     = 1
}

variable "enable_ip_forwarding" {
  description = "Should IP Forwarding be enabled? Defaults to false"
  default     = false
}

variable "enable_accelerated_networking" {
  description = "Should Accelerated Networking be enabled? Defaults to false."
  default     = false
}

variable "private_ip_address_allocation_type" {
  description = "The allocation method used for the Private IP Address. Possible values are Dynamic and Static."
  default     = "Dynamic"
}

variable "private_ip_address" {
  description = "The Static IP Address which should be used. This is valid only when `private_ip_address_allocation` is set to `Static` "
  default     = null
}

variable "dns_servers" {
  description = "List of dns servers to use for network interface"
  default     = []
}

variable "enable_vm_availability_set" {
  description = "Manages an Availability Set for Virtual Machines."
  default     = false
}

variable "platform_update_domain_count" {
  description = "Specifies the number of update domains that are used"
  default     = 5
}

variable "platform_fault_domain_count" {
  description = "Specifies the number of fault domains that are used"
  default     = 3
}

variable "enable_public_ip_address" {
  description = "Reference to a Public IP Address to associate with the NIC"
  default     = null
}

variable "source_image_id" {
  description = "The ID of an Image which each Virtual Machine should be based on"
  default     = null
}

variable "windows_distribution_list" {
  description = "Pre-defined Azure Windows VM images list"
  type = map(object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  }))

  default = {
    windows2012r2dc = {
      publisher = "MicrosoftWindowsServer"
      offer     = "WindowsServer"
      sku       = "2012-R2-Datacenter"
      version   = "latest"
    },

    windows2016dc = {
      publisher = "MicrosoftWindowsServer"
      offer     = "WindowsServer"
      sku       = "2016-Datacenter"
      version   = "latest"
    },

    windows2019dc = {
      publisher = "MicrosoftWindowsServer"
      offer     = "WindowsServer"
      sku       = "2019-Datacenter"
      version   = "latest"
    },

    ws2008r2sp1sd = {
      publisher = "MicrosoftWindowsServer"
      offer = "WindowsServer"
      sku = "2008-R2-SP1-smalldisk"
      version = "latest"
    },

    ws2012dcsd = {
      publisher = "MicrosoftWindowsServer"
      offer = "WindowsServer"
      sku = "2012-Datacenter-smalldisk"
      version = "latest"
    },

    ws2012dcsdg2 = {
      publisher = "MicrosoftWindowsServer"
      offer = "WindowsServer"
      sku = "2012-datacenter-smalldisk-g2"
      version = "latest"
    },

    ws2012r2dcsd = {
      publisher = "MicrosoftWindowsServer"
      offer = "WindowsServer"
      sku = "2012-R2-Datacenter-smalldisk"
      version = "latest"
    },

    ws2012r2dcsdg2 = {
      publisher = "MicrosoftWindowsServer"
      offer = "WindowsServer"
      sku = "2012-r2-datacenter-smalldisk-g2"
      version = "latest"
    },

    ws2016dcsvrcoresd = {
      publisher = "MicrosoftWindowsServer"
      offer = "WindowsServer"
      sku = "2016-Datacenter-Server-Core-smalldisk"
      version = "latest"
    },

    ws2016dcsvrcoresdg2 = {
      publisher = "MicrosoftWindowsServer"
      offer = "WindowsServer"
      sku = "2016-datacenter-server-core-smalldisk-g2"
      version = "latest"
    },

    ws2016dcsd = {
      publisher = "MicrosoftWindowsServer"
      offer = "WindowsServer"
      sku = "2016-Datacenter-smalldisk"
      version = "latest"
    },

    ws2016dcsdg2 = {
      publisher = "MicrosoftWindowsServer"
      offer = "WindowsServer"
      sku = "2016-datacenter-smalldisk-g2"
      version = "latest"
    },

    ws2019dccoresd = {
      publisher = "MicrosoftWindowsServer"
      offer = "WindowsServer"
      sku = "2019-Datacenter-Core-smalldisk"
      version = "latest"
    },

    ws2019dccoresdg2 = {
      publisher = "MicrosoftWindowsServer"
      offer = "WindowsServer"
      sku = "2019-datacenter-core-smalldisk-g2"
      version = "latest"
    },

    ws2019dccorecntsd = {
      publisher = "MicrosoftWindowsServer"
      offer = "WindowsServer"
      sku = "2019-Datacenter-Core-with-Containers-smalldisk"
      version = "latest"
    },

    ws2019dccorecntsdg2 = {
      publisher = "MicrosoftWindowsServer"
      offer = "WindowsServer"
      sku = "2019-datacenter-core-with-containers-smalldisk-g2"
      version = "latest"
    },

    ws2019dcsd = {
      publisher = "MicrosoftWindowsServer"
      offer = "WindowsServer"
      sku = "2019-Datacenter-smalldisk"
      version = "latest"
    },

    ws2019dcsdg2 = {
      publisher = "MicrosoftWindowsServer"
      offer = "WindowsServer"
      sku = "2019-datacenter-smalldisk-g2"
      version = "latest"
    },

    ws2019dccntsd = {
      publisher = "MicrosoftWindowsServer"
      offer = "WindowsServer"
      sku = "2019-Datacenter-with-Containers-smalldisk"
      version = "latest"
    },

    ws2019dccntsdg2 = {
      publisher = "MicrosoftWindowsServer"
      offer = "WindowsServer"
      sku = "2019-datacenter-with-containers-smalldisk-g2"
      version = "latest"
    },

    ws2022dcazedcoresd = {
      publisher = "MicrosoftWindowsServer"
      offer = "WindowsServer"
      sku = "2022-datacenter-azure-edition-core-smalldisk"
      version = "latest"
    },

    ws2022dcazedsd = {
      publisher = "MicrosoftWindowsServer"
      offer = "WindowsServer"
      sku = "2022-datacenter-azure-edition-smalldisk"
      version = "latest"
    },

    ws2022dccoresd = {
      publisher = "MicrosoftWindowsServer"
      offer = "WindowsServer"
      sku = "2022-datacenter-core-smalldisk"
      version = "latest"
    },

    ws2022dccoresdg2 = {
      publisher = "MicrosoftWindowsServer"
      offer = "WindowsServer"
      sku = "2022-datacenter-core-smalldisk-g2"
      version = "latest"
    },

    ws2022dcsd = {
      publisher = "MicrosoftWindowsServer"
      offer = "WindowsServer"
      sku = "2022-datacenter-smalldisk"
      version = "latest"
    },

    ws2022dcsdg2 = {
      publisher = "MicrosoftWindowsServer"
      offer = "WindowsServer"
      sku = "2022-datacenter-smalldisk-g2"
      version = "latest"
    },

    wsdccore1803cntsdg2 = {
      publisher = "MicrosoftWindowsServer"
      offer = "WindowsServer"
      sku = "datacenter-core-1803-with-containers-smalldisk-g2"
      version = "latest"
    },

    wsdccore1809cntsdg2 = {
      publisher = "MicrosoftWindowsServer"
      offer = "WindowsServer"
      sku = "datacenter-core-1809-with-containers-smalldisk-g2"
      version = "latest"
    },

    wsdcCore1903cntsd = {
      publisher = "MicrosoftWindowsServer"
      offer = "WindowsServer"
      sku = "Datacenter-Core-1903-with-Containers-smalldisk"
      version = "latest"
    },

    wsdccore1903cntsdg2 = {
      publisher = "MicrosoftWindowsServer"
      offer = "WindowsServer"
      sku = "datacenter-core-1903-with-containers-smalldisk-g2"
      version = "latest"
    },

    wsdccore1909cntsd = {
      publisher = "MicrosoftWindowsServer"
      offer = "WindowsServer"
      sku = "datacenter-core-1909-with-containers-smalldisk"
      version = "latest"
    },

    wsdccore1909cntsdg1 = {
      publisher = "MicrosoftWindowsServer"
      offer = "WindowsServer"
      sku = "datacenter-core-1909-with-containers-smalldisk-g1"
      version = "latest"
    },

    wsdccore1909cntsdg2 = {
      publisher = "MicrosoftWindowsServer"
      offer = "WindowsServer"
      sku = "datacenter-core-1909-with-containers-smalldisk-g2"
      version = "latest"
    },

    wsdccore2004cntsd = {
      publisher = "MicrosoftWindowsServer"
      offer = "WindowsServer"
      sku = "datacenter-core-2004-with-containers-smalldisk"
      version = "latest"
    },

    wsdccore2004cntsdg2 = {
      publisher = "MicrosoftWindowsServer"
      offer = "WindowsServer"
      sku = "datacenter-core-2004-with-containers-smalldisk-g2"
      version = "latest"
    },

    wsdccore20h2cntsd = {
      publisher = "MicrosoftWindowsServer"
      offer = "WindowsServer"
      sku = "datacenter-core-20h2-with-containers-smalldisk"
      version = "latest"
    },

    wsdccore20h2cntsdg2 = {
      publisher = "MicrosoftWindowsServer"
      offer = "WindowsServer"
      sku = "datacenter-core-20h2-with-containers-smalldisk-g2"
      version = "latest"
    },

    wsdccore20h2cntsdgs = {
      publisher = "MicrosoftWindowsServer"
      offer = "WindowsServer"
      sku = "datacenter-core-20h2-with-containers-smalldisk-gs"
      version = "latest"
    },
  }
}

variable "windows_distribution_name" {
  default     = "windows2019dc"
  description = "Variable to pick an OS flavour for Windows based VM. Possible values include: winserver, wincore, winsql"
}

variable "os_disk_storage_account_type" {
  description = "The Type of Storage Account which should back this the Internal OS Disk. Possible values include Standard_LRS, StandardSSD_LRS and Premium_LRS."
  default     = "StandardSSD_LRS"
}

variable "admin_username" {
  description = "The username of the local administrator used for the Virtual Machine."
  default     = "azureadmin"
}

variable "admin_password" {
  description = "The Password which should be used for the local-administrator on this Virtual Machine"
  default     = null
}

variable "nsg_inbound_rules" {
  description = "List of network rules to apply to network interface."
  default     = []
}

variable "dedicated_host_id" {
  description = "The ID of a Dedicated Host where this machine should be run on."
  default     = null
}

variable "license_type" {
  description = "Specifies the type of on-premise license which should be used for this Virtual Machine. Possible values are None, Windows_Client and Windows_Server."
  default     = "None"
}

variable "active_directory_domain" {
  description = "The name of the Active Directory domain, for example `consoto.com`"
  default     = ""
}

variable "active_directory_netbios_name" {
  description = "The netbios name of the Active Directory domain, for example `consoto`"
  default     = ""
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}