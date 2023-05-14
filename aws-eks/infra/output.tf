output "cluster-name" {
  value = module.eks.cluster_name
}

output "cluster-id" {
  value = module.eks.cluster_id
}

output "cluster-role-name" {
  value = module.eks.cluster_iam_role_name
}

output "cluster-endpoint" {
  value = module.eks.cluster_endpoint
}

output "cluster-sg-id" {
  value = module.eks.cluster_security_group_id
}