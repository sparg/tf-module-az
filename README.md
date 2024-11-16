## Terraform modules

### Summary of module
1. **Certificate**
2. **Networking**
3. **Virtual Machine**

### Structure
- **certificates**
  - **main.tf**
  - **variables.tf**
  - **outputs.tf**
- **networking**
  - **main.tf**
  - **variables.tf**
  - **outputs.tf**
- **vm**
  - **main.tf**
  - **variables.tf**
  - **outputs.tf**

### Usage module

Certificate
```hcl
module "certificates" {
  source    = "../modules/certificates"

  algorithm = var.algorithm
  rsa_bits  = var.rsa_bits
}
```

Networking
```hcl
module "network" {
  source                = "../modules/network"

  address_space         = var.address_space
  subnet_address_prefix = var.subnet_address_prefix
  location              = var.location
  resource_group_name   = var.resource_group
  instance              = var.instance
  environment           = var.environment
}
```

Virtual Machine
```hcl
module "virtual_machine" {
  source     = "../modules/vm"

  instance            = var.instance
  resource_group_name = var.resource_group
  location            = var.location
  vm_size             = var.vm_size
  admin_username      = var.admin_username
  public_ssh_key      = var.public_key
  environment         = var.environment

  image_publisher = var.image_publisher
  image_offer     = var.image_offer
  image_sku       = var.image_sku
  image_version   = var.image_version

  computer_name = var.computer_name

  # network
  subnet_id = var.subnet_id
}
```

### Note:

Depending on the environment used, you may encounter problems with the extraction and use of the private key, due to permissions issues.

If you encounter this problem use the following command inside “Git Bash”:

```bash
$ terraform output -raw private_key > file
$ ssh user@public_ip -i file
$ chmod 600 file
```

Shortcut to open “Git Bash” terminal:
```bash
$ "C:\Program Files\Git\bin\bash.exe" --login -i
```