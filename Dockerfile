FROM alpine:3
FROM openjdk:11
RUN mkdir javamvn
COPY target/my-app-1.0-SNAPSHOT.jar /javamvn
RUN java -jar javamvn/my-app-1.0-SNAPSHOT.jar
CMD ["java", "-jdk"]

