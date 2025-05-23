# Cert manager for IRSA (IAM Roles for Service Accounts)

module "cert_manager_irsa_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "5.34.0"

  role_name                     = "cert-manager"
  attach_cert_manager_policy    = true
  cert_manager_hosted_zone_arns = ["arn:aws:route53:::hostedzone/Z05156923JYRHHGT9YACW"]

  oidc_providers = {
    eks = {
      provider_arn = module.eks.oidc_provider_arn

      namespace_service_accounts = ["cert-manager:cert-manager"]

    }
  }

  tags = local.tags
}

# External DNS IRSA

module "external_dns_irsa_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "5.34.0"

  role_name                     = "external-dns"
  attach_external_dns_policy    = true
  external_dns_hosted_zone_arns = ["arn:aws:route53:::hostedzone/Z05156923JYRHHGT9YACW"]

  oidc_providers = {
    eks = {
      provider_arn               = module.eks.oidc_provider_arn
      namespace_service_accounts = ["external-dns:external-dns"]


    }
  }

  tags = local.tags

}

