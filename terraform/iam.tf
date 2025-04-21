resource "aws_eks_access_entry" "example" {
  cluster_name      = module.eks.cluster_name
  principal_arn     = "arn:aws:iam::585768150963:user/Ozzy"
  type              = "STANDARD"
  depends_on = [ module.eks ]
}

resource "aws_eks_access_policy_association" "example" {
  cluster_name  = module.eks.cluster_name
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
  principal_arn = "arn:aws:iam::585768150963:user/Ozzy"


  access_scope {
    type       = "namespace"
    namespaces = ["example-namespace"]
  }
}

resource "aws_eks_access_policy_association" "example1" {
  cluster_name  = module.eks.cluster_name
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSAdminPolicy"
  principal_arn = "arn:aws:iam::585768150963:user/Ozzy"


  access_scope {
    type       = "namespace"
    namespaces = ["example-namespace"]
  }
}