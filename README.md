# Mini-Projet DevOps : Déploiement Automatisé K8s & Ansible

Ce projet est une preuve de concept (PoC) illustrant la conteneurisation, l'orchestration et l'automatisation de l'infrastructure logicielle (Infrastructure as Code). Il a été conçu pour simuler un workflow DevOps complet.

## 🛠️tack Technologique
* **Application** : Python / Flask
* **Conteneurisation** : Docker & Docker Hub
* **Orchestration** : Kubernetes (via Minikube)
* **Automatisation / IaC** : Ansible (exécuté depuis WSL/Ubuntu)

## ⚙️ Architecture du Projet
1. Une API Python allégée est empaquetée dans une image Docker.
2. L'image est poussée sur un registre public (`Docker Hub`).
3. Un playbook **Ansible** orchestre le déploiement sur un cluster **Kubernetes** local en appliquant les manifestes YAML (qui incluent des ReplicaSets pour la haute disponibilité et un Service NodePort pour l'accès réseau).

##  Comment lancer le projet localement ?

### Prérequis
* Docker Desktop installé et en cours d'exécution.
* Minikube et `kubectl` installés.
* Ansible installé (sous Linux/WSL).

### Instructions
1. **Démarrer le cluster Kubernetes :**
   ```bash
   minikube start --driver=docker

2. **Lancer le déploiement automatisé :**
   ```bash
   ansible-playbook deploy.yml

3. **Accéder à l'application :**
   ```bash
   minikube service mon-app-service
