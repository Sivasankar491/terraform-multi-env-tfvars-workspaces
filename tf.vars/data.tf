data "aws_ami" "expense" {
    most_recent = true
    owners = ["973714476881"]
	
	filter {
		name   = "name"
		values = ["RHEL-9-DevOps-Practice"]
	}
	
	filter {
		name   = "root-device-type"
		values = ["ebs"]
	}

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
  
}


data "aws_route53_zone" "expense" {
  name         = "kotte.site"
  private_zone = false
}