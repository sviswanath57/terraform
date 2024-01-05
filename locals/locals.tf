locals {

  instance_count = length(var.instance_names)
  instance_type  = [for name in var.instance_names : contains(["mongodb", "web"], name) ? "t3.small" : "t2.micro"]
  #dns_records = "${[aws_instance.robo[count.index].public_ip]}"
}
