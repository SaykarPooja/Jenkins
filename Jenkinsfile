pipeline {
    agent any

    tools {
        jdk 'Java'       // matches your Jenkins JDK name
        maven 'Maven'    // matches your Jenkins Maven name
    }

    environment {
        // SonarQube token credential ID from Jenkins
        SONAR_TOKEN = credentials('sonar-token')
        // Replace with your SonarQube server URL if needed
        SONAR_URL = 'http://52.66.205.151/:9000'
    }

    stages {

        stage('Checkout') {
            steps {
                echo 'Cloning GitHub repository...'
                git branch: 'main', url: 'https://github.com/SaykarPooja/Jenkins.git'
            }
        }

        stage('Build') {
            steps {
                echo 'Building the project with Maven...'
                sh 'mvn clean install'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                echo 'Running SonarQube analysis...'
                sh """
                    mvn sonar:sonar \
                        -Dsonar.host.url=${SONAR_URL} \
                        -Dsonar.login=${SONAR_TOKEN}
                """
            }
        }

    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
