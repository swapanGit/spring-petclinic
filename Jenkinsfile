pipeline{
    agent any
    stages{
        stage("Build"){
            steps{
                bat "mvn clean"
                bat "mvn -version"
                bat "mvn clean"
            }

        }

    }

}
