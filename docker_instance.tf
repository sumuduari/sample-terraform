resource "aws_instance" "ec2-public-avatarindash-stg" {
  ami                    = "ami-0625a212c50aa6656" #id of desired AMI
  instance_type          = "t3.medium"
  count                  = 1
  subnet_id              = element(aws_subnet.public.*.id,count.index)
  security_groups        = [aws_security_group.security_group-avatarindash-stg.id]
  key_name               = "key-avatarindash-stg"
}

