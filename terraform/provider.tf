terraform {
  backend "s3" {
    bucket  = "2048-eks"
    key     = "eks-lab"
    region  = "eu-west-2"
    encrypt = true
  }

  required_version = ">=1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.84.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.6"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_name
  depends_on = [ module.eks ]
}
provider "helm" {
  kubernetes {
    host                   = module.eks.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)

    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", module.eks.cluster_name]
      command     = "aws"
    }
  }
}
