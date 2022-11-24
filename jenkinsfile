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
                git credentialsId:"f4ce8537-4c0d-42b1-b6bd-425bbc796e0c", url:'https://github.com/Yves-Jean/java-app'
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
            }
            
        }
         stage("Unit Test Exectut"){
            steps{
                sh "./mvnw test"
            }
            
        }
        stage("Build Docker Image"){
            steps{
                withCredentials([string(creadentialsId: "d4d97f85-1142-43f1-961b-4cdf2e144eb8",variable:"DOCKER_HUB_PASSWORD")]){
                    sh "docker login -u jeanpcr94 -p $DOCKER_HUB_PASSWORD"
                }
                sh "docker build -t jeanpcr94/tp7-devops"
            }
            
        }
    }
}
