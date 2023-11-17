pipeline{
    agent{
        label "jenkins-agent"
    }
    tools{
        jdk 'Java17'
        maven 'Maven3'
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
        
    }
}