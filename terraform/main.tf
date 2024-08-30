provider "aws" {
  region = "us-east-1"  # Altere para sua região desejada
}

resource "aws_instance" "teamspeak" {
  ami           = "ami-066784287e358dad1"  # AMI do Amazon Linux 2
  instance_type = "t2.micro"               # Tipo de instância

  key_name      = "ts"          # Substitua pelo seu par de chaves

  security_groups = [aws_security_group.teamspeak_sg.name]

  tags = {
    Name = "TeamSpeak Server"
  }
}

resource "aws_security_group" "teamspeak_sg" {
  name        = "teamspeak_sg"
  description = "Allow access to TeamSpeak"

  ingress {
    from_port   = 9987
    to_port     = 9987
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]  # Altere para restringir o acesso
  }

  ingress {
    from_port   = 10011
    to_port     = 10011
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 30033
    to_port     = 30033
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Permitir todo o tráfego de saída
    cidr_blocks = ["0.0.0.0/0"]
  }
}

