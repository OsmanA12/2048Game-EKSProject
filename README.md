# Run This App Locally

_Ensure nodejs is installed first_

```
node -v 
npm -v
```
```
python -m http.server 3000
```

```
http://localhost:3000/
```
# **Marking Criteria**

| **Category**                   | **Points** | **Criteria**                                                                                                                                            |
|--------------------------------|------------|---------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Board / Tickets**             | 10         | - Proper ticketing system in place (e.g., Jira / Trello etc.). <br> - Tasks broken down into logical, actionable steps. <br> - Progress tracked effectively.   |
| **Terraform for AWS Infra**     | 15         | - EKS Cluster and VPC configured using Terraform. <br> - Reusable modules for infrastructure components. <br> - IAM roles and security groups properly configured. |
| **NGINX Ingress Controller**    | 10         | - NGINX Ingress Controller successfully deployed on Kubernetes. <br> - Configured for Kubernetes Ingress traffic routing.                               |
| **Monitoring Setup**            | 15         | - Prometheus and Grafana set up for cluster monitoring. <br> - Basic dashboard configured (e.g., high CPU/memory, pods, nodes, namespaces etc.)                            |
| **Pipeline 1: Terraform**          | 10         | - Pipeline automates Terraform deployments for EKS infra (including modules). <br> - Includes proper state management and error handling.               |
| **Pipeline 2: Security, Docker, Kubernetes**         | 30         | - Includes Trivy and Checkov scans. <br> - Docker image build and push to ECR. <br> - Application deployed to EKS using Kubernetes manifests (If no ArgoCD). <br> - Pipeline automates secure deployments, ensuring error handling and compliance. |
| **ArgoCD Integration (Bonus)**  | 15         | - ArgoCD set up for automated deployment to EKS.                                                                    |
| **Architecture Diagram (Bonus)**        | 15         | - Clear architecture diagram created using tools like draw.io. <br> - Includes infrastructure, CI/CD pipelines, monitoring, security, argocd, k8s setup etc. |

---

### **Total Points: 120**
