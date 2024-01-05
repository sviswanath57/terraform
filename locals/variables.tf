variable "instance_names" {
  type = list(any)
  #   default = ["mongodb","redis","mysql"]
  default = ["mongodb", "web", "redis", "mysql"]
}

variable "ami_id" {
  type    = string
  default = "ami-03265a0778a880afb"
}

# this block is not usefull when we use manual types
#variable "ec2_type" {
#  type = list
#default = "t2.micro"
# default = ["t2.micro","t3.small"]
#}

variable "zone_id" {
  type    = string
  default = "Z0969811182YP4UP1MW89"

}

variable "my_domain_name" {
  type    = string
  default = "devopslife.cloud"

}