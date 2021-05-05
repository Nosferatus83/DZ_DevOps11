pipeline {
    agent {
/*        dockerfile {
            filename 'Dockerfile.build'
            dir 'Build'
            label 'Docker BUILDER'
            args '-v ./war/:/usr/local/samplejavacode/target/'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
*/
        docker {
            image '34.89.204.88:8123/repository/mydockerreppo/build:latest'
            registryUrl 'http://34.89.204.88:8123/repository/mydockerreppo'
            registryCredentialsId '23887642-4a26-41bd-b4f5-8860145c627f'
            args '-v ./war/:/usr/local/samplejavacode/target/'
            args '-v /var/run/docker.sock:/var/run/docker.sock -u 0:0'
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
                sh 'docker tag DZ_DevOps11  34.89.204.88:8123/repository/mydockerreppo/DZ_DevOps11:latest  && docker push  34.89.204.88:8123/repository/mydockerreppo/DZ_DevOps11:latest'
            }
        }
        stage ('DEPLOY docker') {
            steps {
                sh 'docker run -d  -p 8088:8080 34.89.204.88:8123/repository/mydockerreppo/DZ_DevOps11:latest'
            }
        }
    }
}