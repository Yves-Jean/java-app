pipeline {
    agent any
    tools {
        maven "MAVEN_HOME"
    }
    stages {
        stage("git checkout"){
            steps{
                git credentialsId:"github-credentials", url:'https://github.com/Yves-Jean/java-app'
            }
        }
        stage("Set UP"){
            steps{
                 sh "chmod +x mvnw"
            }
        }
        stage("build"){
            steps{
                sh "./mvnw clean install"
                sh "ls"
            }
            
        }
        stage("Unit Test Execution"){
            steps{
                sh "./mvnw test"
            }
            
        }
        stage("Build Docker Image"){
             steps{
                script{
                    docker.build("jeanpcr94/devops-tp7:v1.0.0")
                }
            }            
        }
        stage("Push Docker Image"){
            steps{
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKER_HUB_USERNAME',passwordVariable:"DOCKER_HUB_PASSWORD")]) {
                    sh 'docker login -u $DOCKER_HUB_USERNAME -p $DOCKER_HUB_PASSWORD'
                }
                sh "docker push jeanpcr94/devops-tp7:v1.0.0"
                
            }
        }
    }
    post{
        failure{
            emailext body: "Ce Build $BUILD_NUMBER a échoué",
            recipientProviders:[requestor()], subject: "build", to: "jean.coding971@gmail.com"
        }
    }
}
