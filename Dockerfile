#Build stage

FROM gradle:latest AS BUILD
WORKDIR /usr/app/
COPY . . 
RUN gradle build
RUN #ls -l build && ls -l build/* && false

# Package stage

FROM openjdk:latest

WORKDIR /usr/app/
COPY --from=BUILD /usr/app/ .
EXPOSE 8080

ENTRYPOINT exec java -jar /usr/app/build/libs/docker-java-0.0.1-SNAPSHOT.jar