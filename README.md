# Jenkins-Docker-Ansible

A simple DevOps Project (CI/CD) with Jenkins, Docker, and Ansible.

## BluePrint
![blueprint](https://github.com/alilotfi23/jenkins-docker-ansible/assets/91953142/8d1eb684-2ac9-46ba-8b9e-cae8a822f23f)

### Workflow Description

1. **Developer Pushes Code**:
    - Developers push their code changes to a Git repository.

2. **Jenkins Pulls Code**:
    - Jenkins is configured to pull the latest code from the Git repository whenever a change is detected.

3. **Jenkins Builds Docker Image**:
    - Jenkins builds a Docker image from the pulled code.

4. **Push Docker Image**:
    - The Docker image is pushed to a Docker registry for storage and further use.

5. **Ansible Deployment**:
    - Ansible pulls the Docker image from the registry and deploys it to the development environment.
    - Ansible can also push the image to other environments (e.g., staging, production).

## Prerequisites

- **Jenkins**: Ensure Jenkins is installed and running.
- **Docker**: Ensure Docker is installed and running.
- **Ansible**: Ensure Ansible is installed and configured.
- **Git**: Ensure Git is installed and your repository is set up.

## Setup Instructions

### Jenkins Setup

1. **Install Required Plugins**:
    - Docker Pipeline Plugin
    - Git Plugin
    - Ansible Plugin

2. **Configure Jenkins Pipeline**:
    - Create a new pipeline job in Jenkins.
    - Add your Git repository URL.
    - Write a Jenkinsfile in your repository to define the build, push, and deployment steps.

### Docker Setup

1. **Dockerfile**:
    - Please make sure you have a Dockerfile in your repository that Jenkins will use to build the Docker image.

### Ansible Setup

1. **Inventory and Playbook**:
    - Create an inventory file listing your target servers.
    - Write an Ansible playbook to handle the deployment of the Docker image.

## Example Jenkinsfile

```groovy
pipeline {
  agent any

  stages {
    stage('building image') {
      steps {
        sh 'docker image build -t $JOB_NAME:v1.$BUILD_ID .'
        sh 'docker image tag $JOB_NAME:v1.$BUILD_ID alilotfi/$JOB_NAME:latest'
      }
    }

    stage('Ansible version') {
      steps {
        script {
          
          sh 'ansible --version'

        }
      }
    }

    stage('Ansible Deploy') {

      steps {

        sh 'ansible-playbook -i /etc/ansible/hosts -u ubuntu /var/lib/jenkins/workspace/jenkins-docker-ansible/ansible/play.yml'

      }
    }
  }
}
```

## Running the Pipeline

1. **Trigger the Pipeline**:
    - Push code changes to your Git repository.
    - Jenkins will automatically trigger the pipeline.

2. **Monitor the Pipeline**:
    - Monitor the pipeline's progress in the Jenkins dashboard.
    - Ensure each stage completes successfully.

## Conclusion

This setup provides a straightforward CI/CD pipeline leveraging Jenkins, Docker, and Ansible to automate code integration, build, and deployment processes. Customize the provided examples to fit your specific project needs.

