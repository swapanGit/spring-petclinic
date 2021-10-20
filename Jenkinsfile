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
                bat "mvn liquibase:update"
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
            cleanWs(cleanWhenNotBuilt: false,
                    deleteDirs: true,
                    disableDeferredWipeout: true,
                    notFailBuild: true)
        }
    }

}
