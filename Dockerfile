FROM openjdk:11
RUN mkdir javamvn
COPY target/my-app-1.0-SNAPSHOT.jar /yogiflogicmvn
RUN java -jdk yogiflogicmvn/my-app-1.0-SNAPSHOT.jar
CMD ["java", "-jdk"]
