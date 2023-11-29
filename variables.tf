variable "ec2_ami" {
    description = "Value of the AMI id for the EC2 instance."
    type        = string
    default     = "ami-06873c81b882339ac"
}

variable "ec2_name" {
    description = "Value of the Name for the EC2 instance"
    type        = string
    default     = "iManage"
}

variable "ec2_region" {
    description = "Value of the region for the EC2 instance"
    type = string
    default = "ca-central-1"
}
