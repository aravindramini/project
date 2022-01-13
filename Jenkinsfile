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
                sh 'chmod +x ecr-login.sh'
                sh './ecr-login.sh'
            }
        }

        stage('deployment') {   
            steps {
                echo 'Hello, kubernetes'
                sh 'kubectl apply -f deployment.yml'
             }
        }
    }
}
