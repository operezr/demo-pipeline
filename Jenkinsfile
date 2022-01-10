pipeline {
    agent {
        docker {
            image 'alpine/terragrunt:1.0.4'
            reuseNode true
        }
    }
    environment {
        GOOGLE_APPLICATION_CREDENTIALS = credentials('gcp')
    }
    stages {
        stage('Plan') {
            steps {
                sh 'terragrunt run-all init'
                sh 'terragrunt run-all plan'
            }
        }
        stage('Apply') {
            input {
                message "Do you want to apply the change?"
            }
            steps {
                sh 'terragrunt run-all apply --terragrunt-non-interactive'
            }
        }
    }
}
