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
                sh 'mvn sonar:sonar -Dsonar.host.url=http://54.67.88.122:9000 -Dsonar.login=97206df986acf7a1775f3924d0481b844e472ee5'

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

        stage('deployment') {   
            steps {
                echo 'Hello, tomcat'
                deploy adapters: [tomcat9(credentialsId: 'tomcat', path: '', url: 'http://54.67.88.122:9090')], contextPath: null, war: '**/*.war'
            }
        }
    }
}
