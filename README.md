# AWS Infrastructure Deployment Using Terraform and Ansible

## Overview

This project showcases how to build a highly available infrastructure on AWS using Terraform for provisioning and Ansible for automation. The architecture includes multiple availability zones (AZs), load balancing, and automated web application deployment. 

**Objective:**  
The project addresses the challenge of connecting on-premises infrastructure to AWS, facilitating smooth migration from on-prem to the cloud using VPN.

![aws architecture2](https://github.com/user-attachments/assets/45d330f7-b9e0-4b4c-9af6-9e7fc49f8e0a)

## Features

- **Infrastructure as Code (IaC):** Built using Terraform version 5.81.0.
- **High Availability:** Spread across two Availability Zones (AZs) with a load balancer.
- **Network Configuration:**
  - VPC with CIDR: `10.0.0.0/16`
  - 2 Public Subnets
  - 4 Private Subnets (2 per AZ)
  - Internet Gateway and NAT Gateway
- **Compute:**
  - Public-facing EC2 instances (t3.medium) for web applications.
  - Private EC2 instances (r5.large) for backend or other services.
- **Storage:**
  - Attached Elastic Block Store (EBS) volumes to instances.
- **Security:**
  - Configured security groups and NACLs for secure communication.
  - Separate route tables for public and private subnets.
  - Create openSSL certificate self-assigned.
- **Generate Certificate:**
  - git clone https://github.com/OpenVPN/easy-rsa.git
  - cd easy-rsa/easyrsa3
  - ./easyrsa init-pki
  - ./easyrsa build-ca nopass
  - ./easyrsa build-server-full www.server.com nopass
  - ./easyrsa build-client-full www.client.com nopass
  - mkidr ~/custo_folder
  - cp pki/ca.crt ~/custo_folder
  - cp pki/issued/server.crt ~/custo_folder
  - cp pki/private/server.key ~/custo_folder
  - cp pki/issued/client.crt ~/custo_folder
  - cp pki/private/client.key ~/custo_folder
    
- **Import Certificate To ACM aws:**
  
- **Create AWS VPC endpoint:**
  
- **On-Prem to AWS Connectivity:**
  - VPN connection set up to securely connect on-premises infrastructure to the AWS cloud environment.
  - Enables seamless migration of workloads from on-prem to AWS.
- **Automation:**
  - Ansible used for system updates, registration, and web app deployment.


## Prerequisites

Tools:
  - hashicorp/aws (v5.80.0 or later)
  - Terraform v1.9.8
  - Ansible
  - AWS CLI configured with valid credentials

AWS Resources:
  - IAM Role with appropriate permissions
  - SSH Key Pair for EC2 instances
On-Prem Requirements:
  - VPN Gateway or equivalent setup for connecting to AWS.

## Usage
1. Clone the Repository
  - git clone https://github.com/khalilMaat/AWS_project_VPN.git
  - cd AWS_project_VPN

3. Deploy the Infrastructure
  - terraform init
  - terraform apply

4. Run Ansible Playbooks
  - cd ansible
  - ansible-playbook init.yml
  - ansible-playbook deploy_web_app.yml


Author
Khalil Maatoug

DevOps Engineer | RHCSA | RHCE | AWS
Email: maatoug610@gmail.com




