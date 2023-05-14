variable "aws_region" {
  type    = string
  default = "sa-east-1"
}

variable "cluster_name" {
  description = "Nome do cluster"
}

variable "cluster_version" {
  description = "Version of kubernetes"
}

variable "instance_type" {
  type = string
}

variable "max_instances" {
  description = "Numero maximo de nodes"
}

variable "desired_size" {
  description = "Numero de nodes desejavel"
}