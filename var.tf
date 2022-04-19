variable AWS_REGION {
   default = "us-east-1"
}

variable "ZONE1" {

  default = "us-east-1a"
}

variable "ZONE2" {

  default = "us-east-1b"
}

variable "ZONE3" {

  default = "us-east-1c"
}

variable "AMIS" {
  type = map(any)
  default = {
    us-east-1 = "ami-04505e74c0741db8d"
    us-east-2 = "ami-0c7478fd229861c57"
  }
}

variable "Pri_Key" {

  default = "rjvprofilekey"
}

variable "Pub_Key" {

  default = "rjvprofilekey.pub"
}

variable "USER" {

  default = "ec2-user"
}

variable "MYIP" {

  default = "171.79.58.78/32"
}

variable "rmquser" {
   default = "rabbit"
}

variable "rmqpass" {
   default = "Technicalreja@12345"
}

variable "dbuser" {
   default = "admin"
}

variable "dbpass" {
   default = "admin123"
}

variable "dbname" {
   default = "accounts"
}

variable "VPC_NAME" {
   default = "rjvprofile-VPC"
}

variable "VPC-CIDR" {
   default = "172.21.0.0/16"
}

variable "VPC-PubSub1-CIDR" {
   default = "172.21.1.0/24"
}

variable "VPC-PubSub2-CIDR" {
   default = "172.21.2.0/24"
}

variable "VPC-PubSub3-CIDR" {
   default = "172.21.3.0/24"
}

variable "VPC-PriSub1-CIDR" {
   default = "172.21.4.0/24"
}

variable "VPC-PriSub2-CIDR" {
   default = "172.21.5.0/24"
}

variable "VPC-PriSub3-CIDR" {
   default = "172.21.6.0/24"
}