pipeline{
    agent any
    stages{
        stage("Build"){
            steps{
                bat "mvn -version"
               bat "mvn clean"
            }

        }
        stage('SonarQube analysis') {
        steps{
        withSonarQubeEnv('Sonarqube 6.7.7') { 
        bat "mvn sonar:sonar"
    			}
        	}
        }

    }

}
