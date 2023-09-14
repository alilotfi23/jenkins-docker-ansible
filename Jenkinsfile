pipeline {
  agent any

  stages {
    stage('building image') {
      steps {
        sh 'docker image build -t $JOB_NAME:v1.$BUILD_ID .'
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

        sh 'ansible-playbook -i /etc/ansible/hosts -u root /etc/ansible/playbooks/play2/file.yml'

      }
    }
  }
}
