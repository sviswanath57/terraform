resource "aws_instance" "robo" {
  #count = 11 # count.index is a special variable given by terraform
  count         = local.instance_count
  ami           = var.ami_id
  instance_type = local.instance_type[count.index]

  tags = {
    Name = var.instance_names[count.index]
  }
}

resource "aws_route53_record" "www" {
  zone_id = var.zone_id
  count   = local.instance_count
  name    = "${var.instance_names[count.index]}.${var.my_domain_name}"
  type    = "A"
  ttl     = 1
  records = [aws_instance.robo[count.index].public_ip]
  #records = [for name in aws_instance.robo[count.index] : contains(["mongodb", "web"], name) ? "t3.small" : "t2.micro"]
}

