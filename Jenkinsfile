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
                    docker.withRegistry("https://hub.docker.com/","dockerhub-credentials"){
                        def docker_image = docker.build("jeanpcr94/devops-tp7")
                    }
                }
            }            
        }
        stage("Push Docker Image"){
            steps{
                script{
                    docker.withRegistry("https://hub.docker.com/","dockerhub-credentials"){
                        docker_image.push('latest')
                    }
                }
            }
        }
    }
}
