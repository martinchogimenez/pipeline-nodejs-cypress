# Proveedor AWS
provider "aws" {
  region = "sa-east-1"
}

# VPC principal
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

# Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
}

# Subnet pública
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
}

# Tabla de rutas
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

# Asociación de la tabla de rutas con la subnet
resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.rt.id
}

# Grupo de seguridad
resource "aws_security_group" "instance_security_group" {
  name        = "instance_security_group_users"
  description = "Security group for Users API EC2 instance"
  vpc_id      = aws_vpc.main.id

  # Regla de salida (egress)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web_sg"
  }
}

# Reglas de entrada (ingress)
resource "aws_security_group_rule" "ssh_ingress" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.instance_security_group.id
}

resource "aws_security_group_rule" "https_ingress" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.instance_security_group.id
}

resource "aws_security_group_rule" "custom_ingress" {
  type              = "ingress"
  from_port         = 3000
  to_port           = 3000
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.instance_security_group.id
}

# Instancia EC2
resource "aws_instance" "users_dev_instance" {
  ami                         = "ami-0e992fa13838f3bf6" # Amazon Linux
  instance_type               = "t2.micro"
  key_name                    = "PEM_USERS_DEV"
  subnet_id                   = aws_subnet.public.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.instance_security_group.id]

  tags = {
    Name = "pipeline-nodejs-api"
  }
}
