pipeline {
    agent any

    stages {
        stage("Baixar do Git") {
            steps {
                git url: 'https://github.com/rndcasper/ec2-jenkins-aws.git', branch: 'main'
                sh 'ls'
            }
        }
    }
}