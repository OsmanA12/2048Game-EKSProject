locals {
  name   = "eks-lab"
  domain = "lab.osman2048game.co.uk"
  region = "eu-west-2"

  tags = {
    Environment = "sandbox"
    Project     = "EKS Advanced Lab"
    Owner       = "Ozzy"

  }

}