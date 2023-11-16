resource "kubernetes_env" "CNI_CUSTOM_ENV" {
  container = "aws-node"
  metadata {
    name = "aws-node"
    namespace = "kube-system"
  }

  api_version = "apps/v1"
  kind        = "DaemonSet"

  env {
    name  = "AWS_VPC_K8S_CNI_CUSTOM_NETWORK_CFG"
    value = "true"
  }
  env {
    name = "ENI_CONFIG_LABEL_DEF"
    value = "topology.kubernetes.io/zone"
  }
  force = "true"
}


resource "kubectl_manifest" "eni-az1" {
  yaml_body = <<-YAML
    apiVersion: crd.k8s.amazonaws.com/v1alpha1
    kind: ENIConfig
    metadata:
      name: ${data.aws_region.region.name}a
    spec:
      securityGroups: ${jsonencode(var.security_groups)}
      subnet: ${data.aws_subnet.subnet-az1.id}
  YAML
}
resource "kubectl_manifest" "eni-az2" {
  yaml_body = <<-YAML
    apiVersion: crd.k8s.amazonaws.com/v1alpha1
    kind: ENIConfig
    metadata:
      name: ${data.aws_region.region.name}b
    spec:
      securityGroups: ${jsonencode(var.security_groups)}
      subnet: ${data.aws_subnet.subnet-az2.id}
  YAML
}