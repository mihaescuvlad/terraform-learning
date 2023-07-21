pipeline {
  agent {
    docker {
      image 'internnagarrovlad/terraform:1.0.0'            
    }
  }
  environment {
    AWS_ACCESS_KEY_ID = credentials('mv-aws-accesskey')
    AWS_SECRET_ACCESS_KEY = credentials('mv-aws-secretkey')
    TF_VAR_db_user = credentiald('mv-db-user')
    TF_VAR_db_pass = credentials('mv-db-pass')
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
