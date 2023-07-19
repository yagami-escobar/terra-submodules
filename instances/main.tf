terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.8.0"
    }
  }
}


## BLOQUE PROVIDER → Permite elegir el cloud provider a usar.
provider "aws" {
  region = "us-east-1"
}


## SECURITY GROUP   ## Nos servira para conectarnos via ssh a la instancia que vamos a crear
resource "aws_security_group" "ssh_conection" { # Nombre del Recurso (de la Función)
  name = var.sg_name                            # Nombre del objeto

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}



resource "aws_instance" "yagami-i1" {
  #name = "yagami-i1"
  #description = "XXX"
  ami             = var.ami_id
  instance_type   = var.instance_type
  key_name        = var.key_name
  tags            = var.tags
  monitoring      = true
  security_groups = ["${aws_security_group.ssh_conection.name}"]
}


## INTERPOLACIÓN ya esta deprecado