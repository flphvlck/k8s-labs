variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster"
  default     = "eks-lab"
}

variable "cluster_version" {
  type        = string
  description = "EKS cluster version."
  default     = "1.30"
}

variable "vpc_cidr" {
  description = "Defines the CIDR block used on Amazon VPC created for Amazon EKS."
  type        = string
  default     = "10.1.0.0/16"
}
