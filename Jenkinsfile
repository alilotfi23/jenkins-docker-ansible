pipeline {
  agent any

  stages {
    stage('building image') {
      steps {
        sh 'docker image build -t $JOB_NAME:v1.$BUILD_ID .'
        sh 'docker image tag $JOB_NAME:v1.$BUILD_ID alilotfi/$JOB_NAME:v1.$BUILD_ID'
        sh 'docker image tag $JOB_NAME:v1.$BUILD_ID alilotfi/$JOB_NAME:latest'

      }
    }

    stage('Ansible Init') {
      steps {
        script {

          def tfHome = tool name: 'Ansible'
          env.PATH = "${tfHome}:${env.PATH}"
          sh 'ansible --version'

        }
      }
    }

    stage('Ansible Deploy') {

      steps {

        sh 'ansible-playbook -I /etc/ansible/hosts -u root /etc/ansible/playbooks/play2/file.yml'

      }
    }
  }
}
