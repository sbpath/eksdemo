# This project helps to create EKS cluster with version 1.16 and deploy application, Creates required VPCs, Security groups and Bastion host to act as client for apps deplyments in private subnets. All worker nodes are created in private subnets.
# Terraform install

wget https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip

unzip terraform_0.12.24_linux_amd64.zip 

mv ./terraform /bin/

# clone project

git clone https://github.com/sbpath/eksdemo.git

# Create EKS cluster and deploy application.

cd eksdemo

terraform init

terraform plan

terraform apply


