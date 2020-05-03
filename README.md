# Terraform install

wget https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip

unzip terraform_0.12.24_linux_amd64.zip 

mv ./terraform /bin/

# clone project

git clone https://github.com/sbpath/eksdemo.git

# Create EKS cluster and deploy application. This also creates bastion host to act as client for apps deplyments in private subnets.

cd eksdemo

terraform init

terraform plan

terraform apply


