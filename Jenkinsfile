pipeline {
   tools {
        maven 'Maven3'
    }
    agent any
    environment {
        registry = "612394038250.dkr.ecr.ap-south-1.amazonaws.com/my-ecr-repo"
    }
   
    stages {
        stage('Cloning Git') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/SravanAmbati/eksdeploy.git']])
            }
        }
      stage ('Build') {
          steps {
            sh 'mvn clean install'           
            }
      }
    // Building Docker images
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry 
          dockerImage.tag("$BUILD_NUMBER")
        }
      }
    }
   
    // Uploading Docker images into AWS ECR
    stage('Pushing to ECR') {
     steps{  
         script {
                sh 'aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 612394038250.dkr.ecr.ap-south-1.amazonaws.com'
                sh 'docker push 612394038250.dkr.ecr.ap-south-1.amazonaws.com/my-ecr-repo:$BUILD_NUMBER'
         }
        }
      }
        stage ('Helm Deploy') {
          steps {
            script {
                echo "Helm Deploy" 
                //sh "helm upgrade first --install mychart --namespace helm-deployment --set image.tag=$BUILD_NUMBER"
                }
            }
        }
    }
}