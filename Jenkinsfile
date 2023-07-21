pipeline {
  agent {
    docker {
      image 'internnagarrovlad/terraform:1.0.0'            
    }
  }

  stages {
    stage('Clone repository') {
      steps {
        script{
	  checkout scm
        }
      }
    }
    stage('Services') {
      steps {
        dir('environment/dev') {
          script {
            sh 'terraform init'
            sh 'terraform apply -var-file=terraform.tfvars -auto-approve'
          }
        }
      }
    }
  }
}
