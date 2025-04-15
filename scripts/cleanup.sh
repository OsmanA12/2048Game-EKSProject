#!/bin/bash

#Delete Helm releases
helm uninstall argo
helm uninstall argocd-release --namespace eks-argocd
helm uninstall cert-manager --namespace eks-cert-manager 
helm uninstall external-dns --namespace eks-external-dns 
helm uninstall nginx-ingress-controller --namespace ingress-controller

# Delete ArgoCD related CRDs
kubectl delete crds applications.argoproj.io \
    applicationsets.argoproj.io \
    appprojects.argoproj.io

# Delete Cert-Manager related CRDs
kubectl delete crd certificaterequests.cert-manager.io \
   certificates.cert-manager.io \
   challenges.acme.cert-manager.io \
   clusterissuers.cert-manager.io \
   issuers.cert-manager.io \
   orders.acme.cert-manager.io

# Delete namespaces if no longer needed
kubectl delete namespace eks-argocd
kubectl delete namespace eks-cert-manager