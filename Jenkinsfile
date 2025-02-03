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
            enviroment {
                AWS_ACCESS_KEY_ID=credentials ("AWS_ACCESS_KEY_ID")
                AWS_SECRET_ACCESS_KEY=credentials ("AWS_SECRET_ACCESS_KEY")
                AWS_REGION=credentials ("AWS_REGION")
                
            }
            steps{
                script {
                    dir ("./aplicacoes/first-application") {
                        sh 'terraform init'
                        sh 'terraform plan'
                    }
                }
            }
        
        }
    }
}
