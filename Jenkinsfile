pipeline {
    agent {
/*        dockerfile {
            filename 'Dockerfile.build'
            dir 'Build'
            label 'Docker BUILDER'
            args '-v ./war/:/usr/local/samplejavacode/target/'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }

        docker {
            image '34.89.204.88:8123/repository/mydockerreppo/build:latest'
            registryUrl 'http://34.89.204.88:8123/repository/mydockerreppo'
            registryCredentialsId '23887642-4a26-41bd-b4f5-8860145c627f'
            args '-v ./war/:/usr/local/samplejavacode/target/'
            args '-v /var/run/docker.sock:/var/run/docker.sock -u 0:0'
        }
*/
        docker {
            image 'nosferatus83/build:latest'
//            registryUrl 'https://hub.docker.com/r/nosferatus83/build'
            registryCredentialsId '0423836f-27d7-48c6-b5fe-59511220d527'
            args '--privileged -v ./war/:/usr/local/samplejavacode/target/'
            args '--privileged -v /var/run/docker.sock:/var/run/docker.sock -u 0:0'
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
                sh 'docker build -t dz_devops11 .'
//                sh 'docker tag dz_devops11  34.89.204.88:8123/repository/mydockerreppo/dz_devops11:latest  && docker push  34.89.204.88:8123/repository/mydockerreppo/dz_devops11:latest'
                sh 'docker tag dz_devops11  nosferatus83/dz_devops11:latest  && docker push  nosferatus83/dz_devops11:latest'
            }
        }
        stage ('DEPLOY docker in other server') {
            steps {
//                sh 'docker run -d  -p 8088:8080 34.89.204.88:8123/repository/mydockerreppo/dz_devops11:latest'
//                sh 'docker run -d  -p 8088:8080 nosferatus83/dz_devops11:latest'
                sshagent(['57630d1a-7062-4b20-ae7a-8d6452cfbbe9']) {
                    sh '''ssh -o StrictHostKeyChecking=no root@34.107.121.180 << EOF
                    docker pull nosferatus83/dz_devops11:latest
                    docker run --rm -d -p 8088:8080 nosferatus83/dz_devops11:latest
EOF'''
                }
            }
        }
    }
}