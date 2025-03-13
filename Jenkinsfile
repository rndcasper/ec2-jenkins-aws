pipeline {
    agent any

    stages {
        
        stage("Conectando ao Respositorio do GIT") {
            steps {
                git url: 'https://github.com/rndcasper/ec2-jenkins-aws.git', branch: 'main'
                sh 'echo Conectado ao repositorio do GIT'
            }
        }

        stage ("Execucao do projeto Terraform") {
            environment {
                AWS_ACCESS_KEY_ID=credentials ("AWS_ACCESS_KEY_ID")
                AWS_SECRET_ACCESS_KEY=credentials ("AWS_SECRET_ACCESS_KEY")
                AWS_DEFAULT_REGION=credentials ("AWS_DEFAULT_REGION")
                                
            }
            steps{
                script {
                    dir ("./aplicacoes/first-application") {
                        sh 'terraform init'
                        sh 'terraform destroy -auto-approve'
                    }
                }
            }
        
        }
    }
}
