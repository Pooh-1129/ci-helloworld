# For Java 11, try this
FROM adoptopenjdk/openjdk11:latest

#
ARG JAR_FILE=workspace/build/libs/ci-helloworld-1.0-SNAPSHOT.jar

RUN mkdir -p /workspace
COPY build.gradle /workspace
COPY gradlew /workspace
COPY gradle /workspace/gradle
COPY src /workspace/src
WORKDIR /workspace
RUN chmod a+x gradlew
RUN ./gradlew jar
RUN ls -l
RUN ls -l build/
RUN ls -l build/libs

#
COPY ${JAR_FILE} app.jar

EXPOSE 6379
#
ENTRYPOINT ["java","-jar","app.jar"]