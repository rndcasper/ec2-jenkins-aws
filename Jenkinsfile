pipeline {
    agent any

    stages {
        
        stage("Baixar do Git") {
            steps {
                git url: 'https://github.com/rndcasper/ec2-jenkins-aws.git', branch: 'main'
                sh 'echo Baixar Git OK'
            }
        }

        stage ("Execucao do projeto Terraform") {
            script {
                dir (./aplicacoes/first-application) {
            sh 'terraform init'
            sh 'terraform plan'
                }
            }
        
        }
    }
}
