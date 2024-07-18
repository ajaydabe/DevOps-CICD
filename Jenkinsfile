pipeline {
    agent {
        label "Infra"
    }
    stages {
        stage ("Clone Repository"){
            steps {
                git url:"https://github.com/ajaydabe/DevOps-CICD.git", branch:"Infrastructure"
            }
        }
        stage ("Infra Creation"){
            steps {
                sh "terraform init"
                sh "terraform plan -auto-approve"
                sh "terraform apply -auto-approve"
            }
        }
    }
}
