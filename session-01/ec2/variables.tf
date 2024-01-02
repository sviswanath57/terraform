  variable "ec2-ami" {
   type = string
    default  = "ami-03265a0778a880afb"
  }

   variable "sg-description" {
   type = string
    default = "allow all ports"
  }

   variable "inbound-from-port" {
   #type = string
    default = 0
  }

  variable "ec2-protocol" {
    type = string
    default = "tcp"

  }

