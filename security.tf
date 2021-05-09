# security.tf

# ALB Security Group: Edit to restrict access to the application
resource "aws_security_group" "lb-avatarindash-stg" {
  name        = "lb-avatarindash-stg"
  description = "controls access to the ALB"
  vpc_id      = aws_vpc.main.id

  ingress {
    protocol    = "tcp"
    from_port   = var.app_port
    to_port     = var.app_port
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Traffic to the ECS cluster should only come from the ALB
resource "aws_security_group" "ecs_tasks" {
  name        = "myapp-ecs-tasks-security-group"
  description = "allow inbound access from the ALB only"
  vpc_id      = aws_vpc.main.id

  ingress {
    protocol        = "tcp"
    from_port       = var.app_port
    to_port         = var.app_port
    security_groups = [aws_security_group.lb-avatarindash-stg.id]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "security_group-avatarindash-stg" {
  name        = "security_group-avatarindash-stg"
  description = "avaitarin public ec2 sec group"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags= {
    Name = "security_group-avatarindash-stg"
  }
}

resource "aws_security_group" "security_group-db-avatarindash-stg" {
  name        = "security_group-db-avatarindash-stg"
  description = "avaitarin mysql database sec group"
  vpc_id      = aws_vpc.main.id

 ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 # outbound from DB server
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags= {
    Name = "security_group-db-avatarindash-stg"
  }
}

resource "aws_security_group" "security_group-doc_db-avatarindash-stg" {
  name        = "security_group-doc-db-avatarindash-stg"
  description = "avaitarin doc database sec group"
  vpc_id      = aws_vpc.main.id


  ingress {
    from_port   = 27017
    to_port     = 27017
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 # outbound from DB server
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags= {
    Name = "security_group-doc-db-avatarindash-stg"
  }
}

