pipeline {
    agent any
    environment {
        AWS_REGION = "ap-south-1"  
        ECR_REPO = "417744795688.dkr.ecr.ap-southeast-1.amazonaws.com/jenkins-python"
        IMAGE_TAG = "latest"
    }
    stages {
        stage('Clone') {
            steps {
                git branch: 'main', url: 'https://github.com/AnapaAkhila/Jenkins.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh """
                aws ecr get-login-password --region $AWS_REGION \
                    | docker login --username AWS --password-stdin $ECR_REPO
                docker build -t python-jenkins-demo .
                docker tag python-jenkins-demo:latest $ECR_REPO:$IMAGE_TAG
                """
            }
        }

        stage('Push to ECR') {
            steps {
                sh """docker push $ECR_REPO:$IMAGE_TAG"""
            }
        }
    }
}
