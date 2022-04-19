resource "aws_security_group" "rjprofile-bean-elb-sg" {
  name        = "rjprofile-bean-elb-sg"
  description = "sg for bean-elb"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "rjprofile-bastion-sg" {
  name        = "rjprofile-bastion-sg"
  description = "sg for bastion ec-2 instance"
  vpc_id      = module.vpc.vpc_id
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = [var.MYIP]
  }
}

resource "aws_security_group" "rjvprofile-prod-sg" {
  name        = "rjprofile-prod-sg"
  description = "sg for beanstalk instance"
  vpc_id      = module.vpc.vpc_id
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port       = 22
    protocol        = "tcp"
    to_port         = 22
    security_groups = [aws_security_group.rjprofile-bastion-sg.id]
    cidr_blocks     = [var.MYIP]
  }
}

resource "aws_security_group" "rjprofile-backend-sg" {
  name        = "rjprofile-backend-sg"
  description = "sg for backend for RDS,active MQ, ealstic cache"
  vpc_id      = module.vpc.vpc_id
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port       = 0
    protocol        = "-1"
    to_port         = 0
    security_groups = [aws_security_group.rjvprofile-prod-sg.id]
  }
}

resource "aws_security_group_rule" "sg-allow-itself" {
  type                     = "ingress"
  from_port                = 0
  protocol                 = "tcp"
  to_port                  = 65535
  security_group_id        = aws_security_group.rjprofile-backend-sg.id
  source_security_group_id = aws_security_group.rjprofile-backend-sg.id

}

