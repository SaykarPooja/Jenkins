pipeline {
    agent any
    tools {
        jdk 'Java'
        maven 'Maven'
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/SaykarPooja/Jenkins.git'
            }
        }

        stage('Build with Maven') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('SonarQube Analysis') {
            environment { SONAR_TOKEN = credentials('sonar-token') }
            steps {
                sh "mvn sonar:sonar -Dsonar.projectKey=Jenkins_Project -Dsonar.host.url=http://localhost:9000 -Dsonar.login=$SONAR_TOKEN"
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t jenkins-project .'
            }
        }

        stage('Docker Run (Test)') {
            steps {
                sh 'docker run --rm jenkins-project'
            }
        }
    }
}
