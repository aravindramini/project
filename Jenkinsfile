pipeline {
    agent none 
    stages {
        stage('test') {
            agent { docker 'maven:3.8.1-adoptopenjdk-11' } 
            steps {
                echo 'Hello, Maven'
                sh 'mvn test'
            }
        }
        stage('sonar test') {
            agent { docker 'sonarqube' } 
            steps {
                echo 'Hello, sonar'
                sh 'mvn sonar:sonar -Dsonar.host.url=http://54.67.88.122:9000 -Dsonar.login=97206df986acf7a1775f3924d0481b844e472ee5'

            }
        }

        stage('build') {
            agent { docker 'maven:3.8.1-adoptopenjdk-11' } 
            steps {
                echo 'Hello, JDK'
                sh 'mvn clean package'

            }
        }

        stage('nexus release') {
            agent { docker 'maven:3.8.1-adoptopenjdk-11' } 
            steps {
                echo 'Hello, nexus'
                sh 'mvn deploy'
            }
        }

        stage('deployment') {   
            agent { docker 'tomcat:9.0' } 
            steps {
                echo 'Hello, tomcat'
                deploy adapters: [tomcat9(path: '', url: 'http://54.67.88.122:9090')], contextPath: '/home/centos/apache-tomcat-7.0.94/webapps', war: '**/*.war'
            }
        }
    }
}
