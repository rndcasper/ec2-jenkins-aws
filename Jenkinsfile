pipeline {
    agent any

    stages {
        stage("Baixar do Git") {
            steps {
                git url: 'https://github.com/rndcasper/ec2-jenkins-aws.git', branch: 'main'
                sh 'echo Baixar Git OK'
            }
        }
        stage("Criacao da Infra") {
            steps {
                script {
                    dir ('/home/rndcasper/repositorios/ec2-jenkins-aws/aplicacoes/first-application') {
                    sh terraform init
                    sh terraform apply

                     }

                }

            }
        }
    }
}