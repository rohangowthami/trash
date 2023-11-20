pipeline{
    agent{
        label "jenkins-agent"
    }
    tools{
        jdk 'Java17'
        maven 'Maven3'
    }

    environment {
        APP_NAME = "project"
        RELEASE = "1.0.0"
        DOCKER_USER = "rohangowthami"
        DOCKER_PASS = 'dckr_pat_QmKe4VdJVxue3g739TFfzPqLIRM'
        IMAGE_NAME = "${DOCKER_USER}" + "/" + "${APP_NAME}"
        IMAGE_TAG = "${RELEASE}-${BUILD_NUMBER}"
       // JENKINS_API_TOKEN = credentials("JENKINS_API_TOKEN")

    }

    stages{
        stage("Cleanup workspace"){
            steps{
                cleanWs()
            }
        }
    
        stage(" pull from github"){
            steps{
                git branch: 'main',credentialsId: 'github', url: 'https://github.com/rohangowthami/trash'
            }
        }

        stage("Build Application"){
            steps{
                sh "mvn clean package"
            }
        }

        stage("Test Application"){
            steps{
                sh "mvn test"
            }
        }
        /*stage("Sonar Analysis need adress"){
            steps{
                script{
                    withSonarQubeEnv(credentialsId:'jenkins-sonar')
                        sh "mvn sonar:sonar"
                }
                
            }
        }*/

        stage("Build & Push Docker Image") {
            steps {
                script {
                    docker.withRegistry('',DOCKER_PASS) {
                        docker_image = docker.build "${IMAGE_NAME}"
                    }

                    docker.withRegistry('',DOCKER_PASS) {
                        docker_image.push("${IMAGE_TAG}")
                        docker_image.push('latest')
                    }
                }
            }

        }

        
    }
}