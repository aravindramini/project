pipeline {
    agent any 
    stages {
        stage('test') {
            steps {
                echo 'Hello, Maven'
                sh 'mvn test'
            }
        }
        stage('sonar test') {
            steps {
                echo 'Hello, sonar'
                sh 'mvn sonar:sonar -Dsonar.host.url=http://204.236.136.89:9000 -Dsonar.login=d85ee6e316af83e62bace794ea8e2758d97a70f8'
            }
        }

        stage('build') {
            steps {
                echo 'Hello, JDK'
                sh 'mvn clean package'

            }
        }

        stage('nexus release') {
            steps {
                echo 'Hello, nexus'
                sh 'mvn deploy'
            }
        }
        stage('build image') {   
            steps {
                echo 'Hello, docker'
                script{
                docker.withRegistry("https://164566612831.dkr.ecr.us-west-1.amazonaws.com", "ecr:us-west-1:ecrlogin") {
                 sh '''
                docker build -t myrepo .
                docker tag myrepo:latest 164566612831.dkr.ecr.us-west-1.amazonaws.com/myrepo:latest
                docker tag myrepo:latest 164566612831.dkr.ecr.us-west-1.amazonaws.com/myrepo:1.0
                docker push 164566612831.dkr.ecr.us-west-1.amazonaws.com/myrepo:latest
                docker push 164566612831.dkr.ecr.us-west-1.amazonaws.com/myrepo:1.0
                '''
                 }
                }
            }
        }

        stage('deployment') {   
            steps {
                script{
                withCredentials([kubeconfigFile(credentialsId: 'kubecred', variable: 'KUBECONFIG')]) {
                                    echo 'Hello, kubernetes'
                                    sh 'kubectl apply -f deployment.yml'
                }
                }

             }
        }
    }
}
