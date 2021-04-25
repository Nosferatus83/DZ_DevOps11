pipeline {
    agent {
        docker {
            image '35.246.227.35:8123/repository/mydockerreppo/build:latest'
            registryUrl 'http://35.246.227.35:8123/repository/mydockerreppo'
            registryCredentialsId 'f09f2782-f186-496c-a42c-83b953e6c971'
            args '-v ./war/:/usr/local/samplejavacode/target/'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }
    stages {
        stage ('GIT my rep') {
            steps {
                git 'https://github.com/Nosferatus83/DZ_DevOps11.git'
            }
        }
        stage ('BUILD package') {
            steps {
                sh ' mvn package'
            }
        }
        stage ('CREATE docker image') {
            steps {
                sh 'docker build -t DZ_DevOps11 .'
                sh 'docker tag DZ_DevOps11  35.246.227.35:8123/repository/mydockerreppo/DZ_DevOps11:latest  && docker push  35.246.227.35:8123/repository/mydockerreppo/DZ_DevOps11:latest'
            }
        }
        stage ('DEPLOY docker') {
            steps {
                sh 'docker run -d  -p 8088:8080 35.246.227.35:8123/repository/mydockerreppo/DZ_DevOps11:latest'
            }
        }
    }
}