pipeline{
    agent any
    stages{
        stage("Build project by Maven"){
            steps{
               bat "mvn clean install"
            }

        }
        stage("Code Analysis by SonarQube") {
        	steps{
        		bat "mvn sonar:sonar"
        	}
        }
        stage("Database Analysis by Liquibase"){
            steps{
            bat "liquibase -version"
               //bat "liquibase --changeLogFile=C:\Users\002KNP744\Downloads\spring-petclinic\src\main\resources\liquibase\db\changelog-root.xml --username=root --password=root --classpath=C:\Users\002KNP744\Downloads\liquibase-4.5.0\lib\mysql-connector-java-8.0.26.jar --url=jdbc:mysql://localhost:3306/petclinic update"
            }

        }
        stage("Create Docker image and push to repo"){
            steps{
                bat "mvn package dockerfile:push"
            }

        }
		stage("Deploy to k8s"){
            steps{
                bat "kubectl apply -f deployment.yaml"
            }

        }
       

    }
     post {
        always {
            cleanWs()
        }
    }

}
