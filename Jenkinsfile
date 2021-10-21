pipeline{
    agent any
    stages{
        stage("Build"){
            steps{
               bat "mvn clean package"
            }

        }
        stage('SonarQube analysis') {
        	steps{
        		bat "mvn sonar:sonar"
        	}
        }
        stage("liquibase db analysis"){
            steps{
                bat "liquibase -version"
            }

        }
        stage("docker push"){
            steps{
                bat "mvn package dockerfile:push"
            }

        }
       

    }
     post {
        always {
            cleanWs()
        }
    }

}
