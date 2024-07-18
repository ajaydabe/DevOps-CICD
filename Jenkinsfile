pipeline {
    agent {
        label "Infra"
    }
    tools {
        terraform 'terraform'
    }
    stages {
        stage ("Clone Repository"){
            steps {
                git url:"https://github.com/ajaydabe/DevOps-CICD.git", branch:"Infrastructure"
            }
        }
        stage ("Initialize & Dry Run"){
            steps {
                sh "terraform init"
                sh "terraform plan"
            }
        }
        stage ("Infra Creation"){
            steps {
                withCredentials([usernamePassword(credentialsId: 'terraform', passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]) {
                    sh "terraform apply -auto-approve"
                }
            }
        }
    }
}
