# This project helps to create EKS cluster with version 1.16 and deploy application, Creates required VPCs, Security groups and Bastion host to act as client for apps deplyments in private subnets. All worker nodes are created in private subnets.

Install of terraform, kubectl, awscli and aws-iam-authenticator

```shell
wget https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip
curl -sSL -o aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.15.10/2020-02-22/bin/linux/amd64/aws-iam-authenticator
curl -sSL -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.15.10/2020-02-22/bin/linux/amd64/kubectl
curl -sSL -o awscliv2.zip https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip
unzip -qq awscliv2.zip
unzip terraform_0.12.24_linux_amd64.zip 
./aws/install --bin-dir /bin
chmod +x ./kubectl ./aws-iam-authenticator
mv ./kubectl ./aws-iam-authenticator ./terraform /bin/
```

Clone eksdemo project

```shell
git clone https://github.com/sbpath/eksdemo.git
```

Create EKS cluster and deploy application.

```shell
cd eksdemo
terraform init
terraform plan
terraform apply
```

To get kubeconfig for the cluster

aws eks --region us-east-1 update-kubeconfig --name EKS-Cluster-Testing

