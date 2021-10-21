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
               liquibase --defaultsFile=C:\Users\002KNP744\Downloads\spring-petclinic\src\main\resources\liquibase\liquibase.properties --changeLogFile=C:\Users\002KNP744\Downloads\spring-petclinic\src\main\resources\liquibase\db\changelog-root.xml update
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
