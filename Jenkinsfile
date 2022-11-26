pipeline {
    agent any
    tools {
        maven "MAVEN_HOME"
        jdk "jdk8"
    }
    stages {
        stage ('Initialize') {
            steps {
                sh '''
                    echo "PATH = ${PATH}"
                    echo "M2_HOME = ${M2_HOME}"
                '''
            }
        }
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
                    def docker_image = docker.build("jeanpcr94/tp7-devops")
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
