# **Azure Flexible VM Deployment with ARM Templates**

Welcome to the Azure Flexible VM Deployment project. This ARM (Azure Resource Manager) template-based deployment system is designed to streamline the process of setting up virtual machines in the cloud. It provides a higher degree of flexibility compared to Azure's default VM deployment options, allowing for a more tailored infrastructure setup.

**Key Advantages**

- **Integrated Resource Group & VNet Creation** : Unlike the default Azure ARM deployment, this method allows for the simultaneous creation of resource groups and virtual networks (VNets) as part of the VM deployment process.
- **Enhanced Customization** : Provides additional options to customize the deployment according to specific requirements.
- **Eliminates Pre-setup Requirement** : There's no need to pre-create a resource group, VNet, or address spaces. This project can deploy them during the VM creation.
- **Networking Flexibility** : Users can decide whether to create a public IP address, select VNet address ranges, and designate the VM to one of four subnets.
- **Remote Access Control** : You have the ability to enable or block remote desktop access to the VM.
- **Web Services Installation** : Optionally install web services and present a default web page upon VM deployment.

**Project Notes**

- The OS version available for the new VM deployment is the Standard D2s v3 (2 vcpus, 8 GiB memory).
- Depending on the OS selected (Windows/Linux), the project will install IIS or Apache web services, respectively.
- After deploying a VM with web services, access the welcome page via http://\<public-ip-address\>/default.html. You'll be greeted with a message:

Hello, World!

This is the server named "\<name-of-the-vm\>"

Enjoy your testing :)

**Step-by-Step Usage Guide**

Here's how to deploy your VM using our ARM template:

1. **Prepare for Deployment** :
  - Sign in to the [Azure Portal](https://portal.azure.com/).
  - Search for and select "Template deployment (deploy using custom templates)".
2. **Load the Template** :
  - Click on "Build your own template in the editor".
  - Load the MainTemplate-WindowsLinux.json content into the editor by copying and pasting it.
  - Save your changes.
3. **Customize Parameters** :
  - Adjust the default values of the template parameters as needed.
  - Ensure to set a strong password for the admin username.
4. **Deploy the VM** :
  - Review your settings on the "Review + create" page.
  - Once validated, click "Create" to initiate the deployment process.

Defaults are set for all parameters to facilitate an easier setup, but you have the full freedom to modify them according to your needs. The only mandatory field is the admin password, which you must provide for security reasons.

**Monitoring Deployment** :
  - Azure will provide updates on the deployment status. This process may take a few minutes, so please be patient.
  - Upon completion, you'll receive a notification that your resources are deployed and ready to use.
**Post-Deployment** :
  - Navigate to your newly created VM in the Azure portal to verify its configuration.
  - If you've chosen to install web services, you can test the default page by visiting http://\<public-ip-address\>/default.html.

**Configuration Options**

When deploying your VM, you'll encounter various configuration options:

- **VNet Address Space** : Choose an address space for the virtual network.
- **Subnet Configuration** : Decide which subnet the VM should reside in.
- **Remote Access** : Enable or disable remote desktop services.
- **Public IP** : Opt for creating a public IP address for the VM.
- **Web Services** : Decide whether to install a web server (IIS or Apache) and set up a default page.

**Common Issues and Solutions**

- **Credentials** : Ensure the admin username and password meet Azure's requirements for complexity and security.
- **Resource Modifications** : Avoid manual adjustments to VNets and subnets created by the template to prevent deployment conflicts.
- **Subscription Limitations** : Be aware of the vCPU and RAM limitations in your Azure subscription, especially if you're using a free tier.
- **Resource Cleanup** : After deleting a VM, make sure all related resources, such as public IPs, are also removed to prevent deployment errors in new setups.

**Best Practices**

- **Resource Management** : For a clean environment, consider deleting the entire resource group if you need to remove all related resources.
- **Region Management** : If you hit resource limits in one region, try deploying in a different region to circumvent subscription restrictions.
