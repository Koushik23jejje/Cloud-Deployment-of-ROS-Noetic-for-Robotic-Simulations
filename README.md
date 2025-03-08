Cloud Deployment of ROS Noetic for Robotic Simulations 🚀
Overview
This project automates the deployment of ROS Noetic (Robot Operating System) on an AWS EC2 instance. It enables developers to run robotic simulations remotely using Terraform, Ansible, and GitHub Actions for a fully automated setup.

Features
✅ Cloud-based ROS Deployment – Runs on AWS EC2 with Ubuntu 20.04 LTS.
✅ Automated Setup – Uses Terraform for provisioning and Ansible for configuration.
✅ GitHub Actions CI/CD – Automates infrastructure deployment on code changes.
✅ Scalability & Flexibility – Easily extendable to multiple instances.
✅ Gazebo Simulation Support – Runs robotic simulations in the cloud.

Project Structure
bash
Copy
Edit
ROS-Cloud-Deployment/
│── README.md               # Project overview and setup instructions
│── install_ros.sh          # Script for automated ROS Noetic installation
│── terraform/
│   ├── main.tf            # Terraform script for AWS EC2 deployment
│── ansible/
│   ├── install_ros.yml    # Ansible playbook for ROS Noetic setup
│── .github/workflows/
│   ├── deploy.yml         # GitHub Actions workflow for automated deployment
1️⃣ AWS EC2 Setup
Prerequisites
AWS Account
Terraform Installed
Ansible Installed
Deploy EC2 with Terraform
Navigate to the terraform/ directory:
bash
Copy
Edit
cd terraform
terraform init
terraform apply -auto-approve
This will launch an Ubuntu 20.04 LTS t2.micro instance with 30GB storage.
2️⃣ Install ROS Noetic
Run the automated Bash script to install ROS Noetic:

bash
Copy
Edit
chmod +x install_ros.sh
./install_ros.sh
OR use Ansible for automatic configuration:

bash
Copy
Edit
ansible-playbook -i inventory ansible/install_ros.yml
3️⃣ Testing the Setup
Verify ROS installation by running:

bash
Copy
Edit
roscore
To launch a Gazebo simulation, run:

bash
Copy
Edit
roslaunch gazebo_ros empty_world.launch
4️⃣ GitHub Actions for Auto Deployment
This project uses GitHub Actions to automatically deploy ROS to AWS on each push to the repository.

Setup GitHub Secrets
Go to GitHub Repository → Settings → Secrets → Actions.
Add the following secrets:
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
Workflow Automation
Every time you push code to the main branch, GitHub Actions will:
✅ Deploy infrastructure using Terraform.
✅ Install ROS Noetic using Ansible.
✅ Run tests and validations.

5️⃣ Destroy Infrastructure
To delete the AWS resources created by Terraform, run:

bash
Copy
Edit
cd terraform
terraform destroy -auto-approve
🔗 Resources
ROS Noetic Documentation
AWS EC2 Docs
Terraform Docs
Ansible Docs
🚀 Conclusion
This project provides an automated, scalable, and cloud-based ROS Noetic deployment. With Terraform, Ansible, and GitHub Actions, setting up ROS for robotic simulations has never been easier.

