resource "aws_instance" "ec2-instance-public" {
  ami           	= "ami-0323c3dd2da7fb37d"
  instance_type 	= "t2.micro"
  subnet_id      	= module.vpc.public_subnets[0]
  vpc_security_group_ids      	= [aws_security_group.securitygroup-public.id]
  key_name = "suresh"
  tags = {
    Name = "ec2-${local.cluster_name}"
  }
}
