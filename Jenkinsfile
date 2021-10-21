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
        		bat "mvn surefire-report:report"
        		bat "mvn sonar:sonar"
        	}
        }
        stage("liquibase db analysis"){
            steps{
               bat "liquibase --changeLogFile=C:\Users\002KNP744\Downloads\spring-petclinic\src\main\resources\liquibase\db\changelog-root.xml --username=root --password=root --classpath=C:\Users\002KNP744\Downloads\liquibase-4.5.0\lib\mysql-connector-java-8.0.26.jar --url=jdbc:mysql://localhost:3306/petclinic update"
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
