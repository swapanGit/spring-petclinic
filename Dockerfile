FROM java:8-jdk
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} spring-petclinic.jar
ENTRYPOINT ["java","-jar","/spring-petclinic.jar"]
EXPOSE 8088