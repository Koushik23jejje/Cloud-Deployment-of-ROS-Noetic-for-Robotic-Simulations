Cloud Deployment of ROS Noetic for Robotic Simulations 🚀

1. Introduction
1.1 Project Overview
This project aims to deploy the Robot Operating System (ROS) Noetic on an AWS EC2 instance, enabling developers to remotely run robotic simulations and perform implementations. The deployment automates infrastructure provisioning using Terraform, configures ROS with Ansible, and integrates continuous deployment via GitHub Actions.

1.2 Objectives
- Automate the setup of an AWS EC2 instance with Ubuntu 20.04 LTS.
- Install and configure ROS Noetic with minimal manual intervention.
- Ensure remote access and usability for robotic simulations.
- Utilize Infrastructure as Code (IaC) for scalable and repeatable deployments.
- Enable seamless automation and monitoring with GitHub Actions.

2. Project Files and Structure
The project is organized into the following files:
```
ROS-Cloud-Deployment/
│── README.md              # Project overview and setup instructions
│── install_ros.sh         # Script for automated ROS Noetic installation
│── terraform/
│   ├── main.tf           # Terraform script for AWS EC2 deployment
│── ansible/
│   ├── install_ros.yml   # Ansible playbook for ROS Noetic setup
│── .github/workflows/
│   ├── deploy.yml        # GitHub Actions workflow for automated deployment
```

3. README.md (Project Overview and Setup Instructions)
Contains step-by-step instructions for:
- AWS EC2 Instance Setup
- **Installing ROS Noetic
- Testing and Validation
- Automation using Terraform & Ansible

4. install_ros.sh (Bash Script for Automated Deployment)
```bash
#!/bin/bash
sudo apt update && sudo apt upgrade -y
sudo apt install curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
sudo apt install ros-noetic-desktop-full -y
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
source ~/.bashrc
```
To run the script:
```bash
chmod +x install_ros.sh
./install_ros.sh
```

5. terraform/main.tf (Terraform Script for AWS EC2 Deployment)
```hcl
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ros_server" {
  ami           = "ami-12345678" # Replace with Ubuntu 20.04 LTS AMI ID
  instance_type = "t2.micro"
  key_name      = "your-key"
  security_groups = ["default"]
  
  tags = {
    Name = "ROS-Server"
  }
}
```
To deploy:
```bash
terraform init
terraform apply
```

6. ansible/install_ros.yml (Ansible Playbook for ROS Installation)
```yaml
- hosts: all
  become: yes
  tasks:
    - name: Update package lists
      apt:
        update_cache: yes
    - name: Install dependencies
      apt:
        name: ["curl", "ros-noetic-desktop-full"]
        state: present
    - name: Set up ROS environment
      lineinfile:
        path: ~/.bashrc
        line: "source /opt/ros/noetic/setup.bash"
```
Run the playbook with:
```bash
ansible-playbook -i inventory install_ros.yml
```

7. .github/workflows/deploy.yml (GitHub Actions for Automated Deployment)
```yaml
name: Deploy ROS Noetic to AWS

on:
  push:
    branches:
      - main

jobs:
  deploy:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout Repository
      uses: actions/checkout@v3

    - name: Set up AWS CLI
      uses: aws-actions/configure-aws-credentials@v2
      with:
        aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
        aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
        aws-region: us-east-1

    - name: Deploy Terraform Infrastructure
      run: |
        cd terraform
        terraform init
        terraform apply -auto-approve

    - name: Install ROS Using Ansible
      run: |
        cd ansible
        ansible-playbook -i inventory install_ros.yml
```
7.1 Setting Up GitHub Secrets
1. Navigate to your GitHub Repository Settings → Secrets and variables → Actions.
2. Add the following secrets:
   - `AWS_ACCESS_KEY_ID` → Your AWS Access Key
   - `AWS_SECRET_ACCESS_KEY` → Your AWS Secret Key

8. Conclusion
This structured project enables seamless ROS Noetic deployment on AWS using a fully automated workflow. Terraform provisions cloud infrastructure, Ansible configures ROS, and GitHub Actions integrates continuous deployment. This approach ensures scalability, repeatability, and minimal manual intervention, making it ideal for cloud-based robotic simulations.

