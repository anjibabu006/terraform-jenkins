output "cluster_endpoint" {
  value       = aws_eks_cluster.main.endpoint
  description = "Endpoint for EKS control plane"
}

output "cluster_security_group_id" {
  value       = aws_eks_cluster.main.vpc_config[0].cluster_security_group_id
  description = "Security group ID attached to the EKS cluster control plane"
}

output "cluster_name" {
  value       = aws_eks_cluster.main.name
  description = "Kubernetes Cluster Name"
}

