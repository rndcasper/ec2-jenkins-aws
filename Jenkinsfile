pipeline {
    agent any
    tools {
        terraform 'Terraform1'
    }

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
                    dir ('/aplicacoes/first-application') {
                    withEnv(["PATH+TERRAFORM=${Terraform1 '/usr/bin/terraform'}"]) {    
                    sh 'terraform init'
                    sh 'terraform plan'
                        }

                     }

                }

            }
        }
    }
