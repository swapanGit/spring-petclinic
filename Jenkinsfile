pipeline{
    agent any
    stages{
        stage("Maven"){
            steps{
               bat "mvn clean install"
            }

        }
        stage("SonarQube") {
        	steps{
        		bat "mvn sonar:sonar"
        	}
        }
        stage("Liquibase"){
            steps{
            bat "liquibase -version"
               //bat "liquibase --changeLogFile=C:\Users\002KNP744\Downloads\spring-petclinic\src\main\resources\liquibase\db\changelog-root.xml --username=root --password=root --classpath=C:\Users\002KNP744\Downloads\liquibase-4.5.0\lib\mysql-connector-java-8.0.26.jar --url=jdbc:mysql://localhost:3306/petclinic update"
            }

        }
        stage("Docker"){
            steps{
                bat "docker-compose build"
                    bat "docker-compose push"
            }

        }
		stage("K8s"){
            steps{
                bat "kubectl apply -f k8s/"
            }

        }
       

    }
     post {
        always {
            cleanWs()
        }
    }

}
