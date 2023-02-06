FROM openjdk:11
COPY target/my-app-1.0-SNAPSHOT.jar /usr/src/myapp
WORKDIR /usr/src/myapp
RUN java -jar target/my-app-1.0-SNAPSHOT.jar
CMD ["java", "-jdk"]
