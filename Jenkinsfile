pipeline {
    agent any

    tools {
        jdk 'Java'       // matches your Jenkins JDK name
        maven 'Maven'    // matches your Jenkins Maven name
    }

    environment {
        SONAR_TOKEN = credentials('sonar-token')
        SONAR_URL = 'http://52.66.205.151:9000'
        DOCKER_IMAGE = 'btspooja/myapp:latest'  // Replace with your Docker Hub username/image
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

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                script {
                    docker.build("${DOCKER_IMAGE}")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                echo 'Pushing Docker image to Docker Hub...'
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dokcer-hub') {
                        docker.image("${DOCKER_IMAGE}").push()
                    }
                }
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
