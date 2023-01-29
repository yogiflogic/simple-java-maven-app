node {
    docker.image('maven:3.8.7-eclipse-temurin-11').inside('-p 3000:3000') {
        
        stage('Build') {
                sh 'mvn -B -DskipTests clean package'
            }
        
        stage('Test') { 
  
            sh 'mvn test'
            junit 'target/surefire-reports/*.xml'
        }
        
    }
}
