# 🚀 2048 Game on EKS with Terraform

This project deploys the classic [2048 game](https://play2048.co/) to an **Amazon EKS (Elastic Kubernetes Service)** cluster using **Terraform** for infrastructure provisioning and **GitHub Actions** for CI/CD automation. Docker images are built and pushed to **Amazon ECR (Elastic Container Registry)**.

<img width="747" alt="Screenshot 2025-04-21 at 22 59 31" src="https://github.com/user-attachments/assets/a5263d16-1c63-4dc2-9d31-0cec03349424" />

---

## 🧱 Tech Stack


| 🛠️ Tool              | 📋 Purpose                                                                 |
|----------------------|----------------------------------------------------------------------------|
| ☸️ **AWS EKS**         | Managed Kubernetes service to host the 2048 game                          |
| 🌍 **Terraform**       | Infrastructure as Code (IaC) to provision AWS resources                   |
| 📦 **AWS S3**          | Remote backend for storing Terraform state files securely                 |
| 🔐 **AWS IAM**         | Role-based access with IRSA for Kubernetes service accounts               |
| 🐳 **AWS ECR**         | Container registry to store & pull Docker images                          |
| 🤖 **GitHub Actions**  | CI/CD pipeline for automating build and deployment                        |
| 🚀 **ArgoCD**          | GitOps-based tool to sync and manage K8s resources from Git               |
| 📦 **Helm**            | Package manager for deploying Kubernetes applications                     |
| 🔒 **cert-manager**    | Automatically issues and renews TLS certificates in Kubernetes            |



---

## 📁 Project Structure

```
.
.
├── .github/workflows/      # GitHub Actions workflows for CI/CD
├── terraform/              # Terraform infrastructure code for EKS & networking
├── Dockerfile              # Docker image definition for the 2048 game
├── argo-cd/                # ArgoCD app manifests and config for GitOps deployment
├── cert-manager/           # Manifests for cert-manager setup
├── manifests/              # Kubernetes manifests for 2048 game deployment
└── README.md               # Project documentation

```

---

## 🛠️ Infrastructure Setup

Terraform provisions the following resources:

- VPC and subnets
- EKS cluster with managed node groups
- IAM roles for service accounts (IRSA)
- Kubernetes configurations (via `kubectl`)

---

## ⚙️ CI/CD Pipeline

### 1. **Terraform Workflow**
Automates infrastructure provisioning using:

- `terraform init`
- `terraform plan`
- `terraform apply`

### 2. **Docker Image Workflow**
- Builds the Docker image
- Tags and pushes to **ECR**
- Updates the EKS cluster with the new deployment

---

## 🐳 Docker

To build and run the game locally:

```bash
docker build -t 2048-game .
docker run -p 8080:80 2048-game
```

Visit `http://localhost:8080`

---

## 🧪 Security Scans

The GitHub Actions pipeline includes:

- ✅ **Checkov**: Infrastructure-as-Code security scanning  
- ✅ **Trivy**: Vulnerability scanning for Docker images  
- ✅ **tfsec**: Terraform security analysis  

---

## 🚀 Deploy

To deploy the application:

```bash
# Deploy infrastructure
cd terraform
terraform init
terraform apply -auto-approve


```

> **Note:** The kubeconfig is updated automatically in CI using:
> ```bash
> aws eks update-kubeconfig --name eks-lab --region eu-west-2
> ```

---

## 📌 Notes

- Terraform state is stored in an **S3 backend** with locking via **DynamoDB**.
- IAM roles are used for secure access to AWS services from pods (IRSA).
- This project was designed for educational and portfolio purposes.

---

## 📷 Screenrecording of game



https://github.com/user-attachments/assets/c456b136-70ec-410e-84ff-ce766ed35a01


<img width="1440" alt="Screenshot 2025-04-15 at 01 02 50" src="https://github.com/user-attachments/assets/1e1ee116-76c8-4aaf-9708-92ba8d2b631e" />




---

## 📬 Contact

Feel free to reach out if you have any questions or want to collaborate!

---

## To test the app locally,
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

