variable "location" {
    default = "ap-south-1"
}

variable "key" {
    default = "rtp-03"
}

variable "vpc-cidr" {
    default = "10.10.0.0/16"  
}

variable "subnet1-cidr" {
    default = "10.10.1.0/24"
  
}

variable "subnet2-cidr" {
    default = "10.10.2.0/24"
  
}
variable "subent_az" {
    default =  "ap-south-1a"  
}