# For Java 11, try this
FROM adoptopenjdk/openjdk11:latest

#
ARG JAR_FILE=/build/libs/ci-helloworld-1.0-SNAPSHOT.jar

#
WORKDIR .

#
COPY ${JAR_FILE} app.jar

EXPOSE 6379
#
ENTRYPOINT ["java","-jar","app.jar"]