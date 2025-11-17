pipeline {
    agent any

    tools {
        maven 'Maven-3'
    }

    environment {
        DOCKERHUB = credentials('dockerhub')
    }

    stages {

        stage('Checkout Code') {
            steps {
                git 'https://github.com/SaykarPooja/Jenkins.git'
            }
        }

        stage('Build with Maven') {
            steps {
                sh 'mvn clean install'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${DOCKERHUB_USR}/simple-java-app:${BUILD_NUMBER} ."
            }
        }

        stage('Push Docker Image') {
            steps {
                sh """
                echo ${DOCKERHUB_PSW} | docker login -u ${DOCKERHUB_USR} --password-stdin
                docker push ${DOCKERHUB_USR}/simple-java-app:${BUILD_NUMBER}
                """
            }
        }
    }
}
