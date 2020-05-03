resource "aws_instance" "EKS-Suresh-Testing" {
  ami           	= "ami-0323c3dd2da7fb37d"
  instance_type 	= "t2.micro"
  subnet_id      	= module.vpc.public_subnets[0]
#  security_groups      	= ["${aws_security_group.SG-EKS-Suresh-Testing-public.id}"]
  vpc_security_group_ids      	= [aws_security_group.SG-EKS-Suresh-Testing-public.id]
  key_name = "suresh"
  tags = {
    Name = "EKS-Suresh-Testing-Admin"
  }
}
