pipeline {
  // Define the agent that will run the pipeline. 'any' means it can run on any available agent.
  agent any

  stages {
    // Stage for building the Docker image
    stage('building image') {
      steps {
        // Build the Docker image with a tag that includes the job name and build ID
        sh 'docker image build -t $JOB_NAME:v1.$BUILD_ID .'
        // Tag the newly built image as 'latest' for easier access
        sh 'docker image tag $JOB_NAME:v1.$BUILD_ID alilotfi/$JOB_NAME:latest'
      }
    }

    // Stage to check the installed version of Ansible
    stage('Ansible version') {
      steps {
        script {
          // Execute a command to display the Ansible version
          sh 'ansible --version'
        }
      }
    }

    // Stage for deploying using Ansible
    stage('Ansible Deploy') {
      steps {
        // Run the Ansible playbook for deployment using the specified inventory and user
        sh 'ansible-playbook -i /etc/ansible/hosts -u ubuntu /var/lib/jenkins/workspace/jenkins-docker-ansible/ansible/play.yml'
      }
    }
  }
}
