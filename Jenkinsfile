pipeline {
    agent any

    tools {
        jdk 'JDK21'
        gradle 'Gradle'
    }

    environment {
        STUDENT_NAME = 'Alina Sevidova'
        DOCKER_IMAGE = 'sevidova-alina-student-api:v1.0-sevidova-alina'
    }

    stages {
        stage('Checkout') {
            steps {
                echo "Student: ${STUDENT_NAME}"
                echo 'Checking out source code from GitHub...'
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo 'Building Spring Boot application with Gradle...'
                sh 'gradle clean classes'
            }
        }

        stage('Test') {
            steps {
                echo 'Running automated tests...'
                sh 'gradle test'
            }
        }

        stage('Docker Build') {
            steps {
                echo "Building Docker image: ${DOCKER_IMAGE}"
                sh 'docker build -t ${DOCKER_IMAGE} .'
            }
        }

        stage('Verify') {
            steps {
                echo 'Verifying Docker image...'
                sh '''
                    docker image inspect ${DOCKER_IMAGE} > /dev/null
                    docker images ${DOCKER_IMAGE}
                '''
                echo "Docker image ${DOCKER_IMAGE} was created successfully."
                echo "Pipeline completed for ${STUDENT_NAME}"
            }
        }
    }

    post {
        success {
            echo "SUCCESS: CI pipeline completed successfully for ${STUDENT_NAME}"
        }

        failure {
            echo "FAILED: CI pipeline failed for ${STUDENT_NAME}"
        }
    }
}
