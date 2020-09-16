module "virtual-machine" {
  source  = "kumarvna/active-directory-forest/azurerm"
  version = "2.0.0"

  # Resource Group, location, VNet and Subnet details
  resource_group_name  = "rg-hub-demo-internal-shared-westeurope-001"
  location             = "westeurope"
  virtual_network_name = "vnet-default-hub-westeurope"
  subnet_name          = "snet-management-default-hub-westeurope"

  # This module support multiple Pre-Defined Linux and Windows Distributions.
  # Windows Images: windows2012r2dc, windows2016dc, windows2019dc
  virtual_machine_name               = "vm-testdc"
  windows_distribution_name          = "windows2019dc"
  virtual_machine_size               = "Standard_A2_v2"
  admin_username                     = "batman"
  admin_password                     = "P@$$w0rd1234!"
  private_ip_address_allocation_type = "Static"
  private_ip_address                 = ["10.1.2.4"]

  # Active Directory domain and netbios details
  # Intended for test/demo purposes
  # For production use of this module, fortify the security by adding correct nsg rules
  active_directory_domain       = "consoto.com"
  active_directory_netbios_name = "CONSOTO"

  # Network Seurity group port allow definitions for each Virtual Machine
  # NSG association to be added automatically for all network interfaces.
  # SSH port 22 and 3389 is exposed to the Internet recommended for only testing.
  # For production environments, we recommend using a VPN or private connection
  nsg_inbound_rules = [
    {
      name                   = "rdp"
      destination_port_range = "3389"
      source_address_prefix  = "*"
    },

    {
      name                   = "dns"
      destination_port_range = "53"
      source_address_prefix  = "*"
    },
  ]

  # Adding TAG's to your Azure resources (Required)
  # ProjectName and Env are already declared above, to use them here, create a varible.
  tags = {
    ProjectName  = "demo-internal"
    Env          = "dev"
    Owner        = "user@example.com"
    BusinessUnit = "CORP"
    ServiceClass = "Gold"
  }
}
