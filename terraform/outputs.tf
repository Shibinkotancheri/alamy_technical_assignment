
output "ecr_repository_url" {
  value = aws_ecr_repository.webapp.repository_url
}

output "kubeconfig" {
  value     = module.eks.kubeconfig
  sensitive = true
}
output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}