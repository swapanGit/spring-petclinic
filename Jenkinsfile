pipeline{
    agent any
    stages{
        stage("Build"){
            steps{
               bat "mvn clean install"
            }

        }
        stage('SonarQube analysis') {
        steps{
        withSonarQubeEnv('Sonarqube 6.7.7') { 
        bat "mvn sonar:sonar"
    			}
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
        post {
        always {
            cleanWs(cleanWhenNotBuilt: false,
                    deleteDirs: true,
                    disableDeferredWipeout: true,
                    notFailBuild: true,
                    patterns: [[pattern: '.gitignore', type: 'INCLUDE'],
                               [pattern: '.propsfile', type: 'EXCLUDE']])
        }
    }

    }

}
