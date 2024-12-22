resource "aws_instance" "expense" { 
  for_each = var.instance_type
  ami           = data.aws_ami.expense.id
  instance_type = each.value
  vpc_security_group_ids = [ aws_security_group.allow_ssh.id ]

  tags = merge(
    var.common_tags,
    var.tags,
    {
        Name = each.key
    }
  )
}

resource "aws_security_group" "allow_ssh" {
  name        = "Allow_SSH-${var.environment}"
  description = "Allow SSH inbound traffic"
  
  ingress {
    description = "SSH from everywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.common_tags,
    var.tags,
    {
        Name = "Allow-SSH_${var.environment}"
    }
  )
}