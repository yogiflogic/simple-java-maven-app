FROM openjdk:11
RUN mkdir javamvn
COPY target/my-app-1.0-SNAPSHOT.jar /javamvn
RUN java -jdk javamvn/my-app-1.0-SNAPSHOT.jar
CMD ["java", "-jdk"]

