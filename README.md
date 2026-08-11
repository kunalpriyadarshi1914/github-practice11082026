<div align="center">

# 🚀 Azure Modular Terraform Infrastructure (IaC)

[![Terraform](https://img.shields.io/badge/Terraform-1.5%2B-623CE4?style=for-the-badge&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/Azure-Cloud-0089D6?style=for-the-badge&logo=microsoftazure&logoColor=white)](https://azure.microsoft.com/)
[![IaC](https://img.shields.io/badge/Architecture-Modular-success?style=for-the-badge&logo=structure&logoColor=white)](#-architecture--repository-structure)
[![License](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)](#-license)

**An Enterprise-Grade, Reusable, and Scalable Infrastructure-as-Code (IaC) Framework for Microsoft Azure using Terraform.**

[Key Features](#-key-features) • [Architecture](#-architecture--repository-structure) • [Child Modules](#-child-modules-catalog) • [Getting Started](#-getting-started) • [Deployment](#-deployment-guide)

</div>

---

## 📖 Overview

This repository contains a modular **Terraform** infrastructure automation framework designed to provision, manage, and scale cloud infrastructure on **Microsoft Azure**. 

It implements the **Parent-Child Module Pattern**:
- **Child Modules**: Atomic, single-responsibility Terraform modules driven dynamically via `for_each` maps.
- **Parent Modules**: Multi-environment configurations (`dev`, `prod`) that consume child modules using environment-specific `terraform.tfvars`.

---

## ✨ Key Features

- 🏗️ **Modular Architecture**: 14 standalone child modules built for high reusability and maintainability.
- 🔁 **Dynamic Multi-Resource Provisioning**: Configured using HCL maps and `for_each` loops to scale resources without duplicating code.
- 🌍 **Multi-Environment Support**: Clean separation between `dev` and `prod` environments with environment-specific variable files.
- 🔐 **Network Security & Isolation**: Pre-configured VNet, Subnets, Network Security Groups (NSG), Public IPs, NAT Gateway, and Azure Bastion integration.
- ⚡ **Automated Dependency Chaining**: Explicit `depends_on` hooks ensuring predictable resource lifecycle execution (Resource Groups → Networking → Compute).

---

## 🏛️ Architecture & Repository Structure

```
                      +----------------------------------+
                      |          Parent Modules          |
                      |   +------------+  +------------+ |
                      |   |    dev     |  |    prod    | |
                      |   +-----+------+  +-----+------+ |
                      +---------|---------------|--------+
                                |  Consumes     |
                                v               v
+---------------------------------------------------------------------------------+
|                                  Child Modules                                  |
|  [RG]  [VNet]  [Subnet]  [PIP]  [NIC]  [VM]  [Bastion]  [NSG]  [LB]  [NAT]  ...  |
+---------------------------------------------------------------------------------+
```

```
github-practice11082026/
├── 📁 child_modules/                  # Reusable Atomic Terraform Modules
│   ├── 📁 azurerm_resource_group/     # Azure Resource Group provisioning
│   ├── 📁 azurerm_vnet/               # Virtual Networks (VNet)
│   ├── 📁 azurerm_subnet/             # Subnet allocations
│   ├── 📁 azurerm_public_ip_address/  # Public IP Address allocation
│   ├── 📁 azurerm_NIC/                # Network Interfaces
│   ├── 📁 azurerm_virtual_machine/    # Linux Virtual Machines
│   ├── 📁 azurerm_bastion/            # Azure Bastion Host for secure access
│   ├── 📁 azurerm_loadbalancer/       # Azure Load Balancers
│   ├── 📁 azurerm_NAT_gateway/        # Azure NAT Gateway
│   ├── 📁 azurerm_nsg/                # Network Security Groups
│   ├── 📁 azurerm_nsg-rules/          # Inbound/Outbound Security Rules
│   ├── 📁 azurerm_nsg_association/    # NSG Subnet/NIC Associations
│   ├── 📁 azurerm_storage_account/    # Storage Accounts
│   └── 📁 azurerm_vnet_peering/       # VNet Peering connections
│
├── 📁 parent_modules/                 # Environment Deployment Root
│   ├── 📁 dev/                        # Development Environment
│   │   ├── main.tf                    # Module invocations
│   │   ├── provider.tf                # AzureRM Provider configuration
│   │   ├── variable.tf                # Input variable declarations
│   │   └── terraform.tfvars           # Development environment inputs
│   └── 📁 prod/                       # Production Environment
│       ├── main.tf                    # Module invocations
│       ├── provider.tf                # AzureRM Provider configuration
│       ├── variable.tf                # Input variable declarations
│       └── terraform.tfvars           # Production environment inputs
│
└── 📄 .gitignore                      # Ignore terraform state & sensitive tfvars
```

---

## 📦 Child Modules Catalog

| Module Name | Resource Type | Description |
| :--- | :--- | :--- |
| [azurerm_resource_group](file:///c:/Users/kp4u2/OneDrive/Desktop/github11082026/github-practice11082026/child_modules/azurerm_resource_group) | `azurerm_resource_group` | Provision baseline logical containers for Azure resources. |
| [azurerm_vnet](file:///c:/Users/kp4u2/OneDrive/Desktop/github11082026/github-practice11082026/child_modules/azurerm_vnet) | `azurerm_virtual_network` | Provision isolated Virtual Networks. |
| [azurerm_subnet](file:///c:/Users/kp4u2/OneDrive/Desktop/github11082026/github-practice11082026/child_modules/azurerm_subnet) | `azurerm_subnet` | Segment network IP address ranges into subnets. |
| [azurerm_public_ip_address](file:///c:/Users/kp4u2/OneDrive/Desktop/github11082026/github-practice11082026/child_modules/azurerm_public_ip_address) | `azurerm_public_ip` | Allocate Static or Dynamic Public IP addresses. |
| [azurerm_NIC](file:///c:/Users/kp4u2/OneDrive/Desktop/github11082026/github-practice11082026/child_modules/azurerm_NIC) | `azurerm_network_interface` | Attach Network Interfaces to subnets & PIPs. |
| [azurerm_virtual_machine](file:///c:/Users/kp4u2/OneDrive/Desktop/github11082026/github-practice11082026/child_modules/azurerm_virtual_machine) | `azurerm_linux_virtual_machine` | Compute instances with SSH/Password authentication. |
| [azurerm_bastion](file:///c:/Users/kp4u2/OneDrive/Desktop/github11082026/github-practice11082026/child_modules/azurerm_bastion) | `azurerm_bastion_host` | Secure agentless RDP/SSH management access. |
| [azurerm_loadbalancer](file:///c:/Users/kp4u2/OneDrive/Desktop/github11082026/github-practice11082026/child_modules/azurerm_loadbalancer) | `azurerm_lb` | High-availability traffic distribution. |
| [azurerm_NAT_gateway](file:///c:/Users/kp4u2/OneDrive/Desktop/github11082026/github-practice11082026/child_modules/azurerm_NAT_gateway) | `azurerm_nat_gateway` | Outbound internet connectivity for private subnets. |
| [azurerm_nsg](file:///c:/Users/kp4u2/OneDrive/Desktop/github11082026/github-practice11082026/child_modules/azurerm_nsg) | `azurerm_network_security_group` | Firewall rule container. |
| [azurerm_nsg-rules](file:///c:/Users/kp4u2/OneDrive/Desktop/github11082026/github-practice11082026/child_modules/azurerm_nsg-rules) | `azurerm_network_security_rule` | Define granular network traffic rules. |
| [azurerm_nsg_association](file:///c:/Users/kp4u2/OneDrive/Desktop/github11082026/github-practice11082026/child_modules/azurerm_nsg_association) | `azurerm_subnet_network_security_group_association` | Attach security groups to target subnets/interfaces. |
| [azurerm_storage_account](file:///c:/Users/kp4u2/OneDrive/Desktop/github11082026/github-practice11082026/child_modules/azurerm_storage_account) | `azurerm_storage_account` | Cloud blob/file object storage setup. |
| [azurerm_vnet_peering](file:///c:/Users/kp4u2/OneDrive/Desktop/github11082026/github-practice11082026/child_modules/azurerm_vnet_peering) | `azurerm_virtual_network_peering` | Connect distinct Azure VNets seamlessly. |

---

## 🚀 Getting Started

### Prerequisites

Ensure you have the following CLI tools installed:

- [Terraform](https://developer.hashicorp.com/terraform/downloads) `>= 1.5.0`
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli) `>= 2.50.0`
- Active **Microsoft Azure Subscription**

### 1. Authenticate with Azure

```bash
az login
az account set --subscription "YOUR_SUBSCRIPTION_ID"
```

---

## 🛠️ Deployment Guide

### Deploying Development Environment (`dev`)

```bash
# Navigate to the dev parent module
cd parent_modules/dev

# Initialize Terraform modules & providers
terraform init

# Review execution plan
terraform plan

# Apply infrastructure changes
terraform apply -auto-approve
```

### Deploying Production Environment (`prod`)

```bash
# Navigate to the prod parent module
cd parent_modules/prod

# Initialize Terraform modules & providers
terraform init

# Review execution plan
terraform plan

# Apply infrastructure changes
terraform apply -auto-approve
```

---

## 🛡️ Security & Best Practices

1. **Secrets Isolation**: Avoid committing passwords or sensitive credentials in `.tfvars` files. Use Azure Key Vault or environment variables (`TF_VAR_*`).
2. **State Management**: Implement Remote Backend storage (Azure Blob Storage container) for production state locking and collaboration.
3. **Least Privilege**: Grant Azure Service Principal minimum necessary RBAC roles (e.g., Contributor scoped to Resource Groups).

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to check the issues page or submit a pull request.

---

<div align="center">
  <sub>Built with ❤️ using Terraform & Azure Cloud</sub>
</div>